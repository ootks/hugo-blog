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
The basic goal in information theory is to represent a number of possible events. In order to represent $k$ events, we need to have $k$ possible symbols. 

As an example, a stop sign has 3 possible states, either red green or yellow. This is enough to convey whether a person should stop, slow or go. To communicate more information, like whether turning left is allowed, more states are needed.

Typically, one does not only have access to a fixed number of states, rather, one can write down a sequence of characters coming from some fixed alphabet. In such a case, one typically wants to represent information using as few characters as possible.

A typical example of this is ASCII encoding: they agreed upon about 256 possible characters/punctuation needed to represent English text. To record all of these possibilities, we need at least 8 binary digits, and indeed, that is how many bits each ASCII character takes up.

In mathematical terms, we have some set of states $X$, and a base alphabet $A$, and to each state $x \in X$, we want to assign an encoding $\phi(x) \in A^\*$, where $A^*$ is the set of all strings made using the alphabet $A$. If our base alphabet $A$ consists of $n$ characters, we can represent $n^k$ possible states with $k$ character strings from $A$.

Strings from a base alphabet of $n$ characters have a certain algebraic structure: they are what is called a *free monoid*. In this case, being a monoid simply means that given two strings $a$ and $b$, we can concatenate them together to form a string $a + b$. For our purposes, this is important, because in order to form English words, we need to concatenate multiple characters, which in turn are formed from concatenating multiple binary bits. In a sense, we are trying to simulate a full English alphabet of 26 characters using only 2 characters at a time. We will formalize this in a moment using the idea of a **homomorphism**.

The term *free* will also be important for our discussion, but it is a bit more complicated to explain, so let us leave that for a moment.

## Variable length codes
The ASCII encoding is nice because each character's encoding has the same length; this makes it relatively easy to read an ASCII encoded string, you simply break the string into 8 character chucks, turn each chunk into a Latin character. However, this encoding is somewhat wasteful. Notice that the character **e** has the same length as the character **q**, even though **e** appears significantly more often in English than **q** does. Imagine if **e** took up 7 characters, but **q** took up 9. 

Nowadays, when bits are plentiful, we do not care so much about these minor savings, but back when people used telegrams, they cared a lot more. So for example, in Morse code, **e** takes up only 1 dot, whereas **q** takes up 4. This means that it is a lot faster to transmit **e** than to transmit **q**, which in practice is good.

In mathematical language, we have a secondary alphabet $B$, a variable length code assigns each character in $B$ a sequence of characters from $A$. If we take a string $s = b_1b_2\dots b_k$ in $B^*$, and we replace each character $b_i$ with its encoding $\phi(b_i)$, we get get a string $\phi(s) = \phi(b_1)\phi(b_2)\dots \phi(b_k)$.

In order for this code to be usable, it had better be the case that different elements of $B^\*$ map to different elements of $A^\*$. For example, if we had an encoding that looked like

a -> 011
b -> 101
c -> 01

then the strings **cb** and **ca** would be encoded by the same string **01101**. This would be a problem when trying to read the code back.

In mathematical language, we say that $\phi : B^\* \rightarrow A^\*$ is a monoid homomorphism, because if we have a string $\beta_1 + \beta_2$, where $\beta_1, \beta_2 \in B^\*$, then its encoding $\phi(\beta_1 + \beta_2) = \phi(\beta_1) + \phi(\beta_2)$. The code is said to be **uniquely decodable** if the map $\phi : B^\* \rightarrow A^\*$ is **injective**.

In practice, the goal is to find a code that minimizes the average length of a codeword, when the characters are drawn from a fixed distribution, like that of the English language. The uniquely decodable assumption puts constraints that make it difficult to make the code short. For example, we cannot give each character in the alphabet the code **0**, even though that would make all of the codewords very short. On the other hand, if we insisted that all of the codewords are of length 2, then we could only support 4 characters in $B$, as there are only 4 characters of length 2 in existence. Intuitively, if we try to make the codewords too short, then for large alphabets $B$, the codewords will have to start colliding.

The formal bound expressing the intuition that short codes are difficult to create is known as Kraft's inequality.
$$
\sum_{i} n^{-|\phi(x_i)|} \le 1
$$
The proof of Kraft's inequality for uniquely decodable codes is one of my favorite proofs out there, and we'll do it in slightly greater generality in a moment.

One observation is that if we have some numbers $\ell_i$, then we say that $\ell_i$ satisfies Kraft's inequality if 
$$
    \sum_{i} n^{-\ell_i} \le 1
$$
It is a theorem that if $\ell_i$ satisfy Kraft's inequality, then there is in fact a uniquely decodable code so that $|\phi(x_i)| = \ell_i$. 


# Relations in monoids
Let us come back to the term **free** in the term **free monoid**.

Let us describe what that means. It essentially means that given two strings, consisting of different characters, it is possible to distinguish between what they are. This is pretty obviously something you can do with binary strings, but it becomes a little less obvious what dealing with other strings of characters.

A classic example of this difficulty is Russian cursive: it is famously difficult to read Russian cursive, because some characters actually look the same as other characters. In particular, it is very difficult, for foreigners like myself to distinguish between the text $ $ and $ $. We call such a thing a *relation* between characters, and we might write asldas = asdads.

A monoid (not necessarily free) is a free monoid, where we identify some pairs of strings according to these relations. The existence of relations makes it more difficult to record information faithfully, because some pairs of strings will appear to record the same information. Nevertheless, Russian speakers continue to write in cursive, and they are able to have a functioning society. We might try to mathematize this observation.


So, we'll say, given an arbitrary monoid $A$, a variable length code in $A$ is a homomorphism from a free monoid $B^*$ to $A$. We will say that this is a uniquely decodable encoding if the map is injective.

The first question we would want to ask, given a monoid $A$ is, how many states can we encode using only $k$ characters. Let $A_k$ be the set of all elements that can be made as the product of at most $k$ generators. That reduces to the question:

**How many elements are there in $B_k$?**

If this question can be answered, the next interesting question in this field would be 

**What possible lengths are achievable by uniquely decodable codes in $A$?**

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
However, $g^k$ is an exponential function; the only way it could grow more slowly than a linear function is if $g \le 1$. This concludes the proof.
{{< /hide >}}

The close connection between Kraft's inequality in the free monoid case and the existence of uniquely decodable codes makes the following question tempting:

**What is the smallest** $\beta$ **so that for any uniquely decodable** $\phi$, **we have** $\sum_{b \in B} \beta^{-|\phi(b)|} \le 1$? The above inequality shows that $\beta \ge \alpha$ suffices, and we might conjecture that for a large class of monoids, in fact, $\beta = \alpha$ is the correct estimate.

# Braids
A braid is a very intuitive construction, which can be described mathematically.


