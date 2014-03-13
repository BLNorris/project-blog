class User < ActiveRecord::Base
   has_many :posts
   has_many :comments
   has_many :pages
end

class Post < ActiveRecord::Base
   has_many :comments
   belongs_to :user
end

class Page < ActiveRecord::Base
   belongs_to :user
end

class Comment < ActiveRecord::Base
   belongs_to :user
   belongs_to :post
end

class Setting < ActiveRecord::Base
   #belongs_to :user #not sure if this will work the way I thought it would
   
end