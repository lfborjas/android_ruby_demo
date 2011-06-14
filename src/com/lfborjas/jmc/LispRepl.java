package com.lfborjas.jmc;

public class LispRepl extends org.ruboto.RubotoActivity {
	public void onCreate(android.os.Bundle arg0) {
    try {
      setSplash(Class.forName("com.lfborjas.jmc.R$layout").getField("splash").getInt(null));
    } catch (Exception e) {}

    setScriptName("lisp_repl.rb");
    super.onCreate(arg0);
  }
}
