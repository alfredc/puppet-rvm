define rvm::gem::install($gemname = $name, $ruby, $gemset = 'global') {

  include rvm::params
  $gem_bin = "${rvm::params::root}/rubies/ruby-${ruby}/bin"

  $ruby_with_gemset = $gemset ? {
    false => "ruby-${ruby}",
    default => "ruby-${ruby}@${gemset}",
  }

  exec { "${name}":
    command => "${rvm::params::bin}/rvm use ${ruby_with_gemset} && ${gem_bin}/gem install ${gemname}",
    unless => "ls ${rvm::params::root}/gems/${ruby_with_gemset}/gems/ | grep '${gemname}-'",
    require => Exec["rvm install ruby-${ruby}"],
  }

}