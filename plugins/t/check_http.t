#! /usr/bin/perl -w -I ..
#
# HyperText Transfer Protocol (HTTP) Test via check_http
#
# $Id: check_http.t,v 1.12 2006/10/19 18:59:58 tonvoon Exp $
#

use strict;
use Test::More;
use NPTest;

plan tests => 22;

my $successOutput = '/OK.*HTTP.*second/';

my $res;

my $host_tcp_http      = getTestParameter( "NP_HOST_TCP_HTTP", 
		"A host providing the HTTP Service (a web server)", 
		"localhost" );

my $host_nonresponsive = getTestParameter( "NP_HOST_NONRESPONSIVE", 
		"The hostname of system not responsive to network requests",
		"10.0.0.1" );

my $hostname_invalid   = getTestParameter( "NP_HOSTNAME_INVALID", 
		"An invalid (not known to DNS) hostname",  
		"nosuchhost");

$res = NPTest->testCmd(
	"./check_http $host_tcp_http -wt 300 -ct 600"
	);
cmp_ok( $res->return_code, '==', 0, "Webserver $host_tcp_http responded" );
like( $res->output, $successOutput, "Output OK" );

$res = NPTest->testCmd(
	"./check_http $host_tcp_http -wt 300 -ct 600 -v -v -v -k 'bob:there;fred:here'"
	);
like( $res->output, '/bob:there\r\nfred:here\r\n/', "Got headers, delimited with ';'" );

$res = NPTest->testCmd(
	"./check_http $host_tcp_http -wt 300 -ct 600 -v -v -v -k 'bob:there;fred:here' -k 'carl:frown'"
	);
like( $res->output, '/bob:there\r\nfred:here\r\ncarl:frown\r\n/', "Got headers with multiple -k options" );

$res = NPTest->testCmd(
	"./check_http $host_nonresponsive -wt 1 -ct 2"
	);
cmp_ok( $res->return_code, '==', 2, "Webserver $host_nonresponsive not responding" );
cmp_ok( $res->output, 'eq', "CRITICAL - Socket timeout after 10 seconds", "Output OK");

$res = NPTest->testCmd(
	"./check_http $hostname_invalid -wt 1 -ct 2"
	);
cmp_ok( $res->return_code, '==', 2, "Webserver $hostname_invalid not valid" );
# The first part of the message comes from the OS catalogue, so cannot check this.
# On Debian, it is Name or service not known, on Darwin, it is No address associated with nodename
# Is also possible to get a socket timeout if DNS is not responding fast enough
like( $res->output, "/Unable to open TCP socket|Socket timeout after/", "Output OK");

$res = NPTest->testCmd(
	"./check_http --ssl www.verisign.com"
	);
cmp_ok( $res->return_code, '==', 0, "Can read https for www.verisign.com" );

$res = NPTest->testCmd( "./check_http -C 1 --ssl www.verisign.com" );
cmp_ok( $res->return_code, '==', 0, "Checking certificate for www.verisign.com");
like  ( $res->output, '/Certificate will expire on/', "Output OK" );
my $saved_cert_output = $res->output;

$res = NPTest->testCmd( "./check_http -C 1 www.verisign.com" );
cmp_ok( $res->output, 'eq', $saved_cert_output, "--ssl option automatically added");

$res = NPTest->testCmd( "./check_http www.verisign.com -C 1" );
cmp_ok( $res->output, 'eq', $saved_cert_output, "Old syntax for cert checking still works");

$res = NPTest->testCmd(
	"./check_http --ssl www.e-paycobalt.com"
	);
cmp_ok( $res->return_code, "==", 0, "Can read https for www.e-paycobalt.com (uses AES certificate)" );

$res = NPTest->testCmd( "./check_http -H altinity.com -r 'nagios'" );
cmp_ok( $res->return_code, "==", 0, "Got a reference to 'nagios'");

$res = NPTest->testCmd( "./check_http -H altinity.com -r 'nAGiOs'" );
cmp_ok( $res->return_code, "==", 2, "Not got 'nAGiOs'");
like ( $res->output, "/pattern not found/", "Error message says 'pattern not found'");

$res = NPTest->testCmd( "./check_http -H altinity.com -R 'nAGiOs'" );
cmp_ok( $res->return_code, "==", 0, "But case insensitive doesn't mind 'nAGiOs'");

$res = NPTest->testCmd( "./check_http -H altinity.com -r 'nagios' --invert-regex" );
cmp_ok( $res->return_code, "==", 2, "Invert results work when found");
like ( $res->output, "/pattern found/", "Error message says 'pattern found'");

$res = NPTest->testCmd( "./check_http -H altinity.com -r 'nAGiOs' --invert-regex" );
cmp_ok( $res->return_code, "==", 0, "And also when not found");

$res = NPTest->testCmd( "./check_http -H www.worldfirefoxday.com -f follow" );
is( $res->return_code, 0, "Redirection based on location is okay");

