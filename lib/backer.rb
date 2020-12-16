class Backer
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def back_project(project)
        ProjectBacker.new(project, self)
    end

    def backed_projects
        this_backers_projects = ProjectBacker.all.select { |backed_project| backed_project.backer == self }
        this_backers_projects.map {|backed_project| backed_project.project}
    end

end