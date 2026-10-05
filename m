Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C509CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 17:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vo3/R/UpUzh6/sfdwtuW9Y23N0AJmticKut7jC50Xqw=; b=fULAJ6oIS5zAkzNn9E4kd9TB6I
	mSC94xeTAwu/LjM8CbBqPcaVMRSB/Erj7Cy7wpzGLFoiy9aI9ZZmOSlo10eyViJwImabr+awQy+xV
	NA5HfUB7wiW+XlJ82NUc8P452IHo58RtcJdXYZR7WQdymqu8Xbyn3o/PeX1KCmcIeNi1x5p7GA1xf
	dmbcIKjaQQF+4Quhwduafv88OjP74MnDBwg7Yd4kgHg4vV04el04jRA8K8wVrVp7bK0MBjx2KZ6yA
	diCSjZJ2JQ4pgysfaDYdR6hg3chov2hvbes5e8eIUmiY0gBIwVEvqFYRQjVy+xkI6PGHlS0Zp5pOT
	O61BLjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmST-0000000Guoc-2jSt;
	Mon, 05 Oct 2026 17:26:37 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmSO-0000000Guni-0d9A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 17:26:36 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 9A6222291E;
	Mon,  5 Oct 2026 19:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791221189;
	bh=Vo3/R/UpUzh6/sfdwtuW9Y23N0AJmticKut7jC50Xqw=; h=From:To:Subject;
	b=WZA4Jqe4L2sP4O+dt2hMr3GY0I9p+xGwrYYBVRk8c0bdZzNQ4QCP04V77ybzIM2bp
	 aPQ7H81Oo8qL22pZ42aEY03qts2TDxUF7v+hGRQZ1aYY/mLBQPRveMYBIs1ioYoLks
	 Im2LQAiL9LPFn6X3PwHCWcXVkgKVrHlyEsI8FbYWGxuuy56Is4m0M+MQlFoHpnt/gO
	 JckwQZLRpRjenfwtCT1xJ8B5hW9Xx0prAaWld0PIPgNjysbS8AauSpCC+0WwMOGl1h
	 Ygy0uvweR8fpgTWLtl3MhtapP1ZUKhNdI3NetyJQH/XwrvUYzJKVbINiaQhFR97aDK
	 6FBjU5gI+5PEw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: freescale: imx952: Add GPIO5 lines 18 to 20
Date: Mon,  5 Oct 2026 19:26:21 +0200
Message-ID: <20261005172622.135725-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_102633_104784_2A782A8A 
X-CRM114-Status: UNSURE (   8.89  )
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

Add missing GPIO5 lines, GPIO_IO38, GPIO_IO39 and GPIO_IO40 are
GPIO-only pads fixed to GPIO5[18:20], their SW_MUX_CTL registers have no
MUX_MODE field (IMX952RM Rev.1, 2026-07-08, sections 33.3.2.44-46 and
33.3.2.184-186).

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx952-pinfunc.h | 6 ++++++
 arch/arm64/boot/dts/freescale/imx952.dtsi      | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952-pinfunc.h b/arch/arm64/boot/dts/freescale/imx952-pinfunc.h
index debe6ede2d70..72cfe7893af8 100644
--- a/arch/arm64/boot/dts/freescale/imx952-pinfunc.h
+++ b/arch/arm64/boot/dts/freescale/imx952-pinfunc.h
@@ -307,6 +307,12 @@
 #define IMX952_PAD_GPIO_IO37__WAKEUPMIX_TOP_LPUART7_RX                0x00A4 0x02D4 0x05B0 0x02 0x01
 #define IMX952_PAD_GPIO_IO37__WAKEUPMIX_TOP_LPSPI4_SCK                0x00A4 0x02D4 0x0568 0x04 0x01
 
+#define IMX952_PAD_GPIO_IO38__WAKEUPMIX_TOP_GPIO5_IO_18               0x00A8 0x02D8 0x0000 0x00 0x00
+
+#define IMX952_PAD_GPIO_IO39__WAKEUPMIX_TOP_GPIO5_IO_19               0x00AC 0x02DC 0x0000 0x00 0x00
+
+#define IMX952_PAD_GPIO_IO40__WAKEUPMIX_TOP_GPIO5_IO_20               0x00B0 0x02E0 0x0000 0x00 0x00
+
 #define IMX952_PAD_CCM_CLKO1__CCMSRCGPCMIX_TOP_CLKO_1                 0x00D4 0x0304 0x0000 0x00 0x00
 #define IMX952_PAD_CCM_CLKO1__NETCMIX_TOP_NETC_TMR_1588_TRIG1         0x00D4 0x0304 0x0494 0x01 0x00
 #define IMX952_PAD_CCM_CLKO1__WAKEUPMIX_TOP_FLEXIO1_FLEXIO_26         0x00D4 0x0304 0x04AC 0x04 0x00
diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 1154b66dadb2..4930e09e0206 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -1076,8 +1076,8 @@ gpio5: gpio@43850000 {
 			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
 				 <&scmi_clk IMX952_CLK_BUSWAKEUP>;
 			clock-names = "gpio", "port";
-			gpio-ranges = <&scmi_iomuxc 0 103 12>, <&scmi_iomuxc 12 36 6>;
-			ngpios = <18>;
+			gpio-ranges = <&scmi_iomuxc 0 103 12>, <&scmi_iomuxc 12 36 9>;
+			ngpios = <21>;
 		};
 
 		aips1: bus@44000000 {
-- 
2.47.3


