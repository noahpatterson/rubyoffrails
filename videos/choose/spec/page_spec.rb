
require 'spec_helper'



describe Page do

  before(:each) do 
    Page.delete_all
  end

  it "should know if its at the end of the road" do
    page = Page.create(conclusion: true)
    #subject is a new page
    expect(page.conclusion?).to be_true
  end

  it "should have content" do
    page = Page.create(content: "The hox and the hound get along")
    expect(Page.find(page.id).content).to eq("The hox and the hound get along")
  end

  context "#options" do
    subject {Page.create}
    let(:option_a) {Page.create(parent_id: subject.id)}
    let(:option_b) {Page.create(parent_id: subject.id)}
    let(:option_c) {Page.create(parent_id: subject.id)}

    it "should have options for the next pages" do
      expect(subject.options).to eq([option_a, option_b])
    end
  end

  it "should not be a starting point by default" do
    expect(Page.create.starting_point).to eq(false)
  end

  it "should not be a conclusion by default" do
    expect(Page.create.conclusion).to eq(false)
  end

  it "should have a starting point" do
    starting_page = Page.create(starting_point: true)
    expect(Page.starting_point).to eq(starting_page)
  end
end