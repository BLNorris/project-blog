ActiveRecord::Base.establish_connection(
   :adapter  => 'sqlite3',
   :database => (ENV['RACK_ENV'] == "test") ? './db/blog.test.sqlite' : './db/blog.sqlite'
)

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Schema.define do
   unless ActiveRecord::Base.connection.tables.include? 'users'
      create_table :users do |table|
         table.column :first_name, :string
         table.column :last_name, :string
         table.column :username, :string
         table.column :created_on, :datetime
         table.column :updated_on, :datetime
         table.timestamps

      end

   end
   
   unless ActiveRecord::Base.connection.tables.include? 'posts'
      create_table :posts do |table|
         table.column :user_id, :integer
         table.column :title, :string
         table.column :content, :text
         table.column :user_id, :integer
         table.column :created_at, :datetime
         table.column :created_on, :datetime
         table.column :updated_at, :datetime
         table.column :updated_on, :datetime
         table.timestamps
      end
   end
   
   unless ActiveRecord::Base.connection.tables.include? 'comments'
      create_table :comments do |table|
         table.column :user_id, :integer
         table.column :title, :string
         table.column :content, :text
         table.column :user_id, :integer
         table.column :post_id, :integer
         table.column :created_at, :datetime
         table.column :created_on, :datetime
         table.timestamps
      end
   end
   
   unless ActiveRecord::Base.connection.tables.include? 'pages'
      create_table :pages do |table|
         table.column :user_id, :integer
         table.column :title, :string
         table.column :content, :text
         table.column :user_id, :integer
         table.column :created_at, :datetime
         table.column :created_on, :datetime
         table.column :updated_at, :datetime
         table.column :updated_on, :datetime
         table.timestamps
      end
   end
   
   unless ActiveRecord::Base.connection.tables.include? 'settings'
      create_table :settings do |table|
         table.column :user_id, :integer, options = {:default => 0}
         table.column :site_title, :string, options = {:default => "NEW BLOG TITLE"}
         table.column :site_name, :string, options = {:default =>  "NEW BLOG NAME"}
         table.column :date_format, :string, options = {:default => "YYYY-MM-DD"}
         table.column :time_format, :string, options = {:default => "HH:MM"}
         table.column :main_posts, :integer, options = {:default =>  6}
      end
   end
end