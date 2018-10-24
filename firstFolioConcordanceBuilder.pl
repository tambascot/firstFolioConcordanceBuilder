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
use HTML::TokeParser::Simple;
use LWP::Simple qw(get);

# Create a structure of URLs to parse. I'm thinking a stack so that they can be popped off
# as we process them. These URLS will point to the First Folio old spelling transcripts from
# the University of Victoria's Internet Shakespeare Editions. The structure will also have to have the
# name and short hand name of the play

my %urls =
(
  # Key is the standard MLA abbreviation for the Shakespeare play in question.
  # Value is the URL to the complete text of the old spelling transcription of
  # the first folio edition of that play at the University of
  # Victoria's Internet Shakespeare Editions collection
  'Ado' => 'http://internetshakespeare.uvic.ca/doc/Ado_F1/complete/',
  'AWW' => 'http://internetshakespeare.uvic.ca/doc/AWW_F1/complete/',
  'Ant' => 'http://internetshakespeare.uvic.ca/doc/Ant_F1/complete/',
  'AYL' =>
  'Cor' =>
  'Cym' =>
  'Err' =>
  'Ham' =>
  '1H4' =>
  '2H4' =>
  'H5'  =>
  '1H6' =>
  '2H6' =>
  '3H6' =>
  'H8'  =>
  'JC'  =>
  'Jn'  =>
  'LLL' =>
  'Lr'  =>
  'Mac' =>
  'MM'  =>
  'MND' =>
  'MV'  =>
  'Oth' =>
  'Per' =>
  'R2'  =>
  'R3'  =>
  'Rom' =>
  'Shr' =>
  'TGV' =>
  'Tim' =>
  'Tit' =>
  'Tmp' =>
  'TN'  =>
  'TNK' =>
  'Tro' =>
  'Wiv' =>
  'WT'  =>
);

# Foreach URL {

# 1.  Fetch the URL, download the page.

foreach my $key (keys %urls) {
  # print "$key maps to $urls{$key}\n";
  my %words; # init an empty hash to track words in the this URL.

  # check to see if a file exists in the form of $key.html. if yes, use it
  # as the file. If no, download from the URL and write to that file, and THEN
  # use that file.
  #
  # Yes, this presumes a good faith file, so we need to devise some better
  # means of checking the file to verify it looks like the sort of file we
  # are expecting.

  my $html = get $urls{$key};

}

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
