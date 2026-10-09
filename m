Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B3DCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wUE2v0QW5+a/Ub6fmgECQzNmuGdaL/exMPYRoSsqo3I=; b=u02PA3mhX+R3vmqCobth5M9Gsc
	sTDtsTKBZ5VWc8xUge6hTYCT86TLnOslbUEmOleG2izS6mVeO0UqylP73WRCKOxIogM9wy1iMT15x
	mnEl0ihzFRY5Crr+ses4bZiUCgUC3nTp18bX1AR3OZibcT0adSOxLf7hAykkSHA2Z4UhCH1XKHiM9
	Tis8lo9Kchv3JoRrY3SWKB5ZAxO5HvlPrWuZ1K9LH2WImlW8TbIi+A2MOb/HbeJZiAVgblqVXol2z
	N/ZS0FuysPAt95P4s84AkCUtyA467nLC2/JChnCACIfxtOH9t1EFZTj6OtQWsfwtN0rcYanTgxqmN
	USlWqcug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4OE-00000005ehf-1HFs;
	Fri, 09 Oct 2026 06:47:34 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4OA-00000005egt-0bJv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:47:32 +0000
Received: from francesco-nb.. (90-182-211-1.rcp.o2.cz [90.182.211.1])
	by mail11.truemail.it (Postfix) with ESMTPA id C8EAF1FA63;
	Fri,  9 Oct 2026 08:47:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791528443;
	bh=wUE2v0QW5+a/Ub6fmgECQzNmuGdaL/exMPYRoSsqo3I=; h=From:To:Subject;
	b=PPuq+vZSDhSo8bEfEH3jnD024MnC2tzVwXmX1k9LkTqzG5UGMexs+6O57/58EOBzt
	 F6WgNvKUi2I2p3lMxChjLrYTtvLOg8mdnUHOYDNB1OF0A80body8ajs16KLnCAekoX
	 DJkmw9lOAScLnhpboyLF8yevStacGglpL/sG2iqvI5FUgvrPfEIOIgdXFeb5LXsnJE
	 Hw2i683LFF//t+18VOj/1EnI+mn9m2/svIX+x0k//ZgL7gXwtQGQuIaEh/WbE0uVb+
	 twUoKMPhxYC/GpMfLrPtsA2Zlxgp+MdcLELhAQgva702H2cG5Tm6SkO2gAXB7bVPJL
	 +jyCl1n5O971Q==
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-kernel@vger.kernel.org,
	linux-bsp@toradex.com
Subject: [PATCH] MAINTAINERS: Add entry for Toradex boards
Date: Fri,  9 Oct 2026 08:47:04 +0200
Message-ID: <20261009064705.10116-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_234731_284905_9D489EB1 
X-CRM114-Status: UNSURE (   6.68  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add a MAINTAINERS entry for Toradex board device trees to ensure
that we are included in patch discussions and can provide reviews
and feedback on proposed changes.

Toradex has been developing and supporting its System on Modules and
carrier boards for many years, including their Linux mainline support.

As the hardware vendor, Toradex has access to schematics, bills of
materials and other internal hardware documentation, allowing to
review and validate changes against the actual hardware.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
Frank, Nishanth, Vignesh: up to you to decide who is picking up this
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 483415e46217..fcc2e429bcd7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28088,6 +28088,21 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/topstar-laptop.c
 
+TORADEX BOARD SUPPORT
+M:	Francesco Dolcini <francesco.dolcini@toradex.com>
+L:	linux-bsp@toradex.com
+S:	Supported
+F:	arch/arm/boot/dts/nxp/imx/imx*-apalis*
+F:	arch/arm/boot/dts/nxp/imx/imx*-colibri*
+F:	arch/arm64/boot/dts/freescale/imx*-apalis*
+F:	arch/arm64/boot/dts/freescale/imx*-aquila*
+F:	arch/arm64/boot/dts/freescale/imx*-colibri*
+F:	arch/arm64/boot/dts/freescale/imx*-lino*
+F:	arch/arm64/boot/dts/freescale/imx*-toradex-*
+F:	arch/arm64/boot/dts/freescale/imx*-verdin*
+F:	arch/arm64/boot/dts/ti/k3-*-aquila*
+F:	arch/arm64/boot/dts/ti/k3-*-verdin*
+
 TORADEX EMBEDDED CONTROLLER DRIVER
 M:	Emanuele Ghidoli <ghidoliemanuele@gmail.com>
 M:	Francesco Dolcini <francesco@dolcini.it>
-- 
2.47.3


