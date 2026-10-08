# A Digestion of A Counterexample to the Generalized Lax Conjecture

The generalized Lax conjecture was a central topic of study in the field of hyperbolic polynomials. Hyperbolic polynomials in general serve as a bridge between the seemingly disparate fields of algebraic geometry and convex optimization, and the generalized Lax conjecture in particular gave a characterization of the possible structures of hyperbolic polynomials. This conjecture has been disproven in October of 2026 by an internal model from OpenAI. In a sense, this is the more interesting possibility for this conjecture, as it suggests that there is more richness to this theory of hyperbolic polynomials than previously thought. This post is an attempt to understand this counterexample and its generalizations

A polynomial $p \in \R[x_1, \dots, x_n]$ is said to be hyperbolic with respect to $v \in \R^n$ if for each $x \in \R^n$, the univariate polynomial $p(x-tv)$ has only real roots. The hyperbolicity cone associated to such a polynomial is then $\{x \in \R^n : p(x-tv) \text{ has only nonnegative roots}\}$.

The prototypical example of a hyperbolic polynomial is the determinant of an $n\times n$ symmetric matrix, which is hyperbolic with respect to the identity matrix due to the spectral theorem, and whose hyperbolicity cone is the set of positive semidefinite matrices. The generalized Lax conjecture essentially states that every hyperbolicity cone can be expressed as the intersection between a positive semidefinite cone and a linear subspace. Such a cone is said to be spectrahedral.

In order to show that the generalized Lax conjecture is false, one should take two steps, both of which are nontrivial: first show that a certain polynomial is hyperbolic, and then show that its hyperbolicity cone is not spectrahedral.
While showing that a polynomial is hyperbolic is not always easy, there have been many interesting constructions of hyperbolic polynomials in the literature.
None of these constructions had been shown to have nonspectrahedral hyperbolicity cones in the past (though in light of the disproof of the generalized Lax conjecture, one may wish to revisit some of these earlier constructions to see if they also are counterexamples to the conjecture). So one suspects that showing that the hyperbolicity cone is not spectrahedral will be the hard part. 
Indeed, that will turn out to be the case, but this question actually reduces down to a much better understood distinction, namely the distinction between completely positive operators and positive operators.
This distinction has been studied in the context of quantum mechanics for many years.\cite{TODO}.

The construction of the hyperbolicity cone can actually be stated fairly quickly. To motivate the construction, we will recall the Schur complement characterization of the positive semidefinite cone:
\[
\S^n_+ = \overline{\{\begin{pmatrix}X & Y \\ Y^{\intercal} & Z\end{pmatrix} : X \succ 0, Z \succeq Y^{\intercal}X^{-1}Y\}}.
\]
We will note a few features of the map $(X,Y) \mapsto Y^{\intercal}X^{-1}Y$

1. It is linear in $X^{-1}$.
1. It is quadratic in $Y$.
1. For any $Y$ and any $X \succeq 0$, the output is positive semidefinite.

We will say that a linear map $\Phi : \S^n \rightarrow S^m$ is positive if for every $X \succeq 0$, $\Phi(X) \succeq 0$. We will then define a quadratic family of positive maps (QFPM) to be a polynomial function $Phi : \S^n \times \R^k \rightarrow \S^m$ so that $\Phi(X,Y)$ is linear in $X$, quadratic in $Y$ and for every $Y$, the linear map $\Phi(\cdot, Y)$ is positive.

We then come to the construction of the relevant hyperbolicity cone.
\begin{theorem}
    Let $\Phi(X,Y)$ be a QFPM, then the following is a hyperbolicity cone
    \[
        H_{\Phi} = \overline{\{(Z,X,Y) \in \S^m \times \S^n \times \R^k : X \succ 0 Z \succeq \Phi(X^{-1},Y)\}}
    \]
    for the polynomial
    \[
        p_{\Phi} = \det(\det(X)Z - \Phi(\adj(X), Y))
    \]
    that is hyperbolic with respect to $(I,I,0)$.
    Here $\adj(X) = \det(X) X^{-1}$ for invertible $X$ is the adjugate of $X$.
\end{theorem}
\begin{remark}
    This definition is remarkably close to that of a Siegel cone for the PSD cone, which amounts to the special case of this construction when $n = 1$. Siegel cones of interest because every homogenous cone can be constructed by applying the Sigel cone operation repeatedly to one of a few basic homogeneous cones.
\end{remark}

There are in fact many hyperbolicity cones that result from this construction. We now want to find one such cone which is not spectrahedral. Or to put another way, we want to find conditions that $\Phi$ needs to satisfy in order for this cone to be spectrahedral.

One sufficient condition for the cone to be spectrahedral is for $\Phi$ to be completely positive in the following sense: there exist some positive operator $E : \S^n \rightarrow S^{n'}$ and linear map $F : \R^k \rightarrow \R^{n' \times m}$ so that 
\[
\Phi(X,Y) = A(Y)^{\intercal} E(X) A(Y),
\]
in which case 
\[
    H_{\Phi} = \{(Z,X,Y) : \begin{pmatrix} E(X) & A(Y)^{\intercal} \\ A(Y) & Z\end{pmatrix}\}.
\]

The first thing that the OpenAI paper did to show that there is a nonspectrahedral hyperbolicity cone is to show the following:
\begin{theorem}
    Let $\Phi(X,Y)$ be a QFPM, and suppose that $H_{\Phi}$ is spectrahedral. Then there exist positive maps $E : S^n \rightarrow S^{n'}$ and $G: S^m \rightarrow S^{m'}$ so that $E(I) = G(I) = I$, together with a linear map $F : \R^k \rightarrow \R^{n' \times m'}$ so that 
    \[
        H_{\Phi} = \{\begin{pmatrix} E(X) & F(Y) \\ F(Y)^{\intercal} & G(Z)\end{pmatrix} \succeq 0\}.
    \]
\end{theorem}
Thus, if $H_{\Phi}$ is spectrahedral, then it must look like the construction applied to a completely positive $\Phi$.
In particular, this suggests that if $\Phi$ which is not completely positive is passed through this construction, then $H_{\Phi}$ will not be spectrahedral.
It may not seem obvious that there exists such a completely positive QFPM that is not completely positive. However, such maps are known to exist, and the original paper by OpenAI uses a specific construction of such a map.

Before we describe the particular example, we will proceed from the previous lemma to see what this description implies about $\Phi$. In order to do this, it is helpful to give an alternative formulation of the definition of a QFPM and completely positive such maps.

To begin, we note that a linear map $\Phi : \S^n \rightarrow \S^m$ is positive if and only if the following biquadratic polynomial is pointwise nonnegative:
\[
    B(u,v) = u^{\intercal}\Phi(vv^{\intercal})u.
\]
This follows directly from a the fact that the extreme rays of $S^m$ are spanned by rank 1 matrices. Such a positive map is said to be completely positive if this biquadratic form is a sum-of-squares of bilinear forms.

Similarly, we associate to each QFPM a \emph{triquadratic} polynomial
\[
    T(u,v,Y) = u^{\intercal}\Phi(vv^{\intercal}, Y)u.
\]
Again, this polynomial is pointwise nonnegative exactly when $\Phi$ is a QFPM, and $\Phi$ is completely positive if and only if $T$ is a sum of squares.

Using the previous lemma, we find the following
\begin{theorem}
    Suppose that $\Phi$ has an associated triquadratic polynomial $T$, and that for all $v \in \R^n$ so that
    \[
        T(v,v,Y) = 0
    \]
    for all $Y \in \R^k$.
    Further suppose that $ $
\end{theorem}



A recent counterexample to the generalized Lax conjecture starts from a surprisingly concrete object: a \(3\times 3\) matrix polynomial \(Q(y)\) which is positive semidefinite for every \(y\), but which cannot be factored as a polynomial matrix square.

The construction turns this failure of polynomial factorization into a positive linear map on \(4\times 4\) symmetric matrices. The associated hyperbolicity cone then has a particularly simple description: on its positive-definite part, it is the matrix-valued epigraph of the nonlinear map

\[
(X,y)\longmapsto \Phi_y(X^{-1}).
\]

The fact that this epigraph cannot be represented by any linear matrix inequality is ultimately inherited from the non-SOS behavior of \(Q(y)\).

## 1. A PSD matrix polynomial which is not a matrix sum of squares

Let \(y=(y_1,y_2,y_3)\), with indices interpreted cyclically, and define

\[
Q(y)=
\begin{pmatrix}
y_1^2+y_2^2 & -y_1y_2 & -y_1y_3\\
-y_1y_2 & y_2^2+y_3^2 & -y_2y_3\\
-y_1y_3 & -y_2y_3 & y_3^2+y_1^2
\end{pmatrix}.
\]

Associated to \(Q\) is the biquadratic form

\[
b(z,y)=z^\top Q(y)z.
\]

Explicitly,

\[
b(z,y)
=
\sum_{i=1}^3 z_i^2y_i^2
-2\sum_{1\le i<j\le3}z_i y_i z_j y_j
+\sum_{i=1}^3z_i^2y_{i+1}^2.
\]

This is the classical Choi–Lam biquadratic form. It satisfies

\[
b(z,y)\ge 0
\qquad\text{for every }z,y\in\mathbb R^3.
\]

Equivalently,

\[
\boxed{Q(y)\succeq0\qquad\text{for every }y.}
\]

One can verify this directly from the principal minors. For example,

\[
\det Q(y)
=
y_1^4y_2^2+y_2^4y_3^2+y_3^4y_1^2
-3y_1^2y_2^2y_3^2
\ge0
\]

by AM–GM.

Despite being pointwise positive semidefinite, \(Q(y)\) is not a polynomial matrix sum of squares. There is no polynomial matrix \(H(y)\) such that

\[
Q(y)=H(y)^\top H(y).
\]

Since \(Q\) is homogeneous quadratic, such a factorization could be taken with \(H(y)\) linear in \(y\). It would imply

\[
b(z,y)
=
z^\top H(y)^\top H(y)z
=
\|H(y)z\|^2
=
\sum_k \ell_k(z,y)^2,
\]

where each \(\ell_k\) is bilinear in \((z,y)\).

The Choi–Lam form is not of this type.

In fact, it satisfies a considerably stronger property. If a bilinear form \(\ell(z,y)\) satisfies

\[
\ell(z,y)^2\le b(z,y)
\qquad\text{for all }z,y,
\]

then necessarily

\[
\ell=0.
\]

This is sometimes called **weak extremality**. The proof uses the unusually rich zero set of \(b\), together with curves along which \(b\) vanishes to fourth order.

This stronger fact will eventually be what rules out an LMI representation.

## 2. From \(Q(y)\) to a positive map on \(4\times4\) matrices

Fix \(y\). We now use \(Q(y)\) to define a linear map

\[
\Phi_y:\mathbb S^4\longrightarrow \mathbb S^4.
\]

Write a matrix \(T\in\mathbb S^4\) in block form as

\[
T=
\begin{pmatrix}
a&r^\top\\
r&T'
\end{pmatrix},
\]

where \(a\in\mathbb R\), \(r\in\mathbb R^3\), and \(T'\in\mathbb S^3\). Define

\[
\boxed{
\Phi_y(T)
=
\begin{pmatrix}
\operatorname{tr}(Q(y)T')&-r^\top Q(y)\\
-Q(y)r&aQ(y)
\end{pmatrix}.
}
\]

For fixed \(y\), this is linear in \(T\). Its dependence on \(y\) is homogeneous quadratic.

Why choose this peculiar formula?

Because its action on rank-one matrices reproduces the Choi–Lam form exactly.

Let

\[
v=
\begin{pmatrix}
v_0\\v'
\end{pmatrix}
\in\mathbb R^4.
\]

Then

\[
vv^\top
=
\begin{pmatrix}
v_0^2&v_0v'^\top\\
v_0v'&v'v'^\top
\end{pmatrix}.
\]

Therefore

\[
\Phi_y(vv^\top)
=
\begin{pmatrix}
v'^\top Q(y)v'
&
-v_0v'^\top Q(y)
\\
-v_0Q(y)v'
&
v_0^2Q(y)
\end{pmatrix}.
\]

For another vector \(u=(u_0,u')\in\mathbb R^4\),

\[
u^\top\Phi_y(vv^\top)u
=
(v_0u'-u_0v')^\top
Q(y)
(v_0u'-u_0v').
\]

Hence

\[
\boxed{
u^\top\Phi_y(vv^\top)u
=
b(v_0u'-u_0v',y).
}
\]

Since \(b\ge0\),

\[
\Phi_y(vv^\top)\succeq0.
\]

Every PSD matrix is a nonnegative sum of rank-one PSD matrices, so linearity gives

\[
\boxed{
T\succeq0
\quad\Longrightarrow\quad
\Phi_y(T)\succeq0.
}
\]

Thus \(\Phi_y\) is a positive linear map.

There is also a useful direct factorization for a rank-one input:

\[
\Phi_y(vv^\top)
=
\begin{pmatrix}
-v'^\top\\
v_0I_3
\end{pmatrix}
Q(y)
\begin{pmatrix}
-v'&v_0I_3
\end{pmatrix}.
\]

So the positivity of \(\Phi_y\) follows immediately from the positivity of \(Q(y)\).

## 3. Positive, but not of a completely positive type

There is a familiar dictionary between positive maps and nonnegative biquadratic forms.

Given a linear map

\[
\Psi:\mathbb S^m\to\mathbb S^n,
\]

one can form

\[
b_\Psi(x,u)
=
u^\top\Psi(xx^\top)u.
\]

If \(\Psi\) is positive, then \(b_\Psi\ge0\).

On the other hand, if \(\Psi\) has a Kraus-type factorization

\[
\Psi(T)=\sum_k A_kTA_k^\top,
\]

then

\[
u^\top\Psi(xx^\top)u
=
\sum_k (u^\top A_kx)^2.
\]

So the associated biquadratic form is a sum of squares of bilinear forms.

This gives the heuristic correspondence

\[
\text{positive map}
\quad\leftrightarrow\quad
\text{nonnegative biquadratic form},
\]

whereas

\[
\text{completely positive / Kraus-factorizable map}
\quad\leadsto\quad
\text{SOS biquadratic form}.
\]

The map \(\Phi_y\) is built so that its rank-one behavior is controlled by the Choi–Lam form. The point is therefore not just that \(\Phi_y\) preserves the PSD cone, but that its positivity comes from an underlying biquadratic form which refuses to admit the bilinear-square factorizations that an LMI representation will eventually try to produce.

This distinction between positivity and factorized positivity is the central algebraic ingredient of the construction.

## 4. The cone as a matrix epigraph

Now introduce two symmetric \(4\times4\) matrices \(X,Z\) and the parameter \(y\in\mathbb R^3\).

Consider first \(X\succ0\). Since \(X^{-1}\succ0\) and \(\Phi_y\) is positive,

\[
\Phi_y(X^{-1})\succeq0.
\]

The basic convex set appearing in the construction is

\[
\boxed{
Z\succeq \Phi_y(X^{-1}).
}
\]

This can be viewed as a **matrix epigraph**:

\[
\operatorname{epi}\Phi
=
\left\{
(X,Z,y):
X\succ0,\;
Z\succeq\Phi_y(X^{-1})
\right\}.
\]

Here the order is the Loewner order rather than the ordinary scalar order.

This is analogous to the scalar epigraph

\[
t\ge f(x),
\]

except that both \(t\) and \(f(x)\) are replaced by symmetric matrices and comparison is by positive semidefiniteness.

A useful feature is the scaling

\[
\Phi_{sy}(T)=s^2\Phi_y(T).
\]

Together with

\[
(sX)^{-1}=s^{-1}X^{-1},
\]

this makes

\[
Z\succeq\Phi_y(X^{-1})
\]

compatible with the homogeneous conic structure one expects from a hyperbolicity cone.

## 5. Producing the hyperbolic polynomial

The matrix inequality above contains \(X^{-1}\), so it is not yet given by a polynomial.

For invertible \(X\),

\[
X^{-1}
=
\frac{\operatorname{adj}X}{\det X}.
\]

Since \(\Phi_y\) is linear in its matrix argument,

\[
\Phi_y(X^{-1})
=
\frac{1}{\det X}
\Phi_y(\operatorname{adj}X).
\]

Therefore

\[
Z-\Phi_y(X^{-1})
=
\frac{1}{\det X}
\left(
(\det X)Z-\Phi_y(\operatorname{adj}X)
\right).
\]

This suggests defining

\[
p(X,Z,y)
=
\det\left(
(\det X)Z-\Phi_y(\operatorname{adj}X)
\right).
\]

For invertible \(X\),

\[
p(X,Z,y)
=
(\det X)^4
\det\left(
Z-\Phi_y(X^{-1})
\right).
\]

The polynomial \(p\) is homogeneous of degree \(20\) in

\[
(X,Z,y)\in
\mathbb S^4\times\mathbb S^4\times\mathbb R^3,
\]

an ambient space of dimension

\[
10+10+3=23.
\]

It is hyperbolic with respect to

\[
e=(I_4,I_4,0).
\]

Most importantly, if \(K\) denotes its closed hyperbolicity cone, then on the positive-definite slice

\[
\boxed{
X\succ0:
\qquad
(X,Z,y)\in K
\iff
Z\succeq\Phi_y(X^{-1}).
}
\]

So the hyperbolicity cone is, on its dense positive-definite region, exactly the matrix epigraph described above.

At \(y=0\), since \(\Phi_0=0\), the cone reduces to

\[
(X,Z,0)\in K
\iff
X\succeq0,\qquad Z\succeq0.
\]

Thus one can think of the parameter \(y\) as deforming the product cone

\[
\mathbb S_+^4\times\mathbb S_+^4
\]

by inserting the positive map \(\Phi_y\).

## 6. The degree-16 polynomial

The degree-\(20\) polynomial contains an unnecessary factor of \(\det X\).

Let

\[
K_i=
\begin{pmatrix}
0&e_i^\top\\
-e_i&0
\end{pmatrix},
\qquad
C=(K_1\;K_2\;K_3).
\]

Then

\[
\Phi_y(T)
=
C\bigl(Q(y)\otimes T\bigr)C^\top.
\]

This leads to the block determinant

\[
q(X,Z,y)
=
\det
\begin{pmatrix}
I_3\otimes X&C^\top\\
C(Q(y)\otimes I_4)&Z
\end{pmatrix}.
\]

A Schur complement gives, when \(X\) is invertible,

\[
q(X,Z,y)
=
(\det X)^3
\det\left(
Z-\Phi_y(X^{-1})
\right).
\]

Consequently,

\[
p(X,Z,y)
=
(\det X)q(X,Z,y).
\]

The polynomial \(q\) has degree \(16\), is hyperbolic with respect to the same direction \(e\), and has exactly the same hyperbolicity cone as \(p\).

Thus the final counterexample can be represented by a degree-\(16\) homogeneous polynomial in \(23\) variables.

## 7. Why this epigraph is not spectrahedral

Suppose, hypothetically, that the cone were spectrahedral:

\[
K=
\{(X,Z,y):L(X,Z,y)\succeq0\}
\]

for some finite-dimensional linear pencil \(L\).

The proof in the paper studies what such a representation would imply for the matrix epigraph

\[
Z\succeq\Phi_y(X^{-1}).
\]

After a sequence of rescalings and degenerations toward rank-one matrices, a hypothetical LMI representation produces a matrix-valued bilinear function \(F(z,y)\) satisfying

\[
\|F(z,y)\|_{\mathrm{op}}^2
=
b(z,y).
\]

Every scalar entry \(F_{ij}(z,y)\) is a bilinear form and therefore obeys

\[
F_{ij}(z,y)^2
\le
\|F(z,y)\|_{\mathrm{op}}^2
=
b(z,y).
\]

But the weak extremality property of the Choi–Lam form says that the only bilinear form whose square is dominated by \(b\) is zero.

Therefore every entry of \(F\) must vanish:

\[
F_{ij}=0.
\]

Hence \(F=0\), which contradicts

\[
\|F(z,y)\|_{\mathrm{op}}^2=b(z,y),
\]

because \(b\) is not identically zero.

Therefore no such pencil exists.

The hyperbolicity cone is not spectrahedral.

## 8. The overall picture

The construction can be summarized as

\[
\boxed{
Q(y)\succeq0
\text{ pointwise}
}
\]

but

\[
\boxed{
Q(y)\text{ is not a polynomial matrix SOS}.
}
\]

This produces a family of positive maps

\[
\Phi_y:\mathbb S^4_+\to\mathbb S^4_+
\]

whose positivity is controlled by the Choi–Lam form.

That family defines the matrix epigraph

\[
\boxed{
Z\succeq\Phi_y(X^{-1}).
}
\]

Clearing the inverse produces a hyperbolic polynomial whose cone is exactly this epigraph, after closure.

Finally, if the cone had an LMI representation, the LMI structure would force a bilinear-square factorization hidden inside the Choi–Lam form. Weak extremality makes such a factorization impossible.

The mechanism is therefore remarkably close in spirit to the classical gap between positive and completely positive maps:

\[
\boxed{
\text{pointwise positivity}
\;\not\Rightarrow\;
\text{factorized positivity}.
}
\]

The hyperbolicity cone turns this algebraic distinction into a geometric one:

\[
\boxed{
\text{hyperbolicity cone}
\;\not\Rightarrow\;
\text{spectrahedron}.
}
\]
