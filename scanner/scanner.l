/*
    First pass C-- scanner rules
    Also last pass C-- scanner rules.  Yay!

    Author: Robert Crocombe
    Class: CS453
    Professor: Debray
    Pudding: Chocolate

    Identical results against these files in the Linux kernel

../tests/acct.c		 ../tests/aio.c		  ../tests/attr.c
../tests/audit.c	 ../tests/auditsc.c	  ../tests/bad_inode.c
../tests/binfmt_aout.c	 ../tests/binfmt_elf.c	  ../tests/binfmt_em86.c
../tests/binfmt_flat.c	 ../tests/binfmt_misc.c   ../tests/binfmt_script.c
../tests/binfmt_som.c	 ../tests/bio.c		  ../tests/block_dev.c
../tests/buffer.c	 ../tests/capability.c	  ../tests/char_dev.c
../tests/compat.c	 ../tests/compat_ioctl.c  ../tests/configs.c
../tests/cpu.c		 ../tests/dcache.c	  ../tests/dcookies.c
../tests/direct-io.c	 ../tests/dma.c		  ../tests/dnotify.c
../tests/dquot.c	 ../tests/eventpoll.c	  ../tests/exec.c
../tests/exec_domain.c	 ../tests/exit.c	  ../tests/extable.c
../tests/fcntl.c	 ../tests/fifo.c	  ../tests/file.c
../tests/file_table.c	 ../tests/filesystems.c   ../tests/fork.c
../tests/fs-writeback.c  ../tests/futex.c	  ../tests/inode.c
../tests/intermodule.c	 ../tests/ioctl.c	  ../tests/itimer.c
../tests/kallsyms.c	 ../tests/kmod.c	  ../tests/kthread.c
../tests/libfs.c	 ../tests/locks.c	  ../tests/mbcache.c
../tests/module.c	 ../tests/mpage.c	  ../tests/namei.c
../tests/namespace.c	 ../tests/nfsctl.c	  ../tests/open.c
../tests/panic.c	 ../tests/params.c	  ../tests/pid.c
../tests/pipe.c		 ../tests/posix-timers.c  ../tests/posix_acl.c
../tests/printk.c	 ../tests/profile.c	  ../tests/ptrace.c
../tests/quota.c	 ../tests/quota_v1.c	  ../tests/quota_v2.c
../tests/rcupdate.c	 ../tests/read_write.c	  ../tests/readdir.c
../tests/resource.c	 ../tests/sched.c	  ../tests/select.c
../tests/seq_file.c	 ../tests/signal.c	  ../tests/softirq.c
../tests/stat.c		 ../tests/stop_machine.c  ../tests/super.c
../tests/sys.c		 ../tests/sysctl.c	  ../tests/time.c
../tests/timer.c	 ../tests/uid16.c	  ../tests/user.c
../tests/workqueue.c	 ../tests/xattr.c	  ../tests/xattr_acl.c

    515 ../tests/acct.c
    .
    .
    .
     99 ../tests/xattr_acl.c
  72085 total
*/

/* Definitions */
%{
    #include "tokens.h"
    int line_number = 1;
%}

ID [[:alpha:]][[:alnum:]_]*
/* I gave up and simply iterated through the damn things */
PRINTABLE [- !#$%&()*+,./0-9:;<=>?@A-Z[\]^_`a-z{|}~]

INT_CONSTANT [[:digit:]]+
/* Wow, this was *way* subtler than I thought.  Or I'm dumb.  Either/or. */
CHAR_CONSTANT ({PRINTABLE}|\\0|\"|\\n)
STRING_CONSTANT ({PRINTABLE}|\\|'|\\0|\\n)*

EXTERN extern
VOID void
CHAR char
INT int
IF if
ELSE else
WHILE while
FOR for
RETURN return
AND &&
OR \|{2}
EQUALS  ==
NEQUALS !=
LTE <=
GTE >=

%%

\n                      ++line_number;
[ \t]*                  /* eat whitespace */
{EXTERN}                return EXTERN;
{VOID}                  return VOID;
{CHAR}                  return CHAR;
{INT}                   return INT;
{IF}                    return IF;
{ELSE}                  return ELSE;
{WHILE}                 return WHILE;
{FOR}                   return FOR;
{RETURN}                return RETURN;
{EQUALS}                return EQ;
{NEQUALS}               return NE;
{LTE}                   return LE;
{GTE}                   return GE;
{AND}                   return AND;
{OR}                    return OR;
{ID}                    return ID;
{INT_CONSTANT}          return INTCON;
\"{STRING_CONSTANT}\"   return STRINGCON;
'{CHAR_CONSTANT}'       return CHARCON;
.                       return *yytext; /* Thanks for making the values align!*/
"/*"        {
                int c;
                for ( ;; )
                {
                    while ( (c = input()) != '*' && (c != EOF) )
                    {
                        line_number += c == '\n';
                        ; /* eat comment */
                    }
                    if ( c == '*' )
                    {
                        while ( (c = input()) == '*' )
                        {
                            /* yum */
                        }
                        if ( c == '/' )
                        {
                            break; /* Found the end*/
                        }
                        line_number += c == '\n';
                    }
                    if ( c == EOF )
                    {
                        fprintf(stderr,"ERROR [line %d]: Unexpected EOF within comment\n", line_number);
                        break;
                    }
                }
            }
