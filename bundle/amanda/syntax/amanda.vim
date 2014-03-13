" Vim syntax file
" Language: Amanda Network Backup Configuration File
" Maintainer: Preston Kutzner
" Latest Revision: 2014-03-11

if exists("b:current_syntax")
    finish
endif

if version >= 600
    setlocal iskeyword=_,-,.,a-z,A-Z,48-57
else
    set iskeyword=_,-,.,a-z,A-Z,48-57
endif

syn case ignore

syn case match
syn keyword amandaTodo contained TODO TODO: FIXME FIXME: XXX XXX: NOTE NOTE:
syn case ignore
syn match amandaComment "#.*$" contains=amandaTodo
syn match amandaInt "\<-\?\d\+\>"
syn match amandaFloat "\<-\?\d\+\.\d\+\>"
syn keyword amandaSectDel { }

syn keyword amandaSuffix b byte bytes bps
syn keyword amandaSuffix k kb kbyte kbytes kilobyte kilobytes kps kbps
syn keyword amandaSuffix m mb meg mbyte mbytes megabyte megabytes mps mbps
syn keyword amandaSuffix g gb gbyte gbytes gigabyte gigabytes
syn keyword amandaSuffix t tb tbyte tbytes terabyte terabytes
syn keyword amandaSuffix tape tapes day days week weeks

syn keyword amandaBool   yes no true false on off

syn keyword amandaGlobalConst  all strange error never any other-config
syn keyword amandaGlobalConst  non-amanda volume-error empty first firstfit
syn keyword amandaGlobalConst  largest largestfit smallest last

"syn keyword amandaUnits  k m g t contained
syn match  amandaUnit "\<\d\+\(\.\d\+\)\?\(k\|m\|g\|t\)\>"

syn keyword amandaGlobalKeyword org mailer mailto report-format label-new-tapes
syn keyword amandaGlobalKeyword autolabel meta-autolabel dumpuser printer tapedev
syn keyword amandaGlobalKeyword device-property property tpchanger interactivity
syn keyword amandaGlobalKeyword taperscan changerdev changerfile labelstr tapetype
syn keyword amandaGlobalKeyword dumporder diskfile infofile logdir indexdir
syn keyword amandaGlobalKeyword tapelist amrecover-changer columnspec includefile
syn keyword amandaGlobalKeyword max-dle-by-volume dumpcycle runspercycle tapecycle
syn keyword amandaGlobalKeyword runtapes maxdumpsize taper-parallel-write
syn keyword amandaGlobalKeyword eject-volume ctimeout dtimeout etimeout req-tries
syn keyword amandaGlobalKeyword connect-tries netusage maxdumps bumpsize bumppercent
syn keyword amandaGlobalKeyword bumpdays device-output-buffer-size tapebufs reserve
syn match   amandaGlobalKeyword 'debug-\(days\|auth\|event\|holding\|protocol\)'
syn match   amandaGlobalKeyword 'debug-\(planner\|driver\|dumper\|chunker\|taper\)'
syn keyword amandaGlobalKeyword debug-recovery flush-threshold-dumped bumpmult
syn keyword amandaGlobalKeyword flush-threshold-scheduled report-use-media
syn keyword amandaGlobalKeyword report-next-media usetimestamps amrecover-do-fsf
syn keyword amandaGlobalKeyword amrecover-check-label
syn match   amandaGlobalKeyword '\(un\)?reserved-\(tc\|ud\)p-port'

syn keyword amandaSectionType holdingdisk dumptype tapetype interface application
syn keyword amandaSectionType script device changer interactivity taperscan

syn region  amandaString  start=+"+ skip=+\\\\\|\\"+ end=+"+
syn region  amandaLiteral start=+'+ skip=+\\\\\|\\'+ end=+'+

syn keyword amandaSectionKeyword contained comment directory use chunksize auth
syn keyword amandaSectionKeyword contained amandad-path client-username client-port
syn keyword amandaSectionKeyword contained bumpsize bumppercent bumpmult bumpdays
syn keyword amandaSectionKeyword contained comprate compress client-custom-compress
syn keyword amandaSectionKeyword contained server-custom-compress dumpcycle encrypt
syn keyword amandaSectionKeyword contained client-encrypt client-encrypt-option
syn keyword amandaSectionKeyword contained server-encrypt server-encrypt-option
syn keyword amandaSectionKeyword contained estimate exclude holdingdisk ignore
syn keyword amandaSectionKeyword contained include index kencrypt maxdumps
syn keyword amandaSectionKeyword contained maxpromoteday max-warnings priority
syn keyword amandaSectionKeyword contained program application script property
syn keyword amandaSectionKeyword contained record skip-full skip-incr ssh-keys
syn keyword amandaSectionKeyword contained starttime strategy allow-split
syn keyword amandaSectionKeyword contained tape-splitsize split-diskbuffer
syn keyword amandaSectionKeyword contained fallback-splitsize recovery-limit
syn keyword amandaSectionKeyword contained dump-limit filemark length blocksize
syn keyword amandaSectionKeyword contained readblocksize part-size part-cache-type
syn keyword amandaSectionKeyword contained part-cache-dir part-cache-max-size
syn keyword amandaSectionKeyword contained speed lbl-templ use client-name plugin
syn keyword amandaSectionKeyword contained order single-execution execute-where
syn keyword amandaSectionKeyword contained execute-on

syn keyword amandaSectionValue  contained none client server best fast custom
syn keyword amandaSectionValue  contained calcsize list file optional append never
syn keyword amandaSectionValue  contained auto required low medium high standard
syn keyword amandaSectionValue  contained nofull noinc skip incronly same-host
syn keyword amandaSectionValue  contained disk memory priority
syn match   amandaSectionValue  contained '\(\(pre\|post\)-\(\(\(dle\|host\)-\)\?\(amcheck\|estimate\|backup\)\)\|\(pre\|post\|intr\)-\(level-\)\?recover\)'

syn cluster amandaSectionWords  add=amandaSectionValue,amandaSectionKeyword

syn keyword amandaDefKey define skipwhite nextgroup=amandaSectionDef
syn region  amandaSectionDef matchgroup=amandaSection start="\h\s*\h\s*[-a-zA-Z_0-9]*\s*{" end="}" transparent fold skipwhite skipnl contains=ALLBUT,amandaGlobalKeyword

syn case match
syn case ignore

let b:current_syntax = "amanda"
hi def link amandaTodo           Todo
hi def link amandaComment        Comment
hi def link amandaInt            amandaNumber
hi def link amandaFloat          amandaNumber
hi def link amandaNumber         Number
hi def link amandaGlobalConst    amandaKeyword
hi def link amandaSectionValue   amandaKeyword
hi def link amandaSuffix         amandaKeyword
hi def link amandaKeyword        Keyword
hi def link amandaGlobalKeyword  amandaType
hi def link amandaSectionKeyword amandaType
hi def link amandaType           Type
hi def link amandaUnit           Constant
hi def link amandaSectionType    Keyword
hi def link amandaSection        amandaFunction
hi def link amandaDefKey         Preproc
hi def link amandaFunction       Function
hi def link amandaDumpValue      Special
hi def link amandaBool           Boolean
hi def link amandaString         amandaStrings
hi def link amandaLiteral        amandaStrings
hi def link amandaStrings        String
hi def link amandaSectDel        Statement
