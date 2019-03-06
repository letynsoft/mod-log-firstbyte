mod-log-firstbyte (Apache2 module)
=======

This module lets you log the **time spent processing the request** excluding the time required for receiving and sending data.

The module adds a new option to your log format string: '`%F`'.

This is an updated clone of https://code.google.com/archive/p/mod-log-firstbyte.

This version adds the format parameter to the `%F` (`%{s}F` - seconds, `%{ms}F` - miliseconds, `%{us}F` - microseconds), the default is in seconds.

## Warning

The default format was changed from microseconds to seconds, to follow the format default for %T (http://httpd.apache.org/docs/current/mod/mod_log_config.html).

## Compile and install the module using apxs2

    apxs2 -c mod_log_firstbyte.c
    apxs2 -i -a mod_log_firstbyte.la

This will add a line to your configuration file to load the module:

`LoadModule log_firstbyte_module /path/to/mod_log_firstbyte.so`

## Usage (Simple)

Just add the `%F` into the LogFormat directive you happen to use on your apache2 server (by default vhost_combined or combined).

## Usage (Custom)

Create a new LogFormat and change the CustomLog directive as per below:

`LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %D %F" combined-with-firstbyte`

Or using the format:

`LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %D %{ms}F" combined-with-firstbyte`

Finally, change the CustomLog directive:

`CustomLog /var/log/apache2/access.log combined-with-firstbyte`

## Caveats (TODOs)

The module doesn't handle requests which send `Expect: 100-continue` header, it tracks the time taken to respond with `HTTP/1.1 100 Continue` header
