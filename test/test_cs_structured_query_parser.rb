require 'test/unit'
require 'treetop'
require 'cs_structured_query'

class TestCsStructuredQueryParser < Test::Unit::TestCase
  setup do
    @parser = CsStructuredQueryParser.new
  end

  test '1つのフィールド検索' do
    result = @parser.parse("(and field_1:'サンプル')")
    assert_equal('サンプル', result.first_exp.expression_value.value.text_value)
  end

  test '1つのクエリ検索' do
    result = @parser.parse("(and (not field_1:'サンプル'))")
    assert_equal('サンプル', result.first_exp.exp.expression_value.value.text_value)
  end

  test '複数のクエリ検索' do
    result = @parser.parse("(and field_1:'サンプル1' (or field_2:'サンプル2'))")
    assert_equal('サンプル1', result.first_exp.expression_value.value.text_value)
    assert_equal('サンプル2', result.rest.elements.first.query.exp.expression_value.value.text_value)
  end
end
