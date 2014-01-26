require 'spec_helper'
require_relative '../lib/calculates_route'

describe CalculatesRoute do
  let(:dallas)  {  Place.build("Dallas, tx") }
  let(:lubbock)  {  Place.build("Lubbock, tx") }
  let(:austin) {  Place.build("Austin, tx") }
  let(:el_paso) {  Place.build("El Paso, tx") }


  it "should calculate the route" do
    inputs = [dallas, el_paso, austin, lubbock]
    crazy = [dallas, austin, lubbock, el_paso]
    expect(CalculatesRoute.calculate(inputs)).to eq(crazy)
  end
end