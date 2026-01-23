Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280DCD778AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2AmZueBBxwcbmFuse2FrQw93IukXspqgsUbuEBbbSe8=; b=JV2oVxlmX74chmpGPJj/hFN0yA
	07/KYlApjEFi79PwQRRKpA/i03j7bjsjop1CryrYH8mdWphCGCJdeZ/7/hLjz8aijfifyQJJ8n1fy
	d96eewSZ1UrfpI70irh0OU7ANvKuMrPqUzIs4lcyiKmQo/a4WNyaT5/WdPFhHkNlAGnMDxGkj1IJB
	1vSx/ZsZubtrNJVhAL6HAo9RWBSEF44nVzNKrP9Eh4Ki0aEb3VyzWKt7nFVKK6zt/oD0TtetyedOm
	DL/Qv3AXkohkj5HxgXpJ1jib5FsF1CfPVmpki0CKqq6dC/GhQw53qUYzsYJ55ybBeaBzEnMQdqin0
	Z8M1bxIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjM2M-00000009MMl-3WUj;
	Fri, 23 Jan 2026 18:37:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjM2K-00000009MMS-32VO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 18:37:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04B99445B7;
	Fri, 23 Jan 2026 18:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AE7C4CEF1;
	Fri, 23 Jan 2026 18:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769193453;
	bh=QqghfQYs6gIVngNrbud+bq8jp6flTSCOZwS6FQiIxDA=;
	h=Date:From:To:Cc:Subject:From;
	b=qmv44h/VtPZFhcxzeez9crtwFQkX1M923qxoIWIz/PhSiNl+u/oxBKWf/pMepteTj
	 8dBPLatMBPOYK/YA7ie7Bf+LUs4Z4mebsKX9jjzClm5kEAOPPAnTHWavfuu3fii/09
	 k0Py/USU2TncCxQaBOZa0sMn2cMogdjXaraK1zwkFjcGpZ+CrwR8ag7wapvIL6W/H4
	 IFEOEKqnbenwum4CMMEYlHAKTbjNaNJAwLkEbn6Sv8oDk9PY007QYyhPP/J2WEIAod
	 OxGCic4+PMnDD7aAWQiei3iQhffn2Ok1wswoSZ2lFKd/NbqIF2f/r1qibyRV5PIXUp
	 HJOhnIPzvh15A==
Date: Fri, 23 Jan 2026 18:37:30 +0000
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.19-rc7
Message-ID: <aXO_6oqyqGevo4XW@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_103736_788633_09963389 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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

Please pull the arm64 fixes below. Thanks.

The following changes since commit b9f5c38e4af1a094384650d2fc79fb992d6d5e64:

  arm_mpam: Use non-atomic bitops when modifying feature bitmap (2026-01-16 12:04:20 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to e2f8216ca2d8e61a23cb6ec355616339667e0ba6:

  arm64: Set __nocfi on swsusp_arch_resume() (2026-01-23 18:13:07 +0000)

----------------------------------------------------------------
arm64 fixes:

 - A set of fixes for FPSIMD/SVE/SME state management (around signal
   handling and ptrace) where a task can be placed in an invalid state

 - __nocfi added to swsusp_arch_resume() to avoid a data abort on
   resuming from hibernate

----------------------------------------------------------------
Mark Rutland (3):
      arm64/fpsimd: ptrace: Fix SVE writes on !SME systems
      arm64/fpsimd: signal: Allocate SSVE storage when restoring ZA
      arm64/fpsimd: signal: Fix restoration of SVE context

Zhaoyang Huang (1):
      arm64: Set __nocfi on swsusp_arch_resume()

 arch/arm64/kernel/hibernate.c |  2 +-
 arch/arm64/kernel/ptrace.c    | 26 ++++++++++++--------------
 arch/arm64/kernel/signal.c    | 26 ++++++++++++++++++++------
 3 files changed, 33 insertions(+), 21 deletions(-)

-- 
Catalin

