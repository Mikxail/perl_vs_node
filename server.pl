#!/usr/bin/perl

use strict;
use warnings;


use IO::Socket;
use IO::Select;

my %SES;

my $PORT = 8888;

my $out = q~HTTP/1.1 200 Ok
Content-Type: text/html; charset=UTF-8
Connection: close
Content-Length: 1

a~;

my $listen_socket = IO::Socket::INET->new(
	LocalPort	=> $PORT,
	Proto		=> 'tcp',
	Listen		=> 20,
	ReuseAddr	=> 1
) or die $@;

my $readers = IO::Select->new() or die $@;
$readers->add($listen_socket);

warn "Started";

my (@ready, $handle, $bytes);
while (1) {
	@ready = $readers->can_read(0);
	
	for $handle (@ready) {
		if ($handle eq $listen_socket) { # accept
			my $connect = $listen_socket->accept();
			$readers->add($connect);
			#syswrite($connect, $out);
			#print $connect rand();
			#close $connect;
		} else {
			my $input;
			$bytes = sysread($handle, $input, 1024);
			if ($bytes > 0) {
				syswrite($handle, $out);
				$readers->remove($handle);
				close $handle;
			} else {
				#$readers->remove($handle);
				#close $handle;
			}
		}
	}
}