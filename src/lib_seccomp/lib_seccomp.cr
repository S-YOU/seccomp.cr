lib LibSeccomp
  alias ScmpDatumT = UInt64
  alias ScmpFilterCtx = Void*
  enum ScmpCompare
    X_ScmpCmpMin    = 0
    ScmpCmpNe       = 1
    ScmpCmpLt       = 2
    ScmpCmpLe       = 3
    ScmpCmpEq       = 4
    ScmpCmpGe       = 5
    ScmpCmpGt       = 6
    ScmpCmpMaskedEq = 7
    X_ScmpCmpMax    = 8
  end
  enum ScmpFilterAttr
    X_ScmpFltatrMin      = 0
    ScmpFltatrActDefault = 1
    ScmpFltatrActBadarch = 2
    ScmpFltatrCtlNnp     = 3
    ScmpFltatrCtlTsync   = 4
    ScmpFltatrApiTskip   = 5
    X_ScmpFltatrMax      = 6
  end
  fun seccomp_arch_add(ctx : ScmpFilterCtx, arch_token : UInt32) : Int32
  fun seccomp_arch_exist(ctx : ScmpFilterCtx, arch_token : UInt32) : Int32
  fun seccomp_arch_native : UInt32
  fun seccomp_arch_remove(ctx : ScmpFilterCtx, arch_token : UInt32) : Int32
  fun seccomp_arch_resolve_name(arch_name : UInt8*) : UInt32
  fun seccomp_attr_get(ctx : ScmpFilterCtx, attr : ScmpFilterAttr, value : UInt32*) : Int32
  fun seccomp_attr_set(ctx : ScmpFilterCtx, attr : ScmpFilterAttr, value : UInt32) : Int32
  fun seccomp_export_bpf(ctx : ScmpFilterCtx, fd : Int32) : Int32
  fun seccomp_export_pfc(ctx : ScmpFilterCtx, fd : Int32) : Int32
  fun seccomp_init(def_action : UInt32) : ScmpFilterCtx
  fun seccomp_load(ctx : ScmpFilterCtx) : Int32
  fun seccomp_merge(ctx_dst : ScmpFilterCtx, ctx_src : ScmpFilterCtx) : Int32
  fun seccomp_release(ctx : ScmpFilterCtx)
  fun seccomp_reset(ctx : ScmpFilterCtx, def_action : UInt32) : Int32
  fun seccomp_rule_add(ctx : ScmpFilterCtx, action : UInt32, syscall : Int32, arg_cnt : UInt32, ...) : Int32
  fun seccomp_rule_add_array(ctx : ScmpFilterCtx, action : UInt32, syscall : Int32, arg_cnt : UInt32, arg_array : ScmpArgCmp*) : Int32
  fun seccomp_rule_add_exact(ctx : ScmpFilterCtx, action : UInt32, syscall : Int32, arg_cnt : UInt32, ...) : Int32
  fun seccomp_rule_add_exact_array(ctx : ScmpFilterCtx, action : UInt32, syscall : Int32, arg_cnt : UInt32, arg_array : ScmpArgCmp*) : Int32
  fun seccomp_syscall_priority(ctx : ScmpFilterCtx, syscall : Int32, priority : UInt8) : Int32
  fun seccomp_syscall_resolve_name(name : UInt8*) : Int32
  fun seccomp_syscall_resolve_name_arch(arch_token : UInt32, name : UInt8*) : Int32
  fun seccomp_syscall_resolve_name_rewrite(arch_token : UInt32, name : UInt8*) : Int32
  fun seccomp_syscall_resolve_num_arch(arch_token : UInt32, num : Int32) : UInt8*
  fun seccomp_version : ScmpVersion*

  struct ScmpArgCmp
    arg : UInt32
    op : ScmpCompare
    datum_a : ScmpDatumT
    datum_b : ScmpDatumT
  end

  struct ScmpVersion
    major : UInt32
    minor : UInt32
    micro : UInt32
  end
end
