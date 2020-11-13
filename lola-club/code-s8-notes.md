# Lola session 8 host notes

Snake game — written in Lua for the TIC-80 — made following [this tutorial at infinitelimit.net](https://www.infinitelimit.net/article/tic-80-snake).

This session is suitable for beginners as the program presented is complete, simple and easily understood. The context of the TIC-80 provides some interesting discussion points for more experienced folks.

The `code-s8.tic` "cartridge" can be loaded and run as-is in the [TIC-80](https://tic80.com/create). I'd recommend downloading the TIC-80 binary and running it locally, rather than typing everything into the HTML5 version on their site (can't copy/paste into the web version due to browser security restrictions on clipboard access).


## Notes/hints

(All line numbers refer to `code-s8.pdf`)

- The `TIC()` function on line 51 is the magic "main" function which is called by the TIC-80 60 times per second
- Lua uses [tables](https://www.lua.org/manual/5.1/manual.html#2.5.7) for its arrays, associative arrays and more…
  >Tables are the sole data structuring mechanism in Lua; they can be used to represent ordinary arrays, symbol tables, sets, records, graphs, trees, etc. To represent records, Lua uses the field name as an index. The language supports this representation by providing a.name as syntactic sugar for a["name"].
    - Lua's `#foo` "hashtag" (e.g. line 53) is its [length operator](https://www.lua.org/manual/5.1/manual.html#2.5.5), so `#body` gives you the length of the `body` table
    - The `pairs()` function (e.g. line 27) iterates over key/value pairs in a table
- The [trace](https://github.com/nesbox/TIC-80/wiki/trace), [btn](https://github.com/nesbox/TIC-80/wiki/btn), [cls](https://github.com/nesbox/TIC-80/wiki/cls) and [rect](https://github.com/nesbox/TIC-80/wiki/rect) functions are all TIC-80 built-ins
- If you have time, I'd definitely recommend screen sharing and showing the program running in the TIC-80
    - Our group enjoyed seeing the instant modify/run behaviour
    - You can load another demo cartridge like `quest.tic` to show the sprite and map editor
- The body of the snake (and the food) is drawn with 8x8 blocks
    - Changing `*8` to `*4` in the `draw()` function will "double the resolution"
    - You'll also need to update the modulo operations on lines 64 and 65 so that the snake still wraps at the screen boundary
- Game speed is controlled on line 21
- The last parameter passed to `rect()` (and the only param to `cls()`) is a colour reference (integer index of the 16-colour palette)