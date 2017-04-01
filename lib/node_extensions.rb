# NOTE not used
module CsStructuredQuery
  class Operator < Treetop::Runtime::SyntaxNode
    def depth
      {expression:exp}
    end
  end
end
