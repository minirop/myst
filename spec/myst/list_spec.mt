require "stdlib/spec.mt"

describe("List#* (splat)") do
  it("should return itself") do
    assert(*[1, 2, 3] == [1, 2, 3])
  end
end

describe("List#size") do
  it("should return 0 when size is 0") do
    assert([].size == 0)
  end

  it("should return 3 when size is 3") do
    assert([1,2,3].size == 3)
  end
end

describe("List#empty?") do
  it("should return true when list size is 0") do
    assert([].empty? == true)
  end

  it("should return false when list size is 2") do
    assert([1, 2].empty? == false)
  end
end

describe("List#==") do
  it("returns true when the lists are equal") do
    assert([1, 2] == [1, 2])
  end

  it("returns true when the lists are empty") do
    assert([] == [])
  end

  it("returns false when the lists are different lengths") do
    assert(([1] == [1, 2]) == false)
  end

  it("returns false when the lists are not equal") do
    assert(([1, 2] == [1, "hi"]) == false)
  end
end

describe("List#-") do
  it("returns elements not present in second list") do
    assert(([1, 2] - [1]) == [2])
  end

  it("returns the first list if there are no present elements in the second list") do
    assert(([1, 2] - [3]) == [1, 2])
  end

  it("returns any empty list if the lists are equal") do
    assert(([1, 2] - [1, 2]) == [])
  end
end

describe("List#lt") do
  it("returns true if a list is a proper subset of the other") do
    assert(([1, "hi"] < [1, "hi", 3]) == true)
  end

  it("returns true if a list is a proper subset of the other, unsorted") do
    assert(([3, 1] < [1, 2, 3]) == true)
  end

  it("returns false if the lists are the same") do
    assert(([1, 2] < [1, 2]) == false)
  end

  it("returns false if the list is not a proper subset of the other") do
    assert(([1, 2] < [1]) == false)
  end
end

describe("List#lte") do
  it("returns true if a list is a subset of the other") do
    assert(([1, "hi"] <= [1, "hi", 3]) == true)
  end

  it("returns true if a list is a subset of the other, unsorted") do
    assert(([3, 1] < [1, 2, 3]) == true)
  end

  it("returns true if the lists contain the same elemtns") do
    assert(([1, 2] <= [1, 2]) == true)
  end

  it("returns true if the lists contain the same elements, unsorted") do
    assert(([3, 1, 2] <= [1, 2, 3]) == true)
  end

  it("returns false if the list is not a subset of the other") do
    assert(([1, 2] <= [1]) == false)
  end
end
