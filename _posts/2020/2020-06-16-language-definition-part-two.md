---
title: "Language Definition Part 2: Doing Things One Way"
author: joncram
excerpt_separator: <!--more-->
---

## Doing Things One Way

We previously [separated out actions and assertions](/language-definition-part-one/#actions-come-before-assertions)
in test steps to make our plain-English readable test a little more precise. We will now add more precision to actions 
and assertions.

<!--more-->

## More Than One Way

How can you describe the action of entering text into a search box?

* Enter 'Example' into the search box
* Fill the search box with 'Example'
* Type 'Example' into the search box

How can you describe the action of clicking a button?

* Click the "Google Search" button
* Press the "Google Search" button
* Tap the "Google Search" button

How can you describe checking the value of a form field?

* Form field is "expected value"
* Form field equals "expected value"

There are many correct ways of describing actions and assertions, all as equally valid as each other. Picking one verb 
per type of action, and one verb per type of assertion operation, makes our statements as clear as they can be.

## Action and Assertion Verbs

### Actions

* **back**: the browser 'back' feature
* **forward**: the browser 'forward' feature
* **reload**: reload the current page
* **click**: click/press/tap/select an element
* **set**: change the value of a form field
* **submit**: submit a form
* **wait**: stop for a little whilst and wait for things to happen
* **wait-for**: stop for a little while until an element is present on the page

### Assertions

* **exists**: is an element present?
* **not-exists**: is an element not present?
* **is**: equality (*Page title is "Google"*)
* **is-not**: non-equality (*Page title is-not "Google"*)
* **includes**: does an element/page component contain text? (*Page url includes "q=example"*)
* **excludes**: does an element/page component not contain text? (*Page url excludes "cheese"*)
* **matches**: does an element/page component match a regular expression? (*Page url matches "/^google\.com\/search.*$/"*)

These don't cover every possible need but do cover most needs. Relatively modern browser actions such as dragging 
elements around and dropping them on other elements are not covered, but those can come once we have the basics in
place.

Regarding *includes*: our example test used *contains* for asserting an element featured a known value. I've opted
for *includes* as it better supports the negative of *excludes*.

## Updating Previous Plain English Test

We previously [separated out actions and assertions](/language-definition-part-one/#actions-come-before-assertions)
in our example test. Let's update in again with our action and assertion verbs (in bold).

> Open up https://google.com in Chrome.
>
> * Verify that the page is open
>
>   Assertions
>   * Page title **is** "Google"
>   * Page url **is** "https://google.com"
>
> * Search for "Example"
>
>   Actions
>   * **set** search box to "Example"
>   * **click** "Google Search" button
>
>   Assertions
>   * Page title **is** "Example - Google Search"
>   * Page url **includes** "https://www.google.com/search"
>   * Page url **includes** "q=example"

## Precisely Identifying Page Components

The instruction 'set search box to "Example"' makes sense to us when we're aware of the context of being at the Google
homepage. The Google homepage contains only one search box (actually just one input field when I last checked).

It is possible to retain the same wording and have a computer understand what we mean. Well, it is possible for this
exact example. For other examples it may not be possible. In cases where is it possible to unambiguously translate
a rather loosely-worded instruction into a single operation that a computer can perform, we can't be certain
that what we end up doing is what the person who wrote the test wanted.

Thankfully two standard means of identifying page elements exist. We can expand on that a little to make our brains 
hurt a little less.

The next article in this series will look at exactly that.