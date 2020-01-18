class BooksController < ApplicationController
  def index
  end
#自分の一覧
  def show
  end
#新規データ登録用?
  def new
  	@book = Book.new #空のは送る必要あり
  end
#投稿データの保存
  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id#user_idは、コメントしたユーザのID、カラム追加マイグレーションできてない
    if @book.save
       flash[:notice] = "You have creatad book successfully."#成功メッセ、出るとこ決めてない
       redirect_to book_path(@book)#booksのshowビューに移動、@book = Book.newの内容を送る
      else
       @books = Book.all #全員の一覧に戻るので引っ張ってくる
        render :index #一覧に戻（全員の）
       #エラー文まだ,表示も設定してない
    end
  end
#編集
  def edit
  end

private#投稿データの保存のストロングパラメータ
  def book_params
     params.require(:book).permit(:title, :body)
  end
end
