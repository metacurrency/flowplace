module WealsHelper
  include TagsHelper
  def render_name(which,weal)
    u = case which
    when :requester
      weal.requester
    when :fulfiller
      weal.fulfiller
    end
    u.nil? ? 'NA' : u.full_name
  end
  def render_intentions_tag_cloud(options={})
	  tags = Weal.tag_counts(options)
		if tags.empty?
		  ''
	  else
	    result = []
  		tag_cloud tags, %w(css1 css2 css3 css4) do |tag, css_class|
        result << link_to( tag.name, { :action => :tag, :id => tag.name }, :class => css_class)
      end
      result.join(' ')
    end
	end
end
