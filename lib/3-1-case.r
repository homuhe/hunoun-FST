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


### 3. CASE ###

define CASE [  %+SG%+NOM:0 |
            %+ACCUSATIVE:{<AEÖO>t} |
                %+DATIVE:n{<AE>}k  |
               %+INESIVE:b{<AE>}n  |
              %+ILLATIVE:b{<AE>}   |
             %+SUBLATIVE:r{<AE>}];


#### 4. MORPHOTACTICS #####

regex STEM 0:{<>} CASE;


##### 5. VOWEL HARMONY #####

# A-Stems Accusative
regex {<AEÖO>} -> a || ASTEM {<>} _;
regex {<AEÖO>} -> e || HURVOWEL  CONSONANT+ {<>} _;
regex {<AEÖO>} -> ö || HRVOWEL   CONSONANT+ {<>} _;
regex {<AEÖO>} -> o || LOWVOWEL  CONSONANT+ {<>} _;
regex {<AEÖO>} -> 0 || VOWEL {<>} _;

# applies on ~ 4 cases: Dative, Inesive, Illative, Sublative
regex {<AE>}   -> e || HIGHVOWEL CONSONANT* {<>} [VOWEL|CONSONANT]+ _;
regex {<AE>}   -> a || LOWVOWEL  CONSONANT* {<>} [VOWEL|CONSONANT]+ _;

regex {<>} -> 0;

turn stack
compose net
print lower-words
