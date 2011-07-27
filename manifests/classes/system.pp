class rvm::system {

  include rvm::params
  include rvm::dependencies

  exec { 'system-rvm':
    path    => '/usr/bin:/usr/sbin:/bin',
    command => 'bash -c \'bash <(/usr/bin/curl -s https://rvm.beginrescueend.com/install/rvm)\'',
    creates => $rvm::params::bin,
    require => [
      Class['rvm::dependencies'],
    ],
  }

}
