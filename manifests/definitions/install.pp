define rvm::install($ruby = $name, $default_ruby = false) {

  include rvm::params

  exec { "rvm install ruby-${ruby}":
    path => $rvm::params::bin,
    creates => "/usr/local/rvm/rubies/ruby-${ruby}",
    require => Rvm::System::Exec['system-rvm'],
  }

  if $default_ruby {
    exec { "rvm --default use ruby-${ruby}":
      path => $rvm::params::bin,
      unless => "rvm list default | grep 'ruby-${ruby}'",
      require => Exec["rvm install ruby-${ruby}"],
    }
  }

}