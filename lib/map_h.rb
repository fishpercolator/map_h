module Enumerable
  # Similar to Enumerable#map, but builds a hash of the results using
  # the original value as the key.
  #
  #  ['john', 'paul', 'george', 'ringo'].map_h { |name| name.length }
  #  # => {'john' => 4, 'paul' => 4, 'george' => 6, 'ringo' => 5}
  def map_h
    {}.tap do |result|
      each do |key|
        result[key] = yield key
      end
    end
  end
end
