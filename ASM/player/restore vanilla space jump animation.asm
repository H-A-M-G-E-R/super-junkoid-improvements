lorom

org $91B391 ; revert space jump animation delays back to vanilla (for custom sprites other than junko)
db $04,
   $01, $01, $01, $01, $01, $01, $01, $01, $FE,$08,
   $08, $FF ; Wall jump eligible