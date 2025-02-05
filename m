Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF176C02193
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 00:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pV+yVg74O6M+JjWsYidBH2vKWaB+LVbg5Losiv7J8Tk=; b=E5RjMmmtrZDccwijNoppg3wMLG
	sCbnUohbtbHtfoNVk1Dg8IUlzWNqxIM86cOsYxxuoL38tS7H7606IvIjJuuJEBCN0HH7vupT474dH
	p4KccvuXXXWl6aK8YHhT2HhDoEm+Pk+c5wkSDVeLKQT6aTk/q7BIdDE835DhV6lde+x1HGfpcLsND
	AbbFG/oUgOrWvaCPKPAYZZtdO8DXApCr/6t9A29XPwGF99U5QBRK/HJVVOZy0seyOIqrjVd4NpdRR
	CoZLREeyxYJUiYFRQhD7/GzeJVf+4FCknltxHUj4gDGi787pTRTsZznDtHy9zKQhbTluookW+nWKu
	8A1myXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfTF8-00000001vZb-1BTW;
	Wed, 05 Feb 2025 00:26:14 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfTDm-00000001vTe-3MJW;
	Wed, 05 Feb 2025 00:24:51 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e549be93d5eso6633268276.1;
        Tue, 04 Feb 2025 16:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738715089; x=1739319889; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pV+yVg74O6M+JjWsYidBH2vKWaB+LVbg5Losiv7J8Tk=;
        b=YcQbro85guvMG5+JUaPLLQ0hkJwYv4G6YLRJVPaC/1J66FoXxc4aILwj7IF2i4fhZF
         KY2+NNJIcBBqpnyYp2Dil8Z0hhwwD3SUBys0F3vpIOV+ickQ64k3FJvvwpWGjoEeqg7A
         PCX9fPvFy+fq6OjtlneUx4tHtahwdRxSHy5moCiEikc6SszBSE9fJT5DZu0b1hoK+h/y
         RLWUn8KcWq2yE3RrDxgX85/vUTFJotHOkNu65pugsZ3/ODXqzjnfcMlt8IUypwDPurbf
         NFEE1tiHt81oegOvOqieJjT3kBJHN323da3REfu7lYyggMy+PSEva/vTZRg6IfV3hKuW
         ZR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738715089; x=1739319889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pV+yVg74O6M+JjWsYidBH2vKWaB+LVbg5Losiv7J8Tk=;
        b=iDiaVq8bv7/piGMXzuc6ZRLXEHtppamnVcDlR7YwEUlbm32O1k4nmMvDNR62CrtVDq
         XfbsfsVUZa5iUBuIt5Qlb9FXI2kr2xUVDAuuLMyE4n9TWxu0Nmc2LXIQpkg/fw31sKOn
         mWjKu8R6KJbhEH7DSpu5w9SsC7k6fRCBcjLbzD0rgWBsDhtdPql9/m3ICpnbIF66rkkI
         5tY53Y5gvjMCRYouwPLVwKYxBoHixAuzq7msR2ZtUUhgH5VCQink0fXSavhktozuJj9P
         hMwwjkoDGBqd2YD37SEq8LJRmm/i1xf8VLza8Z3PtinMCp08Wx52p/jPcdVYm0vyiQj1
         5UNg==
X-Forwarded-Encrypted: i=1; AJvYcCUUvE0ArKt6LSzLEUnI0Wku5DOR9JbUFe18Mc//n9SKn6TtTgtZVIKwyJ4XMrzjA6y31RnOgjnKEUK9p4LGYASj@lists.infradead.org, AJvYcCV5ZIJOGHVNXKACNOSi3kTt83rBRVZpv4sG5mj8+8zO6RZXNwYvIrgObODmpYIggC0e494EXc8fn1bs0jA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxW9cQsvwKYMLegvg/YsgYDreFcCFo9Jaem0Sannz8yKBwTvR7a
	sEg9N04PRCG9nhS9+wApZxW3csLZ8UY1Aj4bJoLr0By+n/jLxq0Vh+ZJ8bzEcnLFDaZ2LP9C2L+
	IFpmAL4W9FDcjMRvwwhGAFSwKyyE=
X-Gm-Gg: ASbGncuj0iaF/Eg+8adNhP/V+IU9NKF4FBBf2yN71NZAqqpI/TjE+kYGdmKHJKGdYLU
	tYEGZkkSna22fa3BF7eTWSBrUKWoxujUyYZ9+ihyqk7uDWNhBg4XZ/K3Zfp3c6IymNdQFiMA=
X-Google-Smtp-Source: AGHT+IFlsq7s2GXQcMJV9ME/Neo9VjBp8UIKcRBwptanpGVug8P8PrIq9QJK6U7+DKwL96DfTVdCKiUymMLMc3Gqjc4=
X-Received: by 2002:a05:690c:4c09:b0:6f9:7e35:67a3 with SMTP id
 00721157ae682-6f989f58ad8mr9941447b3.28.1738715089289; Tue, 04 Feb 2025
 16:24:49 -0800 (PST)
MIME-Version: 1.0
References: <20250201071455.718247-1-irogers@google.com> <20250201071455.718247-7-irogers@google.com>
In-Reply-To: <20250201071455.718247-7-irogers@google.com>
From: Howard Chu <howardchu95@gmail.com>
Date: Tue, 4 Feb 2025 16:24:38 -0800
X-Gm-Features: AWEUYZnskUbLhOOdO0dxqAGDHNNLRcx4pR85s1wteJQdCeOlkqATDMc8AaJSwc0
Message-ID: <CAH0uvoiAAYcKOUVMd9saq7FabroD-VcWdD2JTxQ5ZRf2OHkh=w@mail.gmail.com>
Subject: Re: [PATCH v1 6/7] perf syscalltbl: Use lookup table containing
 multiple architectures
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_162450_835090_BD690DE1 
X-CRM114-Status: GOOD (  25.43  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

On Fri, Jan 31, 2025 at 11:15=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> Switch to use the lookup table containing all architectures rather
> than tables matching the perf binary.
>
> This fixes perf trace when executed on a 32-bit i386 binary on an
> x86-64 machine. Note in the following the system call names of the
> 32-bit i386 binary as seen by an x86-64 perf.
>
> Before:
> ```
>          ? (         ): a.out/447296  ... [continued]: munmap())         =
                                  =3D 0
>      0.024 ( 0.001 ms): a.out/447296 recvfrom(ubuf: 0x2, size: 4160585708=
, flags: DONTROUTE|CTRUNC|TRUNC|DONTWAIT|EOR|WAITALL|FIN|SYN|CONFIRM|RST|ER=
RQUEUE|NOSIGNAL|WAITFORONE|BATCH|SOCK_DEVMEM|ZEROCOPY|FASTOPEN|CMSG_CLOEXEC=
|0x91f80000, addr: 0xe30, addr_len: 0xffce438c) =3D 1475198976
>      0.042 ( 0.003 ms): a.out/447296 lgetxattr(name: "", value: 0x3, size=
: 34)                             =3D 4160344064
>      0.054 ( 0.003 ms): a.out/447296 dup2(oldfd: -134422744, newfd: 4)   =
                                  =3D -1 ENOENT (No such file or directory)
>      0.060 ( 0.009 ms): a.out/447296 preadv(fd: 4294967196, vec: (struct =
iovec){.iov_base =3D (void *)0x2e646c2f6374652f,.iov_len =3D (__kernel_size=
_t)7307199665335594867,}, vlen: 557056, pos_h: 4160585708) =3D 3
>      0.074 ( 0.004 ms): a.out/447296 lgetxattr(name: "", value: 0x1, size=
: 2)                              =3D 4160237568
>      0.080 ( 0.001 ms): a.out/447296 lstat(filename: "", statbuf: 0x193f6=
)                                 =3D 0
>      0.089 ( 0.007 ms): a.out/447296 preadv(fd: 4294967196, vec: (struct =
iovec){.iov_base =3D (void *)0x3833692f62696c2f,.iov_len =3D (__kernel_size=
_t)3276497845987585334,}, vlen: 557056, pos_h: 4160585708) =3D 3
>      0.097 ( 0.002 ms): a.out/447296 close(fd: 3</proc/447296/status>)   =
                                  =3D 512
>      0.103 ( 0.002 ms): a.out/447296 lgetxattr(name: "", value: 0x1, size=
: 2050)                           =3D 4157935616
>      0.107 ( 0.007 ms): a.out/447296 lgetxattr(pathname: "", name: "", va=
lue: 0x5, size: 2066)             =3D 4158078976
>      0.116 ( 0.003 ms): a.out/447296 lgetxattr(pathname: "", name: "", va=
lue: 0x1, size: 2066)             =3D 4159639552
>      0.121 ( 0.003 ms): a.out/447296 lgetxattr(pathname: "", name: "", va=
lue: 0x3, size: 2066)             =3D 4160184320
>      0.129 ( 0.002 ms): a.out/447296 lgetxattr(pathname: "", name: "", va=
lue: 0x3, size: 50)               =3D 4160196608
>      0.138 ( 0.001 ms): a.out/447296 lstat(filename: "")                 =
                                  =3D 0
>      0.145 ( 0.002 ms): a.out/447296 mq_timedreceive(mqdes: 4291706800, u=
_msg_ptr: 0xf7f9ea48, msg_len: 134616640, u_msg_prio: 0xf7fd7fec, u_abs_tim=
eout: (struct __kernel_timespec){.tv_sec =3D (__kernel_time64_t)-5781740277=
77317696,.tv_nsec =3D (long long int)4160349376,}) =3D 0
>      0.148 ( 0.001 ms): a.out/447296 mkdirat(dfd: -134617816, pathname: "=
 =EF=BF=BD=EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=BD=E2=96=92=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=E2=96=92=EF=BF=BD=EF=BF=BD=EF=BF=BD", mode: IFREG|ISUID|=
IRUSR|IWGRP|0xf7fd0000) =3D 447296
>      0.150 ( 0.001 ms): a.out/447296 process_vm_writev(pid: -134617812, l=
vec: (struct iovec){.iov_base =3D (void *)0xf7f9e9c8f7f9e4c0,.iov_len =3D (=
__kernel_size_t)4160349376,}, liovcnt: 4160588048, rvec: (struct iovec){}, =
riovcnt: 4160585708, flags: 4291707352) =3D 0
>      0.197 ( 0.004 ms): a.out/447296 capget(header: 4160184320, dataptr: =
8192)                             =3D 0
>      0.202 ( 0.002 ms): a.out/447296 capget(header: 1448669184, dataptr: =
4096)                             =3D 0
>      0.208 ( 0.002 ms): a.out/447296 capget(header: 4160577536, dataptr: =
8192)                             =3D 0
>      0.220 ( 0.001 ms): a.out/447296 getxattr(pathname: "", name: "c=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD", value: 0xf7f77e34, si=
ze: 1)  =3D 0
>      0.228 ( 0.005 ms): a.out/447296 fchmod(fd: -134729728, mode: IRUGO|I=
WUGO|IFREG|IFIFO|ISVTX|IXUSR|0x10000) =3D 0
>      0.240 ( 0.009 ms): a.out/447296 preadv(fd: 4294967196, vec: 0x5658e0=
08, pos_h: 4160192052)            =3D 3
>      0.250 ( 0.008 ms): a.out/447296 close(fd: 3</proc/447296/status>)   =
                                  =3D 1436
>      0.260 ( 0.018 ms): a.out/447296 stat(filename: "", statbuf: 0xffce32=
ac)                               =3D 1436
>      0.288 (1000.213 ms): a.out/447296 readlinkat(buf: 0xffce31d4, bufsiz=
: 4291703244)                       =3D 0
> ```
>
> After:
> ```
>          ? (         ): a.out/442930  ... [continued]: execve())         =
                                  =3D 0
>      0.023 ( 0.002 ms): a.out/442930 brk()                               =
                                  =3D 0x57760000
>      0.052 ( 0.003 ms): a.out/442930 access(filename: 0xf7f5af28, mode: R=
)                                 =3D -1 ENOENT (No such file or directory)
>      0.059 ( 0.009 ms): a.out/442930 openat(dfd: CWD, filename: "/etc/ld.=
so.cache", flags: RDONLY|CLOEXEC|LARGEFILE) =3D 3
>      0.078 ( 0.001 ms): a.out/442930 close(fd: 3</proc/442930/status>)   =
                                  =3D 0
>      0.087 ( 0.007 ms): a.out/442930 openat(dfd: CWD, filename: "/lib/i38=
6-linux-", flags: RDONLY|CLOEXEC|LARGEFILE) =3D 3
>      0.095 ( 0.002 ms): a.out/442930 read(fd: 3</proc/442930/status>, buf=
: 0xffbdbb70, count: 512)         =3D 512
>      0.135 ( 0.001 ms): a.out/442930 close(fd: 3</proc/442930/status>)   =
                                  =3D 0
>      0.148 ( 0.001 ms): a.out/442930 set_tid_address(tidptr: 0xf7f2b528) =
                                  =3D 442930 (a.out)
>      0.150 ( 0.001 ms): a.out/442930 set_robust_list(head: 0xf7f2b52c, le=
n: 12)                            =3D
>      0.196 ( 0.004 ms): a.out/442930 mprotect(start: 0xf7f03000, len: 819=
2, prot: READ)                    =3D 0
>      0.202 ( 0.002 ms): a.out/442930 mprotect(start: 0x5658e000, len: 409=
6, prot: READ)                    =3D 0
>      0.207 ( 0.002 ms): a.out/442930 mprotect(start: 0xf7f63000, len: 819=
2, prot: READ)                    =3D 0
>      0.230 ( 0.005 ms): a.out/442930 munmap(addr: 0xf7f10000, len: 103414=
)                                 =3D 0
>      0.244 ( 0.010 ms): a.out/442930 openat(dfd: CWD, filename: 0x5658d00=
8)                                =3D 3
>      0.255 ( 0.007 ms): a.out/442930 read(fd: 3</proc/442930/status>, buf=
: 0xffbdb67c, count: 4096)        =3D 1436
>      0.264 ( 0.018 ms): a.out/442930 write(fd: 1</dev/pts/4>, buf: , coun=
t: 1436)                          =3D 1436
>      0.292 (1000.173 ms): a.out/442930 clock_nanosleep(rqtp: { .tv_sec: 1=
7866546940376776704, .tv_nsec: 4159878336 }, rmtp: 0xffbdb59c) =3D 0
>   1000.478 (         ): a.out/442930 exit_group()                        =
                                  =3D ?
> ```
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/util/syscalltbl.c | 89 ++++++++++++++++++++++++++----------
>  1 file changed, 64 insertions(+), 25 deletions(-)
>
> diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
> index 760ac4d0869f..572083ba1efe 100644
> --- a/tools/perf/util/syscalltbl.c
> +++ b/tools/perf/util/syscalltbl.c
> @@ -15,16 +15,39 @@
>  #include <string.h>
>  #include "string2.h"
>
> -#if __BITS_PER_LONG =3D=3D 64
> -  #include <asm/syscalls_64.h>
> -#else
> -  #include <asm/syscalls_32.h>
> -#endif
> +#include "trace/beauty/generated/syscalltbl.c"
>
> -const char *syscalltbl__name(int e_machine __maybe_unused, int id)
> +static const struct syscalltbl *find_table(int e_machine)
>  {
> -       if (id >=3D 0 && id <=3D (int)ARRAY_SIZE(syscall_num_to_name))
> -               return syscall_num_to_name[id];
> +       static const struct syscalltbl *last_table;
> +       static int last_table_machine =3D EM_NONE;
> +
> +       /* Tables only exist for EM_SPARC. */
> +       if (e_machine =3D=3D EM_SPARCV9)
> +               e_machine =3D EM_SPARC;
> +
> +       if (last_table_machine =3D=3D e_machine && e_machine !=3D EM_NONE=
)

I don't think it should be && e_machine !=3D EM_NONE. last_table_machine
=3D=3D e_machine =3D=3D EM_NONE could mean last_table being uninitialized, =
but
what if the called *is* trying to search for e_machine =3D=3D EM_NONE? Now
perf will need to traverse the whole syscalltbls array just to find
the last EM_NONE table.

My suggestion is:

static const struct syscalltbl *last_table =3D NULL;

and then:

if (last_table_machine =3D=3D e_machine && last_table)
    return last_table;

Thanks,
Howard

> +               return last_table;
> +
> +       for (size_t i =3D 0; i < ARRAY_SIZE(syscalltbls); i++) {
> +               const struct syscalltbl *entry =3D &syscalltbls[i];
> +
> +               if (entry->e_machine !=3D e_machine && entry->e_machine !=
=3D EM_NONE)
> +                       continue;
> +
> +               last_table =3D entry;
> +               last_table_machine =3D e_machine;
> +               return entry;
> +       }
> +       return NULL;
> +}
> +
> +const char *syscalltbl__name(int e_machine, int id)
> +{
> +       const struct syscalltbl *table =3D find_table(e_machine);
> +
> +       if (table && id >=3D 0 && id < table->num_to_name_len)
> +               return table->num_to_name[id];
>         return NULL;
>  }
>
> @@ -41,38 +64,54 @@ static int syscallcmpname(const void *vkey, const voi=
d *ventry)
>         return strcmp(key->name, key->tbl[*entry]);
>  }
>
> -int syscalltbl__id(int e_machine __maybe_unused, const char *name)
> +int syscalltbl__id(int e_machine, const char *name)
>  {
> -       struct syscall_cmp_key key =3D {
> -               .name =3D name,
> -               .tbl =3D syscall_num_to_name,
> -       };
> -       const int *id =3D bsearch(&key, syscall_sorted_names,
> -                               ARRAY_SIZE(syscall_sorted_names),
> -                               sizeof(syscall_sorted_names[0]),
> -                               syscallcmpname);
> +       const struct syscalltbl *table =3D find_table(e_machine);
> +       struct syscall_cmp_key key;
> +       const int *id;
> +
> +       if (!table)
> +               return -1;
> +
> +       key.name =3D name;
> +       key.tbl =3D table->num_to_name;
> +       id =3D bsearch(&key, table->sorted_names, table->sorted_names_len=
,
> +                    sizeof(table->sorted_names[0]), syscallcmpname);
>
>         return id ? *id : -1;
>  }
>
> -int syscalltbl__num_idx(int e_machine __maybe_unused)
> +int syscalltbl__num_idx(int e_machine)
>  {
> -       return ARRAY_SIZE(syscall_sorted_names);
> +       const struct syscalltbl *table =3D find_table(e_machine);
> +
> +       if (!table)
> +               return 0;
> +
> +       return table->sorted_names_len;
>  }
>
> -int syscalltbl__id_at_idx(int e_machine __maybe_unused, int idx)
> +int syscalltbl__id_at_idx(int e_machine, int idx)
>  {
> -       return syscall_sorted_names[idx];
> +       const struct syscalltbl *table =3D find_table(e_machine);
> +
> +       if (!table)
> +               return -1;
> +
> +       assert(idx >=3D 0 && idx < table->sorted_names_len);
> +       return table->sorted_names[idx];
>  }
>
> -int syscalltbl__strglobmatch_next(int e_machine __maybe_unused, const ch=
ar *syscall_glob, int *idx)
> +int syscalltbl__strglobmatch_next(int e_machine, const char *syscall_glo=
b, int *idx)
>  {
> -       for (int i =3D *idx + 1; i < (int)ARRAY_SIZE(syscall_sorted_names=
); ++i) {
> -               const char *name =3D syscall_num_to_name[syscall_sorted_n=
ames[i]];
> +       const struct syscalltbl *table =3D find_table(e_machine);
> +
> +       for (int i =3D *idx + 1; table && i < table->sorted_names_len; ++=
i) {
> +               const char *name =3D table->num_to_name[table->sorted_nam=
es[i]];
>
>                 if (strglobmatch(name, syscall_glob)) {
>                         *idx =3D i;
> -                       return syscall_sorted_names[i];
> +                       return table->sorted_names[i];
>                 }
>         }
>
> --
> 2.48.1.362.g079036d154-goog
>

