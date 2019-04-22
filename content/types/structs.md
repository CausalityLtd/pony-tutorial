---
title: "Structs"
section: "Types"
menu:
  toc:
    parent: "types"
    weight: 55
toc: true
---

A `struct` is similiar to a `class`. There's a couple very important differences. You'll use classes throughout your Pony code. You'll rarely use structs. We'll discuss structs in more depth in the [C-FFI chapter](/c-ffi.html) of the tutorial. In the meantime, here's a short introduction to the basics of structs.

## Structs are "classes for FFI"

A `struct` is a class like mechanism used to pass data back and forth with C code via Pony's Foreign Function Interface.

Like classes, Pony structs can contain both fields and methods. Unlike classes, Pony structs have the same binary layout as C structs and can be transparently used in C functions.  Structs do not have a type descriptor, which means they cannot be used in algebraic types or implement traits/interfaces.


## What goes in a struct?

The same as a class! A struct is composed of some combination of:

1. Fields
2. Constructors
3. Functions

### Fields

Pony struct fields are defined in the same way as they are for Pony classes, using `embed`, `let`, and `var`.  An embed field is embedded in its parent object, like a C struct inside C struct. A var/let field is a pointer to an object allocated separately.

For example:

```pony
struct Inner
  var x: I32 = 0

struct Outer
  embed inner_embed: Inner = Inner
  var inner_var: Inner = Inner

```

### Constructors

Struct constructors, like class constructors, have names. Everything you previously learned about Pony class constructors applies to struct constructors.

```pony
struct Pointer[A]
  """
  A Pointer[A] is a raw memory pointer. It has no descriptor and thus can't be
  included in a union or intersection, or be a subtype of any interface. Most
  functions on a Pointer[A] are private to maintain memory safety.
  """
  new create() =>
    """
    A null pointer.
    """
    compile_intrinsic

  new _alloc(len: USize) =>
    """
    Space for len instances of A.
    """
    compile_intrinsic
```

Here we have two constructors. One that creates a new null Pointer, and another creates a Pointer with space for many instances of the type the Pointer is pointing at. Don't worry if you don't follow everything you are seeing in the above example. The important part is, it should basically look like the class constructor example [we saw earlier](/types/classes.html#what-goes-in-a-class).

### Functions

Like Pony classes, Pony structs can also have functions. Everything you know about functions on Pony classes applies to structs as well.

## We'll see structs again

Structs play an important role in Pony's interactions with code written using C. We'll see them again in [C-FFI section](/c-ffi.html) of the tutorial. We probably won't see too much about structs until then.
