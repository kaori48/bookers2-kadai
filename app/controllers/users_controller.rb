class UsersController < ApplicationController
#一覧,
  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])#ユーザのデータを1件取得してuserの説明.一覧に送る
  	@book = Book.new #booksコントローラーのからのフォームをuserに渡すために作ってる
  end

  def new
  end
#ユーザー編集画面を出す
  def edit
  	@user = User.find(params[:id])#userの情報出してくる
  end
#ユーザー編集をする、
  def update
  	user = User.find(params[:id])#params[:id]でユーザの情報を取得してインスタンス（@user）に保存し、編集用Viewでform_forを使う準備をしています。
    if
        user.update(user_params)#アップデート
        redirect_to user_path(user)#ユーザーのshowへリダイレクト
        flash[:notice] = "You have updated user successfully."#成功メッセージ表示出るとこ決めてない
    else
        #戻るけどその前で情報取る指示してるのでrenderだけでいい
        render :edit #editに戻る。

    end
  end

private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)#書き方がわからない、idなしでおけ
  end
end
