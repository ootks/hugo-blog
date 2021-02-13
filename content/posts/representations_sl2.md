+++
title = "Inequalities between Binomial Coefficients in a Needlessly Fancy Way"
date = 2021-01-20T00:44:12-05:00
images = []
tags = ["math"]
categories = []
draft = false
+++
Most high school students already know far more about the binomial coefficients than they need to, and one of the things that they might know is the fact that if $k < \frac{n}{2}$, then
$$
    \binom{n}{k} \le \binom{n}{k+1}.
    $$

We're going to talk about a needlessly complicated proof of this fact that uses some pretty cool math.

# Categorification and Inequalities
When we see an inequality like
$$
    \binom{n}{k} \le \binom{n}{k+1},
    $$
we might want to write down an equation for the binomial coefficients like $\binom{n}{k} = \frac{n!}{(n-k)!k!}$, and then do some algebra. This might be fast, but it's hardly satisfying.

Maybe more satisfying would be to first think about what $\binom{n}{k}$ means; if $S_k$ is the number of sets of size $k$ in a set of $n$ elements, then $\binom{n}{k}$ is the size of $S_k$.
So, another way of saying the inequality is that $S_k$ has fewer elements than $S_{k+1}$.

One way to show that one set has more elements than another is to find an injective map $f$ from one set to the other, and such maps are usually a lot more satisfying than a computational proof.

It turns out that this is kind of tricky in this case. For instance, we might naturally want to choose, for each $k$ element set $S$, an element $t(S) \in [n] \setminus S$, and then set $f(S) = S \cup \{t(S)\}$. We might hope that if $t(S)$ is well chosen, then $S$ can be recovered from  $f(S)$ uniquely. There are in fact ways to do this, (see [this](https://math.stackexchange.com/a/2894340/428575)), but it's actually a little tricky to find such an injection. We'll see in the sequal that this is because there is too much symmetry here; to find such a $t(S)$, we need some clever way of choosing an element of $[n] \setminus S$, and all elements of $[n] \setminus S$ basically look the same to me!

As a first towards getting this bijective proof we want, we can apply an an idea that shows up a lot in combinatorics (that we'll also do in a fancier way in the sequel): instead of assigning to each $S \subseteq [n]$ with $|S| = k$, we can form a **relation**, which we might think of as a bipartite graph. This will let us get around the symmetry issue.

The relation here is just the subset relation. For each element $S$ of $S_k$, there are $(n-k)$ elements of $[n] \setminus S$ that we can add to $S_k$ to get an element of $S_{k+1}$. For each element of $S_{k+!}$, there are $k+1$ elements in $S_{k+1}$ that we can remove to get a set of size $k$. So, by a double counting argument, we know that $\frac{|S_{k}|}{|S_{k+1}|} = \frac{k+1}{n-k} < 1$. This doesn't use the equation for binomial coefficients, but requires an unacceptably large amount of computation! Let's see if we can do better.

# Symmetry and vector spaces
Usually, we think of symmetry as being our friend, but in the above paragraph, we saw that symmetry was actually kind of an obstruction to getting a nice map. A slight modification of the above ideas though will let us get symmetry on our side again.

Instead of thinking of $\binom{n}{k}$ as the number of elements in some set, let's think of it as the **dimension** of the vector space spanned by elements of $S_k$, say $V_k$. This is the set of formal linear combinations of elements of $S_k$. Once again, if we have an injective map from $V_k$ to $V_{k+1}$, then linear algebra tells us that $\binom{n}{k} \le \binom{n}{k+1}$.

The value of doing this is that we can now turn the relation that we had above into an honest map of vector spaces; for each $S \in S_k$, let
$$
f_k(S) = \sum_{S \subseteq T \in S_{k+1}}T.
$$
That $f_k(S)$ is the sum of all sets of sets of size $k+1$ that contain $S$, and is sort of the 'vectorization' of the above relation.  If we can show that this map is injective, then we are done, and we will have satisfied our desire for a synthetic proof of this fact.

In fact, this is true; the map is injective and it can be shown for example by looking at the matrix associated with this map, computing its Gram matrix and showing that is positive definite (see for example [this](https://www.jstor.org/stable/2958520?seq=1)). Once again though, this is an unacceptable amount of computation that you can't just handwave away. We must go deeper!

# Playing around with commutators
There are a few steps we need to give a bijective proof `without computations'.

Firstly, the map we defined above has a transpose, specifically, this is a map $g_{k+1} : V_{k+1} \rightarrow V_k$ given by
$$
    g_{k+1}(T) = \sum_{T \supseteq S \in S_k} S
    $$

Secondly, we need to assemble all of these $V_k$ into a single (graded) vector space, namely
$$
V = V_1 \oplus V_2 \dots \oplus V_n
$$

We can define $f$ and $g$ as follows: if $v \in V_i$, then $f(v) = f_i(v)$, and similarly, $g(v) = g_i(v)$.

Now, we can do something a little strange; we can try computing the comutator between this map $g$ and $f$ for some $S \in V_k$:
$$
    [g, f] = g(f(S)) - f(g(S)) = (n-2k)S
    $$
The way you get this is by noticing that if $S' \in S_k$, and $S' \neq S$, then the coefficient in front of $S'$ in $g_{k+1}(f_k(S))$ is the number of elements in $S_{k+1}$ that contain both $S$ and $S'$, but there's only one of these, namely $S \cup S'$. A similar idea for $f_{k-1}(g_k(S))$ gives us that the coefficient in front of $S'$ will also be 1, so these cancel, and the only surviving term is proportional to $X$, and again, it's not that hard to figure out what this coefficient should be.

This is really nice! It says that the commutator of $f$ and $g$ acts diagonally on the $V$. Let's call this commutator $h = gf - fg$.

We also have other commutation relations, which can also be verified `by hand waving' as above: $[h, f] = -2f$ and $[h,g] = 2g$.

These relations are important because they define a **representation**, which we'll look at next:

# Lie algebras and $sl_2$
There are in fact $2 \times 2$ matrices which satisfy these same commutation relations, namely
$$
    h' = \left(\begin{matrix} 1 \& 0 \\\\ 0 \& -1\end{matrix}\right)
$$
$$
    f' = \left(\begin{matrix} 0 \& 1 \\\\ 0 \& 0\end{matrix}\right)
    $$
$$
    g' = \left(\begin{matrix} 0 \& 0 \\\\ 1 \& 0\end{matrix}\right)
    $$
These form what is called a **Lie algebra**, which is a vector space with an antisymmetric, bilinear map called the Lie bracket, denoted $[-,-]$. There are some additional properties that you need, but let's not say what they are here.
The name of this Lie algebra is $sl_2$.

Between two Lie algebras, both of which have an associated Lie bracket, a morphism is just a linear map $\phi : L_1 \rightarrow L_2$ so that $[\phi(x), \phi(y)] = \phi([x,y])$. A **representation** of a Lie algebra $L$ is a map from $L$% to $gl_n$, the Lie algebra of matrices with the normal matrix commutator.

The interesting thing about representations about $sl_2$ is that if you look at $\phi(h')$, we can say some important things about the eigenvectors of $h$, namely that if $v$ is an eigenvector of $\phi(h')$ with eigenvalue $\lambda$, then $\phi(f')v$ and $\phi(g')v$ are also eigenvectors of $h$ with eigenvalues $\lambda+2$ and $\lambda-2$ respectively. In particular, because $\phi(h')$ has only finitely many eigenvalues, $\phi(h')$ and $\phi(g')$ are nilpotent, and so the eigenvalues of $h$ must all be **integers**.

If $gl_n$ acts on an $n$ dimensional vector space $V$, and $\phi$ is a representation of $sl_2$ on $gl_n$, then we have a grading of $V$ according to the eigenvalue of $\phi(h)$, i.e.
$$
V = \dots V_{-1} \oplus V_{0} \oplus V_{1} \oplus \dots.
$$
where $V_i$ is an eigenspace of $h$. Notice that this is exactly the position we found ourselves in the previous section.

The important thing is that people have studied representations of $sl_2$ for a really long time. Specifically, they know that the **irreducible representations** have the following property: the dimension of $V_i$ when $i > 0$ is always at most the dimension of $V_{i+1}$! Because this is true for all irreducible representations of $sl_2$, and all representations are direct sums of irreducible ones, **any representation of $sl_2$** will have this property! In addition, this theory will give us the fact that $f$ and $g$ above are injective, just because they satisfy these commutation relations, so we get our combinatorial proof, and all it took us was a few years worth of representation theory.

# Applications to Betti Numbers and Hodge Theory
The representation theory of $sl_2$ actually appears in a lot of different fields. In particular, it shows up in the cohomology theory of complex projective varieties. I don't understand this very well, but here's the gist of it from my point of view.

Every complex projective variety has something called a **Kahler structure**, which, if the variety is smooth, we can think of as a differential 2-form that lives on the manifold. This differential 2-form $\omega$ (called the symplectic form)  is closed, and therefore defines an element of the De Rham cohomology for the manifold.

The cohomology rings of a manifold have an attached ring structure, whose multiplciation is given by the cup product, and multipliciation by $\omega$ in this ring structure gives us a linear map from the cohomology ring to itself. Let's call this map $f$, suggestively. There is also an inner product on the cohomology ring given by the Riemannian metric structure of the manifold, and so $f$ has an adjoint, which we might call $g$, again suggestively. As you might expect, $h = [f, g]$ turns out to act diagonally on the cohomology ring, its eigenspaces are the graded pieces of the cohomology ring, and the triple $f, g, h$ defines a representation of $sl_2$ on the cohomology ring of the variety.

The dimension of the degree $k$ graded piece of the cohomology ring is called the $k^{th}$ betti number $\beta_k$.  So, what we get in total is that for $k > \frac{n}{2}$, $\beta_k \le \beta_{k+1}$. 

This theory was used by Richard Stanley in the case of toric varieties (whose paper on unimodal sequences forms the substance of this post) to show that the number of facets of simplicial polytopes satisfy the **least upper bound conjecture**, which I don't really get, but am assured is very cool.
