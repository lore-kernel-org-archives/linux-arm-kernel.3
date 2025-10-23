Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4061CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IJp/XqtN7+G9D4+XWBNVUPcq4JUHtkxVMO7bdxQ7ssA=; b=huGDLS/88Kr1f7RxDxS73YMl33
	sjENAS9vXwi6D5mW0lOuvocziKBlM8vo8NyZt7PMcE0T+yzajPfgWFy8QbBFR2J2SXA4EkGwFdKV1
	0E61ZbVaUpzQ/eKgKJJ7sXm0s5UKIT8Eb5kNqAOufjVxASC2H4b7dSfYzjdoiqXr3X+36PYlKXmYq
	j9ubgKrXTLC/3mRNgZHwHRqB/h4GAdjqEk9bx51Kr0zgTe5ttzhBNBSxsF4iRf4w4ucLy+m70FH4+
	fR9lYe8AmKh2aPYv0TA/mpDwLXFFsXddESgLa2eCaIXH9wi3Jyc/5ZJ9K/iHG2cZAyA+KC9aHeCpE
	exFY+Fzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzbj-000000078eg-2Nro;
	Thu, 23 Oct 2025 18:00:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzbd-000000078b9-2Esw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 18:00:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8C3C44FEE;
	Thu, 23 Oct 2025 18:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B45C4CEE7;
	Thu, 23 Oct 2025 18:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761242408;
	bh=84VtKb1TSjLg18NIXnUM3uCUfAjfiOvjdEwx7+IUEhI=;
	h=Date:From:To:Cc:Subject:From;
	b=pNRRfqE9vZF6Zkqdh0sTtu/EUHt/te9QKnVz3VxV1Bjs+ZiDIDB3GO0hydkJsTelo
	 j7q+FMh/I119oGHgfYTKQWk1dvSzCWR85sMZ9LR9oisivHyR0+UC7Pn/oNrgdCOrt8
	 i3INCeoLdW+QdogcD50zZfXxbLjfIgSsYt9VZIDsvSAt2WekG4GJluBqGpj1q0tKff
	 J8yi6KPrI0ybss3bqadR3aA/O5Z2P+TVnb3kdSVU+hO1mITVxnRGRXJ3Wv+a8mVxRj
	 Fq1U7LlNI3nH9Hh7ENHw1JD8jL2fZCAcR9v81t5+em4CoRYOc83HBVWPUbR4yv+ZOg
	 EAfZBJd2lwRrg==
Date: Thu, 23 Oct 2025 19:00:05 +0100
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.18-rc3
Message-ID: <aPptJe8qXOGO-lGt@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_110009_594332_DC7124A2 
X-CRM114-Status: GOOD (  10.48  )
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

The following changes since commit ea0d55ae4b3207c33691a73da3443b1fd379f1d2:

  arm64: debug: always unmask interrupts in el0_softstp() (2025-10-17 18:08:05 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to b98c94eed4a975e0c80b7e90a649a46967376f58:

  arm64: mte: Do not warn if the page is already tagged in copy_highpage() (2025-10-23 17:34:58 +0100)

----------------------------------------------------------------
arm64 fixes:

 - Do not make a clean PTE dirty in pte_mkwrite()

   The Arm architecture, for backwards compatibility reasons (ARMv8.0
   before in-hardware dirty bit management - DBM), uses the PTE_RDONLY
   bit to mean !dirty while the PTE_WRITE bit means DBM enabled. The
   arm64 pte_mkwrite() simply clears the PTE_RDONLY bit and this
   inadvertently makes the PTE pte_hw_dirty(). Most places making a PTE
   writable also invoke pte_mkdirty() but do_swap_page() does not and we
   end up with dirty, freshly swapped in, writeable pages.

 - Do not warn if the destination page is already MTE-tagged in
   copy_highpage()

   In the majority of the cases, a destination page copied into is
   freshly allocated without the PG_mte_tagged flag set. However, the
   folio migration may be restarted if __folio_migrate_mapping() failed,
   triggering the benign WARN_ON_ONCE().

----------------------------------------------------------------
Catalin Marinas (1):
      arm64: mte: Do not warn if the page is already tagged in copy_highpage()

Huang Ying (1):
      arm64, mm: avoid always making PTE dirty in pte_mkwrite()

 arch/arm64/include/asm/pgtable.h |  3 ++-
 arch/arm64/mm/copypage.c         | 11 ++++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

-- 
Catalin

