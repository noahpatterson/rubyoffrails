class Widget
  def initialize
    @sku = "34324234234" #instance variable, resides in the scope of widget
  end

  def ohai
    "34234234" #local variable on only scoped to method
  end

  def sku #methods are only 1-3 lines, only 1 local variable
    ohai
  end
end