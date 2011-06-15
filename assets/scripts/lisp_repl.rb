require 'ruboto'

ruboto_import_widgets :EditText, :TextView, :Button, :LinearLayout

$activity.handle_create do |b|
    setTitle "Scheme Repl" 

    setup_content do
        linear_layout :orientation => LinearLayout::VERTICAL do
            @et = edit_text :single_line => true, :hint => "Enter a sexpr"
            button :text => "Eval"
            @tv = text_view :text => "Gimme some sexprs!"
        end
    end

    handle_click do |view|
        @tv.append "\n #{view.getText}"
    end
end
