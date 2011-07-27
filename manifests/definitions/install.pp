define rvm::ruby::install($ruby = $name, $default_ruby = false) {

  include rvm::params

  exec { "rvm install ruby-${ruby}":
    command => "${rvm::params::bin}/rvm install ruby-${ruby}",
    creates => "/usr/local/rvm/rubies/ruby-${ruby}",
    require => Class['rvm::system'],
    timeout => 0,  # disable timeout for compiling ruby
  }

  if $default_ruby {
    exec { "rvm --default use ruby-${ruby}":
      command => "${rvm::params::bin}/rvm --default use ruby-${ruby}",
      unless => "rvm list default | grep 'ruby-${ruby}'",
      require => Exec["rvm install ruby-${ruby}"],
    }
  }

}