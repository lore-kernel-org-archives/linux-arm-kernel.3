Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE02D5C0C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WdLvCh2oZwdgTS/08Y5PZhiM3bTb9+Mp+XcAh/pKWPg=; b=w7PHx/yXTHEsEjP1DNaGQtHPC8
	Uwfp2/mZiGMtHGuJ0WBTiZ6MtxuHXuqVBKM1qaknIGuG6qLM6op3AIPVEqC99fuN8grgTNai0EBJG
	5XqJKS6qxvqhTTy//rr5KIrnS1R9xFxKEyQF+rhM6DzitFesiT3g4o8HF/6Gl2rAe/u2Jlumxvd4N
	s7qE5bAao/jdjh64thXc2AQo0f17JUtkIevAUmjayYW0hvrUqQLw0iKayNr9kU2ZO5/ThHFQ2RbU7
	aPW2BedlGFuUA51fLfEpPXpy+Dqg2XGp86xV+ek6LICRFxnGerwmCMHWIPl31tIAPLDGO3oLYLnbI
	dSmSp8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NsC-0000000ATRD-0Elr;
	Fri, 08 Nov 2024 12:13:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Nc4-0000000AQeo-313K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 11:57:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 874775C0F4F;
	Fri,  8 Nov 2024 11:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFB6C4CECD;
	Fri,  8 Nov 2024 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731067035;
	bh=fTsuTudBfDdFxkn1fwKanJcNb/J6/WmqUXH2vacHmtI=;
	h=Date:From:To:Cc:Subject:From;
	b=ODcsFpXcL3NMgWgdY5z6YAb97UoEeL2HpXT3eg8kEtISjP2y8HiVWoRSf4MhKy9dG
	 d+U27SeRqt42fiJzfZYb5M+chBBZoQ47YzlTb5ZkpRow4h0vhYX2/7DcZ9Beal8/kw
	 iMS7uFpCKIaAnz0eBv8PemL/LS2e27ZIUMu+G8SIELvngOtYpeAD57XMU6GHeplMBr
	 aL7vzaEd2lqlx+sRINXpJ5at3H2vGClYzFp6LrZZwK0txb7JuvnVUh15957z5jC+TV
	 ocQCyB8oHqOWrAfj27pmChlBxyoZq/TvNEckDxIio4WLuLaY5iFhxEY1ptmgDbsl04
	 MvGDe1klZOIWQ==
Date: Fri, 8 Nov 2024 11:57:11 +0000
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc7
Message-ID: <20241108115709.GA17107@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_035716_834477_1F70E5C8 
X-CRM114-Status: GOOD (  14.72  )
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

As promised, here is a (hopefully) final round of arm64 fixes for 6.12
that address some user-visible floating point register corruption. Both
of the Marks have been working on this for a couple of weeks and we've
ended up in a position where SVE is solid but SME still has enough
pending issues that the most pragmatic solution for the release and
stable backports is to disable the feature. Yes, it's a shame, but the
hardware is rare as hen's teeth at the moment and we're better off
getting back to a known good state before fixing it all properly. We're
also improving the selftests for 6.13 to help avoid merging broken code
in the future.

Anyway, the good news is that we're removing a lot more code than we're
adding.

Cheers,

Will

--->8

The following changes since commit 2e8a1acea8597ff42189ea94f0a63fa58640223d:

  arm64: signal: Improve POR_EL0 handling to avoid uaccess failures (2024-10-29 17:59:12 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 81235ae0c846e1fb46a2c6fe9283fe2b2b24f7dc:

  arm64: Kconfig: Make SME depend on BROKEN for now (2024-11-07 11:20:35 +0000)

----------------------------------------------------------------
arm64 fixes for -rc7

- Fix handling of SVE traps from userspace on preemptible kernels when
  converting the saved floating point state into SVE state.

- Remove broken support for the SMCCCv1.3 "SVE discard hint"
  optimisation.

- Disable SME support, as the current support code suffers from numerous
  issues around signal delivery, ptrace access and context-switch which
  can lead to user-visible corruption of the register state.

----------------------------------------------------------------
Mark Brown (1):
      arm64/sve: Discard stale CPU state when handling SVE traps

Mark Rutland (2):
      arm64: smccc: Remove broken support for SMCCCv1.3 SVE discard hint
      arm64: Kconfig: Make SME depend on BROKEN for now

 arch/arm64/Kconfig             |  1 +
 arch/arm64/kernel/fpsimd.c     |  1 +
 arch/arm64/kernel/smccc-call.S | 35 +++--------------------------------
 drivers/firmware/smccc/smccc.c |  4 ----
 include/linux/arm-smccc.h      | 32 +++-----------------------------
 5 files changed, 8 insertions(+), 65 deletions(-)

