#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;
print "Content-type: text/html\n\n";

my $q = CGI->new;
my $titulo = $q->param("titulo");


my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.0.24";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");;

if(!($titulo eq "")){
print <<HTML;
<!DOCTYPE html>
<html>
  <head>
      <meta charset="utf-8">
    <title> Delete $titulo </title>
  </head>
<body>
<h1>Borrando: $titulo</h1>
<p>La pagina con titulo: \"$titulo\" ha sido eliminada<br>
Para ingresar el listado ingrese <a href="list.pl">aqui</a>
</p>
</body>
</html>
HTML
my $sth = $dbh->prepare("DELETE FROM paginasWiki WHERE titutlo=?");
$sth->execute($titulo);
}
$dbh->disconnect;