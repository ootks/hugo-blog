+++
title = "The Newton Identities"
date = 2022-03-11T17:09:20-05:00
images = []
tags = []
categories = []
draft = true
+++

The Newton identities, named after Isaac Newton, relate two symmetric polynomials: the elementary symmetric polynomials
$$e_k(x_1, \dots, x_n) = \sum_{S \subseteq [n] : |S| = k} \prod_{i \in S}x_i,$$
and the polynomial moments:
$$\mu_k(x_1, \dots, x_n) = \sum_{i=1}^n x_i^k.$$

It is a general fact that these generate the ring of symmetric functions as an algebra, which is a fancy way of saying that if $p(x_1, \dots, x_n)$ is a polynomial which does not change if I permute the variables, then there is some other polynomials $q(y_1, \dots, y_d)$ and $r(y_1, \dots, y_d)$, so that 
$$p(x_1, \dots, x_n) = q(e_1, e_2, \dots, e_d) = r(\mu_1, \dots, \mu_d).$$
Here, I have suppressed the dependence of the $e_i$ and $\mu_i$ on $x_1, \dots, x_n$.

In particular, since the elementary symmetric polynomials and the polynomial moments are both symmetric, we see that there should be some polynomial relations between these polynomials. The Newton identities give such a relation recursively. Specifically,

$$e_1 = \mu_1,$$
$$2e_2 = e_1\mu_1 - \mu_2,$$
$$3e_3 = e_1\mu_2 - e_2 \mu_1 + \mu_3,$$
$$4e_4 = e_1\mu_3 - e_2 \mu_2 + e_3 \mu_1 - \mu_3,$$
and so on.

Even for fixed $n$, this can be extended to an infinite sequence of identities by simply letting $x_{n+1} = x_{n+2} = \dots = 0$, and noticing that this implies that for $k > n$, $e_k(x_1, \dots) = 0$.

I wanted to give a proof of this identity using generating functions, because I think it is slightly cooler than the version given on Wikipedia.

First, we define the moment generating function of $x_1, \dots, x_n$ to be
$$\mu(t) = \sum_{k=1}^{\infty} \mu_k t^k.$$

This is a power series in $t$, and we can simplify it just using the definition of $\mu_k$:
$$\mu(t) = \sum_{k=1}^{\infty} \left(\sum_{i=1}^n x_i^k\right) t^k = \sum_{i=1}^n \sum_{k=1}^{\infty} x_i^k t^k = \sum_{i=1}^n \frac{x_i}{1 - x_it}.$$

Let's simplify this last term by giving it a common denominator:
$$\sum_{i=1}^n \frac{x_i}{1 - x_it} = sum_{i=1}^n \frac{\sum_{i=1}^n x_i\prod_{j\neq i}(x_jt-1)}{\prod_{i=1}^n(x_i t - 1)}$$

Now, notice that
$$\prod_{i=1}^n(1 - x_i t) = \sum_{i=1}^n (-1)^k e_k(x_1, \dots, x_n)t^k,$$
and we also have that
$$\sum_{i=1}^n x_i\prod_{j\neq i}(1-x_jt) = (-1)^n\frac{d}{dt} \prod_{i=1}^n(1 - x_i t) = \sum_{i=1}^n (-1)^n ke_k(x_1, \dots, x_n)t^{k-1}.$$

If we let $p(t) = \sum_{i=1}^n (-1)^k e_k(x_1, \dots, x_n)t^k$, we obtain the equation
$$ p'(t) = p(t) \mu(t).$$

If we expand out this product and equate terms of the same degree, we obtain the Newton identities!
