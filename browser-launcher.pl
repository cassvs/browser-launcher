#!/usr/bin/perl
use strict;
use warnings;
use Tk;

# Search Engine:
# Uncomment one of the following lines to select your search engine:
#my $SEARCH_ENGINE_URL = "https://duckduckgo.com/?q=";		# DuckDuckGo
my $SEARCH_ENGINE_URL = "https://start.duckduckgo.com/?q=";	# Cookieless DuckDuckGo
#my $SEARCH_ENGINE_URL = "https://encrypted.google.com/#q=";	# Google
#my $SEARCH_ENGINE_URL = "https://search.example.org/?query="	# Custom

# Browser Path:
# Uncomment one of these to select the location of your browser:
my $BROWSER_PATH = q[C:/"Program Files (x86)"/"Mozilla Firefox"/firefox];		# Firefox on Win64
#my $BROWSER_PATH = q[C:/"Program Files"/"Mozilla Firefox"/firefox];			# Firefox on Win32
#my $BROWSER_PATH = q[C:/"Program Files (x86)"/Google/Chrome/chrome];			# Google Chrome on Win64
#chomp (my $BROWSER_PATH = `which firefox`);						# Firefox on *nix
#chomp (my $BROWSER_PATH = `which chrome-browser`);					# Chrome on *nix
#chomp (my $BROWSER_PATH = `which chromium-browser`);					# Chromium on *nix

# Tor Browser Path (Tor not enabled by default.)
#my $TOR_PATH = q[C:/PATH/TO/"tor browser"/browser/firefox.exe];			# Tor Browser. Change this to the location of Tor Browser on your system.

# Private Session Option
# Choose the command line option that matches your browser:
my $PRIVATE_OPT = "-private-window";			# Firefox
#my $PRIVATE_OPT = "--incognito";			# Chrome(ium)

# Default-to-Private?
# Set this to "yes" if you want to spawn private windows by default.
my $DEFAULT_TO_PRIVATE = "no";

#my $DEFAULT_TO_TOR = "no";

my $url = "";
my $query = "";
my $privatep = "";
#my $torp = "";

#Set up TK window:
my $mw = MainWindow->new;
$mw->title("browser-launcher");
$mw->CmdLine;
my $frame1 = $mw->Frame(-borderwidth => 2,
		     -relief => 'ridge');
$frame1->pack(-side => 'top',
	      -expand => 'n',
	      -fill => "x");
$frame1->Label(-text => "Enter Query: ")->pack(-side => "left",
					      -anchor => "w");
my $entry = $frame1->Entry(-textvariable => \$query,
			-width => 40);
$entry->pack(-side => "left",
	     -anchor => "w",
	     -fill => "x",
	     -expand => "y");
		 
#A Private mode checkbox:		 
my $pchk = $frame1 -> Checkbutton(-text=>"P?",
	-variable=> \$privatep);
$pchk -> select(); 
$pchk -> deselect() if $DEFAULT_TO_PRIVATE eq "no";
$pchk -> pack(-side => "left", -anchor => "w");

#A Tor checkbox:
#my $tchk = $frame1 -> Checkbutton(-text=>"T?",
#	-variable=> \$torp);
#tchk -> select(); 
#$tchk -> deselect() if $DEFAULT_TO_TOR eq "no";
#$tchk -> pack(-side => "left", -anchor => "w");

my $bttn = $frame1->Button(-text => "Go",
			-command => sub { &do_search(); });
$bttn->pack(-side => 'left',
	    -anchor => "w");
$entry->bind('<Return>', sub { &do_search(); } );
$entry->bind('<Escape>', sub { &close_self(); } );
$entry->focus;
MainLoop;

sub do_search {
	chomp($query);
	#my $private = ($privatep && !$torp) ? $PRIVATE_OPT . " " : "";
	my $private = ($privatep) ? $PRIVATE_OPT . " " : "";
	#my $browser = ($torp) ? $TOR_PATH : $BROWSER_PATH;
	my $browser = $BROWSER_PATH;
	
	if ($query =~ m"(!\w+)|(\w+!)") {
	#Detect DuckDuckGo "Bangs" in query, if found pass to DDG, else proceed.
		$url = "$SEARCH_ENGINE_URL$query";
	} elsif ($query =~ m[(^https?:\/\/)|(\.[a-zA-Z]{2,5})]) {
	#Detect leading "http(s)://" or domain in query, if found $url = $query, else proceed as before.
		$url = $query;
	} else {
		$url = "$SEARCH_ENGINE_URL$query";
	}
	
	#Call the browser.
	#Uncomment for *nix:
	#system("$BROWSER_PATH $private\"$url\" &"); #or die "Failed to call browser! Aborting...\n";
	#Uncomment for Windows:
	exec "start", "$browser $private\"$url\"";
	#print ("$browser $private\"$url\"");
	#print "Success!";
	exit;
}
sub close_self {
	exit;
}
