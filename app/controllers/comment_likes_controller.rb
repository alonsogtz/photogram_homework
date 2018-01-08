class CommentLikesController < ApplicationController
  def index
    @comment_likes = CommentLike.all

    render("comment_likes/index.html.erb")
  end

  def show
    @comment_like = CommentLike.find(params[:id])

    render("comment_likes/show.html.erb")
  end

  def new
    @comment_like = CommentLike.new

    render("comment_likes/new.html.erb")
  end

  def create
    @comment_like = CommentLike.new

    @comment_like.user_id = params[:user_id]
    @comment_like.comment_id = params[:comment_id]

    save_status = @comment_like.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/comment_likes/new", "/create_comment_like"
        redirect_to("/comment_likes")
      else
        redirect_back(:fallback_location => "/", :notice => "Comment like created successfully.")
      end
    else
      render("comment_likes/new.html.erb")
    end
  end

  def edit
    @comment_like = CommentLike.find(params[:id])

    render("comment_likes/edit.html.erb")
  end

  def update
    @comment_like = CommentLike.find(params[:id])

    @comment_like.user_id = params[:user_id]
    @comment_like.comment_id = params[:comment_id]

    save_status = @comment_like.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/comment_likes/#{@comment_like.id}/edit", "/update_comment_like"
        redirect_to("/comment_likes/#{@comment_like.id}", :notice => "Comment like updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Comment like updated successfully.")
      end
    else
      render("comment_likes/edit.html.erb")
    end
  end

  def destroy
    @comment_like = CommentLike.find(params[:id])

    @comment_like.destroy

    if URI(request.referer).path == "/comment_likes/#{@comment_like.id}"
      redirect_to("/", :notice => "Comment like deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Comment like deleted.")
    end
  end
end
