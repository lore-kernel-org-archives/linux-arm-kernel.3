Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DF6CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 20:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djb7sBuKAwcyPC5uO/ympVNzlz8bWFHBS01g270pHWE=; b=S4Lqq7nUAxUEsH5UoQzN9JzACM
	qU1knXoPXAQpa6iMJY98Qos+OfCPiaHbuYKX9Xd5il24gkD4n61WSfMWOC51oSmFDBHntx3CEqfMi
	Soou6Ih16ipZt/oUFRsG1fnlTMYLfM5xKWPr2dqkvyvBQ6xvUWz690XMlA2VM0HP3IkDcjEdLFPLt
	IcCHy6zIrFGm8sTvE1zho9elGF6FRUIYKY89jLfg4jSLiG/TvcZzQqBQZwdklqzaGWf2e/2ppn2vJ
	wSw+uWfS3xsvcbnr5qbVdM/C03mYJI9VpS7YZ5DuRtW2yfSJOLFKz/03i6obCLOVa2rd2asTNmTM6
	EEcBkOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJzo4-0000000EFRd-2uSb;
	Mon, 04 May 2026 20:22:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJzo0-0000000EFP2-47B4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 20:22:18 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1wJznX-0007WV-Kh; Mon, 04 May 2026 22:21:47 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 04 May 2026 22:21:44 +0200
Subject: [PATCH 4/4] arm64: dts: imx8mp: remove LDB reg and reg-names
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-v7-1-topic-ldb-fixes-v1-4-0125d937ff7f@pengutronix.de>
References: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
In-Reply-To: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, laurentiu.palcu@oss.nxp.com, 
 victor.liu@nxp.com
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_132217_037425_03358DAC 
X-CRM114-Status: GOOD (  11.72  )
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

The blk-ctrl syscon device(s) have a very loose register definition, e.g
one register configures the USB PHY clock source, the PCIe EP ready bit
and enables PCIe and USB clocks. This would lead into multiple
sub-devices which use the same 'reg' which is wrong.

Instead of specifying the 'reg' in the OF each sub-device driver needs
to handle the correct bits on their own. Therefore drop the 'reg' and
'reg-names' porperty from the bridge node as well as the '@5c' register
suffix.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 90d7bb8f5619e50d9fd65bcf18c083affe15e6f9..41649afff813833aeb1c0355827597578048b037 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1999,10 +1999,8 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
 						       <1039500000>;
 				#power-domain-cells = <1>;
 
-				lvds_bridge: bridge@5c {
+				lvds_bridge: bridge {
 					compatible = "fsl,imx8mp-ldb";
-					reg = <0x5c 0x4>, <0x128 0x4>;
-					reg-names = "ldb", "lvds";
 					clocks = <&clk IMX8MP_CLK_MEDIA_LDB_ROOT>;
 					clock-names = "ldb";
 					assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>;

-- 
2.47.3


