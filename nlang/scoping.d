/**** Provides scoping rules.
  * 
  * Scopes are heirarchies, with each scope having a single
    parent but parents having multiple children scopes.
  * Each scope provides all the declarations available to
    its parent scope, along with a new addendum of
    declarations (not specifically variables).
  * Note that children scopes are not actually directly
    stored by the parent scope; Each scope is linked to
    a specific symbol which provides children scopes in
    different ways. However, all scopes know their parents.
  * A 'null' parent indicates that the scope is the root
    scope, from which everything else is derived. This may
    even by higher than module-level scopes, in the case of
    package modules.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module nlang.scoping;

import nlang.statement;
public import nlang.scoped;

/// Provides scoping.
class Scope {
  /// Upper scope.
  Scope parent;
  /// Local declarations.
  Declaration[] decls;
  /// Matching holder.
  Scoped holder;

  @safe nothrow pure:

  /// Full constructor.
  this(Scope parent, Scoped holder, Declaration[] decls) {
    this.parent = parent;
    this.holder = holder;
    this.decls = decls;
  }

  /// Finds and returns a declaration by identifier.
  /// Returns 'null' if it was not found.
  Declaration find(string ident) {
    for (auto sc = this; sc !is null; sc = sc.parent)
      foreach (ref decl; sc.decls)
        if (decl.ident == ident)
          return decl;
    return null;
  }

  /// Finds and returns a given holder type, if found.
  /// Otherwise returns null.
  T find(T)()
      if (is(T == class) && is(T : Scoped)) {
    for (auto sc = this; sc !is null; sc = sc.parent)
      if (T obj = cast(T)sc.holder)
        return obj;
    return null;
  }
}