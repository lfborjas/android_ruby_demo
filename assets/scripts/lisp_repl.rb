require 'ruboto'

ruboto_import_widgets :EditText, :TextView, :Button

$activity.handle_create do |b|
    setTitle "Scheme Repl" 

    setup_content do
        @et = edit_text :single_line => true, :hint => "Enter a sexpr"
    end

end
