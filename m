Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D9CCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 12:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WA2CZtBS9fHMoIY/zwvWk1Henhm4f4v0yv0DUKTe2HI=; b=nVAcpHseIZ+F4O4zF7kWNjD1dW
	C4B7jVvDAKNuOjnfW0E4QVnYzXCsUWPELQ3eks33V1h18Fqlx97QL93gfzVz95a28FvvWULDJUEqv
	lR/zHwiRSmQQhAl5mVnKp1Ld2x33n8jh5cAh2RfIO4jxG7vgfiknT4Hzx12LbFYr50HBgSOmYygIL
	sHBvEVsYNP1FlePfl/cJeybLW0YxfZnoH+mugTG13mX1ogaoy/+JgU9Pv9vZHqOBUrJPvO0kusQiC
	AoxV6T/HEWnGcEvs+fc5DxEzW1F+t9oa8tRyDWRC0C9q6Xj3e7t6jdaIC04pIoVPtrEaDAPdK21zt
	A7iYn/HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLAM-00000007tCp-339F;
	Sat, 30 Aug 2025 12:58:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usL7d-00000007suz-0WsY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 12:55:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79EBA601AE;
	Sat, 30 Aug 2025 12:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F249CC4CEF4;
	Sat, 30 Aug 2025 12:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756558555;
	bh=uP51najkfs7vJzJ0QsafPgpRZW4SWTRyZVZeQrPAzpI=;
	h=Date:From:To:Cc:Subject:From;
	b=RvHL3ojEBrITnNcKWqBd0DYDCz2MusIAQLkyW9AtSu4sBqU2fFhXxXxnciv3AIn0j
	 mDHaGvOtCCsiSuESXkzPhr7TDvfSE0+3yJVgSKINaZ/RVLQE0700eRM++x4K3pzPlh
	 koyMwhtklcFaEtYH9hUvzVicuaq5NJW1EZ2QqnnlB1g5xnhwcFQ4xLOUEgYspFs/iP
	 BDX2kNzC8VHOoHSeJKX9id6SSrI9LB/pqVubSTb3vGhmQWslcqQbCpFfyzmfegJ8vB
	 HB8QJlbMkxD9PggzNdrRiM25uWHrSjaF/g9OeJH3TX9UuK6TJmq32ngeBYOeu28Cr8
	 NQMGgSU+ixpqQ==
Date: Sat, 30 Aug 2025 13:55:52 +0100
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.17-rc4
Message-ID: <aLL02Fi-gazNRa1G@arm.com>
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

Please pull a couple of small arm64 fixes below (for -rc4 if there's
still time, otherwise -rc5 is fine as well). Thanks.

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to d82aa5d3501b25bfb7bc2a24a68ad0a83b2ad10b:

  kselftest/arm64: Don't open code SVE_PT_SIZE() in fp-ptrace (2025-08-30 11:31:11 +0100)

----------------------------------------------------------------
Two arm64 fixes:

- CFI failure due to kpti_ng_pgd_alloc() signature mismatch

- Underallocation bug in the SVE ptrace kselftest

----------------------------------------------------------------
Kees Cook (1):
      arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc function signature

Mark Brown (1):
      kselftest/arm64: Don't open code SVE_PT_SIZE() in fp-ptrace

 arch/arm64/include/asm/mmu.h                 | 7 +++++++
 arch/arm64/kernel/cpufeature.c               | 5 +++--
 arch/arm64/mm/mmu.c                          | 7 -------
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 5 ++---
 4 files changed, 12 insertions(+), 12 deletions(-)

-- 
Catalin

