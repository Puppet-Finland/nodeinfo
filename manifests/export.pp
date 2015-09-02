#
# == Class: nodeinfo::export
#
# Export this node's information for nodes that include nodeinfo::collector.
#
# == Parameters
#
# [*ensure*]
#   Status of the exported resource. Valid values 'present' (default) and 
#   'absent'.
#
class nodeinfo::export
(
    $ensure='present'
)
{
    include ::os::params

    # These local "facts" get set to the real fact value or nil, so that the ERB 
    # templating engine does not choke when a fact is missing.
    $l_updates = $::updates
    $l_security_updates = $::security_updates
    $l_reboot_required = $::reboot_required

    # This top-scope variable needs to be defined in Hiera
    $admin = $::admin ? {
        undef   => 'unknown',
        default => $::admin,
    }

    @@concat::fragment { "nodeinfo-fragment-${::fqdn}":
        ensure  => $ensure,
        target  => 'nodeinfo-nodes.html',
        content => template('nodeinfo/fragment.erb'),
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        mode    => 644,
        tag     => 'nodeinfo-export-fragment',
    }
}
