local function queue()
  return {
    values = {}, -- The end of this table is the 'front' of the q (where items get deqd) and index 1 is the 'back' (where items get enqd)

    enqueue = function (self, number)
      table.insert(self.values, 1, number)
    end,

    dequeue = function (self)
      local front_of_q = self.values[#self.values]

      table.remove(self.values, #self.values)

      return front_of_q
    end,

    front = function (self)
      return self.values[#self.values]
    end,

    back = function (self)
      return self.values[1]
    end,

    empty = function (self)
      if self.values == {} then
        return true
      end

      return false
    end,

    size = function (self)
      return #self.values
    end,

    clear = function (self)
      self.values = {}
    end,

    to_string = function (self)
      local string = "["

      for key, value in pairs(self.values) do
        string = string .. value

        if key ~= #self.values then
          string = string .. ", "
        end
      end

      string = string .. "]"

      return string
    end,

    print = function (self)
      io.write("[")

      for key, value in pairs(self.values) do
        io.write(value)

        if key ~= #self.values then
          io.write(", ")
        end
      end

      io.write("]\n")
    end,
  }
end

return queue()
