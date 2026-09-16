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

