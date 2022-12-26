#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;
print "Content-type: text/html\n\n";

my $q = CGI->new;
my $titulo = $q->param("titulo");
my $contenido = $q->param("body");
my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.0.24";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");;

if(defined($titulo)&!defined($contenido)){

  my $sth = $dbh->prepare("SELECT * FROM paginasWiki WHERE titutlo=?");
    $sth->execute($titulo);
    my $body;
    while( my @row = $sth->fetchrow_array ) {
          $body = @row[1];
          }
           print <<HTML;
           <!DOCTYPE html>
            <html>
            <head>
            <meta charset="utf-8">
            <title> $titulo </title>
            </head>
            <body>
            <h1>$titulo</h1>
            <form action="edit.pl">
            <input type="hidden" name="titulo" value="$titulo">
            <label for="body"> Texto </label>
            <textarea type = "texto" name="body" cols="40" rows="5" >$body</textarea><br>
            <input type="submit" value="Enviar">
HTML
            }else{
            my $sth = $dbh->prepare("UPDATE paginasWiki SET texto=? WHERE titutlo=?");
            $sth->execute($contenido,$titulo);
            print "<p>Su pagina fue actualizada en <a href=\"list.pl\">Listado de paginas</a></p>";
           }
$dbh->disconnect;
print <<HTML;

</form>
</body>
</html>
HTML



