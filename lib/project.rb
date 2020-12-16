require "pry"

class Project
    attr_accessor :title

    @@all = []

    def initialize(title)
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end

    def add_backer(backer)
        ProjectBacker.new(self,backer)
    end


    def backers
        these_projects = ProjectBacker.all.select do |backed_project|
            backed_project.project == self
        end

        these_projects.map do |backed_project|
            # binding.pry
            backed_project.backer
        end
    end

end