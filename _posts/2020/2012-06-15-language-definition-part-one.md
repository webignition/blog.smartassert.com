---
title: "Language Definition Part 1: Grouping Actions and Assertions"
author: joncram
excerpt_separator: <!--more-->
---

## Grouping Actions and Assertions

We previously [summarised the components of a test](/language-definition-part-one/#components-of-a-test) and created
a [simple test in plain English](/language-definition-part-one/#a-simple-test-in-plain-english). Let's now look at how 
grouping actions and assertions make things just a little more clear.

<!--more-->

## Our Previous Plain English Test

Towards the end of the previous article in this series we created a plain-English test for opening Google and then
performing a search.

{% include posts/partial/open-search-google-plain-english.md %}

This should be clear enough for any competent web tester to run manually in a browser. That doesn't mean we can't make
it better. 

## Actions Come Before Assertions

Within a given step (such as *Search for "Example"* above), actions always come before assertions.

The behaviour that we are modelling takes the general form of: *do something, then check if it worked*. We might not 
always want to do something first, but if we do we must do it before checking if it worked.

{% include posts/partial/open-search-google-plain-english-actions-and-assertions.md %}

Three main changes here:

* we can't accidentally try to perform an action between assertions
* we don't need to number statements, they are performed in the order in which they are written
* we don't need to prefix every single assertion with 'assert that ...'

We've made it clear we're following a *do something, then check if it worked* approach. We've made it clear where
actions and assertions go within a step. We've made our assertion statements less verbose.
 
These improvements make the test easier for us to follow and understand. As a bonus this is one step closer to making
the test easier for a computer to parse.

## Doing Things One Way and One Way Only

How can you describe the action of entering text into a search box?

* Enter 'Example' into the search box
* Fill the search box with 'Example'
* Type 'Example' into the search box

The next article in this series will look at picking one verb per type of action to further remove ambiguity.
