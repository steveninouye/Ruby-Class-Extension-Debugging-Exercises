class Array
  def my_select(&blk)
    result = []
    i = 0
    while i < length
      result << self[i] if blk.call(self[i])
      i += 1
    end
    result
  end
end

class Array
  def my_map(&blk)
    result = []
    i = 0
    while i < length
      result << blk.call(self[i])
      i += 1
    end
    result
  end
end


class Array
  def my_find(&blk)
    i = 0

    while i < length
      return self[i] if blk.call(self[i])
      i += 1
    end

    nil
  end
end


class Array
  def my_any?(&prc)
    self.each do |el|
      return true if prc.call(el)
    end
    false
  end
end


class Array
  def my_all?(&blk)
    self.each do |el|
      return false if !blk.call(el)
    end
    true
  end
end


class Array
  # Write an array method that returns `true` if the array has duplicated
  # values and `false` if it does not
  def dups?
    self.each do |el|
      return true if self.count(el) > 1
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
  def my_merge(hash2, &prc)
    prc ||= Proc.new{|key, oldval, newval| newval}
    hash = self.dup

    hash2.each do |k2, v2|
      if hash.has_key?(k2)
        hash[k2] = prc.call(k2, hash[k2], v2)
      else
        hash[k2] = v2
      end
    end
    hash
  end
end
