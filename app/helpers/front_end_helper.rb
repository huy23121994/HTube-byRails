module FrontEndHelper
	def front_end_layout(layout)
	    @view_flow.set(:layout, output_buffer)
	    output = render(:file => "front_end/layouts/#{layout}")
	    self.output_buffer = ActionView::OutputBuffer.new(output)
  	end
end
