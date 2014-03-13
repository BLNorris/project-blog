ActiveRecord::Base.establish_connection(
   :adapter  => 'sqlite3',
   :database => (ENV['RACK_ENV'] == "test") ? 'blog.test' | 'blog'
)

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Schema.define do
   unless ActiveRecord::Base.connection.tables.include? 'users'
      create_table :users do |table|
         table.column :first_name, :string
         table.column :last_name, :string
         table.column :username, :string
      end
   end
   
   unless ActiveRecord::Base.connection.tables.include? 'posts'
      create_table posts do |table|
         table.column :user_id, :integer
         table.column :title, :string
         table.column :content, :text
         table.column :time, :datetime
      end
   end
   
   unless ActiveRecord::Base.connection.tables.include? 'comments'
      create_table comments do |table|
         table.column :user_id, :integer
         table.column :title, :string
         table.column :content, :text
         table.column :time, :datetime
      end
   end
   
   unless ActiveRecord::Base.connection.tables.include? 'pages'
      create_table pages do |table|
         table.column :user_id, :integer
         table.column :title, :string
         table.column :content, :text
         table.column :time, :datetime
      end
   end
   
   unless ActiveRecord::Base.connection.tables.include? 'settings'
      create_table comments do |table|
         table.column :user_id, :integer
         table.column :site_title, :string
         table.column :site_name, :string
         table.column :date_format, :string
         table.column :time_format, :string
         table.column :main_posts, :integer
      end
   end
end