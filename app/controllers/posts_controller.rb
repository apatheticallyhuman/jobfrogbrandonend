class PostsController < ApplicationController
  before_action: set_post, only: [:show, :edit, :update, :destroy]

  #GET /posts
  #Get /posts.json
  def index
    @posts = Post.all
  end

  #GET /posts/1
  #GET /posts/1.json
  def show
  end

  #GET /posts/new
  def new
    @post = current_user.post.build
  end

  #GET /posts/1/edit
  def edit
  end

  #POST /posts
  #POST posts.json
  def create
    @post = current_user.post.build(post_params)

    respond_to do |format|
    if @post.save
      format.html {redirect_to @post, notice: 'Post was successfully created.'}
      format.json {render :show, status: :created, location: @post }
    else
      format.html {render :new }
      format.json {render json: @post errors, status: :unprocessable_entity }
    end
  end
  
