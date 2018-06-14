Debian Buster Perl 5
====================

Ancient Perl 5 with App::cpanminus built on Debian Buster.

Available Perl versions are:

+ 5.10.1
+ more if in need

USAGE
-----

To use Perl 5.10.1, do:

```
% docker pull yowcow/debian-buster-perl5:5.10.1
% docker run --rm yowcow/debian-buster-perl5:5.10.1 perl -V
```

HOW TO BUILD
------------

```
% make && make build
```
