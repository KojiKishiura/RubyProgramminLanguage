x = 1
puts x

x , y = 1, 2     #x = 1; y = 2
puts x
puts y
x , y = y , x    #exchange
puts x
puts y
x, y, z = [1, 2, 3]
puts x
puts y
puts z

# 直交座標の(x, y)を極座標に変換
def polar(x, y)
    theta = Math.atan2(y, x)           #角度の計算
    r = Math.hypot(x, y)               #距離の計算
    [r, theta]                         #最後の式が戻り値
end

#このメソッドの戻り値は次のようにして多重代入する
distance, angle = polar(2, 2)

puts distance
puts angle