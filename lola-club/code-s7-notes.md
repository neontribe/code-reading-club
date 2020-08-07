# Lola session 7 host notes

Sample lightly adapted from [Racket's example "Memory" card game](https://github.com/racket/games/tree/master/memory).

Trimmed down a bit for easier reading (mostly just removed the game timer).

`code-s7.rkt` can be executed as-is in DrRacket and it will show the game GUI, but it assumes you have a full Racket install with the game assets in `share/games/...` etc. However, if you just want to run the pre-compiled version (with the timer) it is included in [the default Racket bundle](https://download.racket-lang.org) (run the "PLT Games" executable in the download and select "Memory").


## Hints

- The `#t` and `#f` values on lines 26, 34, 35 etc. are booleans
- `(+ 1 HEIGHT)` is calling the `(+)` function and passing in 1 and HEIGHT
- `(car)` is a standard function that returns the first element in a list (should really be named `(first)`)
  - `(cdr)` returns the remaining elements as a list (should really be named `(rest)`)
  - the reasons for these function names are quite literally lost in the mists of time
  - lists are recursively defined: they're either `null` or a pair of elements; the first element being the head of the list, the second being either `null` (if it's a single-element list) or a list of the remaining elements
- `(cond)` is a convenience function used to chain **cond**itionals as a series of tests
- square brackets `[]` are interchangeable with parens `()`
  - by _convention_ they're used for `(cond)` clauses (along with indentation) to make things a bit more readable
- `(send t stack-cards deck)`
  - sending `deck` to the `stack-cards` function in the `t` object (ish)
- The exclamation in `(set!)` [is significant](https://docs.racket-lang.org/guide/set_.html)

