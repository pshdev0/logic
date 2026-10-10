# Introduction

The following notes were compiled to refresh my logic knowledge, based on The Logic Manual (Halbach, V., 2010)
# Syntax and Semantics of Propositional Logic

> The formula $\psi$ is *logically true* iff $\varnothing\models\psi$ , i.e. iff $\models\psi$. In propositional logic, a logically true formula is called a *tautology*.

**Theorem 2.14 (Semantic entailment, Logical entailment, Logically implies, p. 43).** For $n \geq 1$,
$$
\{\psi_i\}_{i=1}^n \models \phi
\quad\Longleftrightarrow\quad
\left(\bigwedge_{i=1}^n \psi_i\right) \to \phi
\text{ is a tautology.}
$$
or in other word:
$$
\{\psi_i\}_{i=1}^n \models \phi
\quad\Longleftrightarrow\quad
\models \left(\left(\bigwedge_{i=1}^n \psi_i\right) \to \phi\right).
$$
**Example.** We can prove that a propositional formula is a tautology by enumerating every possible assignment of truth values to
$$
((P \to \neg Q) \land Q) \to \neg P.
$$Its truth table is:

| $P$ | $Q$ | $P \to \neg Q$ | $(P \to \neg Q) \land Q$ | $\neg P$ | $((P \to \neg Q) \land Q) \to \neg P$ |
| :-: | :-: | :------------: | :----------------------: | :------: | :-----------------------------------: |
|  T  |  T  |       F        |            F             |    F     |                   T                   |
|  T  |  F  |       T        |            F             |    F     |                   T                   |
|  F  |  T  |       T        |            T             |    T     |                   T                   |
|  F  |  F  |       T        |            F             |    T     |                   T                   |

Since the final column contains only T, the formula is a tautology. Hence, by Theorem 2.14,

$$
P \to \neg Q,\ Q \models \neg P.
$$
# Formalisation in Propositional Logic

 $L_1$ is the formal language of propositional logic: sentence letters such as $P$, $Q$, and $R$; connectives such as $\neg$, $\land$, $\lor$, $\to$, and $\leftrightarrow$; and formation rules determining which strings are sentences. For example, $\neg P$ and $(P \wedge Q)$ are sentences of $L_1$.

---
A *propositional formula* is an expression built from sentence letters and connectives according to the formation rules. A *sentence* is a formula with no free variables. A sentence may be assigned a truth value relative to an interpretation or structure, e.g. a structure $A$ might assign $A(P)=\mathrm T$. (p. 87)

---
In propositional logic there are no free individual variables, so every well-formed propositional formula can be treated as a sentence. $P$, $\neg P$, and $P \land Q$ are therefore called sentences of $L_1$, while $\phi$ and $\psi$ are metavariables ranging over sentences of $L_1$, e.g. $\phi$ may stand for $P \land Q$.

Connectives often include $\land$, $\lor$, and $\neg$, but a sentence-forming operator such as “it is necessarily the case that…” can also be a connective, although it is not part of classical propositional logic and is not truth-functional (see below)

[ADD THE ZENO EXAMPLE BELOW HERE]

---
A *direct subsentence* is the sentence "at the next level down to" the sentence in question, e.g. the direct subsentence of $\neg(P\wedge Q)$ is $P\wedge Q$, whereas the direct subsentences of $P\wedge Q$ are $P$ and $Q$.

**Characterisation 3.1 (Truth Functionality, p.54)** A connective is *truth-functional* iff the truth-value of the compound sentence cannot be changed by replacing a direct subsentence with another sentence having the same truth-value.

> The usual connectives $\wedge$, $\lor$, $\neg$, etc are always truth functional.

**Example (Not truth functional).** Let $P$ be the sentence “$2+2=4$,” and let $Q$ be the sentence “London is the capital of the UK.” Both $P$ and $Q$ are true. However, under the usual interpretation of $\Box$ as “it is necessarily the case that,” $\Box P$ is true, whereas $\Box Q$ is false: London is the capital, but historically it could have turned out otherwise. Thus, replacing $P$ with the equally true sentence $Q$ changes the truth value of the compound sentence: although $Q$ is true, $\Box Q$ is false because London is not *necessarily* the capital of the UK. Therefore, $\Box$ is not truth-functional.

---
> **Basics Recap**. Recall $A\rightarrow B$ means "if $A$ is true, then $B$ follows as a consequence". So, $A$ is sufficient for $B$ because $A$ is enough to obtain $B$ as a consequence. Whereas $B$ is necessary for $A$ because $B$ follows from $A$.

---
Scope ambiguities can arise so we must use parentheses appropriately, e.g. $P\wedge(Q\lor R)$ versus $(P\wedge Q)\lor R$.

# The Syntax of Predicate Logic

Consider

> $P$: Zeno is a tortoise. $Q$: All tortoises are toothless. Therefore $R$: Zeno is toothless.

This argument is not propositionally valid since the two premisses and conclusion are formalised as three sentence letters $P$, $Q$ and $R$ respectively, but $P,Q\not\models R$.

>*Propositional logic treats each complete sentence as an atomic unit*, i.e. there is no propositional connective linking the three sentence letters, and propositional logic does not look inside them to see the recurrence of Zeno, tortoise, and toothless.

---
We can represent formulae using e.g. $Px$ or $Pxy$, sometimes we include the *arity-indices*, e.g. $P^1x$ or $P^2xy$ to indicate the number of variables accepted by $P$.

---
**Example** (p.89) Converting English sentences to predicate logic: "All frogs are amphibians" translates as "for all $x$ (if $x$ is a frog, then $x$ is an amphibian)" or in symbols $\forall x (P(x)\rightarrow Q(x))$, with the predicate letters (not sentences) $P$: ... is a frog, and $Q$: ... is an amphibian. $P$ and $Q$ become formulae when supplied with a variable, e.g. $P(x)$, $Q(x)$. When a variable is bound, i.e. $\forall x P(x)$, $\exists x P(x)$, the formula becomes a sentence. 

**Example** (p.92) "If it's raining then Bill reads a book or a newspaper" translates as $P\rightarrow \exists x(P^2ax\wedge(Qx\lor Rx))$ with $P$: it's raining, $Q^1$: ... is a book, $R^1$: ... is a newspaper, and $P^2$: ... reads ... .

---
# Semantics of Predicate Logic

Meaning of "logically true":

> A sentence of the language $L_2$ is said to be *logically true* $\iff$ it is true under any interpretation of the constants and predicate letters.

Meaning of "valid":

> An argument in $L_2$ will be defined to be valid $\iff$ there is no interpretation under which the premisses are all true and the conclusion is false, i.e. $\Gamma\models\phi$ where $\Gamma$ is the set of premisses and $\phi$ the conclusion.

Meaning of "structure":

> A *structure* $\mathcal A$ consists of a non-empty *domain* $D$ and an interpretation function $I$. The domain $D$ contains the objects under discussion, while $I$ assigns:
> 
> - each constant $a$ an element $I(a)\in D$;
> - each unary predicate letter $P$ a subset $I(P)\subseteq D$;
> - each $n$-ary predicate letter $R$ an $n$-ary relation $I(R)\subseteq D^n$.
>   
>   For example, let $D=\mathbb Z$, and suppose $a$ means zero, $P$ means “... is even,” and $R$ means “... is less than ...”. Then$$
\begin{aligned}
I(a) &= 0,\\
I(P) &= \{n\in\mathbb Z:\exists k\in\mathbb Z\ (n=2k)\},\\
I(R) &= \{(m,n)\in\mathbb Z^2:m<n\}.
\end{aligned}
$$Consequently, $P(a)$ is true because $I(a)\in I(P)$. If $I(b)=3$, then $R(a,b)$ is true because $(0,3)\in I(R)$.

---
>**Semantic Value** (see p. 99). Let $|e|^\alpha_\mathcal{A}$ be the *semantic value* of the expression $e$ in the $\mathcal{L}_2$-structure $\mathcal{A}$ under the variable assignment $\alpha$ ( i.e. $\alpha$ is a map over $\mathcal{A}$). Let $\mathcal{A}=(D_\mathcal{A},I_\mathcal{A})$, where $D_\mathcal{A}$ is the domain and $I_\mathcal{A}$ is the interpretation function that assigns semantic values to the non-logical symbols (i.e. constants and predicates):

- **Constant $t$:** $|t|^\alpha_\mathcal{A}\in D_\mathcal{A}$ assigned to $t$ by $\mathcal{A}$, e.g. $|c|^\alpha_\mathcal{A}=5$ if $c=5$ by $\mathcal{A}$.
- **Variable $v$:** $|v|^\alpha_\mathcal{A}\in D_\mathcal{A}$ assigned to $v$ by $\alpha$, e.g. $|x|^\alpha_\mathcal{A}=7$ if $\alpha(x)=7$.

- **Sentence letter $P$:** $|P|^\alpha_\mathcal{A}\in\{T,F\}$ assigned directly by $\mathcal{A}$; $\alpha$ has no effect.
 
- **Formula / Sentence $\phi$:** $|\phi|^\alpha_\mathcal{A}\in\{T,F\}$; $\alpha$ matters if $\phi$ has free variables. $|\phi|^\alpha_\mathcal{A}=T$ means "$\alpha$ satisfies $\phi$ in $\mathcal{A}$", sometimes written $\mathcal{A}\models\phi[\alpha]$. $\phi$ is a sentence if it has no free-variables.

- **Unary predicate $\phi$:** $|\phi|^\alpha_\mathcal{A}\subseteq D_\mathcal{A}$, e.g. if $E=$ "is even", then $|E|^\alpha_\mathcal{A}=\{\ldots,-2,0,2,4,\ldots\}$.
- **Binary predicate $\phi$:** $|\phi|^\alpha_\mathcal{A}\subseteq D_\mathcal{A}^2$, e.g. if $L=$ "$<$", then $(2,5)\in|L|^\alpha_\mathcal{A}$.
- **3-ary predicate $\phi$:** $|\phi|^\alpha_\mathcal{A}\subseteq D_\mathcal{A}^3$, e.g. if $S=$ "$x+y=z$", then $(2,3,5)\in|S|^\alpha_\mathcal{A}$.

- **$n$-ary predicate $\phi$:** $|\phi|^\alpha_\mathcal{A}\subseteq D_\mathcal{A}^n$, i.e. a set of ordered $n$-tuples, e.g. if $\phi(x_1,\ldots,x_n)=$ "$x_1+\cdots+x_n=a$", then $(x_i)_{i=1}^n\in|\phi|^\alpha_\mathcal{A}\iff\sum_{i=1}^n x_i=a$.

>**Definition 5.2 (Satisfaction, pp.100-104):**

- **Atomic (no connectives or quantifiers) formula:** $|\Phi t_1...t_n|^\alpha_\mathcal{A}=T$ iff $(|t_1|^\alpha_\mathcal{A},...,|t_n|^\alpha_\mathcal{A})\in|\Phi|^\alpha_\mathcal{A}$, where $\Phi$ is an $n$-ary predicate letter, e.g. $Px_1x_2...x_n$, with $n\geq 1$, and each $t_i$ is either a variable or constant.

- **Negation:** $|\neg\phi|^\alpha_\mathcal{A}=T$ iff $|\phi|^\alpha_\mathcal{A}=F$.

- **Conjunction:** $|\phi\wedge\psi|^\alpha_\mathcal{A}=T$ iff $|\phi|^\alpha_\mathcal{A}=T$ and $|\psi|^\alpha_\mathcal{A}=T$.
- **Disjunction:** $|\phi\vee\psi|^\alpha_\mathcal{A}=T$ iff $|\phi|^\alpha_\mathcal{A}=T$ or $|\psi|^\alpha_\mathcal{A}=T$.

- **Conditional:** $|\phi\to\psi|^\alpha_\mathcal{A}=T$ iff $|\phi|^\alpha_\mathcal{A}=F$ or $|\psi|^\alpha_\mathcal{A}=T$, the reason for which can be seen directly from the truth table for $\rightarrow$: $TTT,\ TFF,\ FTT,\ FFT$.
- **Biconditional:** $|\phi\leftrightarrow\psi|^\alpha_\mathcal{A}=T$ iff $|\phi|^\alpha_\mathcal{A}=|\psi|^\alpha_\mathcal{A}$.

- **Existential quantifier:** $|\exists v\phi|^\alpha_\mathcal{A}=T$ iff there is some value in $D_\mathcal{A}$ that can be assigned to $v$, while leaving the values of all other variables fixed by $\alpha$, for which $\phi$ is true. Formally, $|\exists v\phi|^\alpha_\mathcal{A}=T\iff|\phi|^\beta_\mathcal{A}=T$ for some assignment $\beta$ such that $\beta(u)=\alpha(u)$ for every variable $u\neq v$.
- **Universal quantifier:** $|\forall v\phi|^\alpha_\mathcal{A}=T$ iff $\phi$ is true for every possible value in $D_\mathcal{A}$ assigned to $v$, while leaving the values of all other variables fixed by $\alpha$. Formally, $|\forall v\phi|^\alpha_\mathcal{A}=T\iff|\phi|^\beta_\mathcal{A}=T$ for every assignment $\beta$ such that $\beta(u)=\alpha(u)$ for every variable $u\neq v$.

[TODO: **Examples:** show the examples i read through on pp.105-108, i understood them all.]

**Definition 5.7 (Logical truth, contradiction, equivalence & semantic consistency, p.108):**

- **Logically true:** A sentence $\phi$ is logically true iff $\phi$ is true in every $\mathcal{L}_2$-structure $\mathcal{A}$; i.e. $\mathcal{A}\models\phi$ for every $\mathcal{A}$.
- **Contradiction:** A sentence $\phi$ is a contradiction iff $\phi$ is false in every $\mathcal{L}_2$-structure $\mathcal{A}$; i.e. $\mathcal{A}\not\models\phi$ for every $\mathcal{A}$.
- **Logically equivalent:** Sentences $\phi$ and $\psi$ are logically equivalent iff they are true in exactly the same $\mathcal{L}_2$-structures; i.e. $\mathcal{A}\models\phi\iff\mathcal{A}\models\psi$ for every $\mathcal{A}$.
- **Semantically consistent:** A set $\Gamma$ of $\mathcal{L}_2$-sentences is *semantically consistent* iff there is at least one $\mathcal{L}_2$-structure $\mathcal{A}$ in which every sentence in $\Gamma$ is true; i.e. there exists some $\mathcal{A}$ such that $\mathcal{A}\models\phi$ for every $\phi\in\Gamma$. $\Gamma$ is *semantically inconsistent* iff no such $\mathcal{A}$ exists.

>**Definition 5.8 (Validity; Valid Argument, p.109):** Let $\Gamma$ be a set of $\mathcal{L}_2$-sentences (premises) and $\phi$ an $\mathcal{L}_2$-sentence (conclusion). The argument is *valid* iff there is no $\mathcal{L}_2$-structure $\mathcal{A}$ in which every sentence in $\Gamma$ is true and $\phi$ is false. Equivalently, every $\mathcal{L}_2$-structure that makes all the premises true also makes the conclusion true. This is written $\Gamma\models\phi$ and read "$\Gamma$ logically implies $\phi$" or "$\phi$ logically follows from $\Gamma$." We also say "semantically entails" or "logically entails" for "logically implies". **In other words:** There is no structure $\mathcal A$ in which all the premises in $\Gamma$ are true but the conclusion $\phi$ is false.

> **Note:** This is closely related to *tautology*, but that term is usually reserved for propositional logic. In predicate logic we instead say a sentence is *logically true* iff it is true in every structure.

An $\mathcal L_2$ structure $\mathcal A$ is a *counterexample* to an argument iff all premises of the argument are true in $\mathcal A$ and the conclusion is false in $\mathcal A$.

[TODO: work through the counterexample examples]

# Natural Deduction

>**Note:** the following notes use the `bussproof` which works with Obsidian, but this is easily adapted to `ebproof` or plain LaTeX instead.

**Basics.**

- As example, $P\wedge Q,P\to R\vdash P\lor Q$ reads as: the premises (left) *prove/derive* ($\vdash$) the conclusion $P\lor Q$, which is different from *logical implication* ($\vDash$) - see below.
- The premises $P\wedge Q$ and $P\to R$  are free to use throughout the deduction.
- As we proceed we may introduce temporary assumptions, e.g. $P$, but when an assumption is discharged by a rule we enclose it in square brackets $[P]$ to show it has been discharged.
- Various rules are applied to deduce conclusions from premises, and so the proof tree builds until we reach the desired final conclusion. The rules are:
	- $\wedge\;\mathrm{Intro}$ (*introduction*), $\wedge\;\mathrm{Elim}$ (*elimination*)
	- $\lor\;\mathrm{Intro}_{1}$ (*left*), $\lor\;\mathrm{Intro}_{2}$ (*right*), $\lor\;\mathrm{Elim}$
	- $\to\;\mathrm{Intro}$, $\to\;\mathrm{Elim}$
	- $\neg\;\mathrm{Intro}$, $\neg\;\mathrm{Elim}$

**Theorem (Soundness).** $\Gamma \vdash \varphi \Rightarrow \Gamma \vDash \varphi$.

>If $\varphi$ is provable from $\Gamma$, then $\varphi$ is logically implied by $\Gamma$.

**Theorem (Completeness).** $\Gamma \vDash \varphi \Rightarrow \Gamma \vdash \varphi$.

>If $\varphi$ is logically implied by $\Gamma$, then $\varphi$ is provable from $\Gamma$.

**Theorem (Adequacy).** $\Gamma \vDash \varphi \iff \Gamma \vdash \varphi$. 

> $\Gamma \vdash \varphi$ means: there is a formal proof of $\varphi$ from $\Gamma$ using the allowed rules of deduction. Whereas $\Gamma \vDash \varphi$ means: in every interpretation where all sentences in $\Gamma$ are true, $\varphi$ is also true.
> 
> For example $P, P \rightarrow Q \vdash Q$ because $Q$ can be formally derived by modus ponens, and $P, P \rightarrow Q \vDash Q$ because there is no interpretation in which both premises are true and $Q$ is false.
> 
> So $\vdash$ is about proofs, whereas $\vDash$ is about truth in all models, i.e. logical consequence; when there are no premises, $\emptyset\vDash\varphi$, or simply $\vDash\varphi$, expresses logical validity, analogous to a _tautology_ in propositional logic.

**Example 6.3** $P\lor Q,P\to R\vdash R\lor Q$.
**Proof.**
$$\require{bussproofs}
\begin{prooftree}
  \AxiomC{$P \lor Q$}
  \AxiomC{$[P]$}
  \AxiomC{$P \to R$}
  \RightLabel{$(\to\;\mathrm{Elim})$}
  \BinaryInfC{$R$}
  \RightLabel{$(\lor\;\mathrm{Intro}_{1})$}
  \UnaryInfC{$R \lor Q$}
  \AxiomC{$[Q]$}
  \RightLabel{$(\lor\;\mathrm{Intro}_{2})$}
  \UnaryInfC{$R \lor Q$}
  \RightLabel{$(\lor\;\mathrm{Elim})$}
  \TrinaryInfC{$R \lor Q$}
\end{prooftree}$$
**Explanation.**  The premises are $P\lor Q$ and $P\to R$. Since we know $P\lor Q$ we can assume $P$ in one branch and $Q$ in another and see if we can derive the conclusion $R\lor Q$ from each. With $P$ we know $R$ since $P\to R$. Now we can trivially introduce $R\lor Q$. On the other hand, if we assume $Q$ then we can trivially deduce $R\lor Q$. Finally, since $P\lor Q$, we have covered both branches and therefore $R\lor Q$.

**Example 6.4** $\neg(P\to Q)\vdash\neg Q$.
**Proof.**
$$
\require{bussproofs}
\begin{prooftree}
  \AxiomC{$[Q]$}
  \RightLabel{$(\to\;\mathrm{Intro})$}
  \UnaryInfC{$P\to Q$}
  \AxiomC{$\neg(P\to Q)$}
  \RightLabel{$(\neg\;\mathrm{Intro})$}
  \BinaryInfC{$\neg Q$}
\end{prooftree}
$$
**Explanation.** To prove a negative such as $\neg Q$ we can use proof by contradiction. First assume $Q$, then by using ($\to$ Intro) we can introduce $P\to Q$. On the other hand, we already have the premise $\neg(P\to Q)$. Given we have reached both $\phi$ and $\neg\phi$ we conclude in fact $\neg Q$, i.e. our original assumption $Q$ must be false. **Note.** here we introduce a "$\neg$" hence ($\neg$ Intro), which contrasts with the next example of ($\neg$ Elim) to remove the "$\neg$".

**Example 6.5** $\neg P\to Q,\neg Q\vdash P$.
**Proof.**
$$
\require{bussproofs}
\begin{prooftree}
  \AxiomC{$[\neg P]$}
  \AxiomC{$\neg P\to Q$}
  \RightLabel{$(\to\;\mathrm{Elim})$}
  \BinaryInfC{$Q$}
  \AxiomC{$\neg Q$}
  \RightLabel{$(\neg\;\mathrm{Elim})$}
  \BinaryInfC{$P$}
\end{prooftree}
$$
**Explanation.** Essentially this is just another proof by contradiction. We assume $\neg P$ and use the premise $\neg P\to Q$ which by ($\to$ Elim) gives $Q$, which together with $\neg Q$ forms a contradiction, so we may invoke ($\neg$ Elim) to discharge $\neg P$, and conclude $P$. Here, instead of introducing a negation as in Example 6.4, ($\neg$ Elim) discharges the negated assumption $\neg P$ and concludes the corresponding unnegated sentence $P$.

**Example 6.6** $\vdash P\lor\neg P$.
**Proof.**
$$
\require{bussproofs}
\begin{prooftree}
  \AxiomC{$[P]$}
  \RightLabel{$(\lor\;\mathrm{Intro}_{1})$}
  \UnaryInfC{$P\lor\neg P$}
  \AxiomC{$[\neg(P\lor\neg P)]$}
  \RightLabel{$(\neg\;\mathrm{Intro})$}
  \BinaryInfC{$\neg P$}
  \RightLabel{$(\lor\;\mathrm{Intro}_{2})$}
  \UnaryInfC{$P\lor \neg P$}
  \AxiomC{$[\neg(P\lor\neg P)]$}
  \RightLabel{$(\neg\;\mathrm{Elim})$}
  \BinaryInfC{$P\lor\neg P$}
\end{prooftree}
$$
**Explanation.** From the empty set $\emptyset$ we assume $P$, for we have no premises to use, and introduce $P\lor\neg P$. Next, assume $\neg(P\lor\neg P)$ to reach a contradiction, leading to the discharge of our first assumption $P$, i.e. $[P]$, and conclude the interim step $\neg P$. We then introduce $P\lor\neg P$ and again assume $\neg(P\lor\neg P)$, another contradiction through which negation elimination discharges the two $\neg(P\lor \neg P)$ terms to conclude $P\lor\neg P$, as required.

**Example 6.7** $\vdash(P\to Q)\leftrightarrow(\neg Q\to \neg P)$ .
**Proof.**
$$
\require{bussproofs}
\begin{prooftree}
  \AxiomC{$[P\to Q]$}
  \AxiomC{$[P]$}
  \BinaryInfC{$Q$}
  \AxiomC{$[\neg Q]$}
  \RightLabel{$(\neg\;\mathrm{Intro})$}
  \BinaryInfC{$\neg P$}
  \RightLabel{$(\to\;\mathrm{Intro})$}
  \UnaryInfC{$\neg Q\to\neg P$}
  \AxiomC{$[\neg Q\to \neg P]$}
  \AxiomC{$[\neg Q]$}
  \BinaryInfC{$\neg P$}
  \AxiomC{$[P]$}
  \RightLabel{$(\neg\;\mathrm{Elim})$}
  \BinaryInfC{$Q$}
  \RightLabel{$(\to\;\mathrm{Intro})$}
  \UnaryInfC{$P\to Q$}
  \RightLabel{$(\leftrightarrow\;\mathrm{Intro})$}
  \BinaryInfC{$(P\to Q)\leftrightarrow(\neg Q\to\neg P)$}
\end{prooftree}
$$
**Explanation.** We have no premises with which to start, so (branch 1) first assume $P\to Q$ and $P$, to obtain $Q$ and assume $\neg Q$ to form a contradiction to introduce $\neg P$ which discharges $P$. Next, since $\neg Q$ up until now, we may  introduce $\neg Q\to\neg P$. On the other hand, (branch 2) assume $\neg Q\to\neg P$ and $\neg Q$ to obtain $\neg P$, then assume $P$ to reach a contradiction and eliminate to obtain $Q$, and discharge $\neg Q$, and then introduce $P\to Q$. Now, branch 1 gives $(P\to Q)\to(\neg Q\to\neg P)$ and branch 2 gives $(\neg Q\to\neg P)\to(P\to Q)$, hence we introduce (conclude) that $(P\to Q)\leftrightarrow(\neg Q\to\neg P)$, as required, which also discharges the initial branch assumptions $P\to Q$ and $\neg Q\to\neg P$.

**Example 6.8** $\neg(Q\land\neg R)\vdash Q\to R$.
**Proof.** 
$$
\require{bussproofs}
\begin{prooftree}
  \AxiomC{$\neg(Q\land \neg R)$}
  \AxiomC{$[Q]$}
  \AxiomC{$[\neg R]$}
  \RightLabel{$(\wedge\;\mathrm{Intro})$}
  \BinaryInfC{$Q\land\neg R$}
  \RightLabel{$(\neg\;\mathrm{Elim})$}
  \BinaryInfC{$R$}
  \RightLabel{$(\to\;\mathrm{Intro})$}
  \UnaryInfC{$Q\to R$}
\end{prooftree}
$$

**Explanation.**  Assume $Q$ and $\neg R$ and introduce $Q\land\neg R$, then use the premise to reach a contradiction and eliminate $\neg R$ to obtain $R$. Finally introduce $Q\to R$ which discharges $Q$.

**Example 6.9** $P,\neg P\vdash Q$.
**Proof.**
$$
\require{bussproofs}
\begin{prooftree}
  \AxiomC{$P$}
  \AxiomC{$\neg P$}
  \BinaryInfC{$Q$}
\end{prooftree}
$$
**Explanation.** Halbach's definition of ($\neg$ Elim) is "The result of appending a sentence $\phi$ to a proof of $\psi$ and a proof of $\neg\psi$ and of discharging **all** assumptions of $\neg\phi$ in both proofs is a proof of $\phi$." Note the word "all" could be replaced with "zero or more". Since there are no assumptions on $\neg Q$ then "all" here relates to zero cases, and as such the rule still applies, hence $Q$.

TODO - continue to type up my book notes when I get time...
