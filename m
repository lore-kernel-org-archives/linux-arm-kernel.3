Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F23CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 17:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1nnevepiPTS/RWquuTfGAhyZ5FONbC19wsewtGrmC5E=; b=cvwvTTx6jSoq2cGlzD2qE1a/wf
	j8Tp4hHhb82i52dx6UcDX2KRKmD7MHVnUuOizK5bLdZTB2l6aGfVjOp7er25Sr9Uy4b5CYiqW4lPC
	T6/r+p1YSQUQr7pmX5mfD6pnXcbJr7b2HX92o0NAp3rIscfZVyyotL+QRjqUIvDes7W+b2PXl/F+F
	OONYpdXLHwOB4deStWg+4PLTY9Z0ZmJQmwxT9sRFDf7MVBc/YcUJ5wDhJxBRlAvI3JDwplD1/2vBW
	12CiEADZiWUunABOW5qqiw2ZsYfmgupJDWWThV/M5O80t5zGcwKVMGAamN/3zJj6KXlgijtu1GJ5o
	Sv01IwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us30i-00000006Y49-04Pw;
	Fri, 29 Aug 2025 17:35:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ury3k-00000005cYh-0OGE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 12:18:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C7C6600B0;
	Fri, 29 Aug 2025 12:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A41C4CEF0;
	Fri, 29 Aug 2025 12:18:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v6.18
Date: Fri, 29 Aug 2025 14:18:11 +0200
Message-ID: <cover.1756468041.git.geert+renesas@glider.be>
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
for v6.18.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v6.18

    - Enable support for the Renesas RZ/T2H serial driver and the
      RZ/V2H(P) RSPI driver in the ARM64 defconfig.

  [GIT PULL 2/4] Renesas ARM SoC updates for v6.18

    - Use the SZ_256K definition.

  [GIT PULL 3/4] Renesas driver updates for v6.18

    - Add syscon/regmap support to the RZ System Controller driver.

  [GIT PULL 4/4] Renesas DTS updates for v6.18

    - Add initial support for the RZ/T2H (R9A09G077) and RZ/N2H
      (R9A09G087) SoCs and their evaluation boards,
    - Add SPI support for the RZ/V2H SoC,
    - Add DMAC and I3C support for the RZ/G3E SoC,
    - Add I3C support for the RZ/G3S SoCs,
    - Miscellaneous fixes and improvements.

Note that PR 4/4 includes DT binding definition updates for the RZ/T2H
and RZ/N2H SoCs, which are shared by clock driver, pin control driver,
and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

