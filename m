Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB39BF5A8B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 19:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DRP/ct+Cln23X3vPROCzqtnFJK3nUx496Tyo3sOVW1Q=; b=qNn0NboI+Z1P3hGACDzLKgTGIm
	nm0sHWdfNOA8Ll22gLKJJzPF5Ymfo/iSPMMnX+ZfsEE2yVXcwEl8IX7Kcu2rrAr44rZMdWIHZANZG
	Pao9F5s10yMJ5PZhWiO6wNPgZBKL2DNT6jlqIZns6Oze65T6DoB13qBJF5SDiKlsShqV4//fggJ3O
	Y1j4rrrtwbMtyKSF1+xpDLqm8wYpVBpJDtf48BixeiVX+4oRNbeixOwC252nSQu3vuYJT6usIW6Lh
	U4YoFAgURyJ3Rzkjjw6vR5ESJxal35yWxYya0wBTWNg3Yc8qPWOftrvfJjUm0+Wb5zPlb3VkwyDPa
	502mo1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEubu-00000007bF1-1qZD;
	Mon, 20 Apr 2026 19:48:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEubr-00000007bEg-1hgQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 19:48:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57EA12934;
	Mon, 20 Apr 2026 12:48:35 -0700 (PDT)
Received: from arm.com (unknown [10.57.88.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFF153F915;
	Mon, 20 Apr 2026 12:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776714520; bh=lxvYnOIAQzYn0BvPXuqJ5lTkmdUfRuCSsioM4ikOSZc=;
	h=Date:From:To:Cc:Subject:From;
	b=m0wSTfx3ypJUlw0k+1HqW+Q772X0yxaHtcxqp431qUYG2tarlQmrsYvhXMKca0NmN
	 NJYkoF+qW8+hsKEDQkVFIUcKpvVqjp8RGsRHq8twSlW+9+m8xHPdkqKF2s11s9dcKD
	 pFpRya3ONW/4W/SjAkA5U25LEXjzQoTwyYggLGDQ=
Date: Mon, 20 Apr 2026 20:48:36 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 updates for 7.1-rc1 (second round)
Message-ID: <aeaDFH0-2zhOQTxy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_124843_653158_53A51184 
X-CRM114-Status: GOOD (  14.11  )
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

Please pull the second round of arm64 updates for 7.1. The main
"feature" is a workaround for C1-Pro erratum 4193714 requiring IPIs
during TLB maintenance if a process is running in user space with SME
enabled. The hardware acknowledges the DVMSync messages before
completing in-flight SME accesses, with security implications. The
workaround makes use of the mm_cpumask() to track the cores that need
interrupting (arm64 hasn't used this mask before).

The rest are fixes for MPAM, CCA and generated header that turned up
during the merging window or shortly before.

Thanks.

The following changes since commit 480a9e57cceaf42db6ff874dbfe91de201935035:

  Merge branches 'for-next/misc', 'for-next/tlbflush', 'for-next/ttbr-macros-cleanup', 'for-next/kselftest', 'for-next/feat_lsui', 'for-next/mpam', 'for-next/hotplug-batched-tlbi', 'for-next/bbml2-fixes', 'for-next/sysreg', 'for-next/generic-entry' and 'for-next/acpi', remote-tracking branches 'arm64/for-next/perf' and 'arm64/for-next/read-once' into for-next/core (2026-04-10 14:22:24 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream

for you to fetch changes up to 858fbd7248bd84b2899fb2c29bc7bc2634296edf:

  Merge branch 'for-next/c1-pro-erratum-4193714' into for-next/core (2026-04-20 13:12:35 +0100)

----------------------------------------------------------------
arm64 updates for 7.1 (second round):

Core features:

 - Add workaround for C1-Pro erratum 4193714 - early CME (SME unit)
   DVMSync acknowledgement. The fix consists of sending IPIs on TLB
   maintenance to those CPUs running in user space with SME enabled

 - Include kernel-hwcap.h in list of generated files (missed in a recent
   commit generating the KERNEL_HWCAP_* macros)

CCA:

 - Fix RSI_INCOMPLETE error check in arm-cca-guest

MPAM:

 - Fix an unmount->remount problem with the CDP emulation, uninitialised
   variable and checker warnings

----------------------------------------------------------------
Ben Horgan (2):
      arm_mpam: resctrl: Fix the check for no monitor components found
      arm_mpam: resctrl: Make resctrl_mon_ctx_waiters static

Catalin Marinas (6):
      arm64: tlb: Introduce __tlbi_sync_s1ish_{kernel,batch}() for TLB maintenance
      arm64: tlb: Pass the corresponding mm to __tlbi_sync_s1ish()
      arm64: cputype: Add C1-Pro definitions
      arm64: errata: Work around early CME DVMSync acknowledgement
      Merge branches 'for-next/misc' and 'for-next/mpam' into for-next/core
      Merge branch 'for-next/c1-pro-erratum-4193714' into for-next/core

Mark Brown (1):
      arm64/hwcap: Include kernel-hwcap.h in list of generated files

Sami Mujawar (1):
      virt: arm-cca-guest: fix error check for RSI_INCOMPLETE

Zeng Heng (1):
      arm_mpam: resctrl: Fix MBA CDP alloc_capable handling on unmount

 Documentation/arch/arm64/silicon-errata.rst     |  2 +
 arch/arm64/Kconfig                              | 12 ++++
 arch/arm64/include/asm/Kbuild                   |  1 +
 arch/arm64/include/asm/cpucaps.h                |  2 +
 arch/arm64/include/asm/cputype.h                |  2 +
 arch/arm64/include/asm/fpsimd.h                 | 21 ++++++
 arch/arm64/include/asm/tlbbatch.h               | 10 ++-
 arch/arm64/include/asm/tlbflush.h               | 94 +++++++++++++++++++++++--
 arch/arm64/kernel/cpu_errata.c                  | 30 ++++++++
 arch/arm64/kernel/entry-common.c                |  3 +
 arch/arm64/kernel/fpsimd.c                      | 79 +++++++++++++++++++++
 arch/arm64/kernel/process.c                     | 36 ++++++++++
 arch/arm64/kernel/sys_compat.c                  |  2 +-
 arch/arm64/tools/cpucaps                        |  1 +
 drivers/resctrl/mpam_resctrl.c                  | 12 +++-
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c |  3 +-
 16 files changed, 297 insertions(+), 13 deletions(-)

-- 
Catalin

