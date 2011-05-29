require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutNil < EdgeCase::Koan
  def test_nil_is_an_object
    assert_equal true, nil.is_a?(Object), "Unlike NULL in other languages"
  end

  def test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil
    # What happens when you call a method that doesn't exist.  The
    # following begin/rescue/end code block captures the exception and
    # make some assertions about it.
    begin
      nil.some_method_nil_doesnt_know_about
    rescue Exception => ex
      # What exception has been caught?
      assert_equal NoMethodError, ex.class

      # What message was attached to the exception?
      # (HINT: replace __ with part of the error message.)
      assert_match(/undefined method/, ex.message)
    end
  end

  def test_nil_has_a_few_methods_defined_on_it
    assert_equal true, nil.nil?
    assert_equal "", nil.to_s
    assert_equal "nil", nil.inspect

    # THINK ABOUT IT:
    #
    # Is it better to use
    #    obj.nil?
    # or
    #    obj == nil
    # Why?

    # I think obj.nil? would be preferable. With Ruby, "duck-typing" is
    # is one of the core strengths, and it is more idiomatic to check if
    # an object responds to a particular method than to check type
    # equality. Using this idiom, one could also extend the #nil? method
    # to behave differently than simply comparing an object with nil.
  end

end
