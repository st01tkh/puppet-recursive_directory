if ($operatingsystem == 'windows') {
  $array = ['c:/temp', 'c:/temp/dir0', 'c:/temp/dir0/dir1']
  file {'c:/temp':
      ensure => directory,
  }
  recursive_directory {"c:/temp/dir0/dir1/dir2":
  }
} else {
}
