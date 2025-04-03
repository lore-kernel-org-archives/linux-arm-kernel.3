Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716D7C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mMAk9EaPelGbChZLOruFGLRr/eEiVWGNREHpXNJBoTw=; b=AmXDrGcQ17knraWnFT2Uu5cfMe
	If7e7GiOYTPWK2rpmpquMds3wHXqPIaRJ3Xjg3jC3wQThDcjdGG4Yn6IXVQJIdksUPEJp6fKFXvYp
	WOF9XSYPVYNh08m3pZGz+WT0feShce6KLe7YuPQ+Sdv6hv7JbyFz5+GTKbPZjOdhodUg7zcS56xXA
	M1/gNQtZXo2kNLI4dh55optUFkiPYlAsza0MCJCilrCg5w9X5OaU7IKANChbUz/Jl3LKvmebEHwTc
	nZyPkN0GPfkg+tI6qv8hmKyBI2V09rnasnfjMqvb+gD7Y4FdgeQj3IVHHJXHRcCQKgYe/BQzlo6RS
	C6oWbVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Hp0-00000008ZZE-1WGQ;
	Thu, 03 Apr 2025 10:29:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HPz-00000008TkG-03ro
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 10:03:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 74A2A68424;
	Thu,  3 Apr 2025 10:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4357CC4CEE3;
	Thu,  3 Apr 2025 10:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743674606;
	bh=o7gzNeABQTu7OlUf8+Hv1cJWigvJUHCi3CLLd/mdR1s=;
	h=Date:From:To:Cc:Subject:From;
	b=NQeCrPCtpbjiB4Vq8izbENwfUgsFlt6Mos9L1Gf6iKqkgu70pb05ycku5bB5CjAEZ
	 9uOSE9dmTQnrVxL6Kbr+hBsvfkearDcQdiEQVGN987ORMBwcRvijCaGE1ebLsLpmUf
	 vHZm3uYsCh7CtFmYw6/ZtgebBPLN4rPthTyTqePvsj6dLENZ9sdIyb4sKIAPnB3fUJ
	 KF+QDxCABmnM1eTwKbJ+g1VRoDLUzQtTOG1S/YBD/HozejnR/axaZfpJNEZXP8ygVU
	 kQwLd5Ktozt/3iJXnx5Rq8kMlgPIkK28xuieskdcOGwsDvWJ90w1oLzIUr5yk7BCfE
	 KafUpQPPd3Zog==
Date: Thu, 3 Apr 2025 11:03:22 +0100
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.15-rc1
Message-ID: <Z-5c6hCqQb3s5GxI@arm.com>
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

Please pull the arm64 fixes below that turned up during or shortly
before the merging window. They are based on top of the previous arm64
updates pull request (6.14-rc3).

(sending with my kernel.org address, hopefully not ending in spam this
time around)

Thanks.

The following changes since commit 64fa6b9322a904198589c0479dca6f2ed7f2eb04:

  Merge branch 'for-next/el2-enable-feat-pmuv3p9' into for-next/core (2025-03-25 19:32:32 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to c28f31deeacda307acfee2f18c0ad904e5123aac:

  arm64: Don't call NULL in do_compat_alignment_fixup() (2025-04-01 14:13:11 +0100)

----------------------------------------------------------------
arm64 fixes:

 - Fix max_pfn calculation when hotplugging memory so that it never
   decreases

 - Fix dereference of unused source register in the MOPS SET operation
   fault handling

 - Fix NULL calling in do_compat_alignment_fixup() when the 32-bit user
   space does an unaligned LDREX/STREX

 - Add the HiSilicon HIP09 processor to the Spectre-BHB affected CPUs

 - Drop unused code pud accessors (special/mkspecial)

----------------------------------------------------------------
Angelos Oikonomopoulos (1):
      arm64: Don't call NULL in do_compat_alignment_fixup()

Jinqian Yang (1):
      arm64: Add support for HIP09 Spectre-BHB mitigation

Keir Fraser (1):
      arm64: mops: Do not dereference src reg for a set operation

Peter Xu (1):
      arm64: mm: Drop dead code for pud special bit handling

Zhenhua Huang (1):
      arm64: mm: Correct the update of max_pfn

 arch/arm64/include/asm/cputype.h     | 2 ++
 arch/arm64/include/asm/pgtable.h     | 5 -----
 arch/arm64/include/asm/traps.h       | 4 ++--
 arch/arm64/kernel/compat_alignment.c | 2 ++
 arch/arm64/kernel/proton-pack.c      | 1 +
 arch/arm64/mm/mmu.c                  | 3 ++-
 6 files changed, 9 insertions(+), 8 deletions(-)

-- 
Catalin

