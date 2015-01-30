#
# == Class: nodeinfo
#
# This class is only used to set the administrator name for the node. This is
# used as one "fact" on the inventory page.
#
# == Parameters
#
# [*admin*]
#   Administrator name. Defaults to top-scope variable $::serveradmin
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
    $admin = $::serveradmin
)
{
    # Nothing here yet
}
