require 'ruboto'

ruboto_import_widgets :EditText, :TextView, :Button, :LinearLayout

$activity.handle_create do |b|
    setTitle "Scheme Repl" 

    setup_content do
        linear_layout :orientation => LinearLayout::VERTICAL do
            @et = edit_text :single_line => true, :hint => "Enter a sexpr"
            button :text => "Eval", :on_click_listener => lambda{|v| eval_sexpr }
            @tv = text_view :text => "Gimme some sexprs!"
        end
    end

    def self.eval_sexpr(expr)
        @tv.append "\n #{expr}"    
    end
end
