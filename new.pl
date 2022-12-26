#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;

my $q = CGI->new;


my $text = $q->param('texto');
my $title = $q->param('titulo');
my $user = 'alumno';
my $password = 'pweb1';
print "Content-type: text/html\n\n";
print "<DOCTYPE html>\n";
print "<html><head><title>Nueva Pagina</title></head>\n";
print "<body>\n";
                   
my $dsn="DBI:MariaDB:database=pweb1;host=192.168.0.24";
my $dbh=DBI->connect($dsn,$user,$password) or die ("<p1>No se pudo conectar!</p1>");
my $sth=$dbh->prepare("INSERT INTO paginasWiki(titutlo, texto)VALUES(?,?)");
$sth->execute($title, $text);

$sth->finish;
$dbh->disconnect;

print "<h2>Pagina creada satisfactoriamente</h2>";

print "<a href= 'http://192.168.0.24/~alumno/Wiki1.0/cgi-bin/edit.pl'>
<input type='button' value='Ver lista'></a>";
print "<'http://192.168.0.24/~alumno/Wiki1.0/'>
<input type='button' value='Regresar al menu principal'></b>";



print "</body></html>";
                
