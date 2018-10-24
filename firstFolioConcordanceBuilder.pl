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
  'AYL' => 'http://internetshakespeare.uvic.ca/doc/AYL_F1/complete/',
  'Cor' => 'http://internetshakespeare.uvic.ca/doc/Cor_F1/complete/',
  'Cym' => 'http://internetshakespeare.uvic.ca/doc/Cym_F1/complete/',
  'Err' => 'http://internetshakespeare.uvic.ca/doc/Err_F1/complete/',
  'Ham' => 'http://internetshakespeare.uvic.ca/doc/Ham_F1/complete/',
  '1H4' => 'http://internetshakespeare.uvic.ca/doc/1H4_F1/complete/',
  '2H4' => 'http://internetshakespeare.uvic.ca/doc/2H4_F1/complete/',
  'H5'  => 'http://internetshakespeare.uvic.ca/doc/H5_F1/complete/',
  '1H6' => 'http://internetshakespeare.uvic.ca/doc/1H6_F1/complete/',
  '2H6' => 'http://internetshakespeare.uvic.ca/doc/2H6_F1/complete/',
  '3H6' => 'http://internetshakespeare.uvic.ca/doc/3H6_F1/complete/',
  'H8'  => 'http://internetshakespeare.uvic.ca/doc/H8_F1/complete/',
  'JC'  => 'http://internetshakespeare.uvic.ca/doc/JC_F1/complete/',
  'Jn'  => 'http://internetshakespeare.uvic.ca/doc/Jn_F1/complete/',
  'LLL' => 'http://internetshakespeare.uvic.ca/doc/LLL_F1/complete/',
  'Lr'  => 'http://internetshakespeare.uvic.ca/doc/Lr_F1/complete/',
  'Mac' => 'http://internetshakespeare.uvic.ca/doc/Mac_F1/complete/',
  'MM'  => 'http://internetshakespeare.uvic.ca/doc/MM_F1/complete/',
  'MND' => 'http://internetshakespeare.uvic.ca/doc/MND_F1/complete/',
  'MV'  => 'http://internetshakespeare.uvic.ca/doc/MV_F1/complete/',
  'Oth' => 'http://internetshakespeare.uvic.ca/doc/Oth_F1/complete/',
  'Per' => 'http://internetshakespeare.uvic.ca/doc/Per_F1/complete/',
  'R2'  => 'http://internetshakespeare.uvic.ca/doc/R2_F1/complete/',
  'R3'  => 'http://internetshakespeare.uvic.ca/doc/Ant_F1/complete/',
  'Rom' => 'http://internetshakespeare.uvic.ca/doc/Rom_F1/complete/',
  'Shr' => 'http://internetshakespeare.uvic.ca/doc/Shr_F1/complete/',
  'TGV' => 'http://internetshakespeare.uvic.ca/doc/TGV_F1/complete/',
  'Tim' => 'http://internetshakespeare.uvic.ca/doc/Tim_F1/complete/',
  'Tit' => 'http://internetshakespeare.uvic.ca/doc/Tit_F1/complete/',
  'Tmp' => 'http://internetshakespeare.uvic.ca/doc/Tmp_F1/complete/',
  'TN'  => 'http://internetshakespeare.uvic.ca/doc/TN_F1/complete/',
  'TNK' => 'http://internetshakespeare.uvic.ca/doc/TNK_F1/complete/',
  'Tro' => 'http://internetshakespeare.uvic.ca/doc/Tro_F1/complete/',
  'Wiv' => 'http://internetshakespeare.uvic.ca/doc/Wiv_F1/complete/',
  'WT'  => 'http://internetshakespeare.uvic.ca/doc/WT_F1/complete/'
);

# Foreach URL {

# 1.  Fetch the URL, download the page.

foreach my $key (keys %urls) {
  # print "$key maps to $urls{$key}\n";
  my %words; # init an empty hash to track words in the this URL.

  # check to see if a file exists in the form of $key.html. if yes,
  # check to see if it has a stamp in the form of
  # <!-- downloaded from $urls{$key} on some date --> as the first line and
  # ends with </body></html>.
  # if yes, use that file. If NO, then download the data from the URL or die.
  # and then check to make sure the downloaded data ends with </body></html>
  # or die.
  # then create a file for writing or die. And then write our test string to
  # the first line of that file, and THEN write the HTML data from that file,
  # close the file handle for writing.
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
