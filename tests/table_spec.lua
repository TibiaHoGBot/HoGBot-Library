package.path = package.path .. ";./lib/hogbot.lua"

require("hogbot")

describe("custom table functions", function()
  describe("table.compact", function()
    it("removes nil values from the table", function()
      local arr = { 1, "", {}, nil, nil }
      table.compact(arr)
      assert.are.same(arr, { 1, "", {} })
    end)
  end)

  describe("table.shuffle", function()
    it("removes nil values from the table", function()
      local values = { 1, "", {}, nil, nil }
      local arr = { 1, "", {}, nil, nil }
      table.shuffle(arr)
      assert.are_not.same(values, arr)
    end)
  end)

  describe("table.contains", function()
    it("checks if given element exists on the table", function()
      local values = { 1, 2, 3 }

      assert.is_true(table.contains(values, 3))
      assert.is_true(table.contains(values, 1))
      assert.is_false(table.contains(values, 5))
    end)
  end)
end)
