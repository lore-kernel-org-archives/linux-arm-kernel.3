Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA56FCC076
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 22:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0HRlxIcr2egUQ4gECLiFVcipr2MglHAhUSAdhiewtW4=; b=mmsGU5KzjNcMEjP5zYh0hoem5i
	LbTu6+HT5owHKHeU43tlXFMKpvTjSYObveDHdsnt6jMk/64aNm/61I7nsCYPJrmHvSyr+Q1mgQMmT
	XIDcuFmGwKB4i1dUhlE1XucgOHWiojJ8aUdSr10y9oYTjySaK385rtnG1HzYTTv3OonCVu28E9ytA
	9Q4vsrQSwoQZlxjFRybWThZPEr3hfXUnJQRO8jiKqa2vS9IVU9g4FJ3RYImIiR8xpUUUlsDDTXb85
	oA31X6yejfg/XB/9zbpfqqnAAWZ3foZV+kNRHbM79MTl//GHOAqHWR+J2FvvtaweIdv5bLpe5o8t6
	uwKPRbMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydys-00000004bef-3pAR;
	Fri, 06 Mar 2026 22:49:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydyq-00000004be4-0VvH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 22:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06B8640265;
	Fri,  6 Mar 2026 22:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A654C4CEF7;
	Fri,  6 Mar 2026 22:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772837349;
	bh=oMl8su5V2+G9MIbZwvOfYAhr3YWwqlOSF+49TBDeauM=;
	h=Date:From:To:Cc:Subject:From;
	b=GSIN/6VXxXKGomCDz8lZZhi4eeyWwlmaopQsatx4Sylb3Du1lRZXc7UmogK5ACTBn
	 WCREYN8GJhfznoUYmzo7wgZntcfgWFYsiSKKx3UzKIodGTc+x0WwnDdNgR49Fh0AWW
	 DzjzO/OjF5mC5EulPygE3wKgt5jexp9R8ilqlwO7yt/wok+kaK+4/OkSoOVaimqxj7
	 KAGTPAan2yi/Yw8fuUpr/YB7CYipey/Zrxt9e32TxPkLgXcWELLolFs4dyErcaEfKk
	 hRvxC8k752eZ5GY02kkhrghbXzu9f6j7yTYI2NxJG/zVPw7BCcHSwVtyYPG3q+GSP0
	 wK3fEy2RE5r/w==
Date: Fri, 6 Mar 2026 22:49:04 +0000
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc3
Message-ID: <aatZ4AQK7IRQEQo8@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_144912_183462_6AA6EA1A 
X-CRM114-Status: GOOD (  11.75  )
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

Please pull these arm64 fixes for -rc3. The main changes are a fix to
the way in which we manage the access flag setting for mappings using
the contiguous bit and a fix for a hang on the kexec/hibernation path.

There's the usual summary in the tag.

Cheers,

Will

--->8

The following changes since commit df6e4ab654dc482c1d45776257a62ac10e14086c:

  arm64: topology: Fix false warning in counters_read_on_cpu() for same-CPU reads (2026-02-26 18:27:15 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to d87c828daa7ead9763416f75cc416496969cf1dc:

  selftest/arm64: Fix sve2p1_sigill() to hwcap test (2026-03-06 11:54:26 +0000)

----------------------------------------------------------------
arm64 fixes for -rc3

- Fix kexec/hibernation hang due to bogus read-only mappings.

- Fix sparse warnings in our cmpxchg() implementation.

- Prevent runtime-const being used in modules, just like x86.

- Fix broken elision of access flag modifications for contiguous entries
  on systems without support for hardware updates.

- Fix a broken SVE selftest that was testing the wrong instruction.

----------------------------------------------------------------
Catalin Marinas (2):
      arm64: Silence sparse warnings caused by the type casting in (cmp)xchg
      arm64: mm: Add PTE_DIRTY back to PAGE_KERNEL* to fix kexec/hibernation

Jisheng Zhang (1):
      arm64: make runtime const not usable by modules

Piotr Jaroszynski (1):
      arm64: contpte: fix set_access_flags() no-op check for SMMU/ATS faults

Yifan Wu (1):
      selftest/arm64: Fix sve2p1_sigill() to hwcap test

 arch/arm64/include/asm/cmpxchg.h          | 12 ++++---
 arch/arm64/include/asm/pgtable-prot.h     | 10 +++---
 arch/arm64/include/asm/runtime-const.h    |  4 +++
 arch/arm64/mm/contpte.c                   | 53 ++++++++++++++++++++++++++++---
 tools/testing/selftests/arm64/abi/hwcap.c |  4 +--
 5 files changed, 67 insertions(+), 16 deletions(-)

