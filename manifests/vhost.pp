# httpd::vhost
#
# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   httpd::vhost { 'namevar': }
define httpd::vhost(
  $documentroot,
  $servername        = $name,
  $listenport        = '80',
  $custom_directives = '',
) {
  include httpd
  include httpd::params

  $config = {
    'documentroot'      => $documentroot,
    'servername'        => $servername,
    'listenport'        => $listenport,
    'custom_directives' => $custom_directives,
  }
  $vhost_file = "${httpd::params::vhostdir}/vhost-${servername}.conf"

  file { $vhost_file:
    ensure  => file,
    mode    => '0644',
    content => epp('httpd/vhost.epp', $config),
    notify  => Service[$httpd::params::servicename],
  }
}
