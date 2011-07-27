define rvm::gem::install($gemname = $name, $ruby, $gemset = 'global') {

  include rvm::params
  $gem_bin = "${rvm::params::root}/rubies/ruby-${ruby}/bin"

  $ruby_with_gemset = $gemset ? {
    false => "ruby-${ruby}",
    default => "ruby-${ruby}@${gemset}",
  }

  exec { "${name}":
    command => "/bin/bash -c '${rvm::params::load} && rvm use ${ruby_with_gemset} && gem install ${gemname} --no-ri --no-rdoc'",
    unless => "ls ${rvm::params::root}/gems/${ruby_with_gemset}/gems/ | grep '${gemname}-'",
    require => Exec["rvm install ruby-${ruby}"],
  }

}