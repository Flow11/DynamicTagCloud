class ArticlesController < ApplicationController
  
  def home

  end
  
  def maj_links
  	@a = []
	@b = []
	@c = []
	Article.all.each do |article|
		ArticlesTags.where(:article_id=>article.id).each do |item1|
			ArticlesTags.where(:article_id=>article.id).each do |item2|
			  tag1 = Tag.find(item1.tag_id).name
			  tag2 = Tag.find(item2.tag_id).name
			  if(Equivalence.count >0)
				  Equivalence.all.each do |equ|
					if (tag1 != tag2) && ((tag1!=equ.tag1 && tag1!=equ.tag2) || (tag2!=equ.tag1 && tag2!=equ.tag2))
						@a << [item1.tag_id,item2.tag_id,0]
					end
				  end
			  elsif(tag1 != tag2)
				@a << [item1.tag_id,item2.tag_id,0]
			  end
			end
		end
	end
	@a.each do |x|
	  Equivalence.all.each do |e|
	    if x[0]==Tag.where(:name=>e.tag1).first.id && x[1]!=Tag.where(:name=>e.tag2).first.id
	      @c << [Tag.where(:name=>e.tag2).first.id,x[1],0]
	    end
	    if x[0]==Tag.where(:name=>e.tag2).first.id && x[1]!=Tag.where(:name=>e.tag1).first.id
	      @c << [Tag.where(:name=>e.tag1).first.id,x[1],0]
	    end
	    if x[1]==Tag.where(:name=>e.tag1).first.id && x[0]!=Tag.where(:name=>e.tag2).first.id
	      @c << [x[0],Tag.where(:name=>e.tag2).first.id,0]
	    end
	    if x[1]==Tag.where(:name=>e.tag2).first.id && x[0]!=Tag.where(:name=>e.tag1).first.id
	      @c << [x[0],Tag.where(:name=>e.tag1).first.id,0]
	    end
	  end
	end
	@c.each do |x|
	  @a << x
	  @c.delete(x)
	end
	@a.each do |x|
		@b << [x[0],x[1],@a.count(x)]
		@a.delete(x)
	end
	Links.destroy_all
	@b.each do |y|
		l = Links.new(:id_tag=>y[0],:occurrence=>y[2],:tag_id=>y[1])
		l.save
	end
	redirect_to "/home"
  end
  
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.all
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])
	
    respond_to do |format|
      if @article.save
		params[:p].each do |key,value|
			if(value.to_i==1)
				@a = ArticlesTags.new
				@a.tag_id = Tag.where(:name=>key).first.id
				@a.article_id = @article.id
				@a.save
			end
		end
	  
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
		
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])
	@liste_tag = ArticlesTags.where(:article_id=>@article.id)
	@liste_tag.each do |item|
		item.destroy
	end
	
    respond_to do |format|
      if @article.update_attributes(params[:article])
		params[:p].each do |key,value|
			if(value.to_i==1)
				@a = ArticlesTags.new
				@a.tag_id = Tag.where(:name=>key).first.id
				@a.article_id = @article.id
				@a.save
			end
		end
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
end