# Class: windows_disable_ipv6
#
#  This class is used to enable/disable IPv6 on Windows platforms
# 
# == Parameters: 
#
#  $ipv6_disable: Whether IPv6 is enabled. Defaults to false or enabled.
#  Valid values: true and false
#
#
# == Requires:
#  puppetlabs/registry
#  puppetlabs/stdlib
#  puppetlabs/reboot
#
# == Sample Usage:
#
#  class {'windows_disable_ipv6':
#   ipv6_disable => true,
#   }
#

class windows_disable_ipv6 (
  # ipv6 enabled by default
  $ipv6_disable = false,
) {

# Validate ipv6 class 
validate_bool($ipv6_disable)

# IPv6 logic (IPv6 enabled = 0, IPv6 disabled = 1)
if $ipv6_disable {
  $ipv6_setting = '0xFFFFFFFF'
}else{
  $ipv6_setting = '0x0'
}

registry::value { 'ipv6':
  key   => 'HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters',
  value => 'DisabledComponents',
  type  => 'dword',
  data  => $ipv6_setting,
}

reboot { 'after':
  subscribe => Class['ipv6'],
}

}