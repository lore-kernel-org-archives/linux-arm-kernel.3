Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30301094461
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 08:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6lLfd9L/Zuw0qkOt33z5tgbUKKSdLyNy1U4BYFM1Vg=; b=RLjzVouyhnyVWad7k7kO/RXWwW
	EGK1ed24VCYWjCvOTP9qZhQRecUDX4DF0cLfWtq48/nQrQ5uPNxiRqQES+5IrMuljUDbZv2ecfgbF
	/ctKsBjDamPMA87j154Og6xC3N60QeL8UxiyMrG664IbE3Ub97rMWIga9IZBRmQDHMGPrtRpmD8Eh
	iGaFCY/lt63anS2Knc6gjdXAvXx6ByqIwF+NLoJZJv3EVPQgHbdZJXSZy9moiCT+TxAvUUkClhg2J
	et4Q8zZh70lDgQ7rFITj0hYwOsNQG9xw/jLIFWhOIPsvAj7BFXYSXktzuiUwBXcJ3+j6ZP+DqXvRL
	PuGMa0aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3rZm-0000000EG1w-2KpS;
	Sat, 21 Mar 2026 08:20:54 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3rZi-0000000EG0l-1s1x;
	Sat, 21 Mar 2026 08:20:52 +0000
Received: from gentoo.org (165.145.0.85.dynamic.cust.swisscom.net [85.0.145.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: amadio)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AA137342017;
	Sat, 21 Mar 2026 08:20:41 +0000 (UTC)
Date: Sat, 21 Mar 2026 09:20:38 +0100
From: Guilherme Amadio <amadio@gentoo.org>
To: Ian Rogers <irogers@google.com>
Cc: Namhyung Kim <namhyung@kernel.org>, 9erthalion6@gmail.com,
	acme@kernel.org, adrian.hunter@intel.com, alex@ghiti.fr,
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu, atrajeev@linux.ibm.com,
	blakejones@google.com, ctshao@google.com,
	dapeng1.mi@linux.intel.com, howardchu95@gmail.com,
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org,
	leo.yan@linux.dev, libunwind-devel@nongnu.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org,
	pjw@kernel.org, shimin.guo@skydio.com, tglozar@redhat.com,
	tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
Subject: Re: [PATCH v2 0/8] perf libunwind multiple remote support
Message-ID: <ab5U1oyGcgfIpA7p@gentoo.org>
References: <CAP-5=fWVU3ktkGAnZQrjQJf+Z5AtQo73BVUhj-nr3H95GdcEJQ@mail.gmail.com>
 <20260305221927.3237145-1-irogers@google.com>
 <abxs-2rozL1tBEO1@google.com>
 <CAP-5=fVEKifx7VZJAsoPFguMPipW66k-06vgb9iE2oO6GxSxdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fVEKifx7VZJAsoPFguMPipW66k-06vgb9iE2oO6GxSxdw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_012051_230247_107D456F 
X-CRM114-Status: GOOD (  39.78  )
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

On Fri, Mar 20, 2026 at 08:06:42PM -0700, Ian Rogers wrote:
> On Thu, Mar 19, 2026 at 2:39 PM Namhyung Kim <namhyung@kernel.org> wrote:
> >
> > Hi Ian,
> >
> > On Thu, Mar 05, 2026 at 02:19:19PM -0800, Ian Rogers wrote:
> > > Fix the libunwind build for when libdw and libunwind are feature
> > > detected, currently failing with a duplicate symbol.
> > >
> > > Refactor the libunwind support so that whenever a remote target is
> > > available, perf functions using the ELF machine can use that remote
> > > target regardless of what the host/local machine is. Migrate existing
> > > libunwind supported architectures like powerpc, arm64 and loongarch so
> > > that they can work in a cross-architecture way. Add support for
> > > RISC-V. Make the code more regular in function names, etc. and avoid
> > > including a C-file. This increases the lines of code. It is similar in
> > > style to the unwind-libdw implementation. It is hoped that the more
> > > uniform nature of the code with help with refactoring the perf
> > > registers for SIMD/APX support.
> > >
> > > Aside from local host testing these patches are under tested, in part
> > > as I'm failing to see how to build libunwind with support for multiple
> > > remote targets. Please could I get help in testing.
> >
> > It seems libunwind project is not actively maintained.  Assuming libdw
> > unwinding is performant enough, we may want to get rid of libunwind
> > support.
> 
> Guilherme, is it true that libunwind is built into perf with Gentoo?

Hi Ian, libunwind support is an optional feature, which is not enabled
by default. Users can turn it on via a USE flag:

https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-util/perf/perf-6.19.ebuild#n88

The full list of USE flags is here:
https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-util/perf/perf-6.19.ebuild#n38
the ones marked with a + in front are enabled by default.

Personally, I enable everything when installing:
~ $ perf version --build-options
perf version 6.19
                   aio: [ on  ]  # HAVE_AIO_SUPPORT
                   bpf: [ on  ]  # HAVE_LIBBPF_SUPPORT
         bpf_skeletons: [ on  ]  # HAVE_BPF_SKEL
            debuginfod: [ on  ]  # HAVE_DEBUGINFOD_SUPPORT
                 dwarf: [ on  ]  # HAVE_LIBDW_SUPPORT
    dwarf_getlocations: [ on  ]  # HAVE_LIBDW_SUPPORT
          dwarf-unwind: [ on  ]  # HAVE_DWARF_UNWIND_SUPPORT
                libbfd: [ OFF ]  # HAVE_LIBBFD_SUPPORT ( tip: Deprecated, license incompatibility, use BUILD_NONDISTRO=1 and install binutils-dev[el] )
        libbpf-strings: [ on  ]  # HAVE_LIBBPF_STRINGS_SUPPORT
           libcapstone: [ on  ]  # HAVE_LIBCAPSTONE_SUPPORT
    libdw-dwarf-unwind: [ on  ]  # HAVE_LIBDW_SUPPORT
                libelf: [ on  ]  # HAVE_LIBELF_SUPPORT
               libLLVM: [ on  ]  # HAVE_LIBLLVM_SUPPORT
               libnuma: [ on  ]  # HAVE_LIBNUMA_SUPPORT
            libopencsd: [ OFF ]  # HAVE_CSTRACE_SUPPORT
               libperl: [ on  ]  # HAVE_LIBPERL_SUPPORT
               libpfm4: [ on  ]  # HAVE_LIBPFM
             libpython: [ on  ]  # HAVE_LIBPYTHON_SUPPORT
              libslang: [ on  ]  # HAVE_SLANG_SUPPORT
         libtraceevent: [ on  ]  # HAVE_LIBTRACEEVENT
             libunwind: [ on  ]  # HAVE_LIBUNWIND_SUPPORT
                  lzma: [ on  ]  # HAVE_LZMA_SUPPORT
numa_num_possible_cpus: [ on  ]  # HAVE_LIBNUMA_SUPPORT
                  zlib: [ on  ]  # HAVE_ZLIB_SUPPORT
                  zstd: [ on  ]  # HAVE_ZSTD_SUPPORT

> The performance fix for unwinding with libdw is in commit
> 6b2658b3f36a ("perf unwind-libdw: Don't discard loaded ELF/DWARF after
> every unwind") that is currently only in v7.0-rc[1-4].
> 
> In commit 13e17c9ff49119aa ("perf build: Make libunwind opt-in rather
> than opt-out"), perf made libunwind opt-in rather than opt-out. This
> change is in v6.13.
> 
> LLVM has a libunwind project but LLVM scares me because its library
> dependencies are so large.

If you have advice on what you'd prefer us (i.e. packagers) to do, I'm
happy to follow. For example, I've removed BUILD_NONDISTRO=1 from our
ebuilds some time around 6.17. If the performance fix above applies onto
6.19 (or is included in 6.19.x for some x), then we can pick that up as
well.

> Perhaps we should merge these changes and then delete the libunwind
> support in 2 or 3 releases time. I believe this is closer to how
> libbpf deprecated the pre-1.0 behaviors. Personally I don't mind if we
> just delete everything now, but typically we're not that aggressive.

From Gentoo's point of view, it's relatively easy to adapt the ebuild to
upstream changes. As a user, I care about having reliable stack traces,
what library is used for that is not as important.

Best regards,
-Guilherme

> Thanks,
> Ian
> 
> > Thanks,
> > Namhyung
> >
> > >
> > > v2: Move two fixes patches to position 1 and 2 in the series. Fix
> > >     struct naming inconsistency, Andrew Jones
> > >     <andrew.jones@oss.qualcomm.com>. Fix other inconsistencies and
> > >     potential non-x86 build issues.
> > >
> > > v1: https://lore.kernel.org/lkml/20260224142938.26088-1-irogers@google.com/
> > >
> > > Ian Rogers (8):
> > >   perf unwind: Refactor get_entries to allow dynamic libdw/libunwind
> > >     selection
> > >   perf build loongarch: Remove reference to missing file
> > >   tools build: Deduplicate test-libunwind for different architectures
> > >   perf build: Be more programmatic when setting up libunwind variables
> > >   perf unwind-libunwind: Make libunwind register reading cross platform
> > >   perf unwind-libunwind: Move flush/finish access out of local
> > >   perf unwind-libunwind: Remove libunwind-local
> > >   perf unwind-libunwind: Add RISC-V libunwind support
> > >
> > >  tools/build/feature/Makefile                  |  38 +-
> > >  tools/build/feature/test-libunwind-aarch64.c  |  27 -
> > >  tools/build/feature/test-libunwind-arm.c      |  28 -
> > >  .../test-libunwind-debug-frame-aarch64.c      |  17 -
> > >  .../feature/test-libunwind-debug-frame-arm.c  |  17 -
> > >  .../feature/test-libunwind-debug-frame.c      |   1 -
> > >  tools/build/feature/test-libunwind-x86.c      |  28 -
> > >  tools/build/feature/test-libunwind-x86_64.c   |  28 -
> > >  tools/build/feature/test-libunwind.c          |   1 -
> > >  tools/perf/Makefile.config                    | 215 ++---
> > >  tools/perf/arch/arm/util/Build                |   2 -
> > >  tools/perf/arch/arm/util/unwind-libunwind.c   |  50 --
> > >  tools/perf/arch/arm64/util/Build              |   1 -
> > >  tools/perf/arch/arm64/util/unwind-libunwind.c |  17 -
> > >  tools/perf/arch/loongarch/util/Build          |   3 -
> > >  .../arch/loongarch/util/unwind-libunwind.c    |  82 --
> > >  tools/perf/arch/mips/Build                    |   1 -
> > >  tools/perf/arch/mips/util/Build               |   1 -
> > >  tools/perf/arch/mips/util/unwind-libunwind.c  |  22 -
> > >  tools/perf/arch/powerpc/util/Build            |   1 -
> > >  .../perf/arch/powerpc/util/unwind-libunwind.c |  92 --
> > >  tools/perf/arch/x86/util/Build                |   3 -
> > >  tools/perf/arch/x86/util/unwind-libunwind.c   | 115 ---
> > >  tools/perf/builtin-inject.c                   |   4 +
> > >  tools/perf/builtin-report.c                   |   4 +
> > >  tools/perf/builtin-script.c                   |   4 +
> > >  tools/perf/util/Build                         |   5 +-
> > >  tools/perf/util/libunwind-arch/Build          |  11 +
> > >  .../perf/util/libunwind-arch/libunwind-arch.c | 319 +++++++
> > >  .../perf/util/libunwind-arch/libunwind-arch.h | 296 +++++++
> > >  .../perf/util/libunwind-arch/libunwind-arm.c  | 290 ++++++
> > >  .../util/libunwind-arch/libunwind-arm64.c     | 289 ++++++
> > >  .../perf/util/libunwind-arch/libunwind-i386.c | 312 +++++++
> > >  .../util/libunwind-arch/libunwind-loongarch.c | 297 +++++++
> > >  .../perf/util/libunwind-arch/libunwind-mips.c | 299 +++++++
> > >  .../util/libunwind-arch/libunwind-ppc32.c     | 301 +++++++
> > >  .../util/libunwind-arch/libunwind-ppc64.c     | 303 +++++++
> > >  .../util/libunwind-arch/libunwind-riscv.c     | 297 +++++++
> > >  .../perf/util/libunwind-arch/libunwind-s390.c | 299 +++++++
> > >  .../util/libunwind-arch/libunwind-x86_64.c    | 320 +++++++
> > >  tools/perf/util/libunwind/arm64.c             |  40 -
> > >  tools/perf/util/libunwind/x86_32.c            |  41 -
> > >  tools/perf/util/maps.c                        |  29 +-
> > >  tools/perf/util/maps.h                        |   4 +-
> > >  tools/perf/util/symbol_conf.h                 |  15 +
> > >  tools/perf/util/thread.c                      |  29 +-
> > >  tools/perf/util/unwind-libdw.c                |   2 +-
> > >  tools/perf/util/unwind-libunwind-local.c      | 832 ------------------
> > >  tools/perf/util/unwind-libunwind.c            | 679 ++++++++++++--
> > >  tools/perf/util/unwind.c                      | 102 +++
> > >  tools/perf/util/unwind.h                      |  56 +-
> > >  51 files changed, 4536 insertions(+), 1733 deletions(-)
> > >  delete mode 100644 tools/build/feature/test-libunwind-aarch64.c
> > >  delete mode 100644 tools/build/feature/test-libunwind-arm.c
> > >  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-aarch64.c
> > >  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-arm.c
> > >  delete mode 100644 tools/build/feature/test-libunwind-x86.c
> > >  delete mode 100644 tools/build/feature/test-libunwind-x86_64.c
> > >  delete mode 100644 tools/perf/arch/arm/util/unwind-libunwind.c
> > >  delete mode 100644 tools/perf/arch/arm64/util/unwind-libunwind.c
> > >  delete mode 100644 tools/perf/arch/loongarch/util/unwind-libunwind.c
> > >  delete mode 100644 tools/perf/arch/mips/Build
> > >  delete mode 100644 tools/perf/arch/mips/util/Build
> > >  delete mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c
> > >  delete mode 100644 tools/perf/arch/powerpc/util/unwind-libunwind.c
> > >  delete mode 100644 tools/perf/arch/x86/util/unwind-libunwind.c
> > >  create mode 100644 tools/perf/util/libunwind-arch/Build
> > >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.c
> > >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.h
> > >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm.c
> > >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm64.c
> > >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-i386.c
> > >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-loongarch.c
> > >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-mips.c
> > >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc32.c
> > >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc64.c
> > >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-riscv.c
> > >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-s390.c
> > >  create mode 100644 tools/perf/util/libunwind-arch/libunwind-x86_64.c
> > >  delete mode 100644 tools/perf/util/libunwind/arm64.c
> > >  delete mode 100644 tools/perf/util/libunwind/x86_32.c
> > >  delete mode 100644 tools/perf/util/unwind-libunwind-local.c
> > >  create mode 100644 tools/perf/util/unwind.c
> > >
> > > --
> > > 2.53.0.473.g4a7958ca14-goog
> > >

