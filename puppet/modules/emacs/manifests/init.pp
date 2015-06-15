class emacs {
  include apt

  Exec['add-repo'] -> Exec['apt_update'] -> Package['emacs24']

  exec { 'add-repo':
    command => '/usr/bin/add-apt-repository ppa:cassou/emacs'
  }

  # remove default emacs
  package {'emacs':
    ensure => 'absent',
  }

  # install the latest emacs24
  package {'emacs24':
    ensure   => 'latest',
    require  => Package['emacs'],
  }
}

