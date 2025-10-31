Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B47CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kpTYTK5mSW1XSLpOGBurv1Z2wvnDUWSUOsDikxdLdGg=; b=5EVoCW3jqbNvJdMLP8/d+TSl/R
	IDKa1IJZY8wbtTsJtNB5OPzgwQehN+q4k9NAQpGMt4tVBlKrPL6g2XcrQd/mZUWFDLxd5LvuubKcH
	KFLOuhTm+Yg1Zlfqo5wavykTEk/AEvQDKWqGO3GgbOP/0WVX6Cjm2Ju+foajrZjFxQdLW5oFipKYV
	Rg7OYiEIHwpzLprYD8zP8oaUYGMJ+E37fnQU3KhlCzH6LyYZXmxR1hQKr1J5SjASKLkF5b8YDNN7a
	DeGN4Q9eyeYifM0BSU8Q9nxVh02VFAs6jOrUbvPmfCnGX/zDcgUQzGMUp7RpMDtWVWPaTFRjmzdIu
	5iYU7LdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmbh-00000005x0T-2J8q;
	Fri, 31 Oct 2025 10:43:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmbc-00000005wzT-2rsI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:43:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0FEC4463B;
	Fri, 31 Oct 2025 10:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A256C4CEF8;
	Fri, 31 Oct 2025 10:43:38 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.19
Date: Fri, 31 Oct 2025 11:43:29 +0100
Message-ID: <cover.1761905410.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_034341_023825_6310FBC2 
X-CRM114-Status: GOOD (  16.33  )
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
for v6.19.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.19

    - Enable support for the Renesas RZ/G3S and RZ/G3E thermal drivers,
      and the RZ/T2H and RZ/N2H ADC drivers in the ARM64 defconfig,
    - Refresh the ARM SH-Mobile defconfig for v6.18-rc1.

  [GIT PULL 2/3] Renesas driver updates for v6.19

    - Keep the WDTRSTCR.RESBAR2S bit in the default state on R-Car Gen4.

  [GIT PULL 3/3] Renesas DTS updates for v6.19

    - Add thermal support for the RZ/G3S and RZ/G3E SoCs,
    - Add DT overlay support for the Raspberry Pi Display 2 and Argon40
      fan hats on the Retronix Sparrow Hawk board,
    - Add eMMC support for the Eagle Function expansion board,
    - Add initial support for the R-Car X5H (R8A78000) SoC and the
      Ironhide development board,
    - Move interrupt-parent properties to root nodes,
    - Add system watchdog timer support for R-Car Gen3 and Gen4 SoCs,
      which is reserved for secure firmware on R-Car Gen3 boards,
    - Add ADC support for the RZ/T2H and RZ/N2H SoCs and their evaluation
      boards,
    - Add watchdog timer support on the R-Car V3M Starter Kit board,
    - Add Cortex-A55 PMU support on the RZ/V2H, RZ/V2N, RZ/T2H, and RZ/N2H
      SoCs,
    - Add Imagination Technologies PowerVR Series 6XT GX6250 GPU support
      on the R-Car M3-W and M3-W+ SoCs,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

