# nodeinfo

A simple Puppet module that maintains an inventory page of Puppet-managed nodes. 
This module makes use of an external script, 
[sorttable.js](http://kryogenix.org/code/browser/sorttable), to enable table 
sorting.

The Puppet code and ERB templates in this module are licensed under the BSD 
license (see file LICENSE). The sorttable.js script is licensed under the MIT 
license (see file LICENSE.MIT).

# Module usage

* [Class: nodeinfo](manifests/init.pp)
* [Class: nodeinfo::collector](manifests/collector.pp)
* [Class: nodeinfo::export](manifests/export.pp)

# Dependencies

See [metadata.json](metadata.json).

# Operating system support

This module has been tested on

* Debian 7
* Ubuntu 12.04
* Ubuntu 14.04
