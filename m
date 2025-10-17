Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD76CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 21:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hwybPT10Rcf7wu7+RwSi/qpvm0zbyRD4aYGeDXWzI2k=; b=AzyC2ME6veKGJj2UbHBITeddpm
	32Jw3r65/7MKfkD/N+S1wa/bFtxhs5Tuomcjkiz/0zUWxtp1+id1Kh8Yvin8Hl5VnT0rDdezagdxR
	3rCXIL6CW7xoBS4gaxAgEIz/JozkCeqMeCdqnYCRlX0oqnXDlY7VzDNuXX9qLwSf49a2auyGuhvXI
	nahm23/rIRPjPzUvnbF7F9J4+rGg2txYaoouWMHxPEsOrAGABCaSpUbsr+lTzngzFi7F1J7OMxHQ7
	VefbfsuZi6zHJLSyQxr07QsKqoeptZFqEvjnUDybRbc+9b2HcR4UnFU/wSsDhTwhPZFmBIMmadQ0y
	EdGbAcmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9sJN-0000000955n-2DrY;
	Fri, 17 Oct 2025 21:48:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9sJK-0000000955U-3Nlg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 21:48:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3115B44E2F;
	Fri, 17 Oct 2025 21:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16432C4CEE7;
	Fri, 17 Oct 2025 21:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760737710;
	bh=xd1yFjt8Ov/S9tkR1UjGKlrmvIPjVzyg2KlyTqOt86g=;
	h=Date:From:To:Cc:Subject:From;
	b=j+WSwXh7xicyFQNvSwq+ywq5v4TQoFCf+V49qgiP8FnWrnJYgruFMflp0SQ9/hiX4
	 EmYol1SE0o/VgCGV6y7aCVXY1p9W+2Sh6JDlQCAFfsZ1LxjnX2jITnkHi3JHn5pCaa
	 DB7Px62p75PICjOyWnAGpyaUm880l0AWZhTQS5qu8+H2Z8x3gFN3KhJ78h+RMoebqi
	 +S0H+E0/4+vtIHWMnC9W+beVV8x7Cf8wM33YmNyCY7HnPIHEv/tUs0UyknulYpw7Lw
	 b5+Z0XAzSCASaJZdwb1QyyJA+bzP1IJLUBd9FxIQE8P/lFL0n8AE1gIRSPKJ4Z++b2
	 qC9sJmNjseH3A==
Date: Fri, 17 Oct 2025 22:48:26 +0100
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.18-rc2
Message-ID: <aPK5qkFphJvpJBkJ@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_144830_866045_5B845248 
X-CRM114-Status: UNSURE (   9.88  )
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

Please pull a couple of arm64 fixes below. Normally it's Will handling
the fixes this time around but he's fishing on some remote lake away
from the modern world (and internet connection). Thanks.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to ea0d55ae4b3207c33691a73da3443b1fd379f1d2:

  arm64: debug: always unmask interrupts in el0_softstp() (2025-10-17 18:08:05 +0100)

----------------------------------------------------------------
arm64 fixes:

 - Explicitly encode the XZR register if the value passed to
   write_sysreg_s() is 0. The GIC CDEOI instruction is encoded as a
   system register write with XZR as the source register. However, clang
   does not honour the "Z" register constraint, leading to incorrect
   code generation

 - Ensure the interrupts (DAIF.IF) are unmasked when completing
   single-step of a suspended breakpoint before calling
   exit_to_user_mode(). With pseudo-NMIs, interrupts are (additionally)
   masked at the PMR_EL1 register, handled by local_irq_*()

----------------------------------------------------------------
Ada Couprie Diaz (1):
      arm64: debug: always unmask interrupts in el0_softstp()

Lorenzo Pieralisi (1):
      arm64/sysreg: Fix GIC CDEOI instruction encoding

 arch/arm64/include/asm/sysreg.h  | 11 ++++++++++-
 arch/arm64/kernel/entry-common.c |  8 +++++---
 2 files changed, 15 insertions(+), 4 deletions(-)

-- 
Catalin

