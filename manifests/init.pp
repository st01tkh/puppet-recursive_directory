# == Class: recursive_directory
#
# Resouce to create recursive directories
#
# === Parameters
#
# === Variables
#
# === Examples
#
# === Authors
#
# st01tkh <st01tkh@gmail.com>
#
# === Copyright
#
# Copyright 2016 st01tkh
#

define recursive_directory::create_file_resource(
    $dest_path  = undef,
    $mode       = undef,
    $owner      = undef,
    $group      = undef,
) {
    if ($dest_path) {
        $path = $dest_path
    } else {
        $path = $title
    }
    if ($path) {
        if (!defined(File["$path"])) {
            file {"$path":
                ensure => 'directory',
                mode => $mode,
                owner => $owner,
                group => $group,
            }
        } else {
            notice("resource File[$path] is already defined, skipping")
        }
    } else {
        fail("path is required")
    }
}

define recursive_directory (
    $dest_path  = undef,
    $mode       = undef,
    $owner      = undef,
    $group      = undef,
    $win_mode   = undef,
){
    if ($dest_path) {
        $path = $dest_path
    } else {
        $path = $title
    }
    $data = decompose_path(
        $path,
        $mode,
        $owner,
        $group,
        $win_mode
    )
    notice("data: $data")
    recursive_directory::create_file_resource{ $data['paths_array'] : 
        mode => $mode,
        owner => $owner,
        group => $group
    }
}
