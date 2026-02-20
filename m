Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001D0C56201
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 15:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nHko86wR9he8NccaSKeJR7KAVV8zh6/apBajMVPcRog=; b=mMDWomjAyMI68iPZZ9FYrFr47k
	+fBtJdk0tyG5lb9L3zMKUo8unlxHwU7NiQFJqjACQDjaTyR69fT5fGSXLQBcmt8jpAb/Qk5PI+y3P
	oWkepvljN0jItl7EFwufHM5+lvRExotnB5erxlXZbt4LSwfpPcEq1X9alvD5OIOGLTd4FICPTptZX
	2zjuOiqdQbnsc5FvXOQvQmqGeENuKElMA9q5JKuluvHhmx6wwlGAgUaAgaUOcjUOikjyUzQBya5LP
	KbWbdf2v5qeMGr+El9HIcv4eywkmYQ2vWUUtpWSw9ueGQQ57riMZ75XVjrAYeVgrWgwukNwz0aDO3
	TOHm7w8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSdK-0000000F4ZT-32q1;
	Fri, 20 Feb 2026 15:41:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSdI-0000000F4YH-1qRv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 15:41:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7265040967;
	Fri, 20 Feb 2026 15:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8BCC116C6;
	Fri, 20 Feb 2026 15:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771602091;
	bh=HhlFIas0z3LqVdWnE55/tFWaALrW2dWwPOh8JlBMCsw=;
	h=Date:From:To:Cc:Subject:From;
	b=o1nk5zqsxt2B0gCcd7+O3ISsJiJ0iqozbvrtRhb+9T0h3zPvvZLtL3c9hnsWZGZ/6
	 MG2GxZWfsLe2SJCRL4gzo+iTUTdypW8EPZorH5TBAorJDwSZ57wnM5Hgefcus8S7m4
	 U3JmoLdV35oyEXBJur+hqE5f132IqB7oYnMZJ7QTryVdYCq5b+PbIUzaIQMsdLh3Bj
	 uSFJyaw50Shq9Kx0MbrHipHxD3K5IlcRwKXQn3sviz2ygAkUbfBJKp1XwDJ/R/7D5Y
	 cNJWq5pAV34o1ri+TKT9lGlb/RDLUs3l6kF1dpE9dkl05zqY9M6jzqeA/id5GCMteA
	 l4HDfBeD4pIiA==
Date: Fri, 20 Feb 2026 15:41:27 +0000
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc1
Message-ID: <aZiApyXis2_3vg_t@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_074132_499276_497962E5 
X-CRM114-Status: UNSURE (   9.21  )
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

Please can you pull these two arm64 fixes for -rc1?

One fixes a warning that started showing up with GCC 16 and the other
fixes a lockup in udelay() when running with a vCPU loaded on a CPU with
the new-fangled WFIT instruction.

Cheers,

Will

--->8

The following changes since commit 36c0de02575ce59dfd879eb4ef63d53a68bbf9ce:

  perf/arm-cmn: Reject unsupported hardware configurations (2026-02-03 19:43:52 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 729a2e8e9ac47099a967567389cc9d73ef4194ca:

  arm64: hugetlbpage: avoid unused-but-set-parameter warning (gcc-16) (2026-02-19 12:33:52 +0000)

----------------------------------------------------------------
arm64 fixes for -rc1

- Fix compiler warning from huge_pte_clear() with GCC 16.

- Fix hang in udelay() on systems with WFIT by consistently using the
  virtual counter to calculate the delta.

----------------------------------------------------------------
Arnd Bergmann (1):
      arm64: hugetlbpage: avoid unused-but-set-parameter warning (gcc-16)

Marc Zyngier (1):
      arm64: Force the use of CNTVCT_EL0 in __delay()

 arch/arm64/include/asm/pgtable.h |  9 +++++++--
 arch/arm64/lib/delay.c           | 19 +++++++++++++++----
 2 files changed, 22 insertions(+), 6 deletions(-)

