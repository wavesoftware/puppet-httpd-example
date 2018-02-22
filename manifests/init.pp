# httpd
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include httpd
class httpd (
  $listen = '80'
) {
  include httpd::params

  package { $httpd::params::pkg:
    ensure => installed,
  }
  augeas { 'httpd-conf':
    context => "/files${httpd::params::conffile}",
    require => Package[$httpd::params::pkg],
    changes => [
      "set directive[self::directive='Listen'] Listen",
      "set directive[self::directive='Listen']/arg ${listen}",
    ],
  }
  service { $httpd::params::servicename:
    ensure    => running,
    subscribe => Augeas['httpd-conf'],
  }
}
