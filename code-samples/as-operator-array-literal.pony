actor Main
  fun foo(xs: (Array[U32] ref | Array[U64] ref)): Bool =>
    // do something boring here
    true

  new create(env: Env) =>
    foo([as U32: 1; 2; 3])
    // Try changing it to
    //   foo([1; 2; 3])
    // the compiler would complain about this: