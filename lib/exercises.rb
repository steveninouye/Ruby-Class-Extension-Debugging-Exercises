class Array
  def my_select(&blk)
    result = []
    i = 0
    while i < length
      result << self[i] if blk.call(self[i])
    end
    result
  end
end

class Array
  def my_map(&blk)
    result = []
    while i < length
      result << self[i]
      i += 1
    end
    result
  end
end


class Array
  def my_find(&blk)
    i = 0

    while i < length
      blk.call(self[i])
      i += 1
    end

    nil
  end
end


class Array
  def my_any?(&prc)
    self.each do |el|
      return false if prc.call(el)
    end

    true
  end
end


class Array
  def my_all?(&blk)
    self.each { return false unless blk(el) }
    true
  end
end


class Array
  # Write an array method that returns `true` if the array has duplicated
  # values and `false` if it does not
  def dups?
    elements = Hash.new(true)
    self.each do |item|
      return true if elements[item]
      elements[item] = true
    end
    false
  end
end


class Hash

  # Hash#merge takes a proc that accepts three arguments: a key and the two
  # corresponding values in the hashes being merged. Hash#merge then sets that
  # key to the return value of the proc in a new hash. If no proc is given,
  # Hash#merge simply merges the two hashes.
  #
  # Write a method with the functionality of Hash#merge. Your Hash#my_merge method
  # should optionally take a proc as an argument and return a new hash. If a proc
  # is not given, your method should provide default merging behavior. Do not use
  # Hash#merge in your method.
  def my_merge(hash2)
    new_hash = []

    hash2.each do |k2, v2|
      new_hash[k2] = v2
    end
    new_hash
  end
end
