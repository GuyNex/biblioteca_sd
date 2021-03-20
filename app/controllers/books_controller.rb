class BooksController < ApplicationController
  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save!
      image_change(@book)
      redirect_to root_url, notice: 'deu'
    else
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    begin
      @book.destroy!
    rescue StandardError => e
      flash[:notice] = e
    ensure
      redirect_to root_url
    end
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :date, :file)
  end

  def image_change(book)
    imagem = params[:book][:photo]
    unless imagem.nil?
      book.photo.purge if book.photo.attached?
      book.photo.attach(imagem)
      end
  end
  end
