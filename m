Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D052C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YKI5+bKz/u5TUQe53gU8/jmtq5Ye1wah0IVTuXctBOo=; b=B6AFkVCDQJi/x6r1bVsP2OGjNj
	FCMP0dnGhPsxQ0A1U7Ah4ztcr4gH/sd2EQgtAvU8/S4rGbf8F02mWdLctqSvDYm2J6XfrlXhLQnyU
	Mz8M8Gkpvml5We4q7SX0vwvnvRY3u1vh1v7hR5KM/hxhAOJt6jXaUUDtGnQPXuEPm3uS+hTszfCs1
	FEOrema64Es/fISfTrOgE5BEWgtxJYNFfG0HPpc10PIcAEzHXm+pk1oo5TqHMR9nbe0nMj+U4DzYr
	9BvjkhbWHiDMQQX1uZ4ux/hMX+jbPv7qxygISTZrpml3GDWMe8ndCwiF5ok3j6YBkUJPMB5ARj8bW
	SwidHGNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7a5n-0000000Eoif-3fui;
	Fri, 18 Sep 2026 15:01:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7a5m-0000000EoiM-2Jy7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 15:01:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D57CE419F6;
	Fri, 18 Sep 2026 15:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44DDD1F000FF;
	Fri, 18 Sep 2026 15:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743693;
	bh=YKI5+bKz/u5TUQe53gU8/jmtq5Ye1wah0IVTuXctBOo=;
	h=Date:From:To:Cc:Subject;
	b=lYtunU0LIXI0kdFnVndvU0qN5CMm9UtrVB4RjtpINBU8KSTI6MWxWwTq6crpIwzFF
	 j9Yzc2R6XzWwjUfql5f+i9I0CVWEFX1RHbXxobmywLOVSAYSvddLAFzJd/fDb0zLvD
	 Zd6C5WAYcUbq9UbX6eezQi+54xiJ2v/R1SbO6JvSi4aCw4m8a249I9MBkUfrGsUrfl
	 ApspYgxbZNaYnNnGAoMuC+TI4FwHppzGTWAjbv4Y/VcnznkyDhNuR1C2ydrs0mOJUT
	 Mtl3OQWM+kj5C0Y74x2YPywl7cIjKr5Jiz46QIthFguRn/p4JCBTMQ87Ma1TT73lUr
	 2uO1ry9/OucKg==
Date: Fri, 18 Sep 2026 16:01:28 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc4
Message-ID: <aq1SSMDovHJhKmwF@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Linus,

We've got a steady trickle of arm64 fixes coming in, but I figured it
was better to send you what we've collected so far rather than keep
waiting for it to settle down. I've already queued some more for next
week.

Anyway, in this batch we've got a couple of hibernation fixes, a couple
of minor MTE fixes, some per-cpu codegen fixes (which were found as part
of Mark's series adding preemptible this_cpu_*() operations) and a fix
for the Arm CMN PMU driver. The summary is in the tag,

Cheers,

Will

--->8

The following changes since commit 5445d64199626974269fcdf347769ad44b0bb53b:

  arm64: Don't read GMID_EL1 when MTE is disabled (2026-09-03 13:03:23 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to fdb9ebc7fb7788b8371fbef6c17dc5c8291e1429:

  arm64: mte: Fix PTRACE_{PEEK,POKE}MTETAGS error documentation (2026-09-11 12:50:02 +0000)

----------------------------------------------------------------
arm64 fixes for -rc4

- Fix hypercall arguments when resetting EL2 vectors during hibernation

- Fix hibernation with 52-bit capable kernels on machines without
  52-bit addressing, similarly to the recent kexec fix

- Fix a bunch of clumsy codegen issues with our per-cpu accessors

- Fix MTE ptrace documentation to reflect the de-facto ABI behaviour

- Fix pthread_join() usage in MTE selftest

- Fix port selection in the Arm CMN PMU driver

----------------------------------------------------------------
Bradley Morgan (1):
      arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc

Breno Leitao (1):
      arm64: hibernate: clone only the linear map that exists at runtime

Catalin Marinas (1):
      arm64: mte: Fix PTRACE_{PEEK,POKE}MTETAGS error documentation

Mark Rutland (3):
      arm64: percpu: Fix this_cpu_write() casting
      arm64: percpu: Fix this_cpu_and() mask generation
      arm64: percpu: Fix LSE operations on {8,16}-bit types

Shouping Wang (1):
      perf/arm-cmn: Fix wp_dev_sel2 setting for multi-DTM configurations

Thomas Huth (1):
      kselftest/arm64: Fix size of thread_data values for pthread_join()

 .../arch/arm64/memory-tagging-extension.rst          |  5 ++---
 arch/arm64/include/asm/percpu.h                      | 20 ++++++++++----------
 arch/arm64/kernel/hibernate-asm.S                    |  2 ++
 arch/arm64/kernel/hibernate.c                        |  4 ++--
 arch/arm64/kernel/mte.c                              |  2 +-
 drivers/perf/arm-cmn.c                               | 10 +++++++---
 .../selftests/arm64/mte/check_gcr_el1_cswitch.c      |  2 +-
 7 files changed, 25 insertions(+), 20 deletions(-)

