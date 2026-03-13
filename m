Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08B6105F79A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8latpqdRJXcFNbZL8a9dypIhEmg29FJfWJfdQvLnAjE=; b=jc8vw407LYWazFQyS6F1z2MG1H
	YmY+H3sgSNrXtD1Od/3eNlqMOMfPD9rhNkxjX/mqEKEcvVxS86v/hn57AiMFT+JBhksG+I5Zkc909
	lgDPiPto2u80f7WYTjHA1bDDkhkkaWsckfG4Q1qH210273EeYPMpeGw4H8iDYqCrImRrQu/fLgdvc
	goN5LAEsk0jex0TfpRVCiCwBi8w97dVr0sa2y8SeVU2GaLAt+siA9HcX5Wz2KOu88XwsSmDdVOCSm
	Xmo6wdxF8u+X8Spw14b29aFWzdSqH0L3QwdWM5XY5WHXZXFk9IMoOIFuE2TGjhbZYpiytJexSnggm
	pvp3vNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10RH-0000000HabI-0LKz;
	Fri, 13 Mar 2026 11:12:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10RG-0000000Haan-1GCZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:12:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B88EE6012B;
	Fri, 13 Mar 2026 11:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24881C19421;
	Fri, 13 Mar 2026 11:12:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas SoC fixes for v7.0
Date: Fri, 13 Mar 2026 12:12:09 +0100
Message-ID: <cover.1773398984.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v7.0-tag1

for you to fetch changes up to 85c2601e2c2feb60980c7ca23de28c49472f61f1:

  arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)

----------------------------------------------------------------
Renesas fixes for v7.0

  - Fix SD card initialization on the RZ/T2H and RZ/N2H EVK boards,
  - Remove WDT nodes meant for other CPU cores on the RZ/V2H(P) SoC,
  - Fix Clock Pulse Generator registers on the RZ/T2H and RZ/N2H SoCs,
  - Fix Versa3-related boot hangs on the RZ/G3S SoM,
  - Fix Extended SPI interrupts on the R-Car X5H SoC.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (1):
      arm64: dts: renesas: rzg3s-smarc-som: Set bypass for Versa3 PLL2

Fabrizio Castro (1):
      arm64: dts: renesas: r9a09g057: Remove wdt{0,2,3} nodes

Geert Uytterhoeven (1):
      arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers

Lad Prabhakar (4):
      arm64: dts: renesas: rzt2h-n2h-evk: Add ramp delay for SD0 card regulator
      arm64: dts: renesas: rzv2-evk-cn15-sd: Add ramp delay for SD0 regulator
      arm64: dts: renesas: r9a09g077: Fix CPG register region sizes
      arm64: dts: renesas: r9a09g087: Fix CPG register region sizes

 arch/arm64/boot/dts/renesas/r8a78000.dtsi          | 16 ++++++------
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 30 ----------------------
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  4 +--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  4 +--
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |  2 +-
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |  1 +
 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso  |  1 +
 7 files changed, 15 insertions(+), 43 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

