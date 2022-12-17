#!/usr/bin/perl
use strict;
use warnings;
use CGI;

my $q = CGI->new;
my $text = $q->param('texto');
print "Content-type: text/html\n\n";
print "<DOCTYPE html>\n";
print "<html><head><title>Creacion</title></head>\n";
print "<body>\n";
print "<h2>El texto ingresado es: </h2><h2> $text</h2>\n";

my $i=0;
my $linea;
my $linea2;
my $linea3;
my $linea_final;
my $copia;
for ($i; $i<length($text); $i++){
	if (substr($text, $i, 1) eq "*" && substr($text, $i+1, 1) eq "*" && substr($text, $i+2, 1) eq "*"){
	   $linea=substr($text, index($text, "***")+3);
	   $linea2=substr($linea, 0, index($linea, "***"));
	   $linea3=substr($linea, index($linea, "***")+3);
	   $text=$linea2.$linea3;
	   print "<h2>***: $linea2</h2>";
 }

    elsif (substr($text, $i, 1) eq "*" && substr($text, $i+1, 1) eq "*"){
       $linea=substr($text, index($text, "**")+2);
       $linea2=substr($linea, 0, index($linea, "**"));
       $linea3=substr($linea, index($linea, "**")+2);
       $text=$linea2.$linea3;
       print "<h2>**: $linea2</h2>";
  }


   elsif (substr($text, $i, 1) eq "*"){
	$linea=substr($text, index($text, "*")+1);   	
        $linea2=substr($linea, 0, index($linea, "*"));
	$linea3=substr($linea, index($linea, "*")+1);
	$text=$linea2.$linea3;
	print "<h2>*: $linea2</h2>";
}
   elsif (substr($text, $i, 1) eq "~" && substr($text, $i+1, 1) eq "~"){
	   $linea=substr($text, index($text, "~~")+2);
	   $linea2=substr($linea, 0, index($linea, "~~"));
	   $linea3=substr($linea, index($linea, "~~")+2);
	   $text=$linea2.$linea3;
	   print "<h2>~~: $linea2</h2>";
	}
   elsif (substr($text, $i, 1) eq "`" && substr($text, $i+1, 1) eq "`" && substr($text, $i+2, 1) eq "`"){
	  $linea=substr($text, index($text, "```")+3);
	 $linea2=substr($linea, 0, index($linea, "```"));
	 $linea3=substr($linea, index($linea, "```")+3);
	 $text=$linea2.$linea3;
	 print "<h2>```: $linea2</h2>";
	}
    elsif (substr($text, $i, 1)=/\w/){
    $linea=substr($text, index($text, /\w/));
    $linea2=substr($linea, 0, index($linea, /\W/));
    $linea3=substr($linea, index($linea, /\W/)+3);    
    $text=$linea2.$linea3;
    print "<h2>sadadadasdadadanada :v:</h2>";
    }
	
	}








print "</body></html>\n";
