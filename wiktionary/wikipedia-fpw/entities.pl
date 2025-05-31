use strict;
use warnings;

use English;
use FileHandle;

#
# ダンプデータ中に使用されている実体参照を出力します。
# wikipedia.xml をカレントディレクトリに置いて
# perl entities.pl > output
# のように使用してください。
#

 MAIN: {
   my %entities;
   my $entity;

   my $xml = FileHandle->new();
   if (!$xml->open("wikipedia.xml", 'r')) {
     die "Failed to open the file, $ERRNO: wikipedia.xml\n";
   }

   for (;;) {
     $_ = $xml->getline();
     if (!defined($_)) {
       last;
     }

     while ($_ =~ s/&amp;([0-9a-zA-Z]+);//){
       $entities{$1} = 1;
     }
   }

   foreach $entity (keys(%entities)) {
     print "'$entity' => '?',\n";
   }
}
