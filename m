Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91BC1098782
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FwjGYHLhzXrIB52sblJq6ltbcXGB6eiIAIejM/JliF0=; b=bmHF5j4mv9voYgIMneY/Z7Z0ks
	ulZ1yJZE2IVrx/LxKPgtv1VoPmYQ+G6Jm+UpI+KrjGSYz1zVHpxFRNCT4zHUn1I3tl8IjhT2fVISy
	B0BiK+uxaVQvKgBtdz737v/S3Rwqr6J1Wfvd+TXH7Cfr1wUv6kKtJHDsKrPf1yHU1wdzhYLKdjHWC
	yNdDXQKMsSx/OaAf39DjjJGDQk7wOkyvnunlkEPUseQgsA/+xTFwgG3cQPHPmCqjLDSeVgERGORr8
	zBdPJPOCs6up4TgbEVIxMZ7IxmdQaLGVYBIqzBYgUfGlIoss0eYKYdI2ugFZwRDT283r3OfuEe8Ai
	RixM/MOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ZYO-0000000CpLd-1SAc;
	Fri, 20 Mar 2026 13:06:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ZYM-0000000CpLI-1HFJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 13:06:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0765F406A6;
	Fri, 20 Mar 2026 13:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86BFC4CEF7;
	Fri, 20 Mar 2026 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774011973;
	bh=8pSAPusabmjMrU3euuXusTDZ4rSCYKcfvAegWoDM180=;
	h=Date:From:To:Cc:Subject:From;
	b=kHDjTxzLLqG1g85GidUr37DBvulxgiZUZLxnuxiswU/wyYnm3T6dCj3hVoskiQ5uY
	 UTrXtEBvZeOBjFL7UWjt62P2RsjOwDer39+KqkPtHGNNe8ytZ2eh3AtforVhmLDnY/
	 TnTj3uUNrf0oS7WoJQWukeRKinOIZiNRk2nX/foXU+ROQHZq+2iWRL8dFUchIFtATH
	 k4r4ZOyXeNK9W36OE/OXCk5VG5H8CVXM7ZBBbUkkhatfAc/F9fFCuHdbHy1MSvPQhb
	 ezWXhDQ2J0lerSyPJllRshKBi4bu/eOUpAJ5PE0kB1jcM8JcjT+DwlUSGT5zJ2W8BM
	 r/RhxwjOYZKyw==
Date: Fri, 20 Mar 2026 13:06:09 +0000
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc5
Message-ID: <ab1GQXqkgL61wARW@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_060614_363531_14CF76B0 
X-CRM114-Status: GOOD (  10.78  )
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

Please pull these arm64 fixes for -rc5. There's a small crop of fixes
for the MPAM resctrl driver, a fix for SCS/PAC patching with the AMDGPU
driver and a page-table fix for realms running with 52-bit physical
addresses.

Summary in the tag.

Cheers,

Will

--->8

The following changes since commit d87c828daa7ead9763416f75cc416496969cf1dc:

  selftest/arm64: Fix sve2p1_sigill() to hwcap test (2026-03-06 11:54:26 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 8c6e9b60f5c7985a9fe41320556a92d7a33451df:

  arm64: realm: Fix PTE_NS_SHARED for 52bit PA support (2026-03-19 12:46:05 +0000)

----------------------------------------------------------------
arm64 fixes for -rc5

- Fix DWARF parsing for SCS/PAC patching to work with very large modules
  (such as the amdgpu driver).

- Fixes to the mpam resctrl driver.

- Fix broken handling of 52-bit physical addresses when sharing memory
  from within a realm.

----------------------------------------------------------------
Ben Horgan (2):
      arm_mpam: Fix null pointer dereference when restoring bandwidth counters
      arm_mpam: Disable preemption when making accesses to fake MSC in kunit test

Krzysztof Kozlowski (1):
      arm_mpam: Force __iomem casts

Pepper Gray (1):
      arm64/scs: Fix handling of advance_loc4

Suzuki K Poulose (1):
      arm64: realm: Fix PTE_NS_SHARED for 52bit PA support

 arch/arm64/kernel/pi/patch-scs.c    |  8 ++++++++
 arch/arm64/kernel/rsi.c             |  3 ++-
 drivers/resctrl/mpam_devices.c      |  2 ++
 drivers/resctrl/test_mpam_devices.c | 22 +++++++++++++++-------
 4 files changed, 27 insertions(+), 8 deletions(-)

