# == Class
#
# fail2ban
#
# == Synopsis
#
# This is the main OpenLDAP class for managing fail2ban with Puppet
#
# == Author
#
# John McCarthy <midactsmystery@gmail.com>
#
# - http://www.midactstech.blogspot.com -
# - https://www.github.com/Midacts -
#
# == Date
#
# 17th of July, 2014
#
# -- Version 1.0 --
#
class fail2ban {

  package { 'fail2ban':
    ensure	=> latest,
  }

  file { '/etc/fail2ban/jail.local':
    ensure	=> present,
    content	=> template('fail2ban/jail.local.erb'),
    mode	=> 640,
    owner	=> root,
    group	=> root,
    require	=> Package['fail2ban'],
  }

  service { 'fail2ban':
    ensure	=> true,
    enable	=> true,
    subscribe	=> File['/etc/fail2ban/jail.local'],
  }

}
