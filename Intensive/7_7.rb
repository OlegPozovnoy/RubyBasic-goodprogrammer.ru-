puts Array.new(8) {
    ['0'..'9', 'a'..'z', 'A'..'Z']
    .flat_map(&:to_a)
    .sample
  }.join
