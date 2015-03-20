module ProjectsHelper

    # Returns a css rule to use for the project#show page
    def project_picture_bg
        "background-image: url(#{@project.project_picture.image.url})"
    end

end
