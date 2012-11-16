#
class logclean {

  file { '/etc/cron.daily/logclean':
    ensure  => present,
    mode    => '0755',
    source  => 'puppet:///modules/logclean/logclean.cron',
    require => File['/usr/local/scripts/logclean'],
  }

  file { '/etc/logclean.conf':
    ensure => present,
    source => [
                "puppet:///modules/logclean/logclean.conf.${::hostname}",
                'puppet:///modules/logclean/logclean.conf',
              ]
  }

  file { '/usr/local/scripts/logclean':
    ensure  => present,
    mode    => '0755',
    source  => 'puppet:///modules/logclean/logclean.sh',
    require => File['/usr/local/scripts'],
  }

}
