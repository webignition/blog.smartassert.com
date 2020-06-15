---
title: "Language Definition Part 0: Understanding Web Testing"
author: joncram
excerpt_separator: <!--more-->
---

## Understanding What We Are Modelling

My aim is to define browser automation tests using a plain-English configuration language. Before I can start, we need 
to look at what web testing is and what terminology is used, or can be used, to describe what goes on.

<!--more-->

## Manual Web Testing Defined in as Few Words as Possible

> Open a browser and visit a web page. Perhaps do some things with the web page. Examine the page for correctness.
> Perhaps do more things and again examine the page for correctness.

As definitions go, it's a bit casual but probably captures the essence of what is involved in testing a web page by
hand. We have defined, albeit loosely, a test.

## Components of a Test

A test consists of going to a web page, perhaps doing some stuff, and then checking that everything is as it should be. 
Your test may repeat the *do some stuff*, *check that everything is as it should be* parts, each time doing different 
stuff and checking different things.

Let's re-write our definition of a test in a more formal manner and start applying some terminology to the components of
a test.

1. Open a given URL in a given browser
2. Perform a sequence of steps

### Steps

A step is one of the *do some stuff*, *check that everything is as it should be* parts. A test is made up of one or more
steps.

What makes up a step?

1. Optionally perform a sequence of *actions*
2. Evaluate a series of *assertions*

### Actions

*Actions* are things that you can do within a browser to a web page, such as clicking links, entering text into forms
and clicking buttons.

This is by far the easiest part to understand.

### Assertions

*Assertions* are statements of fact that we want to demonstrate to be either correct or incorrect (true or false). For
example, the statement may be "The browser title is 'Google'".

If we visit https://google.com/ we might want to then verify that this has occurred by asserting that 
"The browser title is 'Google'" is true. If so, all is good. If not, we might have run into a bug.

## A Simple Test in Plain English

Given what we now know of a test and what a test consists of (a sequence of steps, with each step performing an optional
sequence of actions and executing a series of assertions), we can now write out a test in plain English.

{% include posts/partial/open-search-google-plain-english.md %}

If you understand English (I'm really guessing you do at this point), you can read, understand and carry out the test.

## Getting More Precise

What we have so far isn't really suitable as our ideal plain-English configuration language.

We can write a program that will understand the above test. And we can make sure that it understands all common and 
uncommon variants ("Enter 'Example' into the search box" vs "Fill the search box with "Example" vs "Type 'Example' 
into the search box"). We can do this and we can make it work.

It's not the computers we need to cater for, it's us. Our configuration language, as with every single programming-style
language, will be read far, far, far more often than it is written.

Programming-style languages exist to make things easier for us. We write code to convey information to others. We need 
to optimise understandability in our language through unambiguous and succinct wording.

In subsequent articles, I'll look at how we can precisely and unambiguously define actions and assertions and how we
can then start to write out tests in our new configuration language.
