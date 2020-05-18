# Code Reading Club agenda
https://github.com/carwow/elm-slider/tree/master/examples


## Reflection (14:02)
- Between sessions, note times when you notice that code reading club has helped you in your other projects or conversations.
-
- Continuing to work on project to make changes in code. So this is extremely appliable. The logic in determining user lang preference is not terrible obvious - and there were no test cases. It was not clear which input preferences would result in which files being read from the server. So I did actually take a pdf of main controller & highlighted with a cup of tea. I could have just tried loads of different inputs and checked what happened, but instead, I made the effot to not just fiddle and look at output. Keen to apply this
- I've only been writing code last week - so I didn't get the opportunity.

### Code structure

#### Examine structure (14:08)
The goal of this exercise is to be a concrete thing to *do* when looking at new code for the first time. New code can be scary, doing something will help!

Color variables
* Go through the code and circle all variables in red
* Then draw a link between variables and their uses

Color method/function calls
* Go through the code and circle all methods in blue 
* Then draw a link between methods and their invocations

Instantiation 
* Go through the code and circle all instances of classes in green 
* Then draw a link between classes and their instances

#### Discuss the results (14:18 mins)
1. What patterns are visible from the colors and links only?
1. What parts of the code warrant more attention based on the colors?
1. What strategy did you use to identify the different types of element?

- Confused. Not know what is a declaration etc. Drew nothing.
- Model, View, Update (is the update like a controller?)
- weird syntax - the part with in confused me
- what is the return
- Oh - that's a type declaration
- Started trying to colour variables, types, functions but got stuck and tried a new strategy of figuring out what was imports so I could see what was defined in this file vs. defined elsewhere
- Cmd seems to be a global

### Content

#### Identify most important lines (14:31)
Independently identify the 5 lines you consider most important.

#### Discussion (14:41)
Discuss in the group:

- lines covered by many people?
- lines named but not by a lot of people
- What strategy did you use to identify importance?
- Agree less than 10 of the most important lines

Take turns in the group, and let every member talk about the code for 30 seconds (or less/more, could also be one sentence each). Try to add new information and not repeat things that have been said, and repeat until people do not know new things anymore.


| votes | lines  |
|---|---|
| 1  | 11,26,31,36,72,73,74,83,104,107,114 |
| 2  | 65,105 |
| 4  | 12 |
| 5  | 20 |

8 agreed lines - 12,20,31,36,65,73,83,105 basically the function declarations for init, update, view, the defiition of main (the export) and the definition of the Model record.



#### Summarize in less than 10 sentences individually (15:01)
1. Independently write down the essence of the code in a few sentences

#### Discussion (10 mins)
- topics covered by many vs few
- strategies used to create the summary (e.g. method names, documentation, variable names, prior knowledge of system)

#### Summarize in less than 10 sentences (10 mins)
1. Create a summary together
1. Compare the summary with the available documentation (inside and outside the code)
- identify differences and similarities between the groups findings and the existing

## Wash up (5 mins)
- What worked well
    - Doesn't make me anxious that I don't understand because it's an academic exercise.I'm not trying to debug it or work on it.
    - The more I stay with the code the more readable it seems. If you know the syntax, it looks much easier than any other language I've used. That's just an instinct
    - It looks really clean if you know what you are reading. Not too many semicolons and keywords and curly braces
    - It's nice looking at languages I don't use

- What worked badly
    - That was the most confusing code I've read
    - I've looked at elm before because I heard it has nice error messages, but when I read a blog post I'm like whoa, no way that looks hard
    
## Next time
- Prolog? https://meet.google.com/linkredirect?authuser=0&dest=https%3A%2F%2Fyarnpkg.com%2Ffeatures%2Fconstraints
- Would have been better to explain syntax first? In real world, you'd probably look up the basics before reading if the language was totally unfamiliar
