class rvm::system {

  include rvm::dependencies

#  if $rvm_installed != 'true' {  # only run if not installed yet
    exec { 'system-rvm':
      path    => '/usr/bin:/usr/sbin:/bin',
      command => 'bash -c \'bash <(/usr/bin/curl -s https://rvm.beginrescueend.com/install/rvm)\'',
      creates => '/usr/local/rvm/bin/rvm',
      require => [
        Class['rvm::dependencies'],
      ],
    }
#  }

}
