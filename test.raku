sub show($msg, $n) {
    print "$msg ({$n.^name}): ";
    say $n;
}

show('$*CWD', $*CWD);

show('$*EXECUTABLE', $*EXECUTABLE);

# say $*ARGFILES;

say @*ARGS.WHAT(); # Array
print '@*ARGS ';
say @*ARGS;

show('$*PROGRAM-NAME', $*PROGRAM-NAME);

show('$*PROGRAM', $*PROGRAM);

sub script-path( --> IO::Path ) {
    return $*PROGRAM.absolute($*CWD).IO.resolve;
}

sub script-dir( --> IO::Path ) {
    return script-path.parent;
}

my IO::Path $script-path = script-path;

say "script-path: $script-path";

say $script-path.WHAT();

my IO::Path $script-dir = script-dir;

say $script-dir.add('dir') ~~ :e & :d; # 判斷目錄,也有.e .d .f方法
my IO::Path $file =  $script-dir.add('dir/file.txt').resolve;
if $file ~~ :e & :f { # 判斷文件
    say "has $file";
    my Str $basename = $file.basename;
    my IO::Path $parent = $file.parent;
    say "basename: $basename";
    say "parent: $parent";
    say "size: {$file.s}";
}
