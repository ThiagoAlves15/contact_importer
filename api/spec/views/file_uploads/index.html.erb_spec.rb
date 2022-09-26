require 'rails_helper'

RSpec.describe "file_uploads/index", type: :view do
  before(:each) do
    assign(:file_uploads, [
      FileUpload.create!(
        status: 2
      ),
      FileUpload.create!(
        status: 2
      )
    ])
  end

  it "renders a list of file_uploads" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
