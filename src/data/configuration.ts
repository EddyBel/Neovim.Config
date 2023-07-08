export const globals_variables = [
  // {
  //   variable: 'COLOR_THEME',
  //   type: 'String',
  //   function: 'This variable stores the name of the theme to be used in the editor.',
  // },
  {
    variable: 'BACKGROUND_TRANSPARENT',
    type: 'Boolean',
    function: 'This variable indicates whether a transparent background is desired.',
  },
  {
    variable: 'STATUSBAR',
    type: 'Table',
    function:
      'This table contains properties that allow you to modify the style and layout of the status bar (lualine).',
  },
  {
    variable: 'ALPHA',
    type: 'String',
    function:
      'This variable stores the ASCII drawing that is displayed when the editor is opened. There are already drawings loaded in the configuration in the [drawings.lua](./lua/utils/drawings.lua) file, you just need to import the drawing you like or add your own.',
  },
  // {
  //   variable: 'COLOR_LINE',
  //   type: 'Table',
  //   function: 'This variable stores a color table to use when highlighting the cursor line.',
  // },
  {
    variable: 'TODO_PATTERN',
    type: 'String',
    function: 'This variable stores the search pattern to search for TODO comments in the code.',
  },
  {
    variable: 'TODO_ICONS',
    type: 'Table',
    function: 'This variable indicates the table of icons to represent each TODO comment.',
  },
  {
    variable: 'ICONS',
    type: 'Table',
    function: 'This variable stores a table of most of the icons found throughout the editor for general use.',
  },
  {
    variable: 'GIT_SYMBOLS',
    type: 'Table',
    function:
      'This variable stores a table with the icons or symbols that you will use to identify changes in a git repository.',
  },
  {
    variable: 'TREE_SYMBOLS',
    type: 'Table',
    function: 'This variable stores a table with the icons to be used by the Neotree file manager.',
  },
  {
    variable: 'TREE_WIDTH',
    type: 'Integer',
    function: 'This variable stores the width of the file manager.',
  },
  {
    variable: 'TREE_DIRECTION',
    type: 'String',
    function: 'This variable stores from which point the file manager will open, left or right.',
  },
  {
    variable: 'CMP_GHOST_TEXT',
    type: 'Boolean',
    function: 'This variable indicates whether you want a virtual text preview of the autocomplete options.',
  },
  {
    variable: 'LSP_CLIENTS',
    type: 'Table',
    function: 'This variable contains the names of the LSP clients to be installed automatically.',
  },
  {
    variable: 'EXCLUDE_FORMATTERS_FILES',
    type: 'Table',
    function: 'This variable contains the file type names that will not use neoformat to be formatted.',
  },
  {
    variable: 'CODE_FORMATTERS',
    type: 'Table',
    function: 'This variable contains the names of the language and the code formatter to be used for that language.',
  },
];
