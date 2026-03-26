Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF5010AB82A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 22:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPLOfPPpwa8X021sPByahENkcplGntf7zxP10e2vbXo=; b=pSLm2oeQJNYyKXbLC6efLZXWfW
	404BVAemsKacJTjXKWmSPVT6PT+/nF0TNSFU9/6vepdxUXek8zJsdBDNTTJvDMlwRmlvn4zz7mXhd
	cX256dfphs/RnOkZOTEh15EKx5vkEo+Gcpy/yUjqTt3WPgPaA97aeIzLqitAw33+VEAqOrGOTPy62
	KXM3ZV6e7NodDuByVL8cr8ywYLplJOXPKkmFy9q4+mroFyoOvviRXQXrOOqeLT8BrIZulJliZxlM4
	wJjWoTOAv7aTTBq0R6BYusNyu8V2DTyJLdLL36HuVqgkcGejtB9Os++oKpQ7hwMEMcMTYVyyhPv1P
	oY0F0n+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tXw-00000006LdF-1FTa;
	Thu, 26 Mar 2026 22:51:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tXv-00000006Ld0-1IsS;
	Thu, 26 Mar 2026 22:51:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4928E60054;
	Thu, 26 Mar 2026 22:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36DDC116C6;
	Thu, 26 Mar 2026 22:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774565482;
	bh=BwSkK1FHDJhBb9L9q07poJvujcAazF3P+8G7lS5m8FQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tlvjDkbiz41h+QYZBsxuhb0YHGNmEY6otaPvKnoKakmWMQqlrYOSbZReuq6XlEHso
	 xyp67AjYIlAZvu3KV40GFta00jszUBhc4AGQA2Vs9pUn2KA9Mjkl3cmnU2rYZdqLJ6
	 IFFQ0CYxuEmgRxY2dFGWOeFto0qf3MvM1WCSo5LPvU+1G7jmFjGrNVtLn5elwDvHP8
	 gcudumydS5QdzscqjKIqpPsfhYCCKiToA2j/dAfMLC4RT/gnN8O4ARQzYbxJOUqKJ2
	 HbfJ9H76p/ealtpFxGBywfdeMy8zGK/4cEDa+5rHLuDuniNjmj7VWwJluZaGnsXiMp
	 x7z9WkFqXlZeQ==
Date: Thu, 26 Mar 2026 15:51:19 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: 9erthalion6@gmail.com, acme@kernel.org, adrian.hunter@intel.com,
	alex@ghiti.fr, alexander.shishkin@linux.intel.com,
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu,
	atrajeev@linux.ibm.com, blakejones@google.com, ctshao@google.com,
	dapeng1.mi@linux.intel.com, howardchu95@gmail.com,
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org,
	leo.yan@linux.dev, libunwind-devel@nongnu.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org,
	pjw@kernel.org, shimin.guo@skydio.com, tglozar@redhat.com,
	tmricht@linux.ibm.com, will@kernel.org, amadio@gentoo.org,
	yuzhuo@google.com
Subject: Re: [PATCH v1 0/2] perf build: Remove libunwind support
Message-ID: <acW4Z2KJbyPZM1SG@google.com>
References: <abxs-2rozL1tBEO1@google.com>
 <20260321234220.848859-1-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260321234220.848859-1-irogers@google.com>
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

On Sat, Mar 21, 2026 at 04:42:18PM -0700, Ian Rogers wrote:
> libunwind support exists for "--call-graph dwarf", however, libunwind
> support has been opt-in rather than opt-out since Linux v6.13 as libdw
> is preferred - commit 13e17c9ff49119aa ("perf build: Make libunwind
> opt-in rather than opt-out"). A problem with the libdw support was
> that it was slow, an issue fixed in Linux v7.0 in commit 6b2658b3f36a
> ("perf unwind-libdw: Don't discard loaded ELF/DWARF after every
> unwind"). As such libunwind support is now unnecessary.
> 
> The patch series:
> https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@google.com/
> looked to make the libunwind support in perf similar to the libdw
> support, allow cross-architecture unwinding, etc. This was motivated
> by the perf regs conventions being altered by the addition of x86 APX
> support:
> https://lore.kernel.org/lkml/20260209072047.2180332-1-dapeng1.mi@linux.intel.com/
> It is necessary to translate the library's notion of registers to the
> perf register convention so that the stack unwinding state can be
> initialized. On this series it was stated that removing libunwind
> support from perf should be an option, rather than updating support:
> https://lore.kernel.org/lkml/abxs-2rozL1tBEO1@google.com/
> This was also what motivated making libunwind opt-in rather than
> opt-out.
> 
> Given that 7 minor releases have happened with libunwind "deprecated"
> by making it opt-in, let's remove the libunwind support. There doesn't
> appear to be any disagreement to this on the mailing list.

I'm not sure if we want to remove it now.  I think we need more time to
verify libdw unwinding is stable and fast enough.  Also maybe we can
add build- or run-time warning when people try to use libunwind.

Thanks,
Namhyung

> 
> Ian Rogers (2):
>   perf build: Remove libunwind support
>   tools build: Remove libunwind feature tests
> 
>  tools/build/feature/Makefile                  |  31 -
>  tools/build/feature/test-libunwind-aarch64.c  |  27 -
>  tools/build/feature/test-libunwind-arm.c      |  28 -
>  .../test-libunwind-debug-frame-aarch64.c      |  17 -
>  .../feature/test-libunwind-debug-frame-arm.c  |  17 -
>  .../feature/test-libunwind-debug-frame.c      |  17 -
>  tools/build/feature/test-libunwind-x86.c      |  28 -
>  tools/build/feature/test-libunwind-x86_64.c   |  28 -
>  tools/build/feature/test-libunwind.c          |  28 -
>  tools/perf/Documentation/perf-check.txt       |   1 -
>  tools/perf/Documentation/perf-config.txt      |   4 +-
>  tools/perf/Documentation/perf-record.txt      |   2 +-
>  tools/perf/Makefile.config                    | 163 +---
>  tools/perf/Makefile.perf                      |   3 -
>  tools/perf/arch/arm/util/Build                |   1 -
>  tools/perf/arch/arm/util/unwind-libunwind.c   |  50 --
>  tools/perf/arch/arm64/util/Build              |   1 -
>  tools/perf/arch/arm64/util/unwind-libunwind.c |  17 -
>  tools/perf/arch/loongarch/util/Build          |   1 -
>  .../arch/loongarch/util/unwind-libunwind.c    |  82 --
>  tools/perf/arch/mips/util/Build               |   1 -
>  tools/perf/arch/mips/util/unwind-libunwind.c  |  22 -
>  tools/perf/arch/powerpc/util/Build            |   1 -
>  .../perf/arch/powerpc/util/unwind-libunwind.c |  92 --
>  tools/perf/arch/x86/util/Build                |   1 -
>  tools/perf/arch/x86/util/unwind-libunwind.c   | 115 ---
>  tools/perf/builtin-check.c                    |   1 -
>  tools/perf/builtin-report.c                   |   4 +-
>  tools/perf/tests/make                         |   2 -
>  tools/perf/util/Build                         |   5 -
>  tools/perf/util/callchain.c                   |   2 +-
>  tools/perf/util/dso.h                         |   6 -
>  tools/perf/util/libunwind/arm64.c             |  40 -
>  tools/perf/util/libunwind/x86_32.c            |  41 -
>  tools/perf/util/maps.c                        |  47 +-
>  tools/perf/util/maps.h                        |   6 -
>  tools/perf/util/thread.c                      |  40 +-
>  tools/perf/util/thread.h                      |   1 -
>  tools/perf/util/unwind-libunwind-local.c      | 832 ------------------
>  tools/perf/util/unwind-libunwind.c            |  92 --
>  tools/perf/util/unwind.h                      |  41 +-
>  41 files changed, 19 insertions(+), 1919 deletions(-)
>  delete mode 100644 tools/build/feature/test-libunwind-aarch64.c
>  delete mode 100644 tools/build/feature/test-libunwind-arm.c
>  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-aarch64.c
>  delete mode 100644 tools/build/feature/test-libunwind-debug-frame-arm.c
>  delete mode 100644 tools/build/feature/test-libunwind-debug-frame.c
>  delete mode 100644 tools/build/feature/test-libunwind-x86.c
>  delete mode 100644 tools/build/feature/test-libunwind-x86_64.c
>  delete mode 100644 tools/build/feature/test-libunwind.c
>  delete mode 100644 tools/perf/arch/arm/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/arm64/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/loongarch/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/powerpc/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/arch/x86/util/unwind-libunwind.c
>  delete mode 100644 tools/perf/util/libunwind/arm64.c
>  delete mode 100644 tools/perf/util/libunwind/x86_32.c
>  delete mode 100644 tools/perf/util/unwind-libunwind-local.c
>  delete mode 100644 tools/perf/util/unwind-libunwind.c
> 
> -- 
> 2.53.0.959.g497ff81fa9-goog
> 

