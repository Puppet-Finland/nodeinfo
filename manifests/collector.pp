#
# == Class: nodeinfo::collector
#
# This class collects the HTML fragments from the other nodes and publishes them 
# as a webpage.
#
# Note that this class generates the column data based on the 
# $::nodeinfo::variable_names parameter.
#
# == Parameters
#
# [*basedir*]
#   The base directory where the inventory page will be placed. The directory 
#   will be created if it does not exist, and the actual HTML file will be 
#   placed into it as index.html. Defaults to '/var/www/nodeinfo'.
#
class nodeinfo::collector
(
    $basedir = '/var/www/nodeinfo'
)
{
    include ::os::params
    include ::nodeinfo

    $variable_names = $::nodeinfo::variable_names

    file { 'nodeinfo-basedir':
        ensure => directory,
        name   => $basedir,
        owner  => $::os::params::adminuser,
        group  => $::os::params::admingroup,
        mode   => '0755',
    }

    concat { 'nodeinfo-nodes.html':
        ensure         => present,
        path           => "${basedir}/index.html",
        owner          => $::os::params::adminuser,
        group          => $::os::params::admingroup,
        mode           => 644,
        warn           => true,
        order          => alpha,
        ensure_newline => true,
    }

    concat::fragment { 'nodeinfo-header':
        target  => 'nodeinfo-nodes.html',
        content => template('nodeinfo/header.erb'),
        order   => '01',
        # We need the list of variables from the main class
        require => Class['nodeinfo']
    }

    concat::fragment { 'nodeinfo-footer':
        target  => 'nodeinfo-nodes.html',
        content => template('nodeinfo/footer.erb'),
        order   => '99',
    }

    Concat::Fragment <<| tag == 'nodeinfo-export-fragment' |>>

    # Style sheet
    file { 'nodeinfo-nodeinfo.css':
        ensure  => present,
        name    => "${basedir}/nodeinfo.css",
        content => template('nodeinfo/nodeinfo.css.erb'),
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        mode    => '0644',
    }

}
