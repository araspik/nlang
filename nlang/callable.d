/**** Provides function declarations.
  * 
  * Functions consist of an identifier, a type, and a
    series of statements which make up the function body.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module nlang.callable;

import nlang.statement;
import nlang.type;
import nlang.scoping;
import nlang.variable;

import std.range;
import std.algorithm;
import std.array;

/// Function declarations.
class Function: Declaration, Scoped {
  /// Return type.
  Type ret;
  /// Block of statements.
  /// It contains the scope that we store parameters in.
  Block block;

  @safe nothrow pure:

  /// Full constructor, splits up the block input.
  this(VR)(Scope context, VR args, Type ret,
      Statement[] statements)
      if (is(ElementType!VR : Variable)) {

    super(context);
    this.ret = ret;

    // Note how the scope is given a pointer to this
    // function. In this way, the function passes over
    // the Block class and becomes what the Scope refers
    // to.
    this.block = new Block(
      new Scope(
        context,
        this,
        args.map!(v => cast(Declaration)v).array
      ),
      statements);
  }

  /// Returns the matching scope.
  @property const(Scope) innerScope() const {
    return block.innerScope;
  }

  /// Returns whether the function is resolvable.
  bool resolvable() const {
    return block.resolvable;
  }
}