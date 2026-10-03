Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED37CCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 07:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9EIcFLb+YrmmNcWC6f1tYu0S89BRAVqNIn6jBHgd39U=; b=YaGXwuCKKgiKgmtNMAIu+BUwAD
	lqWobK+quDdl+zm1J05OE7ojQDpPstBiKtxuY6cLiazlj9R38q6myDULraDnAFSm8iVXUAgFOLxrW
	rHvMHb+slJTCyu2uebwfOnbsTMgHeNUAoEStRz+iKoemL5JgAzLNmDIb9gVT+YBF2WshQ1P7V4vxT
	qe/E1+I+OmZPMpMvMew2rl3FCLUJ/3OPH8KoPS6/zpm248myXaMS7P8D8nNb9pw1c0YeuVfmAZnl0
	a8S33DQpkfzdRHgTKmOhI067tB3rdGpRuwyfr9VBY3GW9iGOtgdOz0GwoP0Y8GAXiQyrU3+gmT54+
	uSzhA8DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCueh-0000000D9Ji-24R1;
	Sat, 03 Oct 2026 07:59:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCuec-0000000D9Jb-2d81
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 07:59:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C2C4602C2;
	Sat,  3 Oct 2026 07:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B221F0089B;
	Sat,  3 Oct 2026 07:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791014373;
	bh=9EIcFLb+YrmmNcWC6f1tYu0S89BRAVqNIn6jBHgd39U=;
	h=Date:From:To:Cc:Subject;
	b=HFCW37jKJJtcHIUxrbs0X+9Qjq4hYtBrZuxuFklUWqDtNqH+V55rlxgK/uOtjMtlX
	 Eodwo3IMYyg6m6yhQ4PQzN4AfP8E25tvfJ6O7DD8GNcpKSJ5sR04lCWPkpcqi8Gibn
	 +PQFH9Da6QFnMmn1ubGibV5gwOu/6f5esCGLBXFTk+spev9lV/S7z9CZQ3ylk+sXnh
	 oMWeX5QQwILSZEP77FIZeESNbQ9ZGvfsKf+vT7VnROvLL0YxGSB57ZaWYFEUmep5t0
	 9xVOknypMZ/r6eqX0M/714DJK6eYKXtENOPOSBZ6pXs4XuxVcZtAqeYZJ9918L2ELb
	 FNfTKfBPleRHw==
Date: Sat, 3 Oct 2026 08:59:28 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc6
Message-ID: <asC14CHKGoRQLv6n@willie-the-truck>
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

Please pull these arm64 fixes for -rc6. Half of it is broken hardware
(AMU counters and TLB invalidation) and the other half is broken
software (frequency scaling and signals). So it seems as though we're
all as bad as each other.

The AMU workaround is a little noisy, as it refactors an existing
workaround so that it can more easily be applied to additional CPUs.

See you next week,

Will

--->8

The following changes since commit 2bc6b218717b9d08f466f88209251d54bc09b207:

  arm64/boot: Disable trapping of PMZR_EL0 writes to EL2 (2026-09-23 12:34:30 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to e060d9069b49fe55f38057dfe592068014652671:

  arm64/fpsimd: signal: Forbid non-streaming SVE payload on SME-only systems (2026-10-01 15:45:23 +0000)

----------------------------------------------------------------
arm64 fixes for -rc6

- Fix handling of CPU erratum #2645198 when batching pte updates

- Fix truncation of CPU frequency calculation by using 64-bit arithmetic
  in arch_freq_get_on_cpu()

- Work around AMU erratum #3821522 on Cortex-A725

- Fix panic when trying to restore an SVE sigframe on a CPU that only
  supports SME

----------------------------------------------------------------
Andrea Parri (1):
      arm64: mm: Fix the break-before-make flush range for erratum 2645198

Beata Michalska (2):
      arm64: errata: Factor out broken AMU const counter cap
      arm64: errata: Add Cortex-A725 erratum 3821522 workaround

Mark Rutland (1):
      arm64/fpsimd: signal: Forbid non-streaming SVE payload on SME-only systems

Oleg Keri (1):
      arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz

 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 30 +++++++++++++++++++++++++
 arch/arm64/kernel/cpu_errata.c              | 24 +++++++++++++++-----
 arch/arm64/kernel/cpufeature.c              |  2 +-
 arch/arm64/kernel/signal.c                  | 34 +++++++++++++++++------------
 arch/arm64/kernel/topology.c                | 22 +++++++++----------
 arch/arm64/mm/mmu.c                         |  2 +-
 arch/arm64/tools/cpucaps                    |  2 +-
 8 files changed, 84 insertions(+), 34 deletions(-)

