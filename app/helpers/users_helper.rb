module UsersHelper

	def user_login_layout
	    @view_flow.set(:layout, output_buffer)
	    output = render(:file => "back_end/layouts/login_layout")
	    self.output_buffer = ActionView::OutputBuffer.new(output)
  	end

end
