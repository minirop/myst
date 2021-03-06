require "stdlib/spec.mt"

describe("Integer#+") do
  it("does simple addition") do
    assert(1 + 1 == 2)
    assert(2 + 2 == 4)
  end

  it("does chained addition") do
    assert(1 + 1 + 1 == 3)
    assert(1 + 2 + 3 == 4 + 2)
  end

  it("does large addition") do
    assert(2_000 + 4_567 == 6_567)
    assert(10_000 + 100_000 == 110_000)
    assert(1234567890 + 987654310 == 2_222_222_200)
  end

  # TODO: revisit when Negations are supported
  # it("wraps around max int to negatives") do
  #   assert(9_223_372_036_854_775_807 + 1 == -9_223_372_036_854_775_808)
  # end

  it("does nothing with 0") do
    assert(0 + 100 == 100)
    assert(100 + 0 == 100)
    assert(10 + 0 + 10 ==  20)
    assert(0 + 100 + 0 == 100)
  end

  it("returns a float when given a float operand") do
    assert(1 + 1.0 == 2.0)
    assert(123 + 12_396_851_265_129.468 == 12_396_851_265_252.468)
  end

  it("works with variables as arguments") do
    a = 1
    b = 2
    assert(a + b == 3)
  end

  it("does not accept nil as an operand") do
    expect_raises{ 1 + nil }
  end

  it("does not accept a boolean as an operand") do
    expect_raises{ 1 + true }
  end

  it("does not accept a list as an operand") do
    expect_raises{ 1 + [] }
    expect_raises{ 1 + [1, 2] }
  end

  it("does not accept a map as an operand") do
    expect_raises{ 1 + {} }
    expect_raises{ 1 + {a: 1} }
  end

  it("does not accept a string as an operand") do
    expect_raises{ 1 + "a" }
  end

  it("does not accept a symbol as an operand") do
    expect_raises{ 1 + :hi }
  end
end

describe("Integer#times") do
  it("calls a block as many times as integer value") do
    calls = 0
    3.times { calls += 1 }
    assert(calls == 3)
  end

  it("returns the integer") do
    assert(2.times { } == 2)
  end
end
