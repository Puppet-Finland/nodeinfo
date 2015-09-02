#
# == Class: nodeinfo
#
# This class is only used to set the administrator name for the node. This is
# used as one "fact" on the inventory page.
#
# == Parameters
#
# [*variables*]
#   An array of hashes with variable name/title pairs. The hashes are wrapped 
#   into a array solely to ensure correct ordering; while some Ruby versions 
#   iterate over hashes in the order the entries were defined, that behavior 
#   cannot be depended on.
#   
#   The key of each hash refer to a top-scope variable whose value we want to 
#   display. The value of the key is the title of key on the nodeinfo page. To 
#   get the idea look at the Usage section and the provided default value.
#
# [*admin*]
#   Administrator name/email/whatever. Defaults to top-scope variable 
#   $::serveradmin.
#
# == Usage
#
# A usage example using Hiera. First setup common.yaml or similar:
#
#   classes:
#       # This class exports a HTML fragment with the node's information
#       - nodeinfo::export
#   
#   # These apply to both exporting and collecting nodes
#   nodeinfo::variables:
#       - fqdn: 'FQDN'
#       - architecture: 'Arch'
#       - operatingsystem: 'OS'
#       - processorcount: 'CPUs'
#       - memorysize: 'Mem'
#       - is_virtual: 'Virt?'
#       - timezone: 'TZ'
#       - ec2_placement_availability_zone: 'EC2_AZ'
#       - ec2_ami_id: 'EC2_AMI_ID'
#       - ec2_instance_type: 'EC2_type'
#       - ec2_public_ipv4: 'EC2_PUBLIC_IP'
#       - ec2_local_ipv4: 'EC2_LOCAL_IP'
#       - updates: 'Upd.'
#       - security_updates: 'S.Upd.'
#       - reboot_required: 'Reboot?'
#       - admin: 'Admin'
#       - uptime: 'Up'
#
# Then add this to the collecting node(s), which need a webserver obviously:
#
#   classes:
#       - nodeinfo::collector
#   
#   nodeinfo::collector::basedir: '/var/www/nodeinfo'
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
    $admin = $::serveradmin,
    $variables = [  { 'fqdn'           => 'FQDN' },
                    { 'architecture'   => 'Arch' },
                    { 'processorcount' => 'CPUs' },
                    { 'memorysize'     => 'Mem'  },
                    { 'timezone'       => 'TZ'   },
                    { 'uptime'         => 'Up'   } ]
                        
)
{
    # Nothing here yet
}
