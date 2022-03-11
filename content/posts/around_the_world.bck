+++
title = "Around The World in 180 Ways"
date = 2020-08-16T11:35:57-04:00
images = ["/img/AroundTheWorld/shortest_tour.png"]
tags = []
categories = ["code"]
draft = true
+++
*This is a technical write up about a project that I was thinking about related to going around all of the countries in the world in the best way possible. It describes some interesting mathematical models for how to determine which path is the best, and some code snippets for how to optimize these models. All of the models will turn out to be NP-hard technically, but they will be tractible in practice.*

I had an idea a while back that it would be cool to read a book from every country in the world. And since being in quarantine, it seemed like the best possible moment to embark on this literary world tour. But I immediately got sidetracked and started looking at a different question: *what would be the best order to read a book from every country?*

If we want this to simulate the process of touring around the world, we could demand that consecutive books be from different countries. Moreover, we might want the books from a given geographic region to be read close together, to get a better sense of potential similarities within a region. Depending on how we prioritize different features of the tour.

Before even getting started with this idea, there are difficulties even in defining what a country is, and it's questionable as to whether many of the borders drawn between countries (many of which are fairly recent) are really valuable in isolating interesting historical features.

Luckily, none of these difficulties really matter, because Wolfram Mathematica&trade; is packaged with its own definition of what a country is, and I don't really feel like doing my own research to figure out which countries border each other (again, not very good at geography). So, the most of this will make me sound like a Wolfram shill, but to be fair, they did make it pretty easy to do quite a few interesting things. 

I'll include some code snippets in the post, but for easy reading they'll be hidden by default. For example, this next snippet in Mathematica fetches a list of all countries and their neighbors:

{{< hide >}}
{{< highlight mathematica >}}
data = EntityValue["Country", "BorderingCountries", "EntityAssociation"];
{{< /highlight >}}
{{< /hide >}}

# Shortest Tours
Mathematica actually has some demos already for finding shortest tours around the world [here](https://www.wolfram.com/mathematica/new-in-10/entity-based-geocomputation/find-the-shortest-route-through-the-worlds-capital.html). For our purposes, we might try 

# A Graph of the World
When a discussion is about a collection and relationships between pairs of objects in the collection, a mathematician immediately reaches for the notion of a graph. In this case, that means that we would forget all of the geographic information and just focus on which countries are adjacent to one another. The result of doing this results in a graph that looks like this:

{{< figure src="/img/AroundTheWorld/world_map.png">}}


{{< hide >}}
{{< highlight mathematica >}}
vertices = Keys[data];
edges = UndirectedEdge @@@ Flatten[Thread /@ Normal[data]];

SimpleGraph[Graph[vertices, edges]]
{{< /highlight >}}
{{< /hide >}}

With this picture 
