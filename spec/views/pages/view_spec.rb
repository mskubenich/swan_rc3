require 'rails_helper'

RSpec.describe "layouts/application", :type => :view do
  it "displays the title" do
    render
	expect(rendered).to match /SwanRc3/
  end
end
