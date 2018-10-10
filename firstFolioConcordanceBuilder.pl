#!/usr/bin/perl
#
# firstFolioConcordanceBuilder.pl
#
# by Tony Tambasco
# tambascot@yahoo.com
#
# LICENSE: This program is free software, licensed under version 2 of the GNU General Public License.
use strict;
use warnings;
use XML::Twig;
use MARPA::R2::HTML;
#test

# Create a structure of URLs to parse. I'm thinking a stack so that they can be popped off
# as we process them. These URLS will point to the First Folio old spelling transcripts from
# the University of Victoria's Internet Shakespeare Editions. The structure will also have to have the
# name and short hand name of the play

# Foreach URL {

# 1.  Fetch the URL, download the page.
# 1.3 Add the short name of the play as primary key to a shows table. Add the full name as a field,
#	along with a URL to the play's front page.
# 2.  Extract all of the lines and stage directions (?) and quere them for separate persing.
# 3.  Parse the line into words.
# 4.  Check to see if the word is entered in our hash of words. If not, add it as a key. with a list of
#	TLN URLs as the value.
# 5.  Create a URL that links back to the TLN on which the word occurs. Store this URL in the list of TLN
#	URLs# 6.  When finished parsing the file, write the hash to a database.
# 	Foreach key in hash {
#	a. for each item in the value list {
#		1. incriment the entryID counter, this is the primary key.
#		2. write each entry will consist of entryID:word:shortTitle:LongTitle:tln:URL
#	}
#	b. Write the XML structure to a file# }
# }

# A separate application will print the concordance from the database we have constructed.
