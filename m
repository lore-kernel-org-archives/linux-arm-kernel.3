Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18680CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vTrPIy7aWRXBUbeHijtecr12Tf1n8LqaX94Hrd0A9tc=; b=X04i8/z4iIAMTXdNJ/TPRVA3ZL
	J28Qqjjo8TXphOmAbQy6h6l0eQyhR1BM27LyGmqQaMVz1Y0AbQujN6p3Grv13/Udj5B0LOGO4tHC9
	CS92taUnD65THTnw97bBIBPGkhhb1lHxxLCUwJJzGT/6y9W1bfGMENMK0u8/O7FLp+jo9S45Oup29
	FXD757jVBJegh7Ziv+cNB3mEZOra1tJhLi5DHXb8EX921iM3JaA83WT4b15BkE6v3wX6/Ac3mi/FR
	deiNuBIxa/csIAvkermOemiHZpIT44ZitD+nsidby7ruAuu6MubxiRlhG4+TOnr3DtnKzk+pXgYkL
	y3odRtug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZA7-0000000B3LO-3OlT;
	Fri, 02 Oct 2026 09:02:39 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZA4-0000000B3KP-3CBB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:02:37 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 823361F9DF;
	Fri,  2 Oct 2026 11:02:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790931755;
	bh=vTrPIy7aWRXBUbeHijtecr12Tf1n8LqaX94Hrd0A9tc=; h=From:To:Subject;
	b=sDAMM/9N2/6bghZkVkdlySyRz9p204424Lf5rncE4Cvyn/D4qoHTnDIRudno363dE
	 Y5gwgoSPqPwoiOfSS1/Sp2zFSt33GlQTVWB8DNVjnHXWWX9qXYOXXPEyKT9VkUD3Jv
	 T90I6aKSc0f9oWrvof2FoAsOgLvDUuhOO4CAjtA38JzQAgJU5km0xChb4HxYaak71I
	 JsxQeV7kTWtAPJW7u3qMzrJ+2y2DuY7jF936AQ5ldYCkDjMj1ywpcI1cSAKVggJash
	 uAn6Ekb6j7JH9sJmcQvOVeapymO1NF2Mku2wau6mJ/n2BXubCrJR7s514K2yFSkczc
	 X+gWeiDN74mEg==
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
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx95-verdin: fix i3c2 pinctrl group node name
Date: Fri,  2 Oct 2026 11:02:26 +0200
Message-ID: <20261002090228.41445-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_020236_954831_8A547582 
X-CRM114-Status: UNSURE (   9.62  )
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

The pinctrl group node for I3C2 is named "i3c2cgrp", with a stray "c".
Rename it to "i3c2grp" to match the label and the usual naming convention.

Fixes: 676d7ce22f00 ("arm64: dts: freescale: Add Verdin iMX95 support")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
index 72e7f1e88409..3176765a1472 100644
--- a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
@@ -892,7 +892,7 @@ pinctrl_i2s_2_sync_gpio: i2s2syncgpiogrp {
 	};
 
 	/* Verdin I2C_3_HDMI */
-	pinctrl_i3c2: i3c2cgrp {
+	pinctrl_i3c2: i3c2grp {
 		fsl,pins = <IMX95_PAD_ENET1_MDC__I3C2_SCL	0x40001186>, /* SODIMM 59 */
 			   <IMX95_PAD_ENET1_MDIO__I3C2_SDA	0x40001186>; /* SODIMM 57 */
 	};
-- 
2.47.3


