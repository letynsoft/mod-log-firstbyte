mod-log-firstbyte
=======

An updated clone of https://code.google.com/archive/p/mod-log-firstbyte

This version adds the format parameter to the %F, supports the same as %T (s - seconds, ms - miliseconds, us - microseconds), the default is microseconds

The module adds a new option to your log format string: '%F'. This is the request-to-first-byte time, in microseconds. Edit your configuration files to include a new LogFormat directive.

## Compile and install the module using apxs2, e.g.

`apxs2 -c mod_log_firstbyte.c`
`apxs2 -i -a mod_log_firstbyte.la`

This will add a line to your configuration file to load the module:

`LoadModule log_firstbyte_module /path/to/mod_log_firstbyte.so`

## Usage

Just add the %F into the LogFormat directive you happen to use on your apache2 server (be default vhost_combined or combined). Or you can create a new LogFormat and change the CustomLog directive as per below:

`LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %D %F" combined-with-firstbyte`

Or using the format:
`LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %D %{ms}F" combined-with-firstbyte`

Finally, change the CustomLog directive:

`CustomLog /var/log/apache2/access.log combined-with-firstbyte`
