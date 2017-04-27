# browser-launcher
#### A little Perl/TK thingy for launching new tabs.

browser-launcher pops up a little GUI window for typing text in. Pressing the "Go" button (or <kbd>Enter</kbd>) opens your browser (or a new tab if it is already open) and sends your text input to your favourite search engine.

If you use a web browser on a computer that's a little slow, you might find this utility useful.

### System Requirements:
Works on any system with:
- a Perl interpreter
- the Perl/TK GUI toolkit
- a browser

### User Requirements:
- A favourite search engine. (Currently defaults to DuckDuckGo, but easily configurable in the code.)
- Optional: A little knowledge of Perl. Super helpful if you want to tweak things.

### Why Do I Need This?:
Because browsers are enormous. On reasonably-spec'd consumer hardware, cold-starting a browser such as Firefox can take a seriously unreasonable length of time. browser-launcher gives you a box to type in *now*, so you don't have to hold your breath while your browser heaves its bulk off disk and into memory, loads plugins, and fetches and renders multi-megabyte start pages. (Of course, most browsers support some form of the "run-in-background" feature, which keeps the aforementioned bulk in memory even when the browser is "closed". This improves start time, of course, but it uses up an awful lot of system resources *doing nothing*.)

### It's Not Working!:
The script needs to know a few things in order to work right:
- The path to your browser's executable. (For example: `C:\Program Files\Mozilla Firefox\firefox.exe`)
- The option that tells your browser to open a private window. (`-private-window` for Firefox, `--incognito` for Chrome)
- The URL of your preferred search engine. (`https://www.google.com/#q=` for Google)
- The type of system it's running on. This is mainly because of annoying differences between the quoting mechanisms of the Windows command shell and a proper shell like Bash. There are other reasons too, but most of them are related to tools and features that are missing or different on Windows.

You can change these options to match your system by commenting or uncommenting preconfigured lines at the top of the script, or by adding your own lines.
If it still doesn't work, try running the script from the command line, so you can see any error and debugging messages the script might be emitting. (eg. `$ ./browser-launcher.pl`)
