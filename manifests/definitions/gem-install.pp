define rvm::gem::install($gemname = $name, $ruby, $gemset = 'global') {

  include rvm::params

  $ruby_with_gemset = $gemset ? {
    false => "ruby-${ruby}",
    default => "ruby-${ruby}@${gemset}",
  }

  exec { "${name}":
    path => "${rvm::params::bin}:${rvm::params::root}/rubies/ruby-${ruby}/bin",
    command => "rvm use ${ruby_with_gemset} && gem install ${gemname}",
    unless => "ls ${rvm::params::root}/gems/${ruby_with_gemset}/gems/ | grep '${gemname}-'",
    require => Rvm::Install[$ruby],
  }

}