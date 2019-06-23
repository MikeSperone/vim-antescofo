" Vim syntax file
" " Language: Antescofo
" " Maintainer: Michael Sperone
" " Latest Revision: June 4 2019

if exists("b:current_syntax")
    finish
endif

echom "antescofo syntax"

syn clear
syn case ignore

" comments
syn keyword asfCommentTodo   TODO FIXME XXX TBD contained
syn match   asfLineComment   "\v;.*$" contains=@Spell,asfCommentTodo
syn match   asfLineComment   "\v\/\/.*$" contains=@Spell,asfCommentTodo
syn region  asfComment       start="/\*"  end="\*/" contains=@Spell,asfCommentTodo

" string
syn region asfString start="\"" end="\""
syn region asfString start="\'" end="\'"

" @ Indentifiers
" Generic Rule
syn match asfDefinitions "\v(\@)([A-Za-z0-9!?_.]+)" display

" Insert (import/include)
syn match asfInclude "\v\@insert(_once)?" display

" Program keywords
syn match asfMacro "\v\@(MACRO_DEF|PROC_DEF|PATTERN_DEF)(\s+)((\w|\@|\::)*)" display
syn match asfMacro "\v\@(macro_def|proc_def|pattern_def)(\s+)((\w|\@|\::)*)" display

syn match asfFunction "\v\@(FUN_DEF|OBJ_DEF|MAP|TAB|DURING|WHERE|WITHIN)(\s+)((\w|\@|\::)*)" display
syn match asfFunction "\v\@(fun_def|obj_def|map|tab|during|where|within)(\s+)((\w|\@|\::)*)" display

syn match asfGlobal "\v\@global" display

" Events
syn keyword keywordControl case let loop lfwd if else switch whenever curve group gfwd fwd pfwd expr nim forall abort kill
syn keyword asfMusicalEvents atempo newtempo tempo dummysilence event bpm pizzsection rubato staccato transpose variance
syn match asfMusicalEvents "\v(\@)?(fermata|hook|inlet|pizz|staccato|jump)" display

syn keyword asfEventKeyword NOTE CHORD MULTI TRILL EVENT STATE BPM
syn keyword asfEventKeyword note chord multi trill event state bpm

syn match asfActionKeywords "\v\s+\@(assert|broadcast|coef|command|date|dsp_channel|dump|eval_when_load|eval_when_start|external_def|fun_def|global|history_length|init|inlet|is_undef|kill|local|map_history|map_history_date|map_history_rdate|method_def|modulate|obj_def|patterpattern_def|plot|proc_def|rdate|react|refractory|rplot|script_def|signal|tab_history|tab_history_date|tab_history_rdate|tempovar|track_def|type|whenever)" display

syn match asfAttribute "\v\s+\@(ante|coef|conservative|conservative_no_sil|exclusive|grain|action|Action|guard|handling_double|handling_int64|handling_tab|immediate|label|latency|linear_catch_up|loose|mute|name|norec|override|persistent|position|post|progressive|rec_if_alive|solo|staticscope|sync|target|tempo|tempo_max|tempo_min|temporalscope|tight)" display

syn keyword supportFunction cos sin abs action grain target local global type refractory is_undef is_bool is_string is_symbol is_int is_float is_numeric is_map is_interpolatedmap is_tab is_fct atan cos cosh exp log max min pow sqrt floor log10 log2 ceil sinh sin tan car cdr clear concat cons count dim find_index flatten insert lace map member min_val max_val normalize occurs permute push_back push_front rank reduce remove remove_duplicate replace reshape resize reverse rotate scan scramble sort size sputter stutter iota

" $-Identifiers
"
syn match asfVariables "\v(\$)[A-Za-z0-9!?_.]+"

syn match asfConstat "\v\$(NOW|RNOW)"

" syn match constantNumeric "\v((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|([0-9]*\w)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(L|l|UL|ul|u|U|F|f|ll|LL|ull|ULL)?"

let b:current_syntax = "antescofo"

hi def link adfCommentTodo   Todo
hi def link asfComment       Comment
hi def link asfLineComment   Comment

hi def link asfString        String
hi def link asfInclude       Include
hi def link asfDefinitions   Function

hi def link supportFunction  Function

hi def link asfMacro         Macro
hi def link asfFunction      Function

hi def link keywordControl   Keyword
hi def link asfActionKeywords Keyword
hi def link asfAttribute     Keyword
hi def link asfMusicalEvents Special
hi def link asfVariables     Identifier
hi def link asfEventKeyword  Keyword

" hi def link constantNumeric  Number
