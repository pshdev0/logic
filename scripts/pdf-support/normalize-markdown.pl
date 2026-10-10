#!/usr/bin/env perl

use strict;
use warnings;

my @input = <STDIN>;
my @normalized;
my $inside_fence = 0;
my $fence_indent = '';
my $inside_display_math = 0;

for my $line (@input) {
    if (!$inside_fence && $line =~ /^([ \t]*)```/) {
        $inside_fence = 1;
        $fence_indent = $1;
        $line =~ s/^\Q$fence_indent\E// if length $fence_indent;
        push @normalized, $line;
        next;
    }

    if ($inside_fence) {
        $line =~ s/^\Q$fence_indent\E// if length $fence_indent;
        push @normalized, $line;
        if ($line =~ /^```\s*$/) {
            $inside_fence = 0;
            $fence_indent = '';
        }
        next;
    }

    if (!$inside_display_math && $line =~ /^(.*?)\$\$(.+?)\$\$(.*)$/) {
        my ($before, $math, $after) = ($1, $2, $3);
        $before =~ s/^\t//;
        $after =~ s/^\t//;
        if ($before =~ /\S/ || $after =~ /\S/) {
            push @normalized, "$before\n" if $before =~ /\S/;
            push @normalized, "\n" if @normalized && $normalized[-1] !~ /^\s*$/;
            push @normalized, "\$\$$math\$\$\n";
            push @normalized, "\n";
            push @normalized, "$after\n" if $after =~ /\S/;
            next;
        }
    }

    if (!$inside_display_math && $line =~ /^(.*\S)\$\$\s*$/
        && $line !~ /^\s*\$\$/) {
        my $prose = $1;
        push @normalized, "$prose\n";
        push @normalized, "\n";
        push @normalized, "\$\$\n";
        $inside_display_math = 1;
        next;
    }

    if (!$inside_display_math && $line =~ /^\s*\$\$/) {
        if (@normalized && $normalized[-1] !~ /^\s*$/) {
            push @normalized, "\n";
        }
        push @normalized, $line;

        my $delimiter_count = () = $line =~ /\$\$/g;
        if ($delimiter_count >= 2) {
            push @normalized, "\n";
        } else {
            $inside_display_math = 1;
        }
        next;
    }

    if ($inside_display_math) {
        if ($line =~ /^\s*\$\$(\S.*)$/) {
            push @normalized, "\$\$\n";
            push @normalized, "\n";
            $inside_display_math = 0;
            $line = "$1\n";
        } else {
            push @normalized, $line;
            if ($line =~ /\$\$\s*$/) {
                $inside_display_math = 0;
                push @normalized, "\n";
            }
            next;
        }
    }

    # Obsidian tolerates tab-indented prose that Pandoc can interpret as code.
    $line =~ s/^\t//;

    # Make headings and lists unambiguous to Pandoc without changing the source.
    if ($line =~ /^(?:#{1,6}\s|[*+-]\s)/
        && @normalized
        && $normalized[-1] !~ /^\s*$/) {
        push @normalized, "\n";
    }

    push @normalized, $line;
}

print @normalized;
