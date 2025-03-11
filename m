Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E2AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K5qoy4Wwqc/+tp7bILhH7TfD6GuM6X8n/2ysfE71QBM=; b=qTAZBbd50k53m16K8yTxnfCT6D
	2QFWuIl5AJwKxrLLiI4Ch/uxUUyghNBURei8AalM6sJx5T8SVBuzZwsy2wGGW9mnGhKDMT9Ly0BYw
	fvipk/9bs1ds2zxv/ITChPl6XS0taNH5OK73/e3FGHPkS+G2AjiMNAKSiUV4hQuniBie0JTj14xv0
	xuZnnjkjAAYmBxOTr9oIKjWJ0Y/frRAuOE2rH2BKpLzMD2FLjl+qCxnFD254C2vLGLWDE/6MNtmqd
	uDImE/vESQPtXQJr5hkschSEeuc+ESv88wqnH1dJcWJ4T708cunmB1+2/Cxh2k79PUwOjemQpRNqR
	3Tv7mc0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5ZI-00000006oyc-0zKa;
	Tue, 11 Mar 2025 19:47:12 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5Tm-00000006nlm-05q7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:41:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1ts5Tg-0007gL-85; Tue, 11 Mar 2025 20:41:24 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1ts5Tf-005ESk-1n;
	Tue, 11 Mar 2025 20:41:23 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1ts5Tf-001qa6-1Z;
	Tue, 11 Mar 2025 20:41:23 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Tue, 11 Mar 2025 20:41:12 +0100
Subject: [PATCH] arm64: dts: imx8mp: configure GPU and NPU clocks in
 nominal DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-imx8m-clk-nominal-gpu-v1-1-78de5ea24c5d@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIANeR0GcC/x3MQQqAIBBA0avErBvQQqyuEi1SpxpKC6UIorsnL
 d/i/wcSRaYEXfFApIsT7yFDlgXYZQwzIbtsqESlRC0lsr8bj3ZbMeyew7jhfJzoTG2cNtq2QkF
 uj0gT3/+3H973A8Jlk9NnAAAA
X-Change-ID: 20250311-imx8m-clk-nominal-gpu-db3bd7b7c905
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_124130_067557_09791879 
X-CRM114-Status: GOOD (  11.10  )
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

Commit 255fbd9eabe7 ("arm64: dts: imx8mp: Add optional nominal drive
mode DTSI") added imx8mp-nominal.dtsi, which overrides all overdrive
clock rates in imx8mp.dtsi to the nominal rates.

At the same time, commit 9f7595b3e5ae ("arm64: dts: imx8mp: configure
GPU and NPU clocks to overdrive rate") went in, which changed some
clock rates away from the nominal values.

Resolve the discrepancy by effectively reverting the changes in the
latter commit inside imx8mp-nominal.dtsi. This is required for proper
operation of the imx8mp-skov boards, which are currently
imx8mp-nominal.dtsi's only users and lets all other boards that don't
include it benefit from the new higher frequencies.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
If the commit hashes are not stable, please feel free to squash this
change directly into what's currently commit 255fbd9eabe7 ("arm64: dts:

imx8mp: Add optional nominal drive mode DTSI").
---
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
index a1b75c9068b288a2fba73bbd96b1519a50df85a3..dc0ccd723c6d92e7946ebd52bac535e4175498d0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
@@ -24,6 +24,20 @@ &clk {
 	fsl,operating-mode = "nominal";
 };
 
+&gpu2d {
+	assigned-clocks = <&clk IMX8MP_CLK_GPU2D_CORE>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
+	assigned-clock-rates = <800000000>;
+};
+
+&gpu3d {
+	assigned-clocks = <&clk IMX8MP_CLK_GPU3D_CORE>,
+			  <&clk IMX8MP_CLK_GPU3D_SHADER_CORE>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
+				 <&clk IMX8MP_SYS_PLL1_800M>;
+	assigned-clock-rates = <800000000>, <800000000>;
+};
+
 &pgc_hdmimix {
 	assigned-clocks = <&clk IMX8MP_CLK_HDMI_AXI>,
 			  <&clk IMX8MP_CLK_HDMI_APB>;
@@ -46,6 +60,18 @@ &pgc_gpumix {
 	assigned-clock-rates = <600000000>, <300000000>;
 };
 
+&pgc_mlmix {
+	assigned-clocks = <&clk IMX8MP_CLK_ML_CORE>,
+			  <&clk IMX8MP_CLK_ML_AXI>,
+			  <&clk IMX8MP_CLK_ML_AHB>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
+				 <&clk IMX8MP_SYS_PLL1_800M>,
+				 <&clk IMX8MP_SYS_PLL1_800M>;
+	assigned-clock-rates = <800000000>,
+			       <800000000>,
+			       <300000000>;
+};
+
 &media_blk_ctrl {
 	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_AXI>,
 			  <&clk IMX8MP_CLK_MEDIA_APB>,

---
base-commit: 5a690619426fc4b09c7fd3f40d3a69264ef3db0f
change-id: 20250311-imx8m-clk-nominal-gpu-db3bd7b7c905

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


