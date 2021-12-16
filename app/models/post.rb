class Post < ApplicationRecord
  after_create_commit { broadcast_prepend_later_to 'posts' }
  after_update_commit { broadcast_replace_later_to 'posts' }
  after_destroy_commit { broadcast_remove_to 'posts' }

  validates :body, presence: true
  validates :username, presence: true
end
