def calc(str)
  arr = str.split(" ");
  nums = [*0..9]

  nums.map! { |num| num.to_s }

  arr.map! do |x|
    if nums.include?(x)
      x = x.to_i
    elsif x.length > 1
      x= x.to_i
    else
      x = x.to_sym
    end
  end

  calculate(arr)

end

def add(a,b)
  return a + b
end

def minus(a, b)
  return a - b
end

def multi(a, b)
  return a * b
end

def divide(a, b)
  return a/b
end

def calculate(arr)
  while arr.length > 1
    arr.each_with_index do |x, idx|
      if arr.include?(:*) || arr.include?(:/)
        if x == :*
          result = multi(arr[idx - 1], arr[idx + 1])
          arr.delete_at(idx - 1)
          arr.delete_at(idx - 1)
          arr.delete_at(idx - 1)
          arr.insert(idx - 1, result)
        end

        if x == :/
          result = divide(arr[idx - 1], arr[idx + 1])
          arr.delete_at(idx - 1)
          arr.delete_at(idx - 1)
          arr.delete_at(idx - 1)
          arr.insert(idx - 1, result)
        end

      else

        if x == :+
          result = add(arr[idx - 1], arr[idx + 1])
          arr.delete_at(idx - 1)
          arr.delete_at(idx - 1)
          arr.delete_at(idx - 1)
          arr.insert(idx - 1, result)
        end

        if x == :-
          result = minus(arr[idx - 1], arr[idx + 1])
          arr.delete_at(idx - 1)
          arr.delete_at(idx - 1)
          arr.delete_at(idx - 1)
          arr.insert(idx - 1, result)
        end

      end
    end

  end
  arr[0]
end


p calc("3 + 4 * 5 - 23 / 23")

p calc("3 + 4 * 5")
