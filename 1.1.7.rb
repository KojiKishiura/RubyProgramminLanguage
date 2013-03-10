birthyear = 1946

#生年に基づいて米国での世代名を判定する
#case式は、===で範囲をテストする
generation = case birthyear 
             when 1946..1963; "Baby Boomer"
             when 1964..1976; "Generation X"
             when 1977..2000; "Generation Y"
             else nil
             end
puts generation

#ユーザに何かを確かめるためのメソッド
def are_you_sure?                      #メソッド定義。？に注意
    while true                         #明示的にreturnするまで繰り返し
        print "よろしいですか？[y/n]: "   #ユーザに質問
        response = gets                #回答を得る
        case response                  #case条件開始
        when /^[yY]/                   #回答の先頭がyかYなら
            return true                #trueを返す
        when /^[nN]/, /^$/             #回答の先頭がnかN、または空文字列なら
            return false               #falseを返す
        end
    end
end

ret = are_you_sure?
p ret