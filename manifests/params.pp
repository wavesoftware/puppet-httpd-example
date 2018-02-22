# == Class: httpd::params
#
class httpd::params {
  $pkg = $::osfamily ? {
    'Debian' => 'apache2',
    'RedHat' => 'httpd',
    default  => fail("Unsupported OS family: ${::osfamily}"),
  }
  $servicename = $pkg
  $conffile = $::osfamily ? {
    'Debian' => '/etc/apache2/apache2.conf',
    'RedHat' => '/etc/httpd/conf/httpd.conf',
    default  => fail("Unsupported OS family: ${::osfamily}"),
  }
  $vhostdir = $::osfamily ? {
    'Debian' => '/etc/apache2/sites-enabled',
    'RedHat' => '/etc/httpd/conf.d',
    default  => fail("Unsupported OS family: ${::osfamily}"),
  }
}
