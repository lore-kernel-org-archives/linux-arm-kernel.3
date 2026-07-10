Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100FDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 12:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Ra355nAuTx7MVuFZmRds99tclCmZFEB3tlLMfis29o=; b=IPjtxL8KlozDMzVy+MiPqqeECv
	2EU323EWrnH2w3vXOTLZ18Oy20gxD7SoBC9rVRYulfKmXbvNpnNQRbmGH4UqyH/xAbC8OWIcaNh7O
	km4BCgnOVx322Hs8fdcuXu3iy8c+5TW2+eWo/fyFjeyd2YZR7BFfpxCourx5j/Ft3MJDAqR4MoYpC
	BLB8QoJEzLkNqSKeVc5i0acISv1qjaOzFvKluOdmvgxLrtAB6sBCfDPEDDUYNZScJ5Zls4vL6/qto
	TqrPUy50lxzbhhftHjz1tyAyjGUJZ1udDyMngNZkduf934VSHtKBltzCq3dixWwcBX43H0s7v/KS8
	EqUQ4R9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAUO-00000004via-47Vk;
	Fri, 10 Jul 2026 12:37:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAUM-00000004viO-48IY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 12:37:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A01E2409F6;
	Fri, 10 Jul 2026 12:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4C51F000E9;
	Fri, 10 Jul 2026 12:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783687074;
	bh=2Ra355nAuTx7MVuFZmRds99tclCmZFEB3tlLMfis29o=;
	h=Date:From:To:Cc:Subject;
	b=KWfXqrzxsux8/1d2Mf7UG3sjlVd7ci8NvO4ws5CYD/3HNDoBRW12L/OHIqMb9Rjn0
	 lSUgYWQ3mR7LQuEpUTYPZUuuYLj2zPyeQItXgJTAmOB9BSz6X5b3SH+y0Nz37iNPZC
	 L2gfcvu/ukWnU5sJ+k7TrW6t8AdnWXt5B2yGHiBuuXYq4e2mE6SvX3ZVQsdRgknu+t
	 Tyl9msEaHqCytarO9pYH0elL+iOkFpsmrdot1qp33WsADXfLdv0vuRyLAKNIuhoB/a
	 jIA0C/uFbNjSZDfhyWgupzei029B2RDxbIB96H2mfjlMmKnEmKvtjuPcFtvyrzNp1g
	 FmLB5c+Z3eKXg==
Date: Fri, 10 Jul 2026 13:37:50 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc3
Message-ID: <alDnnvhyhZLioQAe@willie-the-truck>
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

Please pull this batch of arm64 fixes for -rc3. The summary is in the
tag, but there are a couple of fixes for significant performance
regressions in here.

Cheers,

Will

--->8

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to a52d6c7160f7e2f8c56adf29146385b8f2868d3d:

  selftests/arm64: fix spelling errors in comments (2026-07-02 11:44:43 +0100)

----------------------------------------------------------------
arm64 fixes for -rc3

- Fix crash when using SMT hotplug on ACPI systems in conjunction with
  maxcpus=.

- Fix 30% kswapd performance regression introduced by C1-Pro SME erratum
  workaround.

- Fix TLB over-invalidation regression during memory hotplug.

- Fix incorrect encoding of FEAT_BWE2 value in ID_AA64DFR2_EL1.BWE.

- Typo fixes in the arm64 selftests.

----------------------------------------------------------------
Anshuman Khandual (1):
      arm64/mm: Optimize TLB flush in unmap_hotplug_[pmd|pud]_range()

Catalin Marinas (1):
      arm64: Avoid eager DVMSync reclaim batches with C1-Pro SME erratum

Jia He (1):
      arm64/sysreg: Fix BWE field encoding in ID_AA64DFR2_EL1

Jinjie Ruan (2):
      arm64: smp: Fix hot-unplug tearing by forcing unregistration
      cpu/hotplug: Fix NULL kobject warning in cpuhp_smt_enable()

Wang Yan (1):
      selftests/arm64: fix spelling errors in comments

 Documentation/arch/arm64/cpu-hotplug.rst     | 28 +++++++++-------
 arch/arm64/include/asm/tlbbatch.h            | 10 ++----
 arch/arm64/include/asm/tlbflush.h            | 49 +++++-----------------------
 arch/arm64/kernel/acpi.c                     |  2 ++
 arch/arm64/kernel/fpsimd.c                   | 10 ++++--
 arch/arm64/kernel/process.c                  | 35 --------------------
 arch/arm64/kernel/smp.c                      | 28 ++++++++--------
 arch/arm64/mm/mmu.c                          | 11 +++++--
 arch/arm64/tools/sysreg                      |  2 +-
 tools/testing/selftests/arm64/gcs/libc-gcs.c |  2 +-
 tools/testing/selftests/arm64/pauth/pac.c    |  2 +-
 11 files changed, 61 insertions(+), 118 deletions(-)

