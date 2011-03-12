require 'test_helper'

class ThemeTest < ActiveSupport::TestCase
  
  test "should get default theme" do
    default_theme = Theme.get_default_theme
    assert default_theme
  end
  
end
