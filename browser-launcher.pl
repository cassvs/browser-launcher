use Tk;
$mw = MainWindow->new;
$mw->title("GLaunch");
$mw->CmdLine;
$frame1 = $mw->Frame(-borderwidth => 2,
		     -relief => 'ridge');
$frame1->pack(-side => 'top',
	      -expand => 'n',
	      -fill => "x");
$frame1->Label(-text => "Enter Query: ")->pack(-side => "left",
					      -anchor => "w");
$entry = $frame1->Entry(-textvariable => \$query,
			-width => 40);
$entry->pack(-side => "left",
	     -anchor => "w",
	     -fill => "x",
	     -expand => "y");
$bttn = $frame1->Button(-text => "Go",
			-command => sub { &do_search(); });
$bttn->pack(-side => "left",
	    -anchor => "w");
$entry->bind('<Return>', sub { &do_search(); } );
$entry->bind('<Escape>', sub { &close_self(); } );
$entry->focus;
MainLoop;

sub do_search {
	chomp($query);
	
	if ($query =~ m"(!\w+)|(\w+!)") {
	#Detect DuckDuckGo "Bangs" in query, if found pass to DDG, else proceed.
		$url = "http://duckduckgo.com/?q=$query";
	} elsif ($query =~ m[(^https?:\/\/)|(\.[a-zA-Z]{2,5})]) {
	#Detect leading "http(s)://" or domain in query, if found $url = $query, else proceed as before.
		$url = $query;
	} else {
		$url = "http://duckduckgo.com/?q=$query";
	}
	$path = "C:\\\"Program Files (x86)\"\\\"Mozilla Firefox\"\\firefox -private-window ";
	#print "Navigating...\n";
	system("start $path \"$url\""); #or die "Failed to call firefox! Aborting...\n";
	#print "Success!";
	exit;
}

sub close_self {
	exit;
}
