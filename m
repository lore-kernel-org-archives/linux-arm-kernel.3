Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36D7C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7vnO3oSB0cm4HtAkjL6UCxThtk+ZQrqxyAxnx1L/1Z4=; b=Qvhpah0VQKuEl/V/mSWoHnwPCF
	WsGIqi9ZZ4Slb73KC0vPQXQUrx6VbAOvaTvDN93nCRe78nvFC9Ll8/bHJXyMdyTkNegCu40gyVgYz
	YeNhquG9W2Fbd/Cj10eiJurZ7+ps9fLQxDOlgjL9T3WvYNTntl81iqwjSdhUZKyNGQVidfzWoNE3O
	WwN7LIXfO36ct+7nY5cN6Dy2hUxFG089rMr2aaGctFSlOWxBd8V7y9AtF1lIoLAacLMho1KOiev1Y
	mBkGTzj8Wl4QK99JY+RWAYrJLCI3yp6qXxDv7+yO8H7krvCVSAx6a2TzUjrGa0ilWuEK0LuFsPIun
	JKKXWSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hbE-0000000Areb-41Cf;
	Thu, 24 Sep 2026 11:26:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hbD-0000000AreO-2wqn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:26:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 25EF0404BE;
	Thu, 24 Sep 2026 11:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8397B1F000FF;
	Thu, 24 Sep 2026 11:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790249207;
	bh=7vnO3oSB0cm4HtAkjL6UCxThtk+ZQrqxyAxnx1L/1Z4=;
	h=Date:From:To:Cc:Subject;
	b=BH1W5g+7ZFBsZxPtz0Q1MFCUOhHnTxSG4ySsSgUw7GMhXQ+4P9v9wQGD432++sDpY
	 JTUBka4M7i6jF43jk4C6nil+EGs5N2LogZve1h1XIoqCLfrDlSTlxtu0WVaa3O+1cz
	 mTLLkocAMoJQs1RWFHBoTjLD78wcfe1wugkvwC82HX7cTari0BHO8MhyOipoZNN3pf
	 CdLKMkOSDKTb60NwlXRwbbCwGeW0yxMKQYWZvDhib0joqYzlgwWeqvMpE5K8jSHFSM
	 CdXB2YObPfDPqXLhgBgtAcdm7X5afJbB6bfXrE4Cwd5bWJbcs9dGqJsijEGxjz3KY8
	 y6cGRsY0NcyjQ==
Date: Thu, 24 Sep 2026 12:26:41 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc5
Message-ID: <arUI8d-mES9Z00we@willie-the-truck>
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

Here is the promised second batch of arm64 fixes. The summary is in the
tag, but it's all spread around a bit. We've also had a couple more
fixes come in overnight, so I'll send you some more next week once
they've had time to sit in -next.

Cheers,

Will

--->8

The following changes since commit fdb9ebc7fb7788b8371fbef6c17dc5c8291e1429:

  arm64: mte: Fix PTRACE_{PEEK,POKE}MTETAGS error documentation (2026-09-11 12:50:02 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 2bc6b218717b9d08f466f88209251d54bc09b207:

  arm64/boot: Disable trapping of PMZR_EL0 writes to EL2 (2026-09-23 12:34:30 +0000)

----------------------------------------------------------------
arm64 fixes for -rc5

- Fix the recently merged user ABI for the Arm CMN PMU driver filtering
  logic so that the ordering matches the hardware spec

- Fix spurious warning when attempting to read PROT_NONE mappings of
  /dev/mem

- Allow WFxT to be disabled on the command line, which is necessary for
  some configurations of recent Apple SoCs

- Fix EL2 fine-grained trap configuration for the CPU PMU

- Fix MIDR matching when applying CPU errata workarounds in a VM

----------------------------------------------------------------
David Carlier (1):
      arm64: errata: match the target implementation CPU's own MIDR

Fuad Tabba (1):
      arm64/boot: Disable trapping of PMZR_EL0 writes to EL2

Robin Murphy (1):
      perf/arm-cmn: Fix multi-filter encoding

Yureka Lilian (1):
      arm64: Add override for WFxT

Zeng Heng (1):
      arm64: io: Reject non-user protection in ioremap_prot()

 Documentation/admin-guide/kernel-parameters.txt |  3 ++
 Documentation/arch/arm64/booting.rst            |  1 +
 arch/arm64/include/asm/el2_setup.h              |  9 +++-
 arch/arm64/include/asm/io.h                     |  3 +-
 arch/arm64/kernel/cpu_errata.c                  | 15 ++++---
 arch/arm64/kernel/pi/idreg-override.c           |  2 +
 drivers/perf/arm-cmn.c                          | 58 +++++++++++++++----------
 7 files changed, 59 insertions(+), 32 deletions(-)

