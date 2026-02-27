Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEF11039895
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 21:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q95YUMi1wDJhpqCpvyi7ZIMSbNgKAnCxNEvXSIETXQU=; b=XyFv4EJ6id1c38oGDkjnyuPBKQ
	YyDg4IBroqN3hW9ZAM/o7gXVoFRsdnyOfdktRWiu7eHWwwqsEn3/Hl8t+eX2o2geTdEw7QGA0+mns
	wu85fAio6MJqzV8MLZt5EWoquAidk7U93JL9859XClI5TqloePMeoI4qgeZKeBhe67B/Dx9nAdW+B
	X73Kr2tkZ4Twfr2S5zoPLoGxOukrGD4TWvkiqv18gP5cFcFoqh03lO6JnfvmbduwXEi8tTTGGgBl4
	7XLRhTa+xXRJwLbeaLRF6OGuhUSjgR/B0NB82b5x8Sx3sOrT9kWWPtaVy/MBLJ0L9JFQaVdfbBLHs
	pI9ufqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5GE-00000009Abx-3DCo;
	Fri, 27 Feb 2026 21:20:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5GD-00000009Abr-0ck4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 21:20:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 934EB60054;
	Fri, 27 Feb 2026 21:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21842C19423;
	Fri, 27 Feb 2026 21:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772227231;
	bh=TNqxRiX5fJGv1YfKVaxqgghtCHWX9+he4UxxuNIYStc=;
	h=Date:From:To:Cc:Subject:From;
	b=YXyvnwlZBfGI2tITrltKdLFIV8rm8GeA4E/mYjUe9QJcarC7ocC5GD3s4Y6zyidJC
	 yuxBF2z9htFgX9CQ4FJmHdLKsOwSx+n/XIoY33BXDkqKAs7bGPDUpWo9E/labwIxU7
	 1aojmbw6PNmReei8zCIvdGW9kB0mpoBXEnvc96rXVFY3XwNjie+O6MFEWVaPYgLF2G
	 4OBULr7gZDUIFeMfSxFCva32SaGn2cfTyCYqlrWXO6CldpXKXqDmWEmp461hrjr9KW
	 f3CA9sIWDuPQdpiObHi7RK+b65QejZFUzy/6ODSd5Faq+mSing7ipPIOr2zfFxoW5T
	 yBpsJthJGPDdw==
Date: Fri, 27 Feb 2026 21:20:26 +0000
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc2
Message-ID: <aaIKmlW2xm8EgoyV@willie-the-truck>
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

Please pull this batch of arm64 fixes for -rc2. The summary is in the
tag but the diffstat is dominated by changes to our TLB invalidation
errata handling and the introduction of a new GCS selftest to catch one
of the issues that is fixed here relating to PROT_NONE mappings.

There are still a few other issues being worked on, so you can expect
another batch of fixes next week.

Cheers,

Will

--->8

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to df6e4ab654dc482c1d45776257a62ac10e14086c:

  arm64: topology: Fix false warning in counters_read_on_cpu() for same-CPU reads (2026-02-26 18:27:15 +0000)

----------------------------------------------------------------
arm64 fixes for -rc2

- Fix cpufreq warning due to attempting a cross-call with interrupts
  masked when reading local AMU counters.

- Fix DEBUG_PREEMPT warning from the delay loop when it tries to access
  per-cpu errata workaround state for the virtual counter.

- Re-jig and optimise our TLB invalidation errata workarounds in
  preparation for more hardware brokenness.

- Fix GCS mappings to interact properly with PROT_NONE and to avoid
  corrupting the pte on CPUs with FEAT_LPA2.

- Fix ioremap_prot() to extract only the memory attributes from the
  user pte and ignore all the other 'prot' bits.

----------------------------------------------------------------
Catalin Marinas (3):
      arm64: gcs: Do not set PTE_SHARED on GCS mappings if FEAT_LPA2 is enabled
      arm64: gcs: Honour mprotect(PROT_NONE) on shadow stack mappings
      kselftest: arm64: Check access to GCS after mprotect(PROT_NONE)

Marc Zyngier (1):
      arm64: Fix sampling the "stable" virtual counter in preemptible section

Mark Rutland (2):
      arm64: tlb: Allow XZR argument to TLBI ops
      arm64: tlb: Optimize ARM64_WORKAROUND_REPEAT_TLBI

Sumit Gupta (1):
      arm64: topology: Fix false warning in counters_read_on_cpu() for same-CPU reads

Will Deacon (2):
      arm64: io: Rename ioremap_prot() to __ioremap_prot()
      arm64: io: Extract user memory type in ioremap_prot()

 arch/arm64/include/asm/io.h                        | 26 ++++++--
 arch/arm64/include/asm/pgtable-prot.h              |  3 -
 arch/arm64/include/asm/tlbflush.h                  | 63 ++++++++++--------
 arch/arm64/kernel/acpi.c                           |  2 +-
 arch/arm64/kernel/sys_compat.c                     |  2 +-
 arch/arm64/kernel/topology.c                       | 21 ++++--
 arch/arm64/kvm/hyp/nvhe/mm.c                       |  2 +-
 arch/arm64/kvm/hyp/nvhe/tlb.c                      |  8 +--
 arch/arm64/kvm/hyp/pgtable.c                       |  2 +-
 arch/arm64/kvm/hyp/vhe/tlb.c                       | 10 +--
 arch/arm64/lib/delay.c                             |  6 +-
 arch/arm64/mm/ioremap.c                            |  6 +-
 arch/arm64/mm/mmap.c                               | 12 +++-
 .../arm64/signal/testcases/gcs_prot_none_fault.c   | 76 ++++++++++++++++++++++
 14 files changed, 179 insertions(+), 60 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/signal/testcases/gcs_prot_none_fault.c

