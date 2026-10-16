Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680E9CCF2C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCo5Z7bS7mkeqjfSouZzs+qx9hT0+GW/Gdoe9SuvPmQ=; b=j/NRCTeQJhr/DtdCk2RLrUd+lP
	yAy4a4doQCV+EL4nfeNUuHxzOrsjyxSxERp/SPIfQOBvn6YcLje3MN1hoaaif/x2m2TrJ6PRz8oHF
	XDYLDdRSjUTGJLQjKsy9lZH9mc5aVRyGAC32paiNUdq1hF2qGbu/oMtNIhwXAHYJPyRqI72VkMRoi
	2PODCYpOIP+NfVlWzDhJ7rK/KDWEGh1kld78kAmdKzSw5PB791thwKxojhlkXtPCv/KBD2ZhAmsWx
	dmyvxY66+ZlGAgu+7XkQgEnpOGD4GEXkCOeWjIyIxu+CzxzZgAd+uVCGAKYmpebqZVx56w0UfV6h+
	DUhEx09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmr8-00000003hUI-1c7f;
	Fri, 16 Oct 2026 18:40:38 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmr4-00000003hT9-45iA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:40:37 +0000
Received: from francesco-nb.. (93-33-119-6.ip44.fastwebnet.it [93.33.119.6])
	by mail11.truemail.it (Postfix) with ESMTPA id 53CCE1FAA9;
	Fri, 16 Oct 2026 20:40:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792176029;
	bh=xCo5Z7bS7mkeqjfSouZzs+qx9hT0+GW/Gdoe9SuvPmQ=; h=From:To:Subject;
	b=p67Y5djGUePOMWx4tpZmF3GTxzYdoh/RO/QctyXj/jWDmyKrTiSI3f0mcwf23M1Js
	 FW4nm7oUhk/YUKNji87MtilPIHCdQbTPB89Fdf2vKI/zibgruJBaog/6bB6ymLOINe
	 hfcZa9XdF1xmrecQmleGiITcfKE+a+ZBdE3w+ZKJ2UlGQicHTv1I2+0daZqZVenGUs
	 M/v8VDCoFV5CbnGIBBj2x8O1AmRo3E38KYjKlz6dANQNC2xQbF+hhMoSkqz5IY9kgN
	 dbA2CU6Td+TZxXXxJZJpdEC6Bd+EuFTFu1ok/r6Z0EtHzyKJHY/DOJRa8r1YRzLb6l
	 4L23aDc8pUQGg==
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
Subject: [PATCH v2 1/2] arm64: dts: freescale: imx95-toradex-osm-dev: Remove ETH_A PHY interrupt
Date: Fri, 16 Oct 2026 20:40:18 +0200
Message-ID: <20261016184020.46763-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016184020.46763-1-francesco@dolcini.it>
References: <20261016184020.46763-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_114035_375221_E0F940E9 
X-CRM114-Status: GOOD (  11.97  )
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

GPIO_A7 is a boot strap on the OSM iMX95 module. The pull-up on the OSM
Development Board Ethernet PHY interrupt line causes the module to enter
USB loader mode instead of booting normally when the reset button is
held for more than 0.5 seconds.

On the OSM Development Board the PHY interrupt line reaches GPIO_A7
through a jumper. Boards are shipped with this jumper removed to avoid
the strap conflict, with no change to the board revision, and GPIO_A7
is available in the jumper area for general-purpose use. A future board
revision might drop the PHY interrupt connection from the schematics
altogether.

Switch the PHY to polling and move the GPIO_A7 pinctrl configuration to
the GPIO controller. Polling works regardless of whether the jumper is
fitted, so this is transparent across existing and future board
revisions.

Fixes: 39be5a7e3ecc ("arm64: dts: freescale: Add Toradex OSM iMX95")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: explain the jumper and board revision situation in the commit message
---
 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
index b3d54be07c43..8f56c2bafb66 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
@@ -115,6 +115,11 @@ &flexcan3 {
 	status = "okay";
 };
 
+&gpio1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_a7>;
+};
+
 &gpio5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio_a1>, <&pinctrl_gpio_a2>, <&pinctrl_gpio_a3>,
@@ -317,10 +322,6 @@ &netc_emdio {
 
 	ethphy_a: ethernet-phy@2 {
 		reg = <2>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_a7>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 	};
-- 
2.47.3


