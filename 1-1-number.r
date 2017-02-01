# HUNGARIAN NOUN DECLENSION

# 1. STEMS #
define ASTEM  [{ház} | {toll}  | {híd}  | {úr}];
define NOUN   [{nap} | {ember} | {kert} | {hajó} | {gyümölcs}];
define STEM   [ASTEM | NOUN];

## 2. VOWELS & CONSONANTS ##
define HIGHVOWEL  [ e | é | ö | ő | ü | ű | i | í ];
define LOWVOWEL   [ a | á | o | ó | u | ú ];
define HRVOWEL    [ ö | ő | ü | ű ];          #high rounded vowels
define HURVOWEL   [ e | é | i | í ];          #high unrounded vowels
define VOWEL      [HIGHVOWEL | LOWVOWEL];

define CONSONANT [b|c|d|f|g|h|j|k|l|m|n|p|q|r|s|t|v|w|x|y|z];


### 3. NUMBER ###

define NUMBER [%+PL:{<AEÖO>k} | %+SG:0];


#### 4. MORPHOTACTICS #####

regex STEM NUMBER;


##### 5. VOWEL HARMONY #####

regex {<AEÖO>} -> a || ASTEM _;
regex {<AEÖO>} -> e || HURVOWEL CONSONANT+ _;
regex {<AEÖO>} -> ö || HRVOWEL  CONSONANT+ _;
regex {<AEÖO>} -> o || LOWVOWEL CONSONANT+ _;
regex {<AEÖO>} -> 0 || VOWEL _;

turn stack
compose net
print lower-words
