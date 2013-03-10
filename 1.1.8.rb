#
# このクラスはfrom, to, byの３つのパラメータによって定義される数列を表現する
# 数列内の数値 xは、次の２つの条件を満たす
#
#     from <= x <= to
#     x = from + n * by, ただし nは整数
#
class Sequence
    # Enumerableクラス、つまりeachイテレータを定義している
    include Enumerable                           # このクラスにこのモジュールのメソッドを取り込む
    
    # initializeは、クラスの新しく作成されたインスタンスを初期化するために
    # 自動的に呼び出される特殊なメソッド
    def initialize(from, to, by)
        # 後で使うためにインスタンス変数にパラメータを保存する
        @from, @to, @by = from, to, by           # 多重代入とプレフィックス@に注意
    end
    
    # Enumerableモジュールが必要とするイテレータ
    def each
        x = @from                                # 開始位置からスタート
        while x <= @to                           # 末尾に到達するまで
            yield x                              # イテレータ付属ブロックに xを渡す
            x += @by                            # xを増やす
        end
    end
    
    # 配列にならい、数列の中の値の個数を返すlengthメソッドを定義する
    def length
        return 0 if @from > @to                  # ifが文修飾子として使われていることに注意
        Integer((@to - @from) / @by) + 1         # 数列の要素数を計算して返す
    end
    
    # 同じメソッドに対して別名を定義する
    # Rubyでは複数の名前を持つメソッドはよくある
    alias size length                            # sizeはlengthの同義語になった
    
    # 数列へのランダムアクセスを認めるために、配列アクセス演算子をオーバライドする
    def[](index)
        return nil if index < 0                  # 負数の添字に対してはnilを返す
        v = @from + index * @by                  # 値を計算する
        if v <= @to                              # 値が数列の一部なら
            v                                    # それを返す
        else                                     # そうでなければ
        	nil                                  # nilを返す
        end
    end
    
    # 新しいSequenceオブジェクトを返すように算術演算子をオーバーライドする
    def *(factor)
        Sequence.new(@from * factor, @to * factor, @by * factor)
    end
    
    def +(offset)
        Sequence.new(@from + offset, @to + offset, @by)
    end
end


s = Sequence.new(1, 10, 2)                       # 1から10まで2つおき
puts
s.each {|x| print x}                             # "13579"と出力
puts
puts "-------------------------------------------"
print s[s.size - 1]                              # 9と出力
puts
puts "-------------------------------------------"
print s[s.length - 2]
puts
puts "-------------------------------------------"
t = (s + 1) * 2                                  # 4から22まで4つおき
puts

module Sequences                                 # 新しいモジュールの先頭
  def self.fromtoby(from, to, by)                # モジュールの特異メソッド
    x = from
    while x <= to
      yield x
      x += by
    end
  end
end
puts "-------------------------------------------"
Sequences.fromtoby(1, 10, 2) {|x| print x }      # "13579"と出力
puts
puts "-------------------------------------------"

class Range                                      # 追加のために既存クラスをオープンする
  def by(step)                                   # byという名前のイテレータを定義する
    x = self.begin                               # 範囲の片方の端点からスタート
    if exclude_end?                              # ...の範囲の場合、末尾を除く
      while x < self.end                         # <演算子によるテスト
        yield x
        x += step
      end
    else                                         # でなければ、末尾を含む...版に
      while x <= self.end                        # <=演算子によるテスト
        yield x
        x += step
      end
    end
  end                                            # メソッド定義の末尾
end                                              # クラス変更の末尾

# Examples
(0..10).by(2) {|x| print x }                     # "0246810"と出力
puts
puts "-------------------------------------------"
(0...10).by(2) {|x| print x }                    # "02468"と出力
puts
puts "-------------------------------------------"
