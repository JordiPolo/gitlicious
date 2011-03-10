class Project < ActiveRecord::Base
  has_many :tags
  
  def target_folders
    'app/controllers app/helpers app/models lib'
  end
  
  def ci_server_url
    'http://192.168.31.237:8080/job/cookpad/'
  end
  
  def update_tags!(filter = CI_TAG_PREFIX)
    git.fetch if git.branches.remote.size > 0
    git.tags.each do |tag|
      tags.create(:name => tag.name) if tag.name.include?(filter)
    end
  end
  
  def git
    @git ||= Git.open(repo_path)
  end
  
end
