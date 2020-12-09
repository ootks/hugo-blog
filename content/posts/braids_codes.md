+++
title = "Braid Codes"
date = 2020-08-23T02:30:59-04:00
images = []
tags = []
categories = ["Math"]
draft = true
+++
The fields of information theory and group theory intersect in a wide variety of places; finite fields are fundamental in the development of error correcting codes, and groups appear in a number of encryption schemes. I wanted to sketch another connection between compression codes and general monoids.

# Codes and Monoids
## Basics of coding theory
The basic goal in information theory is to represent a collection of states using symbols in as efficient a way as possible.
It is clear that the total number of symbols required to represent a collection of $k$ state is at least $k$.
As an example, a stop sign has 3 possible states, either red green or yellow, and this is enough to convey whether a person should stop, slow or go.
To communicate more information, like whether turning left is allowed, more symbols are needed.

To represent a possibly infinite number of states, one typically writes down a sequence of characters coming from some fixed alphabet, and in doing this, one typically wants to represent those states using as few characters as possible.
As an example, each English word is represented as a sequence of characters from the fixed 26 character alphabet, and each English sentence is represented as a sequence of words from a fixed 200 thousand word dictionary.

In one of the basic problems of coding theory, one is interested in representing a sequence of characters from one alphabet in terms of a second alphabet.
A typical example of this is ASCII encoding: most English text is composed of a sequence of about characters from a 200 character alphabet; in order to record a text in binary, one needs to represent each of these characters as a binary string.
To represent about 200 characters, one needs at least 8 binary characters per English character, and indeed, this is the length of the representation of every English character in ASCII.

In mathematical terms, we have some collection of states $X$, which we want to represent, and a base alphabet $A$.
To each character $x \in X$, we want to assign an encoding $\phi(x) \in A^\*$, where $A^*$ is the set of all strings made using the alphabet $A$.
If our base alphabet $A$ consists of $n$ characters, we can represent $n^k$ possible states with $k$ character strings from $A$, so if all characters in $X$ have representations of the same length in $A$, each character in $X$ needs to have an encoding of length at least $\log_n(|X)$.

Strings from a base alphabet of $n$ characters have a certain algebraic structure: they are what is called a *free monoid*.
In this case, being a monoid simply means that given two strings $a$ and $b$, we can concatenate them together to form a string $a + b$.
For our purposes, this is important, because in order to form English words, we need to concatenate multiple characters, which in turn are formed from concatenating multiple binary bits.
In a sense, we are trying to simulate a full English alphabet of 26 characters using only 2 characters at a time.
We will formalize this in a moment using the idea of a **homomorphism**.

## Variable length codes
The ASCII encoding is nice because each character's encoding has the same length; this makes it relatively easy to read an ASCII encoded string, you simply break the string into 8 character chucks, turn each chunk into a Latin character.
However, this encoding is somewhat wasteful.
Notice that the character **e** has the same length as the character **q**, even though **e** appears significantly more often in English than **q** does.
For example, consider the opening lines of *A Tale of Two Cities*: "It was the best of times, it was the worst of times." it was the best of times it was the worst of times
The letter *e* appears 5 times, whereas *q* does not appear at all.
If *e* were to be represented by 7 characters, and *q* were to be represented by 9, then this sentence could be represented with 5 fewer bits.

Nowadays, when bits are plentiful, we do not care so much about these minor savings, but back when people used telegrams, they cared a lot more.
So for example, in Morse code, **e** takes up only 1 dot, whereas **q** takes up 4.
This means that it is a lot faster to transmit **e** than to transmit **q**, which in practice is good, because you want to transmit an *e* a lot more often.

In mathematical language, we have a secondary alphabet $B$, a variable length code assigns each character in $B$ a sequence of characters from $A$. If we take a string $s = b_1b_2\dots b_k$ in $B^*$, and we replace each character $b_i$ with its encoding $\phi(b_i)$, we get get a string $\phi(s) = \phi(b_1)\phi(b_2)\dots \phi(b_k)$.

In order for this code to be usable, it had better be the case that different elements of $B^\*$ map to different elements of $A^\*$. For example, if we had an encoding that looked like

a -> 011
b -> 101
c -> 01

then the strings **cb** and **ca** would be encoded by the same string **01101**. This would be a problem when trying to read the code back.

In mathematical language, we say that $\phi : B^\* \rightarrow A^\*$ is a monoid homomorphism, because if we have a string $\beta_1 + \beta_2$, where $\beta_1, \beta_2 \in B^\*$, then its encoding $\phi(\beta_1 + \beta_2) = \phi(\beta_1) + \phi(\beta_2)$.
The code $\phi$ is said to be **uniquely decodable** if the map $\phi : B^\* \rightarrow A^\*$ is **injective**.

In practice, the goal is to find a code that minimizes the average length of a codeword, when the characters are drawn from a fixed distribution, like that of the English language.
The uniquely decodable assumption puts constraints that make it difficult to make the code short.
For example, we cannot give each character in the alphabet the code **0**, even though that would make all of the codewords very short.
Intuitively, if we try to make the codewords too short, then for a large alphabets $B$, the codewords will have to start colliding when you concatenate a lot of characters together.

The formal bound expressing the intuition that short codes are difficult to create is known as Kraft's inequality.
Suppose that you have a uniquely decodable code $\phi : A -> B$, and that $|B| = n$, and use $|s|$ to denote the length of a string in $s \in B^*$.
$$
\sum_{a \in A} n^{-|\phi(a)|} \le 1
$$
The proof of Kraft's inequality for uniquely decodable codes is one of my favorite proofs out there, and we'll do it in slightly greater generality in a moment.

As a slight abuse of language, if we have some numbers $\ell_i$, then we say that $\ell_i$ satisfies Kraft's inequality if 
$$
    \sum_{i \in A} n^{-\ell_i} \le 1
$$
It is a theorem that if $\ell_i$ satisfy Kraft's inequality, then there is in fact a uniquely decodable code so that $|\phi(i)| = \ell_i$. 


# Relations in monoids
Earlier, we said that an alphabet encoding is equivalent to a monoid homomorphism between **free monoids**, $A$ and $B$.

In a free monoid, if we write down one sequence of strings $x_1x_2\dots x_n$, and someone else writes down another sequence $y_1y_2\dots y_m$, then these two strings are equal if and only if $m = n$ and $x_i = y_i$ for each $i$ from 1 to $n$.
This is pretty obviously something you can do this when dealing with binary strings, but it becomes a little less obvious what dealing with other strings of characters.

A classic example of this difficulty is Russian cursive: it is famously difficult to read Russian cursive, because many of the characters look the same.
In particular, it is very difficult, for foreigners like myself to distinguish between the text $ $ and $ $. We call such a thing a *relation* between characters, and we might write asldas = asdads.

A monoid (not necessarily free) is like the set of strings in some alphabet, but written down using very bad handwriting, so that some strings are indistingushable from others, even though they might have been made by different characters.
Nevertheless, Russians continue to write in cursive, and they are able to have a functioning society, indicating that it should still be possible to represent information using such an alphabet.


So, we'll say, given an arbitrary monoid $A$, a variable length code for a set $B$ in $A$ is a monoid homomorphism $\phi$ from the free monoid $B^*$ to $A$.
We will say that this is a uniquely decodable encoding if $\phi$ is injective.

Technically, in a general monoid, we do not have a notion of how `long' an element of the monoid is, because we cannot tell which strings are supposed to be length 1. 
Because of that, we will actually want our monoid $A$ to be **finitely presented**, meaning that we can write it in the following form:
$$
A = \langle a_1, a_2, \dots, a_n | s_1 = t_1, \dots, s_k = t_k\rangle
$$
where $a_1, \dots, a_n \in A$, and $s_1,t_1 \dots, s_k, t_k \in A^*$.

This denotes the fact that every element in $A$ can be written as a product of characters $a_1, \dots, a_n$, but that the stringss $s_i$ and $t_i$ are identified for each $i$.

One preliminary question that is interesting is the **growth rate** of this presentation.
Let $A_k$ be the set of all elements that can be made as the product of at most $k$ generators.
The growth rate of this presentation is the sequence $g_1, g_2, \dots, $where $g_k$ is the number of elements in $A_k$?

If this question can be answered, the next interesting question would be

**[What](What) possible lengths are achievable by uniquely decodable codes in $A$?**

One observation is that the two questions are related: there is a generalized Kraft's inequality for the monoid case, which we will show below the fold:


**Let $\alpha \in \mathbb{R}$ be any number so that $|A_k| \le \alpha^k$ for all $k$. Let $\phi$ be a uniquely decodable code, then**
$$
    \sum_{b \in B} \alpha^{-|\phi(b)|} \le 1.
    $$
{{< hide >}}
*Proof*
Look at the quantity
$$
    g = \sum_{b \in B} \alpha^{-|\phi(b)|}
    $$
Then take $g^{\ell}$ for some $\ell \in \mathbb{N}$. We can expand this out to be a large sum
$$
    g^{\ell} = \sum_{b_1, b_2,\dots,b_{\ell} \in B} \alpha^{-(|\phi(b_1)| + \dots + |\phi(b_{\ell}|)}
    $$

Notice that $|\phi(b_1)| + \dots + |\phi(b_{\ell}|$ is an upper bound for $|\phi(b_1+\dots+b_{\ell})|$. Thus,
$$
    \sum_{b_1, b_2,\dots,b_{\ell} \in B} \alpha^{-(|\phi(b_1)| + \dots + |\phi(b_{\ell}|)} \le 
    \sum_{b_1, b_2,\dots,b_{\ell} \in B} \alpha^{-(|\phi(b_1+\dots + b_{\ell})|}
    $$
Now, we reindex the sum according to  $|\phi(b_1+\dots+b_{\ell})|$. 
$$
    \sum_{i=1}^{\max_B |\phi(b)| i} |\{b_1, b_2,\dots,b_{\ell} \in B: |\phi(b_1+\dots+b_{\ell})| = i\}| \alpha^{-(|i|)}
    $$
Now note that $|\{b_1, b_2,\dots,b_{\ell} \in B: |\phi(b_1+\dots+b_{\ell})| = i\}| \le |B_i| \le \alpha^i$, and so we have the bound 
$$
   g^k \le (\max_B |\phi(b)|)k.
   $$
Note, $g^k$ grows exponentially; the only way it could grow more slowly than a linear function is if $g \le 1$. This concludes the proof.
{{< /hide >}}

The close connection between Kraft's inequality in the free monoid case and the existence of uniquely decodable codes makes the following question tempting:

**What is the smallest** $\beta$ **so that for any uniquely decodable** $\phi$, **we have** $\sum_{b \in B} \beta^{-|\phi(b)|} \le 1$? The above inequality shows that $\beta \ge \alpha$ suffices, and we might conjecture that for a large class of monoids, in fact, $\beta = \alpha$ is the correct estimate.

# Braids
One type of monoid, whose structure has been studied in depth in the field of topology, is the **braid monoid**.

A **braid** is a collection of paths $p_i : [0,1] \rightarrow \mathbb{R}^3$, where there exists a permutation $\pi$ of $[n]$ so that $p_i(0) = (i, 0, 0)$, $p_i(1) = (\pi(i), 0, 1)$, and for each $t$ and $i$, $p_i(t)_3 = t$. We consider two braids to be equivalent of one can be continuously deformed into the other.

We will say that a braid is **positive** if each time $p_i(t)_1 = p_j(t)_1$, and $i > j$ we have that $p_i(t)_2 = p_j(t)_2$. That is to say, that each crossing of strands in the braid has the left strand crossing over the right one.

This collection of braids turns into a monoid via **concatenation**, where we concatenate each of these paths with each other, say by letting
$$(p\cdot q)_i(t) = \begin{cases} p(t/2) \text{ if }t \le 1/2\\\\ q(t/2 + 1/2) \text{ if }t \ge 1/2\end{cases}.$$
We will use the braid monoid to refer to the monoid of **positive** braids, as this will be the main object of our study.

There is a natural monoid homomorphism that sends the braid monoid to the symmetric group which sends each braid to the permutation of the endpoints that it induces.

Despite the fact that this definition of the braid monoid is continuous in nature, in fact, the braid monoid is finitely presented.
The **Artin presentation**  for the positive braid monoid is given by
$$\langle \sigma_i | \sigma_i \sigma_j = \sigma_j \sigma_i \text{ if } |i-j| > 1\text{ and }\sigma_i\sigma_{i+1}\sigma_i = \sigma_{i+1}\sigma_i\sigma_{i+1}\rangle$$
This presentation is due to Artin, where the generators are simple twists of adjacent strands, and the relations reflect basic operations that one can do on the level of braids which preserve homotopy equivalence. % TODO: Find a citation

Codes on braids have an appealing physical interpretation: if we had a code $\phi : X^* \rightarrow B_n$ one can imagine taking $n$ strands of string and braiding them together to encode messages in the alphabet $X$. As an example, it is not hard to see that if we take $X = \{0, 1\}$, and let $\phi(0) = \sigma_1$ and $\phi(1) = \sigma_2$, we would get a uniquely decodable binary code. This would be sufficient to produce an infinite family of such braid codes, where we use binary codes to produce the corresponding braid code. Such a representation would clearly be inefficient though; we do not even use more than 2 strands in the braid to produce any codewords. Can we do better?

Kraft's inequality indicates that we should begin by considering the **growth rate of the braid monoid**. This is the subject of much study, and has been completely solved. We will recount the details of this study here. The coding theoretic question about the lengths of uniquely decodably codes (or equivalently, what kinds of elements of the braid monoid can generate a free monoid).

# Growth Rates of Braid Codes
Let $M = B_n$ be the braid monoid on $n$ strands, together with the Artin presentation given above. Let $M_k$ be the set of elements of $M$ which can be written as the product of at most $k$ generators. The growth function of $M$ is defined to be 
$$g_M(t) = \sum_{i=0}^{\infty}|M_k| t^k$$

At first glance, it is not obvious that this growth function has any good structure, but it turns out that by a result of Deligne that this growth function is in fact rational. We will first give a proof in terms of the so called `automatic structure' of the braid monoid, as it will set up some interesting further questions, and then give a more detailed examination of the growth function of the 

# Automatic Monoids
For our purposes, a finite automaton over an alphabet $X$ is defined in terms of a directed graph, $G$, together with a labelling $\ell : E(G) \rightarrow X$, so that for each vertex $v \in G$, and $x \in X$, there is at most one directed edge incident to $v$ with the label $x$.  We will also assume that there is a starting vertex, $v_0$ 

A string $w = w_1w_2\dots w_n$ is **accepted** by the finite automaton if there is a walk $v_0, v_1, \dots, v_n$ in $G$ so that $\ell(v_i, v_{i+1}) = w_{i+1}$ for each $i \in \{0, \dots, n\}$. 

The **regular language** defined by a finite automaton is defined to be the set of strings which are accepted by the finite automaton. A set of strings is said to be a regular language if it accepted by some finite automaton.

For our purposes, a finitely presented monoid $M$, generated by elements $g_1, \dots, g_k$, is said to be **automatic** if there is a regular language $L$ with alphabet $\{g_1, \dots, g_k\}$, with the property that the map $\phi : L \rightarrow M$ given by sending $w_1 w_2 \dots w_n \in L$ to the product $w_1\cdot w_2 \dots w_n$ is bijective. There are some additional technical conditions needed to be considered automatic which are defined in **Word Processing in Groups**.

The key fact which is relevant for counting purposes is that the growth rate of a regular language is highly constrained: 

If $L$ is a regular language, and $\ell_k$ is the number of words in $L$ of length $k$, then $\sum_{i=0}^{\infty}\ell_k t^k$ is a rational function. This is easily seen by, say, letting $A$ be the adjacency matrix of $G$, and noting that the number of paths between two vertices $v, w$ of length $k$ in $G$ is given by $A^k_{vw}$. 

Thus, for an automatic monoid, the growth function is rational. We wish to study automatic monoids because braid monoids are automatic. 

The formal proof is given in **Word Processing in Groups**, but we will sketch here the idea of a proof.

The **canonical form** of braid can be thought of topologically. Imagine taking a comb, positioning it at some point in the braid, and dragging it along the braid starting from left, to right. The effect of this is to take some collection of crossings inside the braid, and move them to the right. If we perform this operation enough times, we obtain the **right-greedy canonical form** for the braid, where each nontrivial crossing in the braid is moved as far to the right as possible. 

Formally, we say that a braid $x$ is **simple** if each pair of strands crosses at most once in the resulting braid. Simple braids are uniquely determined by the permutation on endpoints that they induce.
For an arbitrary braid $x$, the canonical form of $x$ is an expression of the form
$$ 
x = s_1s_2\dots s_k
$$
where each $s_i$ is simple, and also maximal given the following $s_i$, in the sense that there is no simple braid $s'$ so that $s_1s_2\dots s_{i-1}s_i = as'$. 

As it turns out, the canonical form of a braid is unique, and the set of strings representing a canonical form for a string is in fact unique.

# Garside Structure

# Computing the Growth Function of Braids
# Lower Bounds for Simple Braid Generators

