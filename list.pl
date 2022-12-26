#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;
my $q = CGI->new;
print $q->header('text/html');

print <<HTML;
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Listado</title>
</head>
<body>
<h1>LISTADO DE PAGINAS</h1>
HTML


my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.0.24";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");

my $sth = $dbh->prepare("SELECT * FROM paginasWiki");
$sth->execute();
while( my @row = $sth->fetchrow_array ) {
      print <<HTML;
          <p><li>
              <a href="view.pl?titulo=$row[0]">$row[0]</a>
    <a href="delete.pl?titulo=$row[0]"><input type="submit" value="Eliminar"></a>
    <a href="edit.pl?titulo=$row[0]"><input type="submit" value="Editar"></a>
    </p></li>
HTML
    }
    #<input type="submit" formaction="delete.pl?titulo=$row[0]" value="X">
    
    print <<HTML;
    <a href="../new.html">Nueva pagina</a><br>
    <a href="../index.html">Volver al inicio</a>
    </body>
    </html>
HTML
    $dbh->disconnect;
  