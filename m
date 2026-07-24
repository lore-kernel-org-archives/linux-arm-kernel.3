Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F638C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MxXJXZfOyfaJYZ2IhyrjqCrkFbhnKm7BAWAy4mDHjq0=; b=HZsJvBO/Qi3iiS6KZdTORJcs5h
	CBEZN9emZ/WGK2J8mn7RuRForNZRqVR78eUurMgJEuSVDdb2ZcCcArwZdFE4gXrIlorsrHa0+W5FI
	0cCerfeH3ODbfYXnAxvBhhzJkfDWLhTFx7jbEG/6cY1vJPQQ445kqiEu9hEihJFUYE/Omt31A+F5r
	f6KrSAl85+ywBYlksKPkrh2rZ+O6QyszXkBdVkmna/2T1wsW2ZAO/F5NLrzRBBKGkv5eQwgqf2a+u
	5uIAiW0839lK2ya3rougb8kPAAMl4CoRvWpq1etWr9rvxP7pm5yRQAZYpYS7y/dqT5VDF03+jOVEk
	pzRSo4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIj4-0000000GqGd-0TaJ;
	Fri, 24 Jul 2026 16:26:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIj3-0000000GqGC-15j1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 16:26:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A90560204;
	Fri, 24 Jul 2026 16:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8881F00A3D;
	Fri, 24 Jul 2026 16:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784910376;
	bh=MxXJXZfOyfaJYZ2IhyrjqCrkFbhnKm7BAWAy4mDHjq0=;
	h=Date:From:To:Cc:Subject;
	b=Ws3GXzHPh9QLc12pQvn8AzBmKp1ofP4yGlY8GL7eqOwLIbYHWTGHz5ZoGYQl9+Yif
	 cXqPnHroMkxizpTsJoq5t15O0hDwvgS9PN+RuiDfgjM849khk33QOdf/5s6HS7ugNk
	 JzKV4oj7uQgHnxML4LHI2dY0oJ55hMPzEz9/ltK+5isTanf2siZlJPbLXxSbCe65WO
	 1zP5QWygRWoQ9gtfR+ZJJX/mSpLcNv/7e8ozYgNX2ridCa/bGhoyEUxUaoGyXSuXef
	 D5cjqxbxPInX0M5vaHtKjK2nX++8M0YK7y4w+DTFvIhvvLcrWC8lFoEoki/vDkRFxf
	 m9OPWG1zfLokw==
Date: Fri, 24 Jul 2026 17:26:12 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc5
Message-ID: <amOSJBcrwNy1SV8p@willie-the-truck>
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

Please pull these arm64 fixes for -rc5.

It's a bit all over the place, as I was hoping to fix a decade-old bug
in our seccomp handling on syscall entry and ended up collecting other
fixes in the meantime. You'll see the failed attempt (+revert) here but
I didn't want to hold off on the others any longer. Hopefully we'll get
that one squashed next week...

The usual summary is in the tag.

Cheers,

Will

--->8

The following changes since commit a13c140cc289c0b7b3770bce5b3ad42ab35074aa:

  Linux 7.2-rc3 (2026-07-12 14:16:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to f73a8edc2ccc6ec72c37d5c578e7592d2e1f9922:

  arm64: make huge_ptep_get handled unaligned addresses (2026-07-22 11:44:47 +0000)

----------------------------------------------------------------
arm64 fixes for -rc5

- Fix early_ioremap() of unaligned ACPI tables

- Remove bogus information from data abort diagnostics

- Fix kprobes recursion during single-step

- Fix incorrect constant in ESR address size fault macro

- Fix OOB page-table walk in memory hot-unplug notifier

- Fix OOB access to the linear map when retrieving an unaligned huge pte

- Fix MPAM register reset values

- Fix MPAM NULL dereference on teardown

----------------------------------------------------------------
Ben Horgan (1):
      arm_mpam: Fix software reset values of MPAMCFG_PRI

Dev Jain (1):
      arm64: make huge_ptep_get handled unaligned addresses

Fenghua Yu (1):
      arm_mpam: Fix MPAMCFG_MBW_PBM register setting

Guangshuo Li (1):
      arm_mpam: guard MBWU state before adding it to garbage

Mark Brown (1):
      arm64: mm: When logging data aborts only decode Xs when ISV=1

Mostafa Saleh (1):
      drivers/virt: pkvm: Fix end calculation in mmio_guard_ioremap_hook()

Pu Hu (2):
      arm64: kprobes: Only handle faults originating from XOL slot
      arm64: kprobes: Allow reentering kprobes while single-stepping

Richard Cheng (1):
      arm64/mm: Check the requested PFN range during memory removal

Steven Price (1):
      arm64: Correct value returned by ESR_ELx_FSC_ADDRSZ_nL()

Will Deacon (2):
      arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates
      Revert "arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates"

Yu Peng (1):
      arm64: fixmap: Allow 256K early_ioremap() at any offset

 arch/arm64/include/asm/esr.h                  |  2 +-
 arch/arm64/include/asm/fixmap.h               |  6 +++-
 arch/arm64/include/asm/kprobes.h              |  6 ++++
 arch/arm64/kernel/probes/kprobes.c            | 45 ++++++++++++++++++++++++++-
 arch/arm64/mm/fault.c                         |  7 +++--
 arch/arm64/mm/hugetlbpage.c                   |  2 +-
 arch/arm64/mm/mmu.c                           |  2 +-
 drivers/resctrl/mpam_devices.c                | 36 ++++++++++++---------
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c |  2 +-
 9 files changed, 85 insertions(+), 23 deletions(-)

