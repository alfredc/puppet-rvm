# Package dependencies must be installed outside of this module.

class rvm::system {

  include rvm::params

  exec { 'system-rvm':
    path    => '/usr/bin:/usr/sbin:/bin',
    command => 'curl -o /tmp/rvm_install.sh https://rvm.beginrescueend.com/install/rvm && bash /tmp/rvm_install.sh && rm /tmp/rvm_install.sh',
    creates => "${rvm::params::bin}/rvm",
    require => $rvm::params::dependencies,
  }

  exec { 'source rvm':
    command => "source '${rvm::params::root}/scripts/rvm'",
    require => Exec['system-rvm'],
  }

}
