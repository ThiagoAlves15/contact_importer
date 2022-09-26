require 'rails_helper'

RSpec.describe "file_uploads/edit", type: :view do
  before(:each) do
    @file_upload = assign(:file_upload, FileUpload.create!(
      status: 1
    ))
  end

  it "renders the edit file_upload form" do
    render

    assert_select "form[action=?][method=?]", file_upload_path(@file_upload), "post" do

      assert_select "input[name=?]", "file_upload[status]"
    end
  end
end
