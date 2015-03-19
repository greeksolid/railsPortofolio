module ApplicationHelper
	
	# Returns the full title on a per-page basis
	def full_title(page_title)
		base_title = "tasosgeorgoulis"

		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	# Returns controller-action string
	# to use as the <body> class
	def body_class
		[controller_name, action_name].join('-')
	end

end
