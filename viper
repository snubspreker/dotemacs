(setq viper-inhibit-startup-message 't)
(setq viper-expert-level '5)

(viper-record-kbd-macro "wc" 'vi-state [: w c (control h) (control h) ! w c \  %] '" *Minibuf-1*")

(viper-record-kbd-macro "www" 'vi-state [: ! w c \  %] '" *Minibuf-1*")
