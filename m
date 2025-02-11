Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF56C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 00:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgRW+jb8xL/yqaf5dv4uBNprZKUbytiPaosPPzbYj8o=; b=nbmJek92PaU8OsLLsQkezngzDU
	wbNE0GEjho6glFgRzS395mWx86E9Q299yKft+jsS0gtg0Kxm865Nntu0boZ8VEHoppEU4CaptOHS4
	Py4Q9nHVBUZoiz/7UlRbsjyHeXTzhj97vPPKA5vhdZJdG/TRgl8HEjBPfHbCXcrxUA9oMSV2AUQL7
	3kZ+lfBjuGKnoSG09t6P9vxoCzh9eWUkKZ+m3qQ3L0WWvIBF9IsGw3Ww3J6yiSBT5u/NCrDRhdwGu
	RkxGLHQI5wMtYN5WhnHUYW24F0iT6XhH+iOeNPCfvV+zm5EyECuCcOWE4dKR6WWGFPPbSfUG/By2J
	pbxRSRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1the5T-00000001yE5-1kL4;
	Tue, 11 Feb 2025 00:25:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1the3M-00000001xyo-0kkB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 00:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XgRW+jb8xL/yqaf5dv4uBNprZKUbytiPaosPPzbYj8o=; b=CvgiCGy3PBCuWeRGz7SqqtWm2K
	E6/X2SiXA6Y9Oi+6SJL0owQ9sCTY5hbiEwy84p71cnI85XyWJ0/G4XTvYS5dVu9WPHZDIPiZ2uAPt
	k4WaKzi5nL2H/SIZpoFH+RdlDsd4oUvggP4COkAJQttreklFPQgY0NiQSUCpFF2K/h+njrjc2qG2S
	NtumttkpcaAZEmecyk6Ra8Biklu7Y3BT2QCMvQqiyJl/3SV5ICygK1jLb7ZsQ5slvXnrAgVawzEBM
	wdAO0Mp3sPhqMmcC8l/XDlIeZuruG6t0DthtXTAqd54QEYCcixEn3EFp8M895kCmNB5W2gcAuD110
	Ydr5kRgg==;
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1the3J-00000000OTY-0Eib
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 00:23:02 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e5b1c4b952dso4012038276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 16:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739233378; x=1739838178; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XgRW+jb8xL/yqaf5dv4uBNprZKUbytiPaosPPzbYj8o=;
        b=R68EwUO5ZtAjI40ZDfuNW8XxD+Ywg4EF5HZxLmoGfSucUdIsNWdu7mUkFK6RdE8ZBy
         hSvN/ttiuTGpw7nKWxyxP46YvuZ7WAEyGrhxjLu6Ge4QNFpLyVI75EKuM2+roM2QHl3u
         9xecil6xSUBFTtbkl6Dupfvfjs0HLF77kZOjMst3ClVpDLR9Tl3lezG3Y2XF64Ra/Ott
         LZXWlIIYckozml2BYtdUT8EFsqrq4iG3Pwt1c7xx+LmNQWme+fOpqmsEiXErW47RDbgF
         Qiy1isLmOrAv5v18BSo8zrnBCNl2UGo/lUR6PbSqUsgo8SH0LuQaJTKaADVcgv6hoGsX
         v9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739233378; x=1739838178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgRW+jb8xL/yqaf5dv4uBNprZKUbytiPaosPPzbYj8o=;
        b=Pm0xbCL/5cnbxtenH1VyYBgC2452+v8VinXuE3KyY3n5sXchh6Mkeou8P6FqjSBiCv
         O5DP51e/NBwRogMHNa9VN3iXfeFXyTTE4iUUW9J9lnsRGebcjZ3MQWB1y/KWPSZ0Ju3x
         5wK8vBpSqUjuLndKCmoZ2mn0PwVEFJbemJfBaD3b5D90DYztVDhYf7cdPdmmRRDpQb6g
         FcYJ9vMHqVhEWqRuuroLeuHxEDiF4id237J7x++BuGbZQwP9oCPQPAnZTemb6CFjTooq
         pQX0TiIRHXgEWQvgzMAw2h0c08/1BZUQB29b4NVyDIASrPfwWOuJpxDYHZUoyUkWsgQP
         FSjg==
X-Forwarded-Encrypted: i=1; AJvYcCVGvPwwoEe4rZIaioTtXB0Se0j3I7Q09TTq+BwkV8gvGpIsTXqrpavsL0ibOi30zb7NHlXvuvyMLksT/op4X0wm@lists.infradead.org
X-Gm-Message-State: AOJu0YwYEaKjh/ajZH90UYKNO7whRYIG/uijPkFJ+uIfw7bJUBF6RmG1
	pz+IMEyIzqYMvkbcorUovnt8OMqmucfeRQgG5ImapXP+02Xmx/AZgw3+X6dQwn4=
X-Gm-Gg: ASbGncustwdjrQYknXR+haFPmhIsdDddIGR3K3w+3YU7g5nJ9DupeY4pplW+2g0syzu
	KwgsK7LaCtL+iMfYAw+/GgFMdmYReXVnCAueXPhjm0HdWPGIqGO0QTGFKJnL84qDgHSeYQGeZpo
	86ImjaLdVGyi5EXe49aJ+lXReCHaWfhcI5IzXSKEO6Pumnp9D7zzw/2QeATHzF22/VtcSK7VWeI
	CcTwBfP7aUxcPlglWpYouqE4db0L/28Yy+XIbIuN4ntOaWL8YEj9ISDWONBiwacql7385ecXdXm
	2Hk=
X-Google-Smtp-Source: AGHT+IET3XuWodAlagrxm8iuDillEgUV/nx7D30be+H1DPXeFO6mBrllo5/7tZ9E22QdIf5EyggISw==
X-Received: by 2002:a05:6902:1b01:b0:e5a:b05e:4da5 with SMTP id 3f1490d57ef6-e5b46292799mr13270555276.43.1739233378411;
        Mon, 10 Feb 2025 16:22:58 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a0f5353sm2917617276.0.2025.02.10.16.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:22:57 -0800 (PST)
Date: Mon, 10 Feb 2025 16:22:56 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/7] perf trace beauty: Add syscalltbl.sh generating
 all system call tables
Message-ID: <Z6qYYC3LqXNZ6hMc@ghost>
References: <20250210165108.95894-1-irogers@google.com>
 <20250210165108.95894-6-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210165108.95894-6-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_002301_253164_BCC6E835 
X-CRM114-Status: GOOD (  30.29  )
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

On Mon, Feb 10, 2025 at 08:51:06AM -0800, Ian Rogers wrote:
> Rather than generating individual syscall header files generate a
> single trace/beauty/generated/syscalltbl.c. In a syscalltbls array
> have references to each architectures tables along with the
> corresponding e_machine. When the 32-bit or 64-bit table is ambiguous,
> match the perf binary's type. For ARM32 don't use the arm64 32-bit
> table which is smaller. EM_NONE is present for is no machine matches.
> 
> Conditionally compile the tables, only having the appropriate 32 and
> 64-bit table. If ALL_SYSCALLTBL is defined all tables can be
> compiled.

Is there somewhere that the ALL_SYSCALLTBL could be documented? I talk
about this more in patch 7, but if this also could help perf report
display the correct syscall names, then ALL_SYSCALLTBL maybe should be
the default?

> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> Reviewed-by: Howard Chu <howardchu95@gmail.com>
> ---
>  tools/perf/Makefile.perf              |   9 +
>  tools/perf/trace/beauty/syscalltbl.sh | 274 ++++++++++++++++++++++++++
>  2 files changed, 283 insertions(+)
>  create mode 100755 tools/perf/trace/beauty/syscalltbl.sh
> 
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 55d6ce9ea52f..793e702f9aaf 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -559,6 +559,14 @@ beauty_ioctl_outdir := $(beauty_outdir)/ioctl
>  # Create output directory if not already present
>  $(shell [ -d '$(beauty_ioctl_outdir)' ] || mkdir -p '$(beauty_ioctl_outdir)')
>  
> +syscall_array := $(beauty_outdir)/syscalltbl.c
> +syscall_tbl := $(srctree)/tools/perf/trace/beauty/syscalltbl.sh
> +syscall_tbl_data := $(srctree)/tools/scripts/syscall.tbl \
> +	$(wildcard $(srctree)/tools/perf/arch/*/entry/syscalls/syscall*.tbl)
> +
> +$(syscall_array): $(syscall_tbl) $(syscall_tbl_data)
> +	$(Q)$(SHELL) '$(syscall_tbl)' $(srctree)/tools $@
> +
>  fs_at_flags_array := $(beauty_outdir)/fs_at_flags_array.c
>  fs_at_flags_tbl := $(srctree)/tools/perf/trace/beauty/fs_at_flags.sh
>  
> @@ -878,6 +886,7 @@ build-dir   = $(or $(__build-dir),.)
>  
>  prepare: $(OUTPUT)PERF-VERSION-FILE $(OUTPUT)common-cmds.h archheaders \
>  	arm64-sysreg-defs \
> +	$(syscall_array) \
>  	$(fs_at_flags_array) \
>  	$(clone_flags_array) \
>  	$(drm_ioctl_array) \
> diff --git a/tools/perf/trace/beauty/syscalltbl.sh b/tools/perf/trace/beauty/syscalltbl.sh
> new file mode 100755
> index 000000000000..635924dc5f59
> --- /dev/null
> +++ b/tools/perf/trace/beauty/syscalltbl.sh
> @@ -0,0 +1,274 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Generate all syscall tables.
> +#
> +# Each line of the syscall table should have the following format:
> +#
> +# NR ABI NAME [NATIVE] [COMPAT]
> +#
> +# NR       syscall number
> +# ABI      ABI name
> +# NAME     syscall name
> +# NATIVE   native entry point (optional)
> +# COMPAT   compat entry point (optional)
> +
> +set -e
> +
> +usage() {
> +       cat >&2 <<EOF
> +usage: $0 <TOOLS DIRECTORY> <OUTFILE>
> +
> +  <TOOLS DIRECTORY>    path to kernel tools directory
> +  <OUTFILE>            output header file
> +EOF
> +       exit 1
> +}
> +
> +if [ $# -ne 2 ]; then
> +       usage
> +fi
> +tools_dir=$1
> +outfile=$2
> +
> +build_tables() {
> +	infile="$1"
> +	outfile="$2"
> +	abis=$(echo "($3)" | tr ',' '|')
> +	e_machine="$4"
> +
> +	if [ ! -f "$infile" ]
> +	then
> +		echo "Missing file $infile"
> +		exit 1
> +	fi
> +	sorted_table=$(mktemp /tmp/syscalltbl.XXXXXX)
> +	grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | sort -n > "$sorted_table"
> +
> +	echo "static const char *const syscall_num_to_name_${e_machine}[] = {" >> "$outfile"
> +	# the params are: nr abi name entry compat
> +	# use _ for intentionally unused variables according to SC2034
> +	while read -r nr _ name _ _; do
> +		echo "	[$nr] = \"$name\"," >> "$outfile"
> +	done < "$sorted_table"
> +	echo "};" >> "$outfile"
> +
> +	echo "static const uint16_t syscall_sorted_names_${e_machine}[] = {" >> "$outfile"
> +
> +	# When sorting by name, add a suffix of 0s upto 20 characters so that
> +	# system calls that differ with a numerical suffix don't sort before
> +	# those without. This default behavior of sort differs from that of
> +	# strcmp used at runtime. Use sed to strip the trailing 0s suffix
> +	# afterwards.
> +	grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | awk '{printf $3; for (i = length($3); i < 20; i++) { printf "0"; }; print " " $1}'| sort | sed 's/\([a-zA-Z1-9]\+\)0\+ \([0-9]\+\)/\1 \2/' > "$sorted_table"
> +	while read -r name nr; do
> +		echo "	$nr,	/* $name */" >> "$outfile"
> +	done < "$sorted_table"
> +	echo "};" >> "$outfile"
> +
> +	rm -f "$sorted_table"
> +}
> +
> +rm -f "$outfile"
> +cat >> "$outfile" <<EOF
> +#include <elf.h>
> +#include <stdint.h>
> +#include <asm/bitsperlong.h>
> +#include <linux/kernel.h>
> +
> +struct syscalltbl {
> +       const char *const *num_to_name;
> +       const uint16_t *sorted_names;
> +       uint16_t e_machine;
> +       uint16_t num_to_name_len;
> +       uint16_t sorted_names_len;
> +};
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__alpha__)
> +EOF
> +build_tables "$tools_dir/perf/arch/alpha/entry/syscalls/syscall.tbl" "$outfile" common,64 EM_ALPHA
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__alpha__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__arm__) || defined(__aarch64__)
> +EOF
> +build_tables "$tools_dir/perf/arch/arm/entry/syscalls/syscall.tbl" "$outfile" common,32,oabi EM_ARM
> +build_tables "$tools_dir/perf/arch/arm64/entry/syscalls/syscall_64.tbl" "$outfile" common,64,renameat,rlimit,memfd_secret EM_AARCH64
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__arm__) || defined(__aarch64__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__csky__)
> +EOF
> +build_tables "$tools_dir/scripts/syscall.tbl" "$outfile" common,32,csky,time32,stat64,rlimit EM_CSKY
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__csky__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__mips__)
> +EOF
> +build_tables "$tools_dir/perf/arch/mips/entry/syscalls/syscall_n64.tbl" "$outfile" common,64,n64 EM_MIPS
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__mips__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__hppa__)
> +#if __BITS_PER_LONG != 64
> +EOF
> +build_tables "$tools_dir/perf/arch/parisc/entry/syscalls/syscall.tbl" "$outfile" common,32 EM_PARISC
> +echo "#else" >> "$outfile"
> +build_tables "$tools_dir/perf/arch/parisc/entry/syscalls/syscall.tbl" "$outfile" common,64 EM_PARISC
> +cat >> "$outfile" <<EOF
> +#endif //__BITS_PER_LONG != 64
> +#endif // defined(ALL_SYSCALLTBL) || defined(__hppa__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__powerpc__) || defined(__powerpc64__)
> +EOF
> +build_tables "$tools_dir/perf/arch/powerpc/entry/syscalls/syscall.tbl" "$outfile" common,32,nospu EM_PPC
> +build_tables "$tools_dir/perf/arch/powerpc/entry/syscalls/syscall.tbl" "$outfile" common,64,nospu EM_PPC64
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__powerpc__) || defined(__powerpc64__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__riscv)
> +#if __BITS_PER_LONG != 64
> +EOF
> +build_tables "$tools_dir/scripts/syscall.tbl" "$outfile" common,32,riscv,memfd_secret EM_RISCV
> +echo "#else" >> "$outfile"
> +build_tables "$tools_dir/scripts/syscall.tbl" "$outfile" common,64,riscv,rlimit,memfd_secret EM_RISCV
> +cat >> "$outfile" <<EOF
> +#endif //__BITS_PER_LONG != 64
> +#endif // defined(ALL_SYSCALLTBL) || defined(__riscv)
> +#if defined(ALL_SYSCALLTBL) || defined(__s390x__)
> +EOF
> +build_tables "$tools_dir/perf/arch/s390/entry/syscalls/syscall.tbl" "$outfile" common,64,renameat,rlimit,memfd_secret EM_S390
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__s390x__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__sh__)
> +EOF
> +build_tables "$tools_dir/perf/arch/sh/entry/syscalls/syscall.tbl" "$outfile" common,32 EM_SH
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__sh__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__sparc64__) || defined(__sparc__)
> +#if __BITS_PER_LONG != 64
> +EOF
> +build_tables "$tools_dir/perf/arch/sparc/entry/syscalls/syscall.tbl" "$outfile" common,32 EM_SPARC
> +echo "#else" >> "$outfile"
> +build_tables "$tools_dir/perf/arch/sparc/entry/syscalls/syscall.tbl" "$outfile" common,64 EM_SPARC
> +cat >> "$outfile" <<EOF
> +#endif //__BITS_PER_LONG != 64
> +#endif // defined(ALL_SYSCALLTBL) || defined(__sparc64__) || defined(__sparc__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_64__)
> +EOF
> +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_32.tbl" "$outfile" common,32,i386 EM_386
> +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_64.tbl" "$outfile" common,64 EM_X86_64
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_64__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__xtensa__)
> +EOF
> +build_tables "$tools_dir/perf/arch/xtensa/entry/syscalls/syscall.tbl" "$outfile" common,32 EM_XTENSA
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__xtensa__)
> +
> +#if __BITS_PER_LONG != 64
> +EOF
> +build_tables "$tools_dir/scripts/syscall.tbl" "$outfile" common,32 EM_NONE
> +echo "#else" >> "$outfile"
> +build_tables "$tools_dir/scripts/syscall.tbl" "$outfile" common,64 EM_NONE
> +echo "#endif //__BITS_PER_LONG != 64" >> "$outfile"
> +
> +build_outer_table() {
> +       e_machine=$1
> +       outfile="$2"
> +       cat >> "$outfile" <<EOF
> +       {
> +	      .num_to_name = syscall_num_to_name_$e_machine,
> +	      .sorted_names = syscall_sorted_names_$e_machine,
> +	      .e_machine = $e_machine,
> +	      .num_to_name_len = ARRAY_SIZE(syscall_num_to_name_$e_machine),
> +	      .sorted_names_len = ARRAY_SIZE(syscall_sorted_names_$e_machine),
> +       },
> +EOF
> +}
> +
> +cat >> "$outfile" <<EOF
> +static const struct syscalltbl syscalltbls[] = {
> +#if defined(ALL_SYSCALLTBL) || defined(__alpha__)
> +EOF
> +build_outer_table EM_ALPHA "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__alpha__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__arm__) || defined(__aarch64__)
> +EOF
> +build_outer_table EM_ARM "$outfile"
> +build_outer_table EM_AARCH64 "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__arm__) || defined(__aarch64__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__csky__)
> +EOF
> +build_outer_table EM_CSKY "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__csky__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__mips__)
> +EOF
> +build_outer_table EM_MIPS "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__mips__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__hppa__)
> +EOF
> +build_outer_table EM_PARISC "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__hppa__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__powerpc__) || defined(__powerpc64__)
> +EOF
> +build_outer_table EM_PPC "$outfile"
> +build_outer_table EM_PPC64 "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__powerpc__) || defined(__powerpc64__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__riscv)
> +EOF
> +build_outer_table EM_RISCV "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__riscv)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__s390x__)
> +EOF
> +build_outer_table EM_S390 "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__s390x__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__sh__)
> +EOF
> +build_outer_table EM_SH "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__sh__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__sparc64__) || defined(__sparc__)
> +EOF
> +build_outer_table EM_SPARC "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__sparc64__) || defined(__sparc__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_64__)
> +EOF
> +build_outer_table EM_386 "$outfile"
> +build_outer_table EM_X86_64 "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_64__)
> +
> +#if defined(ALL_SYSCALLTBL) || defined(__xtensa__)
> +EOF
> +build_outer_table EM_XTENSA "$outfile"
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__xtensa__)
> +EOF
> +build_outer_table EM_NONE "$outfile"
> +cat >> "$outfile" <<EOF
> +};
> +EOF
> -- 
> 2.48.1.502.g6dc24dfdaf-goog
> 

