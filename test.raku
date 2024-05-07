say 'Raku';

say '$*CWD ' ~ $*CWD; # 運行目錄
say '$*EXECUTABLE ' ~ $*EXECUTABLE;
# say $*ARGFILES;
print '@*ARGS ';
say @*ARGS;
say '$*PROGRAM-NAME ' ~ $*PROGRAM-NAME;
say '$*PROGRAM ' ~ $*PROGRAM;

sub script-path {
    return $*PROGRAM.absolute($*CWD).IO.resolve;
}

sub script-dir {
    return script-path.parent;
}

my IO::Path $script-path = script-path;

say "script-path: $script-path";

say $script-path.WHAT();

my IO::Path $script-dir = script-dir;

my IO::Path $e-local = 'e:/local'.IO;

my Str $basename = $e-local.basename;
my IO::Path $parent = $e-local.parent;
say "basename: $basename";
say "parent: $parent";

say $parent.add('local') eq $e-local;

say $script-dir.add('dir') ~~ :e & :d; # 判斷目錄,也有.e .d .f方法
my IO::Path $file =  $script-dir.add('dir/file.txt').resolve;
if $file ~~ :e & :f { # 判斷文件
    say "has $file";
    say $file.s;
}
