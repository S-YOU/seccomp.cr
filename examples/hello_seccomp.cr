require "seccomp"

class SeccompClient < Seccomp
  def run : Int32
    ctx = uninitialized ScmpFilterCtx

    ctx = seccomp_init(SCMP_ACT_ALLOW)
    return -1 unless ctx

    ret = seccomp_export_pfc(ctx, STDOUT_FILENO)
    printf("seccomp_export_pfc result: %d\n", ret)

    seccomp_release(ctx)
    ret < 0 ? -ret : ret
  end
end

fun main(argc : Int32, argv : UInt8**) : Int32
  SeccompClient.new.run
end

