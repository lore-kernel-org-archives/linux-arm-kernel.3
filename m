Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFF7CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FG6wA5UM35A0ka+ZMqRfFDkCa0oVH7cDeee+Y/JcarQ=; b=ybSOaypD4/Wi9ZGIxTARzjEay7
	qcBiCY+rJCVkRX08dHIN8Mx+yyhFYaGTIPG7UHRSyZTh51+VWWEZLF12TJDhjQTfE2tV6JrHnVSXP
	bKPWXPmLhdHJon4RCEGo2JNEDwQ1Wp/a39Gf8yB2QBr+99hn2vhCZjklXJCda38D62HOgh2M8xUZt
	qKT2nvSWZsmdcnLZscTnVF0/GqFzbQKZi2snVZY01fLgdXo7e55DQvDFpYOsI9Z80sbIGrOZTyzLg
	SOWtgMbuWQ7fVhYG99SUOQYpJbw234F8bWnyvoK5k0ZahE+FWk8+qQiPTgjD2TjRZ8oThnugjU/R3
	O5sCk4yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsmk-00000007aAQ-1eF2;
	Tue, 11 Nov 2025 18:08:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsmi-00000007aA5-2BwU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 18:08:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6970343EAC;
	Tue, 11 Nov 2025 18:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F0DC4CEFB;
	Tue, 11 Nov 2025 18:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762884483;
	bh=gO95KTrbpu2fM7hlUMe2sHhsXdeBwVTqIhVla7iPJGM=;
	h=Date:From:To:Cc:Subject:From;
	b=QxW2wvhE4FyjLESZtEIdhk7/Srz0htq1Av1b/YuxPuil2X7uu/ErH5dTH27VFCgjW
	 wz3qG33hC94Lt3yRGrjiJjGGbD2+GVyTTkEbD+4UEof0qaolnKdy5L9xvIvPihJ+G+
	 VlCf4j3vu0SK9P1n7aBOXxZqGcHpXcbiISf9ElEwoeOcNGQp7gUEruH9ymiFOfvshJ
	 epDgAsjN5QQ5VEJ8FEFTsMzFK2/JItbDmT5KtJPvYWrcsBY0M1I/fenoAP0oCA9Zf0
	 DDsaKzoEfmHNad2NQddkUV60G8gEB0pflL9izigbGNCF653XLFdtF41sAwOK5wAL0/
	 u2DPyOIORvfwQ==
Date: Tue, 11 Nov 2025 18:07:58 +0000
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc6
Message-ID: <aRN7fm_q2B5UzQTK@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_100804_647418_72DE5928 
X-CRM114-Status: GOOD (  17.07  )
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

Please pull these arm64 fixes for -rc6. There's more here than I would
ideally like at this stage, but there's been a steady trickle of fixes
and some of them took a few rounds of review.

The bulk of the changes are fixing some fallout from the recent BBM
level two support which allows the linear map to be split from block to
page mappings at runtime, but inadvertently led to sleeping in atomic
context on some paths where the linear map was already mapped with page
granularity. The fix is simply to avoid splitting in those cases but the
implementation of that is a little involved.

The other interesting fix is addressing a catastophic performance issue
with our per-cpu atomics discovered by Paul in the SRCU locking code but
which took some interactions with the hardware folks to resolve.

Anyway, summary in the tag. Please pull.

Cheers,

Will

--->8

The following changes since commit b98c94eed4a975e0c80b7e90a649a46967376f58:

  arm64: mte: Do not warn if the page is already tagged in copy_highpage() (2025-10-23 17:34:58 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 8e8ae788964aa2573b4335026db4068540fa6a86:

  arm64: Reject modules with internal alternative callbacks (2025-11-07 15:00:14 +0000)

----------------------------------------------------------------
arm64 fixes for -rc6

- Avoid sleeping in atomic context when changing linear map permissions
  for DEBUG_PAGEALLOC or KFENCE.

- Rework printing of Spectre mitigation status to avoid hardlockup when
  enabling per-task mitigations on the context-switch path.

- Reject kernel modules when instruction patching fails either due to
  the DWARF-based SCS patching or because of an alternatives callback
  residing outside of the core kernel text.

- Propagate error when updating kernel memory permissions in kprobes.

- Drop pointless, incorrect message when enabling the ACPI SPCR console.

- Use value-returning LSE instructions for per-cpu atomics to reduce
  latency in SRCU locking routines.

----------------------------------------------------------------
Adrian Barnaś (2):
      arm64: Fail module loading if dynamic SCS patching fails
      arm64: Reject modules with internal alternative callbacks

Catalin Marinas (1):
      arm64: Use load LSE atomics for the non-return per-CPU atomic operations

Punit Agrawal (2):
      Revert "ACPI: Suppress misleading SPCR console message when SPCR table is absent"
      arm64: acpi: Drop message logging SPCR default console

Ryan Roberts (3):
      arm64: mm: Don't sleep in split_kernel_leaf_mapping() when in atomic context
      arm64: mm: Optimize range_split_to_ptes()
      arm64: mm: Tidy up force_pte_mapping()

Yang Shi (1):
      arm64: kprobes: check the return value of set_memory_rox()

shechenglong (2):
      arm64: proton-pack: Drop print when !CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY
      arm64: proton-pack: Fix hard lockup due to print in scheduler context

 arch/arm64/include/asm/alternative.h |   7 ++-
 arch/arm64/include/asm/kfence.h      |   3 +-
 arch/arm64/include/asm/percpu.h      |  15 +++--
 arch/arm64/include/asm/scs.h         |   2 +-
 arch/arm64/include/asm/spectre.h     |   1 +
 arch/arm64/kernel/acpi.c             |   8 +--
 arch/arm64/kernel/alternative.c      |  19 +++---
 arch/arm64/kernel/cpufeature.c       |   6 ++
 arch/arm64/kernel/module.c           |  21 +++++--
 arch/arm64/kernel/pi/map_kernel.c    |   2 +-
 arch/arm64/kernel/pi/patch-scs.c     |  10 ++--
 arch/arm64/kernel/pi/pi.h            |   2 +-
 arch/arm64/kernel/probes/kprobes.c   |   5 +-
 arch/arm64/kernel/proton-pack.c      |  35 +++++------
 arch/arm64/mm/mmu.c                  | 111 +++++++++++++++++++++++++----------
 15 files changed, 165 insertions(+), 82 deletions(-)

