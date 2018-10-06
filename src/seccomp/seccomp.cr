require "../lib_seccomp"
require "./constants"

@[Link(ldflags: "-lseccomp")]
lib LibSeccomp
  struct UtilOptions
    bpf_flg : Int32
  end
end

class Seccomp
  include Constants
  alias ScmpFilterCtx = LibSeccomp::ScmpFilterCtx

  macro method_missing(call)
    LibSeccomp.{{call}}
  end
end
