#
# == Class: nodeinfo
#
# This class is only used to set the administrator name for the node. This is
# used as one "fact" on the inventory page.
#
# == Parameters
#
# [*variable_names*]
#   An array of variable _names_ to add to the nodeinfo page. A default value is 
#   provided, but it's intended primarily for testing this module:
#
#   ['fqdn', 'architecture', 'processorcount', 'memorysize', 'timezone']
#
#   The variables need to be top-scope, but can be obtained from any source, e.g.
#   facts, Hiera or site.pp.
# [*admin*]
#   Administrator name/email/whatever. Defaults to top-scope variable 
#   $::serveradmin.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class nodeinfo
(
    $variable_names = ['fqdn', 'architecture', 'processorcount', 'memorysize', 'timezone'],
    $admin = $::serveradmin
)
{
    # Nothing here yet
}
