Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8ED2D47CD5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 10:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqY2yQj6n6899l4f66V80BLpbp7uTdPlqI/ibazaQCg=; b=MIj59zG/3FooD/7jRbeM3//b9m
	E+za7ZL85oamnWUhmqVzFDhyvLG49DWn4aDATv/BgA/mZ51RcB/fcBs0ebvs7NKV0sQQ7u4qfRAra
	xrEhj4Z0m2B2wThXbdL8PL09Ud3wCsnEXnZMJ8gOO75SV/E2FXg9xDOHWJrGFUrM5vMjoLeR1QMNd
	u4zkLJG3l0NEm4ebKFgSwZV+nC06rKlFzZFYJFNcSd6tAa87CIHdS3Y6JACweI13t/HuVQn5GhsaL
	ykHLcvsU1dGSQiX3sW/JTr2CrHLDAM7Sc8Wd6Om+7XXrClp8fqR7tWK35Yul53Mb0/LIvZocnTPGl
	0TwxL/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghPT-0000000DzMU-2FfC;
	Fri, 16 Jan 2026 10:50:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghPP-0000000DzKi-1xzh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 10:50:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FC08441A9;
	Fri, 16 Jan 2026 10:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA064C116C6;
	Fri, 16 Jan 2026 10:50:24 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas driver updates for v6.20 (take two)
Date: Fri, 16 Jan 2026 11:50:16 +0100
Message-ID: <cover.1768559764.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768559762.git.geert+renesas@glider.be>
References: <cover.1768559762.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_025027_528294_4C211B9E 
X-CRM114-Status: UNSURE (   9.40  )
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

The following changes since commit 1bea7e94bf09ee6d46051076866a9369f64d302a:

  soc: renesas: Enable ICU support on RZ/N2H (2025-12-23 09:25:33 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.20-tag2

for you to fetch changes up to 49261f479d45714692587ff0abe0c5279c6068d6:

  soc: renesas: Add support for RZ/N1 GPIO Interrupt Multiplexer (2026-01-15 12:05:16 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.20 (take two)

  - Add and use for_each_of_imap_item() iterator,
  - Add support for the RZ/N1 GPIO Interrupt Multiplexer.

----------------------------------------------------------------
Herve Codina (Schneider Electric) (5):
      of/irq: Introduce for_each_of_imap_item
      of: unittest: Add a test case for for_each_of_imap_item iterator
      irqchip/ls-extirq: Use for_each_of_imap_item iterator
      irqchip/renesas-rza1: Use for_each_of_imap_item iterator
      soc: renesas: Add support for RZ/N1 GPIO Interrupt Multiplexer

 drivers/irqchip/irq-ls-extirq.c                |  47 ++++-----
 drivers/irqchip/irq-renesas-rza1.c             |  43 ++++-----
 drivers/of/irq.c                               |  70 ++++++++++++++
 drivers/of/unittest-data/tests-interrupts.dtsi |   9 ++
 drivers/of/unittest.c                          | 116 ++++++++++++++++++++++
 drivers/soc/renesas/Kconfig                    |   4 +
 drivers/soc/renesas/Makefile                   |   1 +
 drivers/soc/renesas/rzn1_irqmux.c              | 127 +++++++++++++++++++++++++
 include/linux/of_irq.h                         |  41 +++++++-
 9 files changed, 400 insertions(+), 58 deletions(-)
 create mode 100644 drivers/soc/renesas/rzn1_irqmux.c

