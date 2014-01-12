#isolated tesing

class Widget
  end

class Panda
end

#expectations --> tests
#assertion --> test on a object

#message expecatation --should_receive(:shatter) --classes interact with other classes

#value expecatation -- panda.widget should be_empty --internally

#value was changed -- Mutation

describe  Panda do 
  #testing the mutation of the panda
  it "should throw the widget" do
    panda = Panda.new
    panda.throws(widget)
    panda.widgets.shoud be_empty
  end

  #not testing internals of the widget but that it was told to shatter. This just tests the boundry between shatter and widget
  it "should shatter the widget" do
    # widget = Widget.new 
    #testing the widget should be told to shattered
    #mock
    widget = mock(:widget)
    widget.should_receive(:shatter)
    panda.throws(widget)
    widget.shattered.should be_true
  end
end

#this actually tests the shattering
describe Widget do
  it "should shatter when told to shatter" do
    widget = Widget.new
    widget.shatter!
    widget.shattered.should be_true 
  end
end