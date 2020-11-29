class BooklistsController < ApplicationController
  def new
    @book = Book.new

  end
  
 def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    # ３. トップ画面へリダイレクト
    redirect_to booklist_path(@book)
    
  else 
    @books = Book.all
    render 'index'
  end
  
end
  
  def index
    @books = Book.all
    @book = Book.new
  
end

def  show
  @book = Book.find(params[:id])
  
end

 def edit
    @book = Book.find(params[:id])
  end
  
  def update
     book = Book.find(params[:id])
    book.update(book_params)
    redirect_to booklist_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to :action => 'index'   # 投稿一覧画面へリダイレクト
  
end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
