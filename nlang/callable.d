/**** Provides function declarations.
  * 
  * Functions consist of an identifier, a type,
    and a series of statements which make up the
    function body.
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
class Function: Declaration {
  private { // Variables
    /// Return type.
    Type ret;
    /// Block of statements.
    /// It contains the scope that we store parameters in.
    Block block;
  }

  @safe nothrow pure:

  /// Full constructor, splits up the block input.
  this(VR)(VR args, Type ret, Statement[] statements, Scope upper)
      if (isInputRange!VR && is(ElementType!VR : Variable)) {
    this.ret = ret;
    this.block = new Block(new Scope(upper,
      args.map!(v => cast(Declaration)v).array), statements);
  }
}