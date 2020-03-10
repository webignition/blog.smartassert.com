---
title: "Browser Automation Test Creation Is Configuration Not Coding"
author: joncram
excerpt_separator: <!--more-->
---

## No Programming Needed 

You don't program your TV to record your favourite shows and you don't program your heating system. You might say that
you do but you don't. In both cases you use a specialist system already created for a specific purpose and configure 
it as needed.

Given the right automation system you don't need to write code to define your tests, you instead need to configure 
the system to test as needed.

From the experiences of people learning to code in order to create automation tests, I am creating a plain-English 
configuration language to define tests and a specialist automation system that understands this language and runs
your tests.

<!--more-->

## People Can't Code (and that is ok)

My partner worked for some time running intensive automation courses, either on-site for organisations looking to 
re-train their manual testers, or in a classroom setting for a group of professionals looking to expand their career 
opportunities.

What she learned from running such courses, and what I then learned from her, is that manual testers with no prior
coding experience transitioning to automation testers are, in many cases, incapable of doing so effectively.

Such testers are not able to learn to code effectively. Some could barely type with much proficiency. All were great 
people and great at manual testing, but coding was generally not what they were wired for. And this is absolutely ok.

If I had to actually program my heating system, to actually crack out an IDE and write some code and then figure out
how to deploy that code and how to debug things when they failed, I'd be sitting here in the cold.

It's silly to think that we need, in most cases, to code-up tests by hand using a powerful does-anything tool.

## General-Purpose Programming Languages Are (Generally) The Wrong Choice

You don't need to perform any coding to "program" your TV to record your favourite shows or you "program" your heating
system. You don't need to perform any coding to create browser automation tests.

You shouldn't have to learn the concepts of object-oriented programming and be armed with the full potential of a 
general-purpose programming language in order to ~~tell your heating system when to come on and off~~ make a browser 
do some things and then check that those things were indeed done.

*Make a browser do some things and then check that those things were done*. A problem that can be narrowed down to a
small set of well-defined set of operations for which a general-purpose programming language is not the best choice 
for a vast number of common use cases.

Trim down a general-purpose language to only a specialist subset of operations needed for browser automation tests and
what you end up with is a specialist browser automation system that can be controlled via a simplified language.

## Configuration Not Coding

What you end up with is not coding but configuration. 

This might at first sound like a semantic argument since at some level any type of coding could be described as 
configuring a computer to perform deterministically a set of operations.

Remove from a language variable assignments, control structures and loops, making the language far from computationally
universal, and you transform a programming language into a configuration language.

If you can in a configuration language define all that is needed to perform browser automation tests you can state
that browser automation test creation is configuration not coding.

In subsequent articles I'll explore what is needed to define a browser automation test and how this can be expressed
in a plain-English configuration language.
