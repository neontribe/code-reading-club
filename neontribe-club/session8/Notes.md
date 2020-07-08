# Code Reading Club Session Notes

## Intro: Reflection
### Has code reading club has helped you in your other projects or conversations? 
Not much except from suggesting to a colleague to join the Club due to his practise.

## Exercise 1: First glance
### Look at the code and discuss

A piece of prep code. 
It looks like an object orientated code due to the existence of classes or objects, functions, constructors. 
Using familiarity, only one participant guessed it was Rust. 
One participant acknowledged that the bump was allocated twice (defined, implemented) which appeared to be important as the frame allocator was imported for the bump allocator.

## Exercise 2: Examine the structure
### Highlight the code and discuss

- Due to the tool (Miro) some participants struggled to finish the exercise. 
- The code seems to consist only of 5 functions but each reference something. 
- It is a dynamically constructed object. 
- Lots of static things. 
- Some participants started the exercise by trying to find variables by looking for keywords. 
- It seems it contains a lot of variables.
- Classes seem to be called similar way as PHP with double colon.
- Functions are interesting due to the way they are being called which is inside of themselves.
- For one participant there was not enough time to understand what the code was doing.
- The code has been described by all as “very wordy”.

## Exercise 3: Most important lines
### Identify the most important lines of the code

Easy agreement on the following lines:
9 
18 
45 
56 (bounce check of line 55’s validity) 
91 
128 (Comment.  If it were to be present in a parent it would mean don’t do anything if you are in panic)

### Summarize in less than 10 sentences the essence of the code
Memory allocation. Bump allocator defines how to choose next physical memory area. Frame allocator has functions to help the bump allocator find & make areas it can use.

## Wash Up
- Miro – Seems to be a good tool but still is a good tool if we know how to use it
- Layout is good (i.e. each participant has its own frame with its own code sheet and agenda)
- First exercise of glancing the code was pushed to 2min. For one participant it was too long, for another one it was enough. 
- For accessibility matter, PDF seems better than Jpeg.
- Facilitator has removed the exercise “create a list of all identifier names in the snippet” due to not knowing how to make it work and ensuring there was time for a wash up.

## Code Source
https://gitlab.redox-os.org/redox-os/kernel/-/commit/fe705d9b63173c8e8f31bd6b5bfde8349779df61
