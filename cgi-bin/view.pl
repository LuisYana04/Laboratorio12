#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;

my $q = CGI->new;
my $body = $q->param('body');
my $titulo = $q->param('titulo');

print $q->header('text/html');

print "<DOCTYPE html>\n";
print "<html><head><title>Vista</title></head>\n";
print "<body>\n";
print "<h1>$titulo</h1>";

my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.0.24";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");;

    my $sth = $dbh->prepare("SELECT * FROM paginasWiki WHERE titutlo=?");
      $sth->execute($titulo);
      my $text;
      while( my @row = $sth->fetchrow_array ) {
            $text = @row[1];
            }
$text=$text."\n";
my $palabra;
my $i=0;
my $init=0;
my $p1;
my $p2;
my $l1;
my $l2;
my $j;
my $cond=0;
my $s1;


for ($i; $i<length($text); $i++){

  if (substr($text, $i, 1) =~ /\n/){
    $palabra=substr($text, $init, $i-$init);
    $init=$i+1;
      
  if (substr($palabra, 0, 1) eq "#" && substr($palabra, 1, 1) eq "#" && substr($palabra, 2, 1) eq "#"){
    $palabra=substr($palabra, 6, length($palabra)-6);
    print "<h6>$palabra</h6>";
    }
    elsif (substr($palabra, 0, 1) eq"#" && substr($palabra, 1, 1) eq "#"){
    $palabra=substr($palabra, 2, length($palabra)-2);
    print "<h2>$palabra</h2>";
                      
    }
    elsif (substr($palabra, 0, 1) eq "#"){
    $palabra=substr($palabra, 1, length($palabra)-1);
    print "<h1>$palabra</h1>";
                          
    }
    elsif (substr($palabra, 0, 1) eq "*" && substr($palabra, 1, 1) eq "*" && substr($palabra, 2, 1) eq "*"){
    $palabra=substr($palabra, 3, length($palabra)-7);
    print "<p><strong><em>$palabra</em></strong></p>";
    }
   elsif (substr($palabra, 0, 1) eq "*" && substr($palabra, 1, 1) eq "*"){
    $palabra=substr($palabra, 2, length($palabra)-5);
    print "<p><strong>$palabra</strong></p>";
    }
   elsif (substr($palabra, 0, 1) eq "*"){
      $palabra=substr($palabra, 1, length($palabra)-4);
      print "<p><em>$palabra</em></p>";
     }
   elsif (substr($palabra, 0, 2) eq "~~"){
     $palabra=substr($palabra, 2, length($palabra)-5);
     print "<p>$palabra</p>";
     }
   else{
     for ($j=0; $j<length($palabra); $j++){
      if (substr($palabra, $j, 1) eq "]" && substr($palabra, $j+1, 1) eq "("){
     $l1=substr($palabra, index($palabra, "["));
     $l2=substr($l1, 1, index($l1, "]")-1);
     $p1=substr($palabra, index($palabra, "("));
     $s1=substr($palabra, 0, index($palabra, "["));
     $p2=substr($p1, 1, index($p1, ")")-2);
     print <<EOF;
     <p>$s1<a href="$p2">$l2</a>.</p>
EOF

     $cond=1;

        }
   }
  if ($cond==0){
    print "<p>$palabra</p>";
}
                                                 
                         
}
$cond=0;
                      
}
}                               
print <<EOF;
<br><br><a href="http://192.168.0.24/~alumno/Wiki1.0/" style="font-size:28px">Regresar a la pagina principal</a>
<br><a href="http://192.168.0.24/~alumno/Wiki1.0/cgi-bin/list.pl" style="font-size:28px" >Listado de paginas</a>
</body></html>
EOF



