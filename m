Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF960C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pZaZr52AzQS5o66Gj05pGk1SSzjvjeGJK9V7UXspD4=; b=Wmeu7KRdJHB0BM4AociguHbUaG
	A3jjuXdpuglkRbBnNG+/sbr5Nw6wbvg5+ytcxpBvsfFdvmbyGU/QnuPLmXPEALyUQNTFfhaj1csAM
	+sIRD/cNF7mdZc6bliIly9BI7bz0q6ITiHuEKYD+hEW5qtPkn5C0U9U4n1wh0/BBpUm9Y73xYnf3v
	PARxUmnLxpAXn8YnFZgIwuoP9WR3NywjXQYQy1JtI1nVXc5Gp/0+VnDP+Ap2a4fhrDUbyfztXjvLJ
	Q6vOAxyWDSb9exmXeTaKuyCGlcfeBtAJCnYt0ZTiLbbrxTsPo7LOOmdR3CcfzwjQbKI4mOh31jCgE
	rN4hIoEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHrN-00000002MBH-3fUA;
	Mon, 27 Jul 2026 09:42:57 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHrE-00000002M7m-22bw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:42:51 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1woHqx-00009N-HK; Mon, 27 Jul 2026 11:42:31 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 27 Jul 2026 11:42:17 +0200
Subject: [PATCH v5 5/5] arm64: dts: imx8mp-skov: support new 7inch panel
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-5-67faa5ee0bf6@pengutronix.de>
References: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de>
In-Reply-To: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2446;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=xHdkr4TXvzlRmv77uCiU60TwMusuTd/LSXCkcJLQxdc=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ1a6Bsucu+JbLa6rd+REG+d9UFBScfqdtzp/2809am8j9
 BtnfTvXUcrCIMbFICumyKKysIJP1OODZ+Q0ES6YOaxMIEMYuDgFYCKi4Qz/NNMX8T1vFZ22ZdG8
 x8UbZLWY9078Ffhlq/TExT83/g+b18zwh4MvXGJu45eiD0ICaX2Guw7pZupH+Uh2xEjOlEkXdWB
 jBAA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_024248_547622_205B1253 
X-CRM114-Status: GOOD (  11.45  )
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

This board is similar to the already upstream
imx8mp-skov-revc-tian-g07017 and imx8mp-skov-revc-jt101tm023 but uses a
different 7" panel with a different touch controller.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 ++
 .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 36 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2caac104bec6e..92559e0dd8396 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -435,10 +435,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 
+imx8mp-skov-revc-jutouch-jt070tm041-dtbs += imx8mp-skov-revc-touch.dtb \
+	imx8mp-skov-revc-jutouch-jt070tm041.dtbo
 imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
 	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
 imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
 	imx8mp-skov-revc-tian-g07017.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt070tm041.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso
new file mode 100644
index 0000000000000..2433b57aeed40
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "SKOV IMX8MP CPU revC - JuTouch JT070TM041";
+	compatible = "skov,imx8mp-skov-revc-jutouch-jt070tm041", "fsl,imx8mp";
+
+	panel {
+		compatible = "jutouch,jt070tm041";
+		backlight = <&backlight>;
+		power-supply = <&reg_tft_vcom>;
+
+		port {
+			in_lvds0: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
+	assigned-clock-rates = <0>, <358400000>;
+
+	ports {
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&in_lvds0>;
+			};
+		};
+        };
+};

-- 
2.51.0


