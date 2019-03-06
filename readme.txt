Compile and install the module using apxs2, e.g.

apxs2 -c mod_log_firstbyte.c
apxs2 -i -a mod_log_firstbyte.la

This will add a line to your configuration file to load the module:

LoadModule log_firstbyte_module /path/to/mod_log_firstbyte.so

The module adds a new option to your log format string: '%F'. This is the request-to-first-byte time, in microseconds. Edit your configuration files to include a new LogFormat directive. I usually use:

LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %D %F" combined-with-firstbyte

Finally, change the CustomLog directive:

CustomLog /var/log/apache2/access.log combined-with-firstbyte
