class Ambiguous
	def x; 1; end #必ず1を返す"x"という名前のメソッド
	
	def test
		puts x # まだ変数を検出していないので、上のメソッドを参照して1を出力
		
		# "if false"となっているので、下の行は絶対に実行されないが、
		# パーサーはこれを検出してメソッドの末尾まではxを変数として扱う
		x = 0 if false
		
		puts x # xは変数だが代入されていないのでnilを出力する
		
		x = 2 # この代入は評価される
		puts x # そこでこの行は2を出力する
	end
end

y = Ambiguous.new
y.test