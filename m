Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D3BCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TPPhZoPptZw0BuAuXEu+AmirEQrC29ZkluE6KKz/+wA=; b=WSwnNE8i5Av78ozU2P4yQhgXjC
	Zd5+CLaoXE+dGO/i8aKuRBmzXNajLWO2Tw1k3DLetYkEPgTLcloLJjp14nwSMCpZb57k30xmuIhF4
	ctetz+cslFqX6L7ra9CavF0suAveZsbrTkbYzI/CWlyJx3ZNKE2LRBpe61fMnJ9lV7bAi5YsviZCp
	GhJ4cQnay6t8nxU6M/Fo1/sk4snOcLEsHcHt75TKokP7sPK7TLe+yfqQFnXj7fpmOi1Apm3APpoMY
	MTgHB/PtIiX0cY6hV5ZLDzoj8eoeTny2GqKd2zVxz/XkJpPARD6nQHCUBNJQlNdR6Lp/Q0pxg4yau
	Ie/5gtVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5Rj-00000005lcp-38yw;
	Fri, 09 Oct 2026 07:55:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5Ri-00000005lcR-2HNx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 07:55:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A27AF602C3;
	Fri,  9 Oct 2026 07:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE89F1F000FF;
	Fri,  9 Oct 2026 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791532513;
	bh=TPPhZoPptZw0BuAuXEu+AmirEQrC29ZkluE6KKz/+wA=;
	h=Date:From:To:Cc:Subject;
	b=ikhouu69VgjzDcPEGu1DjthWGro28ttAT3hnW3MZ41u6IzXqU+G2a7gaYTuSzxWwX
	 efYEremPSCd26YhUShPZW+I4K7S2kYz7z2fWuqOpX/fAerGj6Qd37z8OiiBlgwzCTF
	 EBeGZ0TJQv5yFsOVZ6crWNDh5fgzL/hPkgSfT2bVr/liNrfSJHlr49xt1XEbUKk29n
	 fteM1Mnmv8yAJ1pb6regpIw3p3g2Mq++suCAPXs1hPPhzHFuXW1WDVSlydAJMUlhop
	 zmoxsXxe9zWQH1z33nVa12QLVe/wJ3Q4RlTIPSeWHhMNGQU/N6+rIzbAkk7+iqP414
	 hXeyv03/k58Nw==
Date: Fri, 9 Oct 2026 08:55:09 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc7
Message-ID: <asid3RY1C6mbTvh9@willie-the-truck>
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

It finally seems to have calmed down on the arm64 fixes front, so please
pull these two straightforward fixes for -rc7. One fixes the EL2 trap
configuration for implementation-defined CPU PMU hardware during boot
and the other fixes a kcov selftest failure by excluding our softirq
early entry code.

Cheers,

Will

--->8

The following changes since commit e060d9069b49fe55f38057dfe592068014652671:

  arm64/fpsimd: signal: Forbid non-streaming SVE payload on SME-only systems (2026-10-01 15:45:23 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to a9cd14bfb0c113f1cd77be4349784663bec71bb4:

  arm64: irq: exclude the softirq stack switch from KCOV (2026-10-07 09:39:11 +0000)

----------------------------------------------------------------
arm64 fixes for -rc7

- Fix PMU EL2 trap configuration for CPUs with an IMPDEF PMU.

- Fix kcov boot selftest failure by excluding our early IRQ entry code.

----------------------------------------------------------------
Fuad Tabba (1):
      arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3

Karl Mehltretter (1):
      arm64: irq: exclude the softirq stack switch from KCOV

 arch/arm64/include/asm/el2_setup.h | 5 +++--
 arch/arm64/kernel/Makefile         | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

