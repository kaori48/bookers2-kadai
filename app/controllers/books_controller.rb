class BooksController < ApplicationController
#本いちらん
  def index
    @books = Book.all
    @user = current_user #テンプレサイド用
    @book_new = Book.new #テンプレサイド用
  end
#投稿詳細
  def show#エラーまだ
    @book_new = Book.new#からの箱を渡す
    @book = Book.find(params[:id])#bookから１けん持ってくる
    @user = current_user #ログインしているユーザーと定義する
  end
#新規データ登録用?
  def new
  	@book = Book.new #空のは送る必要あり,viewないし別にいらん
  end
#投稿データの保存
  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id#user_idは、コメントしたユーザのID、currentでログインしているユーザー
    if @book.save
       flash[:notice] = "You have creatad book successfully."#成功メッセ、出るとこ決めてない
       redirect_to book_path(@book)#booksのshowビューに移動、@book = Book.newの内容を送る
      else
       @books = Book.all #全員の一覧に戻るので引っ張ってくる
        render :show #bookのshowへ
       #エラー文まだ,表示も設定してない
    end
  end
#編集
  def edit
    @book = Book.find(params[:id])
  end
# 更新
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
#削除
  def destroy#消すか聞く
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path#booksのindex
  end

private#投稿データの保存のストロングパラメータ
  def book_params
     params.require(:book).permit(:title, :body)
  end
end
