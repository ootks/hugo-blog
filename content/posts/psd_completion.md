+++
title = "Surprising Positive Semidefiniteness"
date = 2021-09-09T00:05:13-04:00
tags = ["math"]
categories = []
draft = false
+++
They say that in Euclidean geometry, the solutions to all problems start by drawing a line somewhere in the picture. I think that this is characteristic of my favorite kind of proof, where you can't just move forward in a linear fashion to get to an answer, but you actually have to add something new, that you might not have thought was related to the old proof.

Here are two proofs that I only recently thought of as being related to each other. They are both about proving that a certain matrix is positive semidefinite (PSD), meaning that they have nonnegative eigenvalues, and we will prove them by finding that matrix inside a much larger PSD matrix.

It is actually not too hard to show that if you take a principal submatrix of a PSD matrix, that will also be PSD. But we can make use of a slightly stronger theorem to strengthen our results.

#### Theorem (Cauchy Interlacing Theorem)

> Let $X$ be an $n \times n$ symmetric matrix, and let $Y$ be a $k\times k$ principal submatrix of $X$ (that is, we obtain $Y$ by deleting $n-k$ rows and their corresponding columns). Let $\lambda_i(\cdot)$ denote the $i^{th}$ smallest eigenvalue function. Then, for each $i = 1,\dots,k$,
$$
    \lambda_{i}(X) \le \lambda_i(Y) \le \lambda_{i+n-k}(X).
$$


Disclaimer: There are almost certainly better proofs of both of these results, but I think highlighting their similarities is interesting enough for us. It will also allow us to prove what I think is an unknown fact about Schur 

# The Schur Product Theorem

We all know how to multiply square matrices. If $X$ and $Y$ are two matrices, then each entry of $X \cdot Y$ is the product of the corresponding entries of $X$ and $Y$.

This style of multiplication, called the Hadamard product, is sort of weird, but what is weirder is that it actually interacts well with linear algebraic forms of multiplication.

#### Theorem (Schur Product Theorem)

> Let $X$ and $Y$ be PSD matrices, then the Hadamard product, $X \cdot Y$ is also PSD.

How can we go about proving this? The difficulty is that the Hadamard product seems to depend a lot on the basis of the underlying vector space, whereas the eigenvalues of a matrix are naturally basis independent. What we might try to do is to relate the basis dependent $X \cdot Y$ with a naturally basis invariant thing.

To do this, we will need the notion of a [tensor product](https://en.wikipedia.org/wiki/Tensor_product). There are actually two related notions here: the tensor product of vector spaces, and of matrices. The tensor product of vector spaces $V$ and $W$ is the vector space spanned by simple tensors of the form $v \otimes w$, where $v \in V$ and $w \in W$, together with some natural relations that make the tensor product behave like the usual product.

The tensor product of matrices $X$ and $Y$, $X \otimes Y$, is given as follows: it is an $n^2 \times n^2$ matrix where, for a tensor product vector $v \otimes w$, $(X \otimes Y)(v\otimes w) = (Xv)\otimes(Yw)$. If $v$ is a vector satisfying $Xv = \lambda v$, and $w$ is a vector satisfying $Yw = \mu w$, then $v \otimes w$ satisfies $(X\otimes Y)(v \otimes w) = \lambda\mu v\otimes w$. So, we can see that the eigenvalues of $X \otimes Y$ are all of the form $\lambda \mu$, where $\lambda$ and $\mu$ are eigenvalues of $X$ and $Y$ respectively.

In particular, it is easy to see that if $X$ and $Y$ are PSD, then $X \otimes Y$ is also PSD. This proof was relatively straightforward, since the object that we are looking at $X \otimes Y$ is basis invariant.

Now we relate $X \otimes Y$ to $X \cdot Y$ by looking at the entries of $X \otimes Y$ in the natural basis consisting of vectors of the form $e_i \otimes e_j$ for basis vectors $e_i$ and $e_j$. We can find the entries of this matrix using the natural inner product of $V \otimes W$, given by $\langle v_1 \otimes w_1, v_2 \otimes w_2\rangle = \langle v_1, w_1 \rangle \langle v_2, w_2\rangle$, in which case,
$$
    (e_i \otimes e_j)^{\intercal} (X \otimes Y) (e_{\ell}\otimes e_k) = X_{i,\ell}Y_{j,k},
$$
That is, the entries of $X \otimes Y$ in this basis are really just pairwise products of entries of entries of $X$ and $Y$, which sounds suspiciously like the definition of the Hadamard product. Indeed, let take the principal submatrix of $X \otimes Y$ that you get from just looking at basis elements of the form $e_i \otimes e_i$, in which case, you get that
$$
    (e_i \otimes e_i)^{\intercal} (X \otimes Y) (e_j\otimes e_j) = X_{i,j}Y_{i,j} = (X \cdot Y)_{i,j}.
$$
That is, if you delete all of the rows and columns of $X\otimes Y$ that are indexed by basis elements of the form $e_i \otimes e_j$ for $i \neq j$, then you get $X \cdot Y$. So, $X \cdot Y$ is actually a principal submatrix of $X \otimes Y$!

In particular, since $X \otimes Y$ is 'obviously PSD', that means that $X \cdot Y$ is PSD! We can even get bounds on the eigenvalues of $X \cdot Y$ in terms of the eigenvalues of $X$ and $Y$. Let $v(X,Y)$ denote the $n^2$ long vector that you get from taking all of the pairwise products of eigenvalues of $X$ and $Y$, and sorting them from smallest to largest. Then, by Cauchy interlacing,
$$
    v(X,Y)_i \le \lambda_i(X \cdot Y) \le v(X,Y)_{i + n^2 - n}.
$$

# Schur Complements

I have heard it said that the difference between a pure mathematician and an applied mathematician is that an applied mathematician knows what a Schur complement is (and likes it). When I was an undergrad studying mathematics, I had briefly heard of a Schur complement, and dismissed it as an ugly trick. Now, I suppose I have turned over a new leaf.

Let $X$ be an $n\times n $matrix, and let $T \subseteq [n]$ index a subset of the columns of $X$. Also, 
assume that $X_{T,T}$ is invertible. Then
$$
    X \setminus T = X_{T^c,T^c} - X_{T^c, T} X_{T,T}^{-1} X_{T,T^c}.
$$
Here, $X_{S,T}$ is the submatrix of $X$ whose columns are indexed by $S$ and whose rows are indexed by $T$.


One nice thing about Schur complements is that they interact nicely with other Schur complements, and also the operations of taking submatrices.

Precisely, let $S, U$ be disjoint from $T$, then
$$
    (X \setminus S)\setminus T = X\setminus (S \cup T),
$$
and
$$
    (X_{S\cup T,U\cup T})\setminus T = (X\setminus T)_{S,U}.
$$
(Yes, the notation is quite terrible, but again, this is applied math, so that is perhaps to be expected.)

We also have the determinant formula for Schur complements, which we will use without proof.

#### Theorem (Determinant Formula)
> $\det(X) = \det(X_{T,T})\det(X \setminus T)$.

Using the above properties, it can be seen that the entries of the Schur complement satisfy
$$
    (X \setminus T)_{i,j} = \frac{1}{\det(X_{T,T})}\det(X_{T+i, T+j}).
$$

We should expect that the following theorem hold then:

#### Theorem (Schur Complement Theorem)
> Let $X$ be a PSD matrix, then $X \setminus T$ is PSD for any $T \subseteq [n]$.

This is often stated as a consequence of a more general fact, known as Haynesworth inertia additivity, named after [Emilie Virginia Haynsworth](https://en.wikipedia.org/wiki/Emilie_Virginia_Haynsworth), who I think should be a better known mathematician.
Let's give a proof more in line with our previous proof.

To do this, we will make use an object called the [exterior power](https://en.wikipedia.org/wiki/Exterior_algebra) of a vector space, which is related to the tensor product, but slightly more complicated.

Given a vector space $V$, $\Land^{(k)}V$ is a vector space spanned by elements of the form
$$
    v_1 \wedge v_2 \dots \wedge v_k,
$$
where $v_i \in V$ for each $i$.
This exterior power also satisfies two relations:

* **Multilinearity**
$$
    (v_1+\lambda w) \wedge v_2 \dots \wedge v_k = 
    v_1 \wedge v_2 \dots \wedge v_k + \lambda (w \wedge v_2 \dots \wedge v_k)
$$

* **Alternativity** For any $i \in [k]$,
$$
    v_1 \wedge v_2 \dots \wedge v_i \wedge v_{i+1} \dots \wedge v_k = 
    - v_1 \wedge v_2 \dots \wedge v_{i+1} \wedge v_{i} \dots \wedge v_k
$$

These two properties make the exterior power related to the determinant of a matrix. Indeed, we can define the wedge power of a matrix in a similar way to the tensor power:
$$
    (\Land^{(k)}X)(v_1 \wedge v_2 \dots \wedge v_k) = 
    Xv_1 \wedge Xv_2 \dots \wedge Xv_k.
$$

In this case, it can be seent that $\Land^{(n)} V$ is a 1-dimensional vector space spanned by $e_1\wedge e_2\dots \wedge e_n$, and that 
$$
    (\Land^{(n)}X)(e_1 \wedge \dots \wedge e_n) = \det(X) e_1 \wedge \dots \wedge e_n.
$$

Generally, let $S \subseteq [n]$ be of size $k$, and let
$$
    e_S = e_{s_1} \wedge e_{s_2} \wedge \dots e_{s_k}.
$$
Then 
$\Land^{(k)} V$ is an $\binom{n}{k}$ dimensional vector space with $\{e_S\}$ as a basis.

There is also a natural inner product on wedge powers given by
$$
    \langle v_1 \wedge v_2 \dots \wedge v_k, w_1 \wedge w_2 \dots \wedge w_k \rangle = 
    \det \begin{pmatrix} \langle v_1, w_1 \rangle & \langle v_1, w_2 \rangle & \dots & \langle v_1, w_k\rangle\\
    \langle v_2, w_1 \rangle & \langle v_2, w_2 \rangle & \dots & \langle v_2, w_k\rangle\\
    &&\dots&\\
    \langle v_k, w_1 \rangle & \langle v_k, w_2 \rangle & \dots & \langle v_k, w_k\rangle
    \end{pmatrix}.
$$
The fact that this is an inner product is implied by the [Cauchy-Binet Theorem](https://en.wikipedia.org/wiki/Cauchy%E2%80%93Binet_formula).

Now, we can perform the same trick as before: let's look at the eigenvalues of this matrix, and also look at its entries. 

If $v_1, \dots, v_k$ are eigenvectors of $X$, with eigenvalues $\lambda_1, \dots, \lambda_k$, then
$$
    (\Land^{(k)}X)(v_1 \wedge v_2 \dots \wedge v_k) = 
    Xv_1 \wedge Xv_2 \dots \wedge Xv_k = \prod_{i=1}^k \lambda_i (v_1 \wedge \dots \wedge v_k).
$$
So, it is clear that the eigenvalues of $\Land^{(k)}X$ are precisely $\prod_{i=1}^k \lambda_i$, where $\lambda_i$ are distinct eigenvalues of $X$. In particular, if $X$ is PSD, then so is $\Land^{(k)}X$.

On the other hand, we can look at the entries of $\Land^{(k)}X$ as follows: let $S = \{i_1, \dots, i_k\}$, and let $U = \{j_1, \dots, j_k\}$, then
$$
    (e_{i_1} \wedge e_{i_2} \dots \wedge e_{i_k})^{\intercal} (X \otimes Y) (e_{j_1} \wedge e_{j_2} \dots \wedge e_{j_k}) = \det(X_{S,U}).
$$

Now, we can connect this back to Schur complements: let $k = |T| + 1$, consider the submatrix of $\wedge^{(k)}X$ indexed by basis vectors of the form $e_{t_1} \wedge e_{t_2} \wedge e_{t_{k-1}} \wedge e_{j}$, for some $j \not \in T$, then then from our earlier properties,
$$
    (X \setminus T)_{j,k} = \frac{1}{\det(X_{T,T})}\det(X_{T+j,T+k}) = \frac{1}{\det(X_{T,T})} (\Land^{(k)} X)_{T+i, T+k}.
$$
Thus, we have discovered $(X \setminus T)$ as a principal submatrix of $\Land^{(k)} X$, and so is PSD.

In fact, we have a slightly stronger fact, let $v$ be the $\binom{n}{|T|+1}$-length vector whose entries are all of the ways of taking products of $|T|+1$ eigenvalues of $X$, in sorted order, then
$$
    v_i \le \lambda_i(X\setminus T) \le v_{i + \binom{n}{|T|+1} - n+|T|}.
$$

I wonder if this inequality is tight?