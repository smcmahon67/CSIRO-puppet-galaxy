# == Class: galaxy::first_run
#
# On first run, galaxy grabs a large number of eggs and sets up configuration files from templates. We do that manually here
#
# === Examples
#
#  galaxy::first_run{'development': }
#
# === Authors
#
# M. Loaec <mloaec@versailles.inra.fr>
# O. Inizan <oinizan@versailles.inra.fr>
# Eric Rasche <rasche.eric@yandex.ru>
#
# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
define galaxy::first_run(
  $directory = $galaxy::params::directory
){
  exec { "galaxy-${name}-eggs-and-universeconf":
     path => '/usr/bin:/usr/sbin:/bin:/sbin',
     cwd  => $directory,
     user => 'galaxy',
     # Run the 'stop' command so the server runs the conf file generating stuff once
     command => "bash run.sh --daemon;bash run.sh --stop-daemon",
     creates => "$directory/universe_wsgi.ini",
  }
#  class{ 'galaxy::upgrade-database':
#  }
}
