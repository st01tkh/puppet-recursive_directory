# recursive_directory

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with recursive_directory](#setup)
    * [What recursive_directory affects](#what-recursive_directory-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with recursive_directory](#beginning-with-recursive_directory)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Puppet module to create recursive directory resource

## Module Description

Image you need to create recursive directory.
To do it with standard puppet's file resource you have to create individual file resources
and link them in ordered sequence.
This module allow to make it by single resource
It will create file resources that previously were not defined

## Setup

### What recursive_directory affects

* Contains decompose_path function

### Setup Requirements **OPTIONAL**

### Beginning with recursive_directory

## Usage

recursive_directory {"/tmp/dir0/dir1/dir2":
    mode => '0700',
    owner => 'nobody',
    group => 'nogroup' 
}

## Reference

## Limitations

## Development

## Release Notes/Contributors/Etc **Optional**
