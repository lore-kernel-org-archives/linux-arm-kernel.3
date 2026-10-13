Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2C5CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 11:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsG4E7aRTBns4kMYtLjpkG5awBdjw9he/iK/yHlji88=; b=HwdhvwZnOioZl0Hc0GFYnvDVLP
	GReBxfVmHD41wMJWF/jAd5o+f1FKfGvwutFPoWZat23URyudfZLlujeB91D98NPmjonS75hZ/fdIx
	l5vJ0nCEb7m+m9uf9zl3YJhjhpk88Wxt6/iKf8GW6y5KMInGatgbtC5xjq/xjNiFSNg2N5ttj7xj3
	zWiY7EZslAXQgWCEQnS4Iy+5JTeRdZOddgFljoF/ZR58C42si366ZjHUrtvXynV/4gKPhK9/ED/6/
	IwyRNXdbn9w8uwfPJ5iSrfufhhXr3U7US29R9cNGZ3zTn2Je2XZCM0QVn/IrVbQyEHkPhiBSwp54Z
	HngQa49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb35-0000000Ckcr-3JDM;
	Tue, 13 Oct 2026 11:52:03 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb2o-0000000CkWW-2fvd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 11:52:00 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791892304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KsG4E7aRTBns4kMYtLjpkG5awBdjw9he/iK/yHlji88=;
	b=z8QIS+EKxKo9K94EIaWFfURwted8ao1VqhfKf1QhehonOMXXeKWt+HtbLbgxlNJwA5Lc97
	8GsIEFuG6jm6j3kJkUmgadJbn+RZ9mloT0iWbBVmDYvD/lBz6oSxJbqSKIDSlGQl+6yVUP
	u/2iG8os20G7qh1vx2l2EMAM7ilYVKpHlv6a0h/KzNvFMVQjQJoUkhZZ/42dXCxsvomGN6
	1c54JAs3wFU76iaKXcc6dBKVhcbBlulcZITjhZg80StbuVSQ7iQiH7HTjC2M5xz4ePziBA
	s1iJHdm9MDz9dnEA8dMOf1JxW0S9CXctwHxGGSxpBQnHQrf6agq1m9D3sBI9Jg==
Date: Tue, 13 Oct 2026 13:51:07 +0200
Subject: [PATCH v2 2/9] arm64: dts: imx8mp-kontron: Fix GPIO for DL panel
 standby signal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v2-2-d464ca652c91@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=zqKe5SSvEE0xziVYkkE5XVoVhrCJnP1Q6qOdqCtplLU=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuctF+5kl7Ii5CmTwyJcfb3fU1udvwLzvw95Wutz6k/O
 4r+7L3SUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJGTfQz/1A88TI59fOf9ap/b
 248b/amXvse3k81hbqZQhBL3H09bS0aG47P5ODek15z/IbDF/eXGc2xnjbjbKkNeHLy1WXvHym0
 BvAA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_045156_334833_F49FDCF0 
X-CRM114-Status: GOOD (  10.47  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

On the BL carrier board the panel standby signal of the DL display is
connected to the OSM-S pad GPIO_A_7. On the i.MX8MP OSM-S module this
pad is NAND_CE0_B/GPIO3_IO01. Due to an incorrect pad mapping, the
overlay uses SAI3_RXFS/GPIO4_IO28 instead, which is the I2S_B_DATA_IN
pad.

Use the correct GPIO for the panel standby hog. GPIO_A_7 is already
muxed as GPIO by the SoM devicetree, so drop the extra pinctrl group.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso      | 25 ++++++++--------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
index 88b30ca66adf5..13c6d55126f44 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
@@ -52,22 +52,21 @@ panel_in_lvds0: endpoint {
 	};
 };
 
-&gpio4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_gpio4>, <&pinctrl_panel_stby>;
-
-	panel-rst-hog {
+&gpio3 {
+	panel-stby-hog {
 		gpio-hog;
-		gpios = <21 GPIO_ACTIVE_HIGH>;
+		gpios = <1 GPIO_ACTIVE_HIGH>;
 		output-high;
-		line-name = "panel-reset";
+		line-name = "panel-standby";
 	};
+};
 
-	panel-stby-hog {
+&gpio4 {
+	panel-rst-hog {
 		gpio-hog;
-		gpios = <28 GPIO_ACTIVE_HIGH>;
+		gpios = <21 GPIO_ACTIVE_HIGH>;
 		output-high;
-		line-name = "panel-standby";
+		line-name = "panel-reset";
 	};
 };
 
@@ -127,12 +126,6 @@ &pwm1 {
 };
 
 &iomuxc {
-	pinctrl_panel_stby: panelstbygrp {
-		fsl,pins = <
-			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28		0x19
-		>;
-	};
-
 	pinctrl_touch: touchgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x19

-- 
2.55.0


