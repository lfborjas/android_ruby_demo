require 'ruboto'

ruboto_import_widgets :TextView, :LinearLayout, :Button
%w(
    EditText
    Button
    ListView
    LinearLayout
    ViewGroup
).collect do |widget| 
    "android.widget.#{widget}"
end.each{|path| java_import path}

#From this tutorial:
#https://github.com/ruboto/ruboto-core/wiki/Tutorial:-Generating-UI-elements

outer_ll = LinearLayout.new $activity

outer_ll.instance_eval{
    setOrientation LinearLayout::VERTICAL
    setPadding *[5]*4
}

inner_ll = LinearLayout.new $activity

params = inner_ll.getLayoutParams

params.width = ViewGroup::LayoutParams::FILL_PARENT
params.height = ViewGroup::LayoutParams::WRAP_CONTENT

search_et = EditText.new $activity
search_et.instance_eval{
    setSingleLine true
    setHint "Search Criteria!"
}

inner_ll.addView search_et
params =search_et.getLayoutParams
params.width = ViewGroup::LayoutParams::FILL_PARENT
params.height = ViewGroup::LayourParams::WRAP_CONTENT
params.weight = 1.0

search_b = Button.new $activity
search_b.instance_eval{
    setText "Search"
    setOnClickListener RubotoOnClickListener.new.handle_click{|view| do_something}
}
inner_ll.addView search_b
params = search_b.getLayoutParams




$activity.handle_create do |bundle|
  setTitle 'This is the Title'

  setup_content do
    linear_layout :orientation => LinearLayout::VERTICAL do
      @text_view = text_view :text => "What hath Matz wrought?", :id => 42
      button :text => "M-x butterfly", :width => :wrap_content, :id => 43
    end
  end

  handle_click do |view|
    if view.getText == 'M-x butterfly'
      @text_view.setText "What hath Matz wrought!"
      toast 'Flipped a bit via butterfly'
    end
  end
end
