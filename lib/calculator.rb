class Calculator

  def add *a
    a.inject(0) {|r, v| r + v}
  end

  def multiply *a
    a.inject(1) {|r, v| r * v}
  end
end