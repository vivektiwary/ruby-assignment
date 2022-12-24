def counter(initial_value = 0)
  counter_value = initial_value
  [
    -> { counter_value },
    -> { counter_value += 1 }
  ]
end
