class Cache

  def initialize(max_size: 100)
    @max_size = max_size
    @cache_items = []
  end

  def write(key, value)
    while count >= @max_size
      @cache_items.pop
    end
    @cache_items.prepend([key, value])
  end

  def read(key)
    value = @cache_items.to_h[key]
    promote_to_front([key, value])
    value
  end

  def delete(key)
    value = @cache_items.to_h[key]
    @cache_items.delete([key, value])
  end

  def clear
    @cache_items = []
  end

  def count
    @cache_items.length
  end

  def to_h
    @cache_items.to_h
  end

  private

  def promote_to_front(item)
    @cache_items.delete(item)
    @cache_items.prepend(item)
  end
end

cache =  Cache.new(max_size: 3)
cache.write("key1", "val1")
p cache.to_h
cache.write("key2", "val2")
p cache.to_h
cache.write("key3", "val3")
p cache.to_h
cache.write("key4", "val4")
p cache.to_h
p cache.read("key1")
p cache.read("key2")
p cache.to_h
cache.write("key5", "val5")
p cache.to_h
cache.write("key6", "val6")
p cache.to_h
cache.write("key5", "value5-overwrite")
p cache.to_h
cache.read("key5")
p cache.to_h
cache.clear
