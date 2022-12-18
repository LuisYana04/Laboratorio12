#!/usr/bin/perl
use strict;
use warnings;
use CGI;

my $q = CGI->new;


my $text = $q->param('texto');
my $title = $q->param('titulo');
print "Content-type: text/html\n\n";
print "<DOCTYPE html>\n";
print "<html><head><title>Creacion</title></head>\n";
print "<body>\n";
print "<h2>El texto ingresado es: </h2><h2>$text </h2>\n";



open(OUT,">Nuevos/$title") or die print "<p1>ERROR: No se pudo crear el archivo</p1>";
print OUT "$text";
close(OUT);

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
   elsif (substr($text, $i, 1) eq "#" && substr($text, $i+1, 1) eq "#" && substr($text, $i+2, 1) eq "#"){
	 $linea=substr($text, index($text, "######")+7);
	 $linea2=substr($linea, 0, index($linea, "*"));
	 $linea3=substr($linea, index($linea, "**")+2);
         $text=$linea;
         print "<h2>###: $linea2</h2>";
        }
   elsif (substr($text, $i, 1) eq "#" && substr($text, $i+1, 1) eq "#"){
         $linea=substr($text, index($text, "#")+3);
               $linea2=substr($linea, 0, index($linea, "#"));
               $linea3=substr($linea, index($linea, "######")+7);
         $text=$linea;
         print "<h2>##: $linea2</h2>";
        }	 

    elsif (substr($text, $i, 1) eq "#"){
         $linea=substr($text, index($text, "#")+2);
         $linea2=substr($linea, 0, index($linea, "##"));
         $linea3=substr($linea, index($linea, "##")+3);
         $text=$linea;
         print "<h2>#: $linea2</h2>";
        }
    elsif (substr($text, $i, 1) =~ /\W/ && substr($text, $i+1, 1) =~ /\s/ && substr($text, $i+2, 1) =~ /[A-Z]/){
 	  $linea=substr($text, index($text, /[^a-z]/));
	  $linea2=substr($linea, 0, index($linea, /\W/));
	  $linea3=substr($linea, index($linea, /\W/)+3);
	  $text=$linea2.$linea3;
	  print "<h2>sadadadasdadadanada :v: $text</h2>";
	}
        
   
	
	}
open(OUT,">>/home/alumno/public_html/Laboratorio12/list.html") or die print "<p1>ERROR: No se pudo crear el archivo</p1>";
print OUT "<br><a href='http://192.168.0.22/~alumno/Laboratorio12/cantantes.html'>$title</a>";
print OUT "<a href= 'http://192.168.0.22/~alumno/Laboratorio12/cantantes.html'>
<input type='button' value='Editar'></a>";
print OUT "<a href='http://192.168.0.22/~alumno/Laboratorio12/edit.pl'> 
<input type='button' value='Eliminar'></a>";
print OUT "</body></html>";
close(OUT);

print "<"

print "</body></html>\n";
