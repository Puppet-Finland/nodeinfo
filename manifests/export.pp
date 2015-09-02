#
# == Class: nodeinfo::export
#
# Export this node's information for nodes that include nodeinfo::collector.
#
# Note that this class generates the column data based on the
# $::nodeinfo::variables parameter.
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
    include ::nodeinfo

    $variables = $::nodeinfo::variables

    @@concat::fragment { "nodeinfo-fragment-${::fqdn}":
        ensure  => $ensure,
        target  => 'nodeinfo-nodes.html',
        content => template('nodeinfo/fragment.erb'),
        tag     => 'nodeinfo-export-fragment',
    }
}
