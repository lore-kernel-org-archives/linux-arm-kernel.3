Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B676C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5w58bJM8H9vkHt1iUbfVmmAKWlnyfvvREiELP64Gnk=; b=Zrg8WMzso/jRYdyui+MApQG/kQ
	URyWiWT1FuAdxNO2wdORnY+FlMz4nzx4lZfvM7/JWtPXCYC3z0FXHuyMI/tHiGi4jx2EcXrXNxAVn
	LzzvPhKSXgioDvk7lWXbvWk6DfEmRJYpQgb4o4jYceplcbiO1j+891zgP2hvzrRZl0UP8V6jPBQI7
	iwv4g81cL+pV22iY8SEnsYBP8sgrGXbO1jvpg42Faco9IWC0RKKRYdfOmZE6CyHW4vya7czlBoKu9
	Cft9lYKtzqDf5BDNROz5gt7jSZvuiz/GE5/5lKq1AiIXM/UmSMsZdXOUv4Z0vBHRiEvS7uu/ikMBL
	Jjt5oixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7V23-0000000Dy2Y-08l1;
	Fri, 18 Sep 2026 09:37:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7V1z-0000000Dy1c-2B8H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:37:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C9F7400B4;
	Fri, 18 Sep 2026 09:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCC21F0089B;
	Fri, 18 Sep 2026 09:37:17 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v7.4
Date: Fri, 18 Sep 2026 11:37:04 +0200
Message-ID: <cover.1789722872.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789722868.git.geert+renesas@glider.be>
References: <cover.1789722868.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.4-tag1

for you to fetch changes up to 10eeafc3e90ebbe6627a7d471b86af889d7b07e5:

  soc: renesas: rcar-rst: Add support for RZ/G2M v3.0 (2026-09-07 10:53:31 +0200)

----------------------------------------------------------------
Renesas driver updates for v7.4

  - Register the SYSC power sequencer on RZ/G2L,
  - Add hwspinlock support for R-Car V4H, V4M, and X5H,
  - Add initial support for RZ/G2M v3.0,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Ayman Chaudhry (2):
      soc: renesas: Identify RZ/G2M v3.0 SoC
      soc: renesas: rcar-rst: Add support for RZ/G2M v3.0

Biju Das (2):
      soc: renesas: rz-sysc: Register auxiliary device for PWRRDY power sequencer
      soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for R9A08G046

Geert Uytterhoeven (1):
      soc: renesas: Expand MFIS acronym in RCAR_MFIS help description

Wolfram Sang (2):
      soc: renesas: rcar-mfis: Convert spinlock to raw_spinlock
      soc: renesas: rcar-mfis: Add hwspinlock support

 drivers/soc/renesas/Kconfig          | 19 ++++++++---
 drivers/soc/renesas/r9a08g046-sysc.c |  1 +
 drivers/soc/renesas/rcar-mfis.c      | 62 +++++++++++++++++++++++++++++++++---
 drivers/soc/renesas/rcar-rst.c       |  1 +
 drivers/soc/renesas/renesas-soc.c    |  3 ++
 drivers/soc/renesas/rz-sysc.c        |  5 +++
 drivers/soc/renesas/rz-sysc.h        |  2 ++
 7 files changed, 84 insertions(+), 9 deletions(-)

