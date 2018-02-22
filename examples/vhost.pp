httpd::vhost { 'blog.example.io':
  documentroot => '/var/www/blog',
}
httpd::vhost { 'bitcoin.org':
  documentroot      => '/var/www/bitcoin',
  custom_directives => '# Bitcoin <3 <3 !!!'
}
