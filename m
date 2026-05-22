Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD7CCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Th0xuEFUWvtbY3CJ3v5IoFxV8Djmrn1oWCif0Z9N5iw=; b=gp6UB7Jlt5ycJ5Wzopksc2XlbM
	wqIcG3GNjbQBPzPKesyHhoLOPl8phnMfdqV7DZ1zCF5XDMZ8vA1foWnW3WjijaBTJQlEChfcN8go+
	HAOyIa0IjsMFzw01T2l2fcNN+2jVYScgDy6uDOuuEwzJn3qLfDH7GEgpoCAeOh1WqeTSjukEguqEk
	vgcIaQXrgncs+/ji0ZsFd7t43ryLKY5z1PrFgg+xGIHrICKNxOqmca5VoX8uAfY3VP88kAsOhZ3Yj
	Bk5euqKBMdXEd5uoqGTVeUAL02k7zV1CZrD5QEq2+igFs5QkRtfiZ/R8Bx05ZI8Qkqy3GIUy5gDIP
	NsCGtWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPcJ-0000000AuW9-36Vb;
	Fri, 22 May 2026 13:08:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPcG-0000000AuVc-3MgW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:08:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A134626BC;
	Fri, 22 May 2026 06:08:32 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DDFE3F7B4;
	Fri, 22 May 2026 06:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779455317; bh=Sy8A8d0ASCiHF62sSGqQxFN/BJ6vlYXdpHxU7r6WEts=;
	h=Date:From:To:Cc:Subject:From;
	b=Sh5wIxnYysaawdKwAOuGae3+gXEsGeXllhO4OgTo7PJiCU4/ELT8ibyx+RMKAZRuh
	 PQo2vaxs73SDuZ94YI1jMmZ1UGe0JIROstP1okQ87xlds62hppGbmxN6I+mG9BVzHt
	 R+MZZ/x6FOxKu0j1mteMdh1rwa8cEKghAFkPPZa4=
Date: Fri, 22 May 2026 14:08:34 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 7.1-rc5
Message-ID: <ahBVUtmWJue3HmV8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_060841_104880_F6B88181 
X-CRM114-Status: GOOD (  10.32  )
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

The following changes since commit 6ccbb613b42a1f1ba7bfd547a148f644a902a25c:

  arm_mpam: Check whether the config array is allocated before destroying it (2026-05-14 09:52:05 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to c2ff4764e03e7a8d758352f4aceb8fe1be6ac971:

  arm64: tlb: Flush walk cache when unsharing PMD tables (2026-05-22 11:13:51 +0100)

----------------------------------------------------------------
arm64 fixes:

 - Handle probe on hinted conditional branch instructions. BC.cond
   instructions can be simulated in the same way as B.cond instructions,
   so extend the decode mask for B.cond to cover BC.cond

 - Flush the walk cache when unsharing PMD tables. Recent changes to
   huge_pmd_unshare() introduced mmu_gather::unshared_tables but the
   arm64 code was still treating the TLB flushing as only targeting leaf
   entries (TLBI VALE1IS). Fix it by using non-leaf-only instructions
   (TLBI VAE1IS) when tlb->unshared_tables is set

----------------------------------------------------------------
Vladimir Murzin (1):
      arm64: probes: Handle probes on hinted conditional branch instructions

Zeng Heng (1):
      arm64: tlb: Flush walk cache when unsharing PMD tables

 arch/arm64/include/asm/insn.h | 2 +-
 arch/arm64/include/asm/tlb.h  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
Catalin

