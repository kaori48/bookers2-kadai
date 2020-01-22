class HomesController < ApplicationController
before_action :authenticate_user!, except: [:top, :about]#ログインしていないときにログイン画面だけを表示アクション例外
	def top
	end
	def about
	end
end
