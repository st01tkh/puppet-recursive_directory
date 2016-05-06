if ($operatingsystem == 'windows') {
  file {'c:/temp':
      ensure => directory,
  }
  recursive_directory {"c:/temp/dir0/dir1/dir2":
  }
} else {
}
