return {
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    --[[ Key	Action
    C-n start multicursors
    n	find next (same as C-n)
    N	find previous
    ]	goto next
    [	goto previous
    q	skip and go to next
    Q	remove region
    C-f	fast forward (go to first region in next page)
    C-b	fast backward (go to first region in previous page)
    more at https://github.com/mg979/vim-visual-multi/wiki/Mappings#undo-and-redo ]]
  },
}
