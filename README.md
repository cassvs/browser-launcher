# browser-launcher
#### A little Perl script for launching new tabs.

If you use a web browser ("Who doesn't?") on a computer that's not quite fast enough ("*Fast enough?* What's that?") then you might find this utility useful.

### System Requirements:
- Currently works on MS Windows (tested on 8.1, but most versions should work)
- The Mozilla Firefox web browser (but easy to modify for other browsers)
- Strawberry Perl (or similar Perl interpreter for Windows)
- Perl/TK GUI Toolkit

As it's written in Perl with TK graphics, the script should run on any machine with a Perl interpreter and TK support, including GNU/Linux, Mac OS, and Windows systems. However, different browsers live in different places on different systems. Therefore, **this version currently only works with Firefox under Windows**, but it won't be hard to add support for other OS/browser combos.

### User Requirements:
- A favourite search engine. (Currently defaults to DuckDuckGo, but easily configurable in the code.)
- Optional: A little knowledge of Perl. Super helpful if you want to tweak things.

### The Problem:
It's a dark and stormy evening. A stupendously cool thought has just popped into your head, one that demands that you perform a web search immediately. But alas, your browser is not open, and your computer lacks one of those newfangled instant integrated web search toolbar thingies. *No problem*, you think, and after a flurry of clicks you've opened your browser. But how long will it take for the window to become responsive? Your poor overworked computer must now heave the elephantine bulk of your browser off its hard disk and into memory, then fetch and load your favourite search engine's multi-megabyte start page. By the time all that is done, you might very well have forgotten the jewel of inspiration that began the whole process.

### Some Solutions:
You could engage your browser's "run-in-background" feature. This way, it sits in memory even after it's closed, which means it'll open faster when you need it. Most browsers have some form of this. However, this takes up resources that you might need for other important stuff. It's a trade-off: the browser opens a bit faster, but everything else might run a bit slower.

Here's where *browser-launcher* comes in. It's a little Perl script that opens fast, gives you a box to type text in, and then passes your input on to a new instance of your browser, which loads the search results page for your query. 
