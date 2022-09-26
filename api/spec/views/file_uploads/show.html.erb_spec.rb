require 'rails_helper'

RSpec.describe "file_uploads/show", type: :view do
  before(:each) do
    @file_upload = assign(:file_upload, FileUpload.create!(
      status: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
