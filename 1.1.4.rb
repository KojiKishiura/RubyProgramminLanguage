def square(x)
    x * x
end

puts square(3)


def Math.square(x)   # Math moduleのクラスメソッドを定義する
    x * x
end

puts Math.square(4)