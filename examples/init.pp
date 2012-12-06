class { 'logclean':
  logconfig => [
    '/var/log/something-*.log;30',
  ]
}
