class rvm::params {
  $root = "/usr/local/rvm"
  $bin = "${root}/bin/rvm"

  $dependencies = $operatingsystem ? {
    'debian' => [
      Package['build-essential'],
      Package['bison'],
      Package['openssl'],
      Package['libreadline6'],
      Package['libreadline6-dev'],
      Package['curl'],
      Package['git-core'],
      Package['zlib1g'],
      Package['zlib1g-dev'],
      Package['libssl-dev'],
      Package['libyaml-dev'],
      Package['libsqlite3-0'],
      Package['libsqlite3-dev'],
      Package['sqlite3'],
      Package['libxml2-dev'],
      Package['libxslt1-dev'],
      Package['autoconf'],
      Package['libc6-dev']
    ],

    'centos' => [
      Package['which'],
      Package['gcc'],
      Package['gcc-c++'],
      Package['make'],
      Package['gettext-devel'],
      Package['expat-devel'],
      Package['curl-devel'],
      Package['zlib-devel'],
      Package['openssl-devel'],
      Package['perl'],
      Package['cpio'],
      Package['expat-devel'],
      Package['gettext-devel'],
      Package['wget'],
      Package['bzip2'],
      Package['sendmail'],
      Package['mailx'],
      Package['libxml2'],
      Package['libxml2-devel'],
      Package['libxslt'],
      Package['libxslt-devel'],
      Package['readline-devel']
      Package['patch'],
      Package['git']
    ],
  }

}