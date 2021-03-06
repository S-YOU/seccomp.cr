module Constants
  SCMP_ACT_KILL  = 0x00000000
  SCMP_ACT_TRAP  = 0x00030000
  SCMP_ACT_ERRNO = 0x00050001 # ERRNO + EPERM
  SCMP_ACT_TRACE = 0x7ff00001 # TRACE + EPERM
  SCMP_ACT_ALLOW = 0x7fff0000

  STDIN_FILENO  = 0
  STDOUT_FILENO = 1
  STDERR_FILENO = 2

  NULL = nil
end
