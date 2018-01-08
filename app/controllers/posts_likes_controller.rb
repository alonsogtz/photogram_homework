class PostsLikesController < ApplicationController
  def index
    @posts_likes = PostsLike.page(params[:page]).per(10)

    render("posts_likes/index.html.erb")
  end

  def show
    @posts_like = PostsLike.find(params[:id])

    render("posts_likes/show.html.erb")
  end

  def new
    @posts_like = PostsLike.new

    render("posts_likes/new.html.erb")
  end

  def create
    @posts_like = PostsLike.new

    @posts_like.user_id = params[:user_id]
    @posts_like.post_id = params[:post_id]

    save_status = @posts_like.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/posts_likes/new", "/create_posts_like"
        redirect_to("/posts_likes")
      else
        redirect_back(:fallback_location => "/", :notice => "Posts like created successfully.")
      end
    else
      render("posts_likes/new.html.erb")
    end
  end

  def edit
    @posts_like = PostsLike.find(params[:id])

    render("posts_likes/edit.html.erb")
  end

  def update
    @posts_like = PostsLike.find(params[:id])

    @posts_like.user_id = params[:user_id]
    @posts_like.post_id = params[:post_id]

    save_status = @posts_like.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/posts_likes/#{@posts_like.id}/edit", "/update_posts_like"
        redirect_to("/posts_likes/#{@posts_like.id}", :notice => "Posts like updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Posts like updated successfully.")
      end
    else
      render("posts_likes/edit.html.erb")
    end
  end

  def destroy
    @posts_like = PostsLike.find(params[:id])

    @posts_like.destroy

    if URI(request.referer).path == "/posts_likes/#{@posts_like.id}"
      redirect_to("/", :notice => "Posts like deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Posts like deleted.")
    end
  end
end
