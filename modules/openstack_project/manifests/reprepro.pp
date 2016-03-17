# == Define: openstack_project::mirror_update
#
define openstack_project::reprepro (
  $confdir,
  $basedir,
  $distributions,
  $updates_file,
  $options_template = 'openstack_project/reprepro/options.erb',
  $releases = [],
) {
  file { "$confdir":
    ensure => directory,
  }

  file { "${confdir}/updates":
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => $updates_file,
  }

  file { "${confdir}/options":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template($options_template),
  }

  file { "${confdir}/distributions":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template($distributions),
  }
}
