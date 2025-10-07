Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFC8CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yNPcHPYRrVVYt9jSD+VcPFZsgI6A6G11BtgbkE4PIsU=; b=KmWjRcODzUDURpKQuoKmVge8vW
	MoH51j4mTuIpN/M1L0FD6lfq5xSIZKFiQ6v+iwQIjmIbcz4EtLQ6LLAMSYaCym/EuYelMSQtv7M/g
	MeLH96r+/IklJXVGPtStwoXbA5I6Nb6ageMan769DhyhB+KnQzJQIItvfzfOvujmS+khDF0GkryUB
	0kWZQhb7Qm0iGCUtMBuaRD8lUEutjDapRqmbN9b1lD++IjwovVtTr1YvdetQtajv1o+CXXMbeTFDK
	yW0xeOMcccZBGSLXGUduULMNfO3UrruC8kCnHU5Mqr8KGVVuEpow963sPippus6vqofIuxPrjBeEu
	zm1Sv9Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v633b-00000001Xn5-0d6r;
	Tue, 07 Oct 2025 08:28:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v633X-00000001Xmk-2zCS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 08:28:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B87040464;
	Tue,  7 Oct 2025 08:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EBCAC4CEF7;
	Tue,  7 Oct 2025 08:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759825703;
	bh=dZrWSKDVJTUF8PZreRMgpH0Ay9pg+KwWgz8bJzg8JDo=;
	h=Date:From:To:Cc:Subject:From;
	b=B6kWQCzMPODkdoH2WlQgK6Bo4vtW6CgLSB8KXpdluYGPIu8kKPzCDG0jNAf+Boe55
	 Ebs7vqyYdQu8aFqB86dknrLtEVwBOwI1RIMwIkYRxK7y6vd3G/3Bdn/55sqmHROUSE
	 U4XEUJ64mTrDMPvVYSSR3R02bWkeXIRXjDr6eiMGdpBDvq6THr5Y0k283VL/uyc5Nq
	 Ur/LkH5KM73NjjaNdD4COabHgn/t7dNIXhtU1icv/KYSEOalTsdPnBfgeLrDOzfxke
	 pM497brksJjQcBXwp7AFX0RclM2g+ePz81/LqmriniFegE+RIgyp5a8KiBbvIVhLvB
	 QQy8QB2ym0NEg==
Date: Tue, 7 Oct 2025 09:28:18 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc1
Message-ID: <aOTPIiF3aO-YroaE@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_012823_783369_291886B3 
X-CRM114-Status: GOOD (  11.32  )
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

Please pull these arm64 fixes for -rc1 that address issues either found
or introduced during this merge window. The only one that isn't strictly
a fix is the kpti cleanup, as I ended up queuing it late due to some
inter-branch dependencies and wanted to give it some more time in -next.

Summary in the tag.

Cheers,

Will

--->8

The following changes since commit ea0b39168d3a2313eabd145fb3440c946ccff4d1:

  arm64: cpufeature: Remove duplicate asm/mmu.h header (2025-09-24 16:44:44 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to f620d66af3165838bfa845dcf9f5f9b4089bf508:

  arm64: mte: Do not flag the zero page as PG_mte_tagged (2025-10-03 15:27:34 +0100)

----------------------------------------------------------------
arm64 fixes for -rc1

- Preserve old 'tt_core' UAPI for Hisilicon L3C PMU driver.

- Ensure linear alias of kprobes instruction page is not writable.

- Fix kernel stack unwinding from BPF.

- Fix build warnings from the Fujitsu uncore PMU documentation.

- Fix hang with deferred 'struct page' initialisation and MTE.

- Consolidate KPTI page-table re-writing code.

----------------------------------------------------------------
Catalin Marinas (1):
      arm64: mte: Do not flag the zero page as PG_mte_tagged

Feng Yang (1):
      tracing: Fix the bug where bpf_get_stackid returns -EFAULT on the ARM64

Gopi Krishna Menon (1):
      docs: perf: Fujitsu: Fix htmldocs build warnings and errors

Kevin Brodsky (1):
      arm64: mm: Move KPTI helpers to mmu.c

Yang Shi (1):
      arm64: kprobes: call set_memory_rox() for kprobe page

Yicong Yang (1):
      drivers/perf: hisi: Add tt_core_deprecated for compatibility

 .../admin-guide/perf/fujitsu_uncore_pmu.rst        |   7 +-
 Documentation/admin-guide/perf/hisi-pmu.rst        |   4 +
 arch/arm64/include/asm/ftrace.h                    |   1 +
 arch/arm64/include/asm/mmu.h                       |   7 +-
 arch/arm64/kernel/cpufeature.c                     | 108 ++-------------------
 arch/arm64/kernel/mte.c                            |   2 +-
 arch/arm64/kernel/probes/kprobes.c                 |  12 +++
 arch/arm64/mm/mmu.c                                |  98 +++++++++++++++++--
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c       |  33 ++++++-
 9 files changed, 154 insertions(+), 118 deletions(-)

