local function fix_math(text)
  -- XeLaTeX requires braces around this subscript form.
  text = text:gsub("_\\mathcal{A}", "_{\\mathcal{A}}")
  -- Keep Unicode Isabelle notation in code, but use portable LaTeX in maths.
  return text:gsub("∑", "\\sum")
end

function Math(element)
  element.text = fix_math(element.text)
  return element
end

function Para(element)
  -- MathJax accepts \require{bussproofs}; LaTeX instead needs the package
  -- loaded in the preamble and the prooftree emitted as a block.
  if #element.content == 1
      and element.content[1].t == "Math"
      and element.content[1].mathtype == "DisplayMath"
      and element.content[1].text:match("\\require%s*{bussproofs}") then
    local proof = element.content[1].text:gsub(
      "\\require%s*{bussproofs}%s*", ""
    )
    return pandoc.RawBlock("latex", proof)
  end

  return element
end

local replacements = {
  { symbol = "⌘", latex = "\\LogicCommand{}" },
  { symbol = "⟹", latex = "\\LogicLongImplies{}" },
  { symbol = "∑", latex = "\\LogicSum{}" },
}

function Code(element)
  local remaining = element.text
  local result = pandoc.List()

  while #remaining > 0 do
    local first_start = nil
    local first_end = nil
    local first_replacement = nil

    for _, replacement in ipairs(replacements) do
      local start_pos, end_pos = remaining:find(replacement.symbol, 1, true)
      if start_pos and (not first_start or start_pos < first_start) then
        first_start = start_pos
        first_end = end_pos
        first_replacement = replacement
      end
    end

    if not first_start then
      result:insert(pandoc.Code(remaining, element.attr))
      break
    end

    if first_start > 1 then
      result:insert(pandoc.Code(remaining:sub(1, first_start - 1), element.attr))
    end
    result:insert(pandoc.RawInline("latex", first_replacement.latex))
    remaining = remaining:sub(first_end + 1)
  end

  return result
end

function CodeBlock(element)
  -- These are Isabelle's documented ASCII input forms and remain copyable.
  element.text = element.text:gsub("∑", "\\<Sum>")
  element.text = element.text:gsub("⟹", "==>")
  return element
end
