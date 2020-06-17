---
title: "Language Definition Part 3: Precisely Identifying Page Components"
author: joncram
excerpt_separator: <!--more-->
---

## Precisely Identifying Page Components Using Existing Standards

The unambiguous identification of page elements is a solved problem. As with all good computing problems, two different
groups of people solved the same problem in two different ways: [CSS](https://en.wikipedia.org/wiki/Cascading_Style_Sheets) 
and [XPath](https://en.wikipedia.org/wiki/XPath). Let's use both!

<!--more-->

## Identifying The Google Search Field

Our [previous plain-English example test](/language-definition-part-two/#updating-previous-plain-english-test)
features the instruction 'set search box to "Example"'. This is a bit on the vague side for a computer to understand.

Using the Chrome dev tools to inspect the search box we can see what the CSS selector and XPath expression
is:

* `#tsf > div:nth-child(2) > div.A8SBwf > div.RNNXgb > div > div.a4bIc > input`
* `//*[@id="tsf"]/div[2]/div[1]/div[1]/div/div[2]/input` 

Ignoring any concerns about making your eyes bleed, these expressions are exact and do just what we need with absolute
precision.

That said, our human brains can examine the DOM and can derive equivalents that are less painful:

* `.gLFyf.gsfi`
* `//input[@type="text"]`

## Using CSS Selectors and XPath Expressions in Actions and Assertions

We need to be able to drop CSS selectors and XPath expressions (from here onwards known as *identifiers*) into actions 
and assertions in a way that:

* allows us to tell where the identifier starts and stops (some form of encapsulation)
* differentiates between identifiers and literal values

Encapsulation with double quotes is very common. Let's go with that.

Differentiation between literal strings and references to things that might otherwise look like literal stings can be
accomplished by prefixing a reference with something that is excluded for literals. The dollar sign is common in some
programming languages as a variable name prefix so that sounds good.

Set the value of an element:

`set $".gLFyf.gsfi" to "Example"`

Set the value of one element to the value of another element:

`set $".element1" to $".element2"`

Set the value of an element to the literal string `.element2`:

`set $".element1" to ".element2"`

## Using CSS-based Element References Plain English Test

We most recently [used our action and assertion verbs](/language-definition-part-two/#updating-previous-plain-english-test) 
in our example test. Let's update in again with our CSS-based element references (in bold).

> Open up https://google.com in Chrome.
>
> * Verify that the page is open
>
>   Assertions
>   * Page title is &quot;Google&quot;
>   * Page url is &quot;https://google.com&quot;
>
> * Search for &quot;Example&quot;
>
>   Actions
>   * set **$&quot;.gLFyf.gsfi&quot;** to &quot;Example&quot;
>   * click **$&quot;input[value=&apos;Google Search&apos;]&quot;**
>
>   Assertions
>   * Page title is &quot;Example - Google Search&quot;
>   * Page url includes &quot;https://www.google.com/search&quot;
>   * Page url includes &quot;q=example&quot;

## Identifying Attributes

We need a means of identifying attributes within our actions and assertions. XPath expressions allow for the targeting 
of element attributes but CSS selectors do not. We need to address this.

When accessing an object method or property, many programming languages opt for using a dot between the object and the 
method or property. This common usage is good enough for me so let's do the same.

Want to set the Google search box to the same as it's `maxlength` attribute?

`set $".gLFyf.gsfi" to $".gLFyf.gsfi".maxlength`

Want to assert the value of the search box `maxlength` attribute?

`$".gLFyf.gsfi".maxlength is "2048"`

Want to do the same using an XPath expression in place of the CSS selector?

`set $"//input[@type="text"]" to $"//input[@type="text"]".maxlength`

`$"//input[@type="text"]".maxlength is "2048"`

## Identifying an Element Within a Collection

Let's say you have a list of nine items. You need to target the fourth element. It has no unique properties other than 
it comes after the third item and before the fifth.

CSS offers a range of child-related [pseudo-classes](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
If you're creating some CSS for a web page that is what you would use because you have no other choice. Good luck.

XPath is slightly less complex in this regard and lets you append an index to the end of an expression. Unless perhaps
you're using a broad expression that starts with `//` in which case you should wrap the non-index part of the expression
in brackets.

What if we want to target a collection of elements with a straightforward CSS selector or XPath expression and then
just pick out the fourth one?

An unambiguous way of doing so that doesn't conflict with existing CSS or XPath syntax is to use an ordinal position 
prefixed with a colon.

CSS-based example:

`$"ul li":4`

XPath-based example:

`$"//ul/li":4`

We also need some means of accessing the last item in a collection since we may well not know the ordinal position:

`$"ul li":last`

Since we have the special-case position of `:last`, we should also support `:first`, a synonym for `:1`:

`$"ul li":first`

## Identifying Elements Within Elements

Both CSS selectors and XPath expressions allow some form of targeting an element that is within another element.

I can count on the toes of a fish the number of times I have successfully targeted on my first attempt an element that 
is the child of a parent and where the [descendant combinator](https://developer.mozilla.org/en-US/docs/Web/CSS/Descendant_combinator) 
is not what is needed.

Element hierarchies are somewhat easier to represent using XPath expressions but not ideal. `//parent/direct-child` looks 
identical to `//parent//direct-child` when you're trying to spot a bug. Foot-guns abound for the sleepy or stressed amongst us.

You may be able to easily target a containing element. You may be able to easily target an element within the scope of
a containing element. You might not so easily be able to do so in one go.

Simple example. Target a child within a parent:

`click $".parent" >> $".child"`

A child within a parent within a grandparent:

`click $".grandparent" >> $".parent" >> $".child"`

Crazy example. The third anchor within the second paragraph of the main element, mixing CSS and XPath:

`$"main" >> $"//p":2 >> $"a":3`

## Referencing Page Properties

Our simple plain-English example refers to the page title and page URL. I know what this means, you know what this
means. Our theoretical parser that will read our test and do something with it doesn't know what this means.

Even if we do know what the terms 'page title and page URL' mean, let's make things harder to get wrong by also
referencing these in just one way.

* `$page.title`
* `$page.url`

## Updating Our Simple Plain English Test

> Open up https://google.com in Chrome.
>
> * Verify that the page is open
>
>   Assertions
>   * **$page.title** is &quot;Google&quot;
>   * **$page.url** is &quot;https://google.com&quot;
>
> * Search for &quot;Example&quot;
>
>   Actions
>   * set $&quot;.gLFyf.gsfi&quot; to &quot;Example&quot;
>   * click $&quot;input[value=&apos;Google Search&apos;]&quot;
>
>   Assertions
>   * **$page.title** is &quot;Example - Google Search&quot;
>   * **$page.url** includes &quot;https://www.google.com/search&quot;
>   * **$page.url** includes &quot;q=example&quot;

That is still understandable to us and is now more understandable to a computer.

## Making Everything Easily Machine-Readable

Our example test is now looking more and more like something we can feed into a computer to get it to do our work for
us.

The next article in this series will look at how we can transform the above test into a format that is machine-readable
whilst still being just as straightforward for us to understand.
