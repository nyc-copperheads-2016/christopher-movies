class Folder < ActiveRecord::Base
   has_ancestry

   def sub_folders
     children.order(:name)
   end
end
