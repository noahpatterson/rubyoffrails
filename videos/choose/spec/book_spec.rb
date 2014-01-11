
require_relative 'spec_helper'

describe Book do

  before(:each) do 
    Page.delete_all

    @page = Page.create(starting_point: true) 
    subject { Book.new }
    @option_a =  Page.create(parent_id: @page.id)
    @option_b = Page.create(parent_id: @page.id)
  end

  it "should have a page" do
    expect(subject.current_page).to eq(@page)
  end

  describe '#input' do
    

    it "should receive input and opens page" do
      subject.input("A")
      expect(subject.current_page).to eq(@option_a)
    end

    it "should receive input and opens page" do
      subject.input("B")
      expect(subject.current_page).to eq(@option_b)
    end
  end

  describe "#complete_game" do
    
    it "should know when its done" do
      subject.instance_variable_set(:@current_page, Page.create(conclusion: true))
      expect(subject.complete_game?).to be_true
    end
  end
end