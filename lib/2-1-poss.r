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


### 3. POSSESSION ###

define POSS [  %+1SG%-POSS:{<AEÖO>m}      | %+1SG%-POSS:{<JAE>im}     |
               %+2SG%-POSS:{<AEÖO>d}      | %+2SG%-POSS:{<JAE>id}     |
               %+3SG%-POSS:{<JAE2>}       | %+3SG%-POSS:{<JAE>i}      |
               %+1PL%-POSS:{<ÜU>nk}       | %+1PL%-POSS:{<JAE>ink}    |
               %+2PL%-POSS:{<AEÖOT>k}     | %+2PL%-POSS:{<JAEIT>k}    |
               %+3PL%-POSS:{j<ÜU>k}       | %+3PL%-POSS:{<JAE>ik}     ];


#### 4. MORPHOTACTICS #####

regex STEM 0:{<>} POSS;


##### 5. VOWEL HARMONY #####

# Singular Possession
regex {<AEÖO>} -> a || ASTEM {<>} _;
regex {<AEÖO>} -> e || HURVOWEL  CONSONANT+ {<>} _;
regex {<AEÖO>} -> ö || HRVOWEL   CONSONANT+ {<>} _;
regex {<AEÖO>} -> o || LOWVOWEL  CONSONANT+ {<>} _;
regex {<AEÖO>} -> 0 || VOWEL {<>} _;

# Plural Possession, can be omitted if vocalic ending
regex {<JAE>} ->{je}|| HIGHVOWEL CONSONANT+ {<>} _;
regex {<JAE>} ->{ja}|| LOWVOWEL  CONSONANT+ {<>} _;
regex {<JAE>} -> 0  || VOWEL {<>} _;

# Singular Possession 3SG, obligatory
regex {<JAE2>}->{je}|| HIGHVOWEL CONSONANT* {<>} _;
regex {<JAE2>}->{ja}|| LOWVOWEL  CONSONANT* {<>} _;

# Singular Possession 3PL, can be omitted if vocalic ending
regex {<ÜU>}  -> ü || HIGHVOWEL CONSONANT+ {<>} (j) _;
regex {<ÜU>}  -> u || LOWVOWEL  CONSONANT+ {<>} (j) _;
regex {<ÜU>}  -> 0 || VOWEL {<>} (j) _;

# Singular Possession 2PL
regex {<AEÖOT>} -> {ato} || ASTEM {<>} _;
regex {<AEÖOT>} -> {ete} || HURVOWEL  CONSONANT+ {<>} _;
regex {<AEÖOT>} -> {ötö} || HRVOWEL   CONSONANT+ {<>} _;
regex {<AEÖOT>} -> {oto} || LOWVOWEL  CONSONANT+ {<>} _;
regex {<AEÖOT>} -> {te}  || HURVOWEL  {<>} _;
regex {<AEÖOT>} -> {tö}  || HRVOWEL   {<>} _;
regex {<AEÖOT>} -> {to}  || LOWVOWEL  {<>} _;

# Plural Possession 2PL
regex {<JAEIT>} -> {jeite} || HIGHVOWEL CONSONANT+ {<>} _;
regex {<JAEIT>} -> {jaito} || LOWVOWEL  CONSONANT+ {<>} _;
regex {<JAEIT>} -> {ite}   || HIGHVOWEL {<>} _;
regex {<JAEIT>} -> {ito}   || LOWVOWEL  {<>} _;

regex {<>} -> 0;

turn stack
compose net
print lower-words
