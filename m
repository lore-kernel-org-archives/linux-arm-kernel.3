Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F9E105F79A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sRfhWRMqjk2L0JEOr5H6RNkI6u1UbzmNeAIOrMx/Kao=; b=g4EbhNeCJA+Icl1oPR1pqrA/J1
	FstRWQBcFf0MeddFT3YJzPx7CDGZlKMvjAJsVGAu2V/R+VxaJeVl6dPMcS/FxpROlhrN2GXUGmW6X
	PGukQ1JaZuYSqDD3/pxKfAfBjFNyxK+eoV9ZakreTfn3/cMOI9lDk+FdZp+3XMRWJn+rHgdgJ1h/u
	9qUHcX93rXzK4OEarXBSKhs9V/2rsdkycFH/8HUlO4TErvFMgd6TP8A8Uy061V8/4bz3WCxYimcSG
	VP1wc3t48TK9TS/WnsX6FVEIltd3LVTHKT1Au2uqXV01FMejcLPsE8En79CpM6bDghMMUv1i5S5Qh
	QX2f65/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10S3-0000000Hakl-1n8M;
	Fri, 13 Mar 2026 11:13:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10S1-0000000Hajv-2xKS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:13:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB72660138;
	Fri, 13 Mar 2026 11:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A089C19421;
	Fri, 13 Mar 2026 11:13:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v7.1
Date: Fri, 13 Mar 2026 12:12:56 +0100
Message-ID: <cover.1773399669.git.geert+renesas@glider.be>
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
for v7.1.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v7.1

    - Refresh the ARM SH-Mobile defconfig for v7.0-rc1.

  [GIT PULL 2/4] Renesas driver updates for v7.1

    - Initial support for the Renesas RZ/G3L (R9A08G046) SoC.

  [GIT PULL 3/4] Renesas DT binding updates for v7.1

    - Document RZ/G3L SoC variants, the RZ/G3L SYSC block, and RZ/G3L
      SMARC SoM and Carrier-II EVK boards.

  [GIT PULL 4/4] Renesas DTS updates for v7.1

    - Add CPU frequency scaling and QSPI NOR FLASH support on the RZ/N1
      SoC and the RZN1D-DB development board,
    - Add PCIe slot power control on the R-Car H3, M3-W(+), M3-N, and E3
      SoCs,
    - Add USB3.0 PHY support on the R-Car E3 SoC and the Ebisu development
      board,
    - Add PCIe/USB3.0 clock generator support on the Salvator-X(S), ULCB
      King Fisher extension, and Ebisu development boards,
    - Add RTC support on the RZ/V2N SoC and its EVK board,
    - Add SPI DMA support on the RZ/T2H, RZ/N2H, RZ/V2H(P), and RZ/V2N
      SoCs,
    - Add support for the second SDHI channel on the Atmark Techno
      Armadillo-800-EVA board,
    - Miscellaneous fixes and improvements.

Note that the fourth PR is based on "[GIT PULL] Renesas SoC fixes for
v7.0".

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

