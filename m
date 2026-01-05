Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC98C79F9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lxx4b36pju4cZnIvM2g/h9nlwQgrhogZVOlqiS/7Z8w=; b=unS0WmVeeZ07es0b8u84ERnyGw
	t7UkpSwECnzuswphCgOCx85uBexu60ZMl18BIg+HoDxATiPNcbnXyAG/jca1EYiu10+lt28ezZX4S
	08b1sbD1JmAR6ytRknVApIGauSqBWDy3FIutBBUD5RvWjJ5Qi1XlXeKYhkRiNziAIOqiSNruRk+8z
	V7ETixXS8lkOlE9PfX3lGTQkQPP4FjLbNCCjomNV+o+rpHcUo04AVcIGmNd9rGCcXCcUFUj210+wC
	3MJ3KEkThod3CdEBbbJQyNYN6Qib2JdeLCvdngU3CZvLRo+Z2mucAupUBIOa5zXa8eklRPGPbblVg
	y/qdaAJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmxq-0000000BgRR-1MX5;
	Mon, 05 Jan 2026 15:57:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmxo-0000000BgRG-3cdq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:57:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 048356011E;
	Mon,  5 Jan 2026 15:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3435FC116D0;
	Mon,  5 Jan 2026 15:57:46 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.20
Date: Mon,  5 Jan 2026 16:57:37 +0100
Message-ID: <cover.1767628163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.20.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.20

    - Enable support for the Renesas RZ/G3E USB3 PHY and RZ/G3S PCIe
      drivers in the ARM64 defconfig,
    - Refresh the ARM SH-Mobile defconfig for v6.19-rc1.

  [GIT PULL 2/3] Renesas driver updates for v6.20

    - Enable Interrupt Controller (ICU) support on the RZ/N2H SoC.

  [GIT PULL 3/3] Renesas DTS updates for v6.20

    - Add USB3.2 host and more RSCI serial support for the RZ/G3E SoC and
      the RZ/G3E SMARC EVK board,
    - Add display and USB3.0 host support for the RZ/V2H and RZ/V2N SoCs
      and their EVK boards,
    - Add SPI NOR Flash support for the Yuridenki-Shokai Kakip board,
    - Add PCIe support for the RZ/G3S SoC and the RZ/G3S SMARC EVK board,
    - Add SPI, interrupt controller, and DMAC support for the RZ/T2H,
      RZ/N2H, and RZ/V2N SoCs,
    - Add NMI wakeup button support for the RZ/V2N EVK board,
    - Add thermal support for the RZ/V2N SoC,
    - Add system watchdog timer support for R-Car V3H, which is reserved
      for secure firmware,
    - Add window watchdog timer support for R-Car V3M, V3H, and Gen4 SoCs,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

