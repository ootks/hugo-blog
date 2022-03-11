+++
title = "Hyperbolic Polynomials"
date = 2021-12-11T23:16:26-05:00
images = []
tags = []
categories = []
draft = true
+++
#An Example
The spectral theorem says (amongst other things) that if $X$ is a symmetric matrix, then $X$ has real eigenvalues.
One way of phrasing this is that for any symmetric $X$, the univariate polynomial $g(t)$ defined by
$$ g(t) = \det(X - tI)$$
has only real roots.

This may seem like a strange way of phrasing the spectral theorem, because it is not clear what value we get out of a certain polynomial being real rooted.
However, it turns out that real rooted polynomials are a central part of modern algebraic geometry, because they offer some surprising connections between real analysis, algebra, and combinatorics.
Indeed a lot of the modern theory of real rooted polynomials comes from connections to the Riemann Hypoothesis.
Hyperbolic polynomials are a multivariate generalization of the notion of real rootedness that also are interesting from the point of view of convex optimization. 

#A Quick Tour of Hyperbolic Polynomials
#### Definition
> A polynomial $p \in \mathbb{R}[x_1, \dots, x_n]$ is said to be __hyperbolic__ with respect to $e \in \mathbb{R}^n$ if $p(e) \neq 0$, and for every $x \in \mathbb{R}^n$, the univariate polynomial $g(t) = p(x - te)$ has only real roots.

The spectral theorem implies that the determinant is hyperbolic with respect to the identity matrix, but it turns out that many other polynomial are hyperbolic in various directions.

A simple example of this is the polynomial $x_1x_2\dots x_n \in \mathbb{R}[x_1, \dots, x_n]$ in any $e \in \mathbb{R}^n$ with no nonzero entries, since the polynomial 
$$ (x_1 - e_1 t)(x_2 - e_2 t)\dots(x_n - e_n t)$$
clearly has only has roots at points of the form $\frac{e_i}{x_i}$ for some $i$, and all such points are real.

Another simple example is that the determinant of a symmetric matrix is actually hyperbolic with respect to any positive definite matrix, since if $E = VV^{\intercal}$, 
$$ \det(X - t E) = \det(E)\det(V^{-1}X(V^{-1})^{\intercal} - tI),$$
and this has real roots by the spectral theorem.

There are more complicated examples of such polynomials though. A nice family of examples come from the elementary symmetric polynomials and their matrix analogues:

$$e_k(x) = \sum_{S} \prod_{i \in S}x_i,$$
$$E_k(X) = \sum_{S} \det(X_S).$$
Both sums are over the set of subsets of $[n]$ of size at most $k$, and if $X$ is a matrix, then $X_S$ is the principal submatrix of $X$ indexed by the set $S$.
The fact that these are hyperbolic

Other examples come from combinatorics. For instance, if $G$ is any graph, then the polynomial
$$ T_G(x) = \sum_{S \subseteq \mathcal{T}(G)} \prod_{i \in S}x_i$$
is hyperbolic with respect to the all one's vector (or indeed any vector with nonnegative entries.
This has to do with the famous tree Kirchoff matrix tree theorem, which says that this polynomial can be expressed as the determinant of a certain matrix with polynomial entries. 

There are many other such examples, coming from the theory of matroids.

One basic question that you can ask about a hyperbolic polynomial is 'which directions is the polynomial hyperbolic with respect to?'
For instance, we have seen that the determinant is in fact hyperbolic with respect to any PSD matrix (though it is not hyperbolic with respect to any symmetric matrix).

In fact, there are some nice connections at this point with topology.
It turns out that the roots of a polynomial are continuous functions of its coefficients. So, we can consider some fixed $x$, and the polynomial
$$p(x - te).$$
Now, imagine $e$ varies throughout $\mathbb{R}^n$, and watch how the roots move in the complex plane.
The number of roots in the complex plane is equal to degree of $p(x-te)$, and because this polynomial has real coefficients, the roots come in complex conjugate pairs.
So, as we move $e$ around, there are only two ways that the number of real roots can change:
* The degree of $p(x-te)$ decreases.
* Two roots of $p(x-te)$ collide, and then become a complex conjugate pair of roots.
The degree of $p(x-te)$ is equal to the degree of $p$ as long as $p(e) \neq 0$, so the first condition is easy to check. The second condition is a little more complicated, but it turns out that having a double root is can be checked using a certain polynomial in the coefficients of $p(x-te)$, namely, the resultant of $p(x-te)$ and $\frac{d}{dt} p(x-te)$.
Because these polynomials are we see that the roots of this univariate polynomial are going to vary in a continuous fashion.
Moreover, as long as the degree of the polynomial remains the same, real roots cannot be created or removed on their own; they must come in complex conjugate pairs, so if $p$ is hyperbolic with respect to some fixed $e$. 

# Univariate Hyperbolicity
