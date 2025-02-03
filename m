Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA447C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 23:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlSZOZfwKYccscHiA8mCvG85W1nYtxF2uCQLvRSMURg=; b=B3yjSN5PJ4F2WQFB0CCQgIX/2k
	EklqrAEBBkF2B7rJGYpULd3CTbvGCSMBSCIOehyJfr0MaK/QoRCuhJJBnW58gE8nSxXhSN0YdmX/0
	Ipo1PkeSgswYDNCV1Wlei/blY7AXYCNTawZJ1PesQMg8yCHpy5HDvIz6HhgGfgoO2tyFnCmvXKxeg
	ftNkz2MP4iN3yvQiXv5vEtWc6nIdDOYTUQv0lt3sy5luJYBugvwwfg1pKeOcncLo4P0GxzjK0Xu5V
	aRjE0WTq2Pz4C9UiHFFA7mQkeR8jLcKOM2RmIsdRT0o2AinD3zvXXY65zr/Hb5v8GXRdZ553idjPy
	Jf8cgkpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5UA-0000000Gqm0-2dEo;
	Mon, 03 Feb 2025 23:04:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5Sq-0000000GqY5-3CZJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 23:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mlSZOZfwKYccscHiA8mCvG85W1nYtxF2uCQLvRSMURg=; b=iemvdwSHYtSjsY7Ck2PG4Pcgwn
	HffuRKCvaqGyARkpvBHHHGVxBc/zgqjdWDFHyyzJ87JZkea7P9C4kEGbmmmTEQeBV9+7+Y85/UEwo
	/BHh6/7FG3Vx/VY8wXHI8iB5l1j6TZiNc1PK8iqwcJfsIkQhI9Y3Bux5xgl4B1viWAL9OWSddW2nC
	dpWHkFx/WcqWdHu0L1YeZCvQkK9EmY933QnaLqYa+/PcXEKDXkj8fRYEHd39TzFBeQBIbPhXQtNty
	5CtpFHPQh9tixJn/knrlNmrjn5x6O2APH7smZRUpTKc0JlJgLbS0a7P8klIbCLeZbNY7IP6PLI8Ks
	X/12EnPQ==;
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5Sl-0000000GDN2-1eD4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 23:02:47 +0000
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so8271758a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 15:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738623760; x=1739228560; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mlSZOZfwKYccscHiA8mCvG85W1nYtxF2uCQLvRSMURg=;
        b=YLXB+RooMWdZFBMVEfMtgNZSfcZ3DevG1pMc2KID26jdeEWIzXkpiHFIvtsP/fjiXQ
         R+5Bxcr6qOascGrxYm5JUpX5x0EJa0rSdB8yvklgSHTcvTEGy+AvjqcA9iqaIWlM0LfI
         kyTjozpO3LfDkzJBQ90eZO/mThYRhmELju2OU/pLC+OuXhvmNY5zsErONY5hMPWV/gGK
         ygieu6J4HAkFIAa094cNGm3qb3taM59rlZZjKPi7n/R+9TywEvJ9qbFUepO7fqVvpMfx
         T1cvOUbedBmlHgfcooQyDzDXG98+aUmMxo05TtXgGHLcbMyQEmZVBwtb7F2IoOpLpVHB
         xG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738623760; x=1739228560;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlSZOZfwKYccscHiA8mCvG85W1nYtxF2uCQLvRSMURg=;
        b=i87CRqMCFRYqOhKIj2D9xl3HlVldfmScdFLnRCsT6qeEGzXFrjyo4zC0Jz+sku12x3
         XDfeRT6fcWSIddnztxDQ/gs5jzDUh0rI10FLlpevxXEaRovEIqAJVocd0gvbX4q4jFHE
         TamJ5DwMFa4jggYapApcjdPFfB/ILfa7PjAqllxaKWu1xGOG1dXNtn/5yuC9qBpAS7dI
         lQ4C0CKj9siOOJC5XHJ2QnItGKFuaafFcQEUrmHmkDtCYOmXat+e4I1ZzaviFus3aOyI
         sKUlObSIuCZbJUAHaX67r7TMaQcLyk6ix25GxMr3Vn5q4GYjFEBgl+LBtCEb6hVoQO8f
         e8lg==
X-Forwarded-Encrypted: i=1; AJvYcCVyu+Ug9Zal/y4jPkokvSURJTjPABnqIPlXqtFxwJlDIwqRepevKfSMk2iHrTinANVtmr+iZQRnP0vl4wW0MHPh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4kapUoKrfllem8bykqkPGQojCqIwLswhhXnEPBAsgxOy/QZfA
	PR9FqtLaYGQbTuIGKHy5xQ0nvWqe49PvS7F51WfRwOo5DnHCAZVORqWemyBtFMg=
X-Gm-Gg: ASbGncuYBJdSCAyH0t7se4/tTwZi5Cv6hlxZnCj/2Kn4dCOxddQBeVvsLWGdm/MTJq0
	tcRd7gAbEQVH8rVUd/a3RPKykeb+aHNRIvJ9uveP6932ls0FAoAM4EOfQOfhbH3AhBolVSaRXe2
	4yHB2Z58vTlXR2nWCI5gbtpn2gkG9UGvofyjd/fNbIeszTDZzYWi9sIq5xZq+kxQNZIyJOk7Wh7
	BizfzP4OBzh/UEifuFeLJ3vlVNjM2pAss5OqeebSs2gbWscZ7vBeCsRMMBETHcheVfayN9Vorfx
	S4QfxPsfL/o=
X-Google-Smtp-Source: AGHT+IHVmCZ8M1HoH0RNab91JXVoT4R3jnAicYRidYc+9QjQ5Apn2RrVQw3Ur/bkgiLbrVxSa0JAIA==
X-Received: by 2002:a17:90b:2742:b0:2ee:b4d4:69 with SMTP id 98e67ed59e1d1-2f83ac87677mr33404517a91.35.1738623760388;
        Mon, 03 Feb 2025 15:02:40 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:4f63:f9d5:2cbd:2947])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848acacadsm9535576a91.41.2025.02.03.15.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 15:02:39 -0800 (PST)
Date: Mon, 3 Feb 2025 15:02:36 -0800
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
Subject: Re: [PATCH v1 0/7] perf: Support multiple system call tables in the
 build
Message-ID: <Z6FLDHz6V5L-HGR7@ghost>
References: <20250201071455.718247-1-irogers@google.com>
 <Z6EStkn-YZ8zaO7u@ghost>
 <CAP-5=fXRz_8CKNz4Fr-=0yhKbf_QE2ND+PPykSAO5p8wcUz7xA@mail.gmail.com>
 <Z6EVwaOVYaKtaK1j@ghost>
 <CAP-5=fX1hCNWWmGJPKYxj93S=zM1-eRucqzb4WW5fB_sZBCRLg@mail.gmail.com>
 <Z6Eh1QLuqTbUKLCc@ghost>
 <CAP-5=fXZr8L4Z=Lb28QDZF8cbv2eJJEHSb0H9zcqSOB9cn5-9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fXZr8L4Z=Lb28QDZF8cbv2eJJEHSb0H9zcqSOB9cn5-9g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_230243_775532_E40833CB 
X-CRM114-Status: GOOD (  61.61  )
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

On Mon, Feb 03, 2025 at 12:54:59PM -0800, Ian Rogers wrote:
> On Mon, Feb 3, 2025 at 12:06 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > On Mon, Feb 03, 2025 at 11:39:01AM -0800, Ian Rogers wrote:
> > > On Mon, Feb 3, 2025 at 11:15 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> > > >
> > > > On Mon, Feb 03, 2025 at 11:10:49AM -0800, Ian Rogers wrote:
> > > > > On Mon, Feb 3, 2025 at 11:02 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> > > > > >
> > > > > > On Fri, Jan 31, 2025 at 11:14:48PM -0800, Ian Rogers wrote:
> > > > > > > This work builds on the clean up of system call tables and removal of
> > > > > > > libaudit by Charlie Jenkins <charlie@rivosinc.com>.
> > > > > > >
> > > > > > > The system call table in perf trace is used to map system call numbers
> > > > > > > to names and vice versa. Prior to these changes, a single table
> > > > > > > matching the perf binary's build was present. The table would be
> > > > > > > incorrect if tracing say a 32-bit binary from a 64-bit version of
> > > > > > > perf, the names and numbers wouldn't match.
> > > > > > >
> > > > > > > Change the build so that a single system call file is built and the
> > > > > > > potentially multiple tables are identifiable from the ELF machine type
> > > > > > > of the process being examined. To determine the ELF machine type, the
> > > > > > > executable's header is read from /proc/pid/exe with fallbacks to using
> > > > > > > the perf's binary type when unknown.
> > > > > > >
> > > > > > > Remove some runtime types used by the system call tables and make
> > > > > > > equivalents generated at build time.
> > > > > >
> > > > > > Our approaches are very different but I sent out a patch to do this a
> > > > > > couple of weeks ago [1].
> > > > > >
> > > > > > Did you look at that and decide you didn't like the approach?
> > > > >
> > > > > Missing link?
> > > >
> > > > Whoops here is the link:
> > > >
> > > > https://lore.kernel.org/all/20250114-perf_syscall_arch_runtime-v1-1-5b304e408e11@rivosinc.com/
> > >
> > > I agree it is similar and progress, I think I prefer my changes :-)
> > >
> > > Anything in the arch directories is only going to be built given a
> > > Makefile SRCARCH:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/arch/Build?h=perf-tools-next#n2
> > > which means if we want the system call tables for say ARM on x86-64 we
> > > need to reinvent the build - this isn't a problem today but perhaps
> > > something to consider if we wanted a cross-architecture perf trace
> > > record. I'd like to do away entirely with the arch directory for this
> > > kind of reason. For example, if we run perf on a user space emulator
> > > (say a testing set up) and it sees AMD data fabric PMUs, logic for
> > > those PMUs currently lives in the arch directory for x86 and likely
> > > wasn't even built into the perf tool. We should be able to identify
> > > PMUs and act accordingly based on their names. In the case of the
> > > overloaded "cpu" PMU we can identify it with the CPUID. The less code
> > > in arch and the fewer architecture ifdefs, the better things should
> > > work cross-architecture, in testing scenarios, etc. We also win by
> > > getting code coverage without, for example, having to build and test
> > > on csky or super H.
> > >
> > > Your changes are using the string for the architecture name. I think
> > > that string is something we should get rid of:
> > > https://lore.kernel.org/lkml/CAP-5=fX2BtFzhGLCSqO1QszqfX=HT8RrTdG_5Ttp5Gw4seSstA@mail.gmail.com/
> > > but there's no reason we couldn't clean that up on top of your change.
> >
> > Yes that part is not ideal.
> >
> > >
> > > The build with lots of separate Build/Makefiles is something of a pain
> > > to port/maintain in a bazel version of the build I maintain at Google
> > > (happy to open source if anyone cares). In these changes you just run
> > > a big script and get a big header file out the end, which largely
> > > matches the other perf trace beauty things we build.
> >
> > Fair enough! I wanted to mimic how the kernel was building the syscall
> > tables as closely as possible, it's convenient to have cohesion.
> 
> I think it makes sense in the kernel, as the built binary doesn't have
> cross-platform concerns. This is probably also the reason why the perf
> tool has an arch directory. Let me know what you think is the right
> direction for the perf tool syscall table code.

I am hesitant about moving all of the arch-specific syscall generation
flags into a single file. There is currently a really clean separation
between the architectures and it's possible to generate all of the
syscall tables for all of the architecutures based on the paths to the
syscall table. What causes the arch directory to be a pain for Bazel? I
guess I am mostly confused why it makes sense to change the kernel
Makefiles in order to accomidate a rewrite of the build system in Bazel
that isn't planned to be used upstream.

- Charlie

> 
> > What is the usecase for the bazel version?
> 
> I'm sure there's more info in:
> https://bazel.build/
> but the main thing is having hermetic and reproducible builds. The
> main problem with open sourcing would be dealing with external
> repositories, test set up, etc. Tbh, hermetic builds are a challenge
> as things like lex and yacc will vary the C code they generate based
> on the platform they run on. Bazel has plans to change the world so
> maybe this could be more of a thing in the future.
> 
> Fwiw, I did push changes into the perf tree so that man page building
> was reproducible:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/commit/tools/perf/Documentation?h=perf-tools-next&id=d586ac10ce56b2381b8e1d8ed74660c1b2b8ab0d
> The man pages used to reflect the date/time they were built, but now
> reflect the date the of the commit of the file being built:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/Documentation/Makefile?h=perf-tools-next#n255
> 
> Thanks,
> Ian
> 
> > - Charlie
> >
> > >
> > > Thanks,
> > > Ian
> > >
> > > > >
> > > > > The patches generating a syscall(_32|_64)?.h landed. These changes
> > > > > take your changes and make it so that we just run the script once
> > > > > building a header file for all architectures. On x86 we then have the
> > > > > tables be guarded by ifdefs on i386 and x86-64. Then rather than the
> > > > > table just matching the host architecture the ELF machine is used for
> > > > > the executable running.
> > > > >
> > > > > Thanks,
> > > > > Ian
> > > > >
> > > > > > - Charlie
> > > > > >
> > > > > > >
> > > > > > > Ian Rogers (7):
> > > > > > >   perf syscalltble: Remove syscall_table.h
> > > > > > >   perf trace: Reorganize syscalls
> > > > > > >   perf syscalltbl: Remove struct syscalltbl
> > > > > > >   perf thread: Add support for reading the e_machine type for a thread
> > > > > > >   perf trace beauty: Add syscalltbl.sh generating all system call tables
> > > > > > >   perf syscalltbl: Use lookup table containing multiple architectures
> > > > > > >   perf build: Remove Makefile.syscalls
> > > > > > >
> > > > > > >  tools/perf/Makefile.perf                      |  10 +-
> > > > > > >  tools/perf/arch/alpha/entry/syscalls/Kbuild   |   2 -
> > > > > > >  .../alpha/entry/syscalls/Makefile.syscalls    |   5 -
> > > > > > >  tools/perf/arch/alpha/include/syscall_table.h |   2 -
> > > > > > >  tools/perf/arch/arc/entry/syscalls/Kbuild     |   2 -
> > > > > > >  .../arch/arc/entry/syscalls/Makefile.syscalls |   3 -
> > > > > > >  tools/perf/arch/arc/include/syscall_table.h   |   2 -
> > > > > > >  tools/perf/arch/arm/entry/syscalls/Kbuild     |   4 -
> > > > > > >  .../arch/arm/entry/syscalls/Makefile.syscalls |   2 -
> > > > > > >  tools/perf/arch/arm/include/syscall_table.h   |   2 -
> > > > > > >  tools/perf/arch/arm64/entry/syscalls/Kbuild   |   3 -
> > > > > > >  .../arm64/entry/syscalls/Makefile.syscalls    |   6 -
> > > > > > >  tools/perf/arch/arm64/include/syscall_table.h |   8 -
> > > > > > >  tools/perf/arch/csky/entry/syscalls/Kbuild    |   2 -
> > > > > > >  .../csky/entry/syscalls/Makefile.syscalls     |   3 -
> > > > > > >  tools/perf/arch/csky/include/syscall_table.h  |   2 -
> > > > > > >  .../perf/arch/loongarch/entry/syscalls/Kbuild |   2 -
> > > > > > >  .../entry/syscalls/Makefile.syscalls          |   3 -
> > > > > > >  .../arch/loongarch/include/syscall_table.h    |   2 -
> > > > > > >  tools/perf/arch/mips/entry/syscalls/Kbuild    |   2 -
> > > > > > >  .../mips/entry/syscalls/Makefile.syscalls     |   5 -
> > > > > > >  tools/perf/arch/mips/include/syscall_table.h  |   2 -
> > > > > > >  tools/perf/arch/parisc/entry/syscalls/Kbuild  |   3 -
> > > > > > >  .../parisc/entry/syscalls/Makefile.syscalls   |   6 -
> > > > > > >  .../perf/arch/parisc/include/syscall_table.h  |   8 -
> > > > > > >  tools/perf/arch/powerpc/entry/syscalls/Kbuild |   3 -
> > > > > > >  .../powerpc/entry/syscalls/Makefile.syscalls  |   6 -
> > > > > > >  .../perf/arch/powerpc/include/syscall_table.h |   8 -
> > > > > > >  tools/perf/arch/riscv/entry/syscalls/Kbuild   |   2 -
> > > > > > >  .../riscv/entry/syscalls/Makefile.syscalls    |   4 -
> > > > > > >  tools/perf/arch/riscv/include/syscall_table.h |   8 -
> > > > > > >  tools/perf/arch/s390/entry/syscalls/Kbuild    |   2 -
> > > > > > >  .../s390/entry/syscalls/Makefile.syscalls     |   5 -
> > > > > > >  tools/perf/arch/s390/include/syscall_table.h  |   2 -
> > > > > > >  tools/perf/arch/sh/entry/syscalls/Kbuild      |   2 -
> > > > > > >  .../arch/sh/entry/syscalls/Makefile.syscalls  |   4 -
> > > > > > >  tools/perf/arch/sh/include/syscall_table.h    |   2 -
> > > > > > >  tools/perf/arch/sparc/entry/syscalls/Kbuild   |   3 -
> > > > > > >  .../sparc/entry/syscalls/Makefile.syscalls    |   5 -
> > > > > > >  tools/perf/arch/sparc/include/syscall_table.h |   8 -
> > > > > > >  tools/perf/arch/x86/entry/syscalls/Kbuild     |   3 -
> > > > > > >  .../arch/x86/entry/syscalls/Makefile.syscalls |   6 -
> > > > > > >  tools/perf/arch/x86/include/syscall_table.h   |   8 -
> > > > > > >  tools/perf/arch/xtensa/entry/syscalls/Kbuild  |   2 -
> > > > > > >  .../xtensa/entry/syscalls/Makefile.syscalls   |   4 -
> > > > > > >  .../perf/arch/xtensa/include/syscall_table.h  |   2 -
> > > > > > >  tools/perf/builtin-trace.c                    | 275 +++++++++++-------
> > > > > > >  tools/perf/scripts/Makefile.syscalls          |  61 ----
> > > > > > >  tools/perf/scripts/syscalltbl.sh              |  86 ------
> > > > > > >  tools/perf/trace/beauty/syscalltbl.sh         | 274 +++++++++++++++++
> > > > > > >  tools/perf/util/syscalltbl.c                  | 142 ++++-----
> > > > > > >  tools/perf/util/syscalltbl.h                  |  22 +-
> > > > > > >  tools/perf/util/thread.c                      |  50 ++++
> > > > > > >  tools/perf/util/thread.h                      |  14 +-
> > > > > > >  54 files changed, 598 insertions(+), 506 deletions(-)
> > > > > > >  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Kbuild
> > > > > > >  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Makefile.syscalls
> > > > > > >  delete mode 100644 tools/perf/arch/alpha/include/syscall_table.h
> > > > > > >  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Kbuild
> > > > > > >  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
> > > > > > >  delete mode 100644 tools/perf/arch/arc/include/syscall_table.h
> > > > > > >  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Kbuild
> > > > > > >  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Makefile.syscalls
> > > > > > >  delete mode 100644 tools/perf/arch/arm/include/syscall_table.h
> > > > > > >  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Kbuild
> > > > > > >  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Makefile.syscalls
> > > > > > >  delete mode 100644 tools/perf/arch/arm64/include/syscall_table.h
> > > > > > >  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Kbuild
> > > > > > >  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
> > > > > > >  delete mode 100644 tools/perf/arch/csky/include/syscall_table.h
> > > > > > >  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Kbuild
> > > > > > >  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Makefile.syscalls
> > > > > > >  delete mode 100644 tools/perf/arch/loongarch/include/syscall_table.h
> > > > > > >  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Kbuild
> > > > > > >  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Makefile.syscalls
> > > > > > >  delete mode 100644 tools/perf/arch/mips/include/syscall_table.h
> > > > > > >  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Kbuild
> > > > > > >  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Makefile.syscalls
> > > > > > >  delete mode 100644 tools/perf/arch/parisc/include/syscall_table.h
> > > > > > >  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Kbuild
> > > > > > >  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls
> > > > > > >  delete mode 100644 tools/perf/arch/powerpc/include/syscall_table.h
> > > > > > >  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Kbuild
> > > > > > >  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Makefile.syscalls
> > > > > > >  delete mode 100644 tools/perf/arch/riscv/include/syscall_table.h
> > > > > > >  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Kbuild
> > > > > > >  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Makefile.syscalls
> > > > > > >  delete mode 100644 tools/perf/arch/s390/include/syscall_table.h
> > > > > > >  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Kbuild
> > > > > > >  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Makefile.syscalls
> > > > > > >  delete mode 100644 tools/perf/arch/sh/include/syscall_table.h
> > > > > > >  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Kbuild
> > > > > > >  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Makefile.syscalls
> > > > > > >  delete mode 100644 tools/perf/arch/sparc/include/syscall_table.h
> > > > > > >  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Kbuild
> > > > > > >  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Makefile.syscalls
> > > > > > >  delete mode 100644 tools/perf/arch/x86/include/syscall_table.h
> > > > > > >  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Kbuild
> > > > > > >  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Makefile.syscalls
> > > > > > >  delete mode 100644 tools/perf/arch/xtensa/include/syscall_table.h
> > > > > > >  delete mode 100644 tools/perf/scripts/Makefile.syscalls
> > > > > > >  delete mode 100755 tools/perf/scripts/syscalltbl.sh
> > > > > > >  create mode 100755 tools/perf/trace/beauty/syscalltbl.sh
> > > > > > >
> > > > > > > --
> > > > > > > 2.48.1.362.g079036d154-goog
> > > > > > >

