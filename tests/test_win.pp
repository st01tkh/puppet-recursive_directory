if ($operatingsystem == 'windows') {
  file {'c:/temp':
      ensure => directory,
  }
  recursive_directory {'c:\Windows\temp\dir0\dir1\dir2':
    win_mode => yes
  }
} else {
}
