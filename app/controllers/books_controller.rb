class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @books = Book.all
    book = Book.find(params[:id])
  end

  # def create
  #   # １.&2. データを受け取り新規登録するためのインスタンス作成
  #   book = Book.new(book_params)
  #   # 3. データをデータベースに保存するためのsaveメソッド実行
  #   book.save
  #   # 4. 詳細画面へリダイレクト
  #   flash[:notice] = "Book was successfully created"
  #   redirect_to book_path(book.id)
  # end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def update
    # book = Book.find(params[:id])
    # book.update(book_params)
    # redirect_to book_path(book.id)
    
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated"
      book = Book.find(params[:id])
      @book.update(book_params)
      redirect_to "/books/#{book.id}"
      # redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end
  
  # def update
  #   book = Book.find(params[:id])
  #   book.update(book_params)
  #   redirect_to book_path(book.id)
  # end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end


  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
