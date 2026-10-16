Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FF8CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7Nc8Mvd7NrUs/gWx3FaCKJorqSwr6trCvvoTs/mlio=; b=DsGURZivDADEjyfz2nzlczbawY
	SXOPC5JLSVpz5XzvcBEhkbMk1gBXNGw1XQa17nnsGZx6XVQ/wZaTOx/TxvKMJYhxOaUWdoWBNWbV8
	jd1VOXtx3zFNgqL7N1El7ap1e1xTK8t0geYj+WVE46fwJ+wQzgqR2bYPpK4l203KwsTXkUw0LbRw5
	U5532gAfdc7R60NsPP9Leely8XQSYpMn61rME3Worv+Q+BIPxjUXvkwrOBBcZDU9OGpXa05Jz+9Uz
	7i+o+Rr+58JeD6h3LiQseLUuebbcc7VwERBCsEVCRFU3mkHnBvm6LEnvFtC1h/VYrYsfagAiepT6y
	oyQbtN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmrG-00000003hWT-2Y22;
	Fri, 16 Oct 2026 18:40:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmrA-00000003hUp-0EvH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 18:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=E7Nc8Mvd7NrUs/gWx3FaCKJorqSwr6trCvvoTs/mlio=; b=U6jmhwYuw24jwG8FlGLjaBlEWy
	t/CFJHCtZOEkgTYPwQMX0u1yM2sxltus66oSyAOzAyvHeu9Xo6YA6wxAyoFXUgcJtu4195yNriBtu
	emLVM4TUDGT2A5d1SDR8igcKpFLJXfVo+jre6OSdYtKnufYLUeEylRQb8feNQHYumNmalCRrTJk9d
	YOvVb+04XAtNXM5CwzeRiM9fBo14bqijHv/ipiZYqJSNTItsdNgZCx7ENXENvb8ieDcP2ORAqSjJ8
	DalhFFcZLyhgvOZIqNS/gcVvuEKoDa/XBpQil7VMRo083UxVJrUr/d4Daqj80rlTvyuWjzgVM+7yJ
	Fa5w639A==;
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHmr6-00000001r0U-2kGy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:40:38 +0000
Received: from francesco-nb.. (93-33-119-6.ip44.fastwebnet.it [93.33.119.6])
	by mail11.truemail.it (Postfix) with ESMTPA id AE6D41FB49;
	Fri, 16 Oct 2026 20:40:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792176030;
	bh=E7Nc8Mvd7NrUs/gWx3FaCKJorqSwr6trCvvoTs/mlio=; h=From:To:Subject;
	b=ZWGFy9Hwb5NYNwRADPCHYGGZUNKUGmr4Ar1YSd8anfwhCJ3iesNyNUTrq/J0vz7Pi
	 c0pZ4rjMd6JsTRchbN9hhdenKE76u4zyDOZPvAoednawuGIjEpqKZhUgDfQyuzfkIS
	 fu7O2CncaVocTuuO5BPBBD52cVrEncQlt0HDOlRiIySKRo6Ku/kQBMAzTK2RngB2V3
	 jHNe0EefY6XVGjbie7HS12rQFMFJPT10nZq99FAeLhwGI1NyX8WB6imDrJSa1FH8kt
	 q1yatLz1Ogph4JlBC1MqPIa/3GadGTvtCbLC7YYyYmEff6NStpewHxf+HARuakEDn4
	 Nqjaotkev5yAw==
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
Subject: [PATCH v2 2/2] arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Remove ETH_A PHY interrupt
Date: Fri, 16 Oct 2026 20:40:19 +0200
Message-ID: <20261016184020.46763-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016184020.46763-1-francesco@dolcini.it>
References: <20261016184020.46763-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_194036_966648_841BF79E 
X-CRM114-Status: GOOD (  13.19  )
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

The OSM Development Board is shared across OSM modules. GPIO_A7 is a
boot strap on the OSM iMX95 module, and the pull-up on the carrier board
Ethernet PHY interrupt line connected to it breaks the reset sequence.

On the OSM Development Board the PHY interrupt line reaches GPIO_A7
through a jumper. Boards are shipped with this jumper removed to avoid
the strap conflict, with no change to the board revision, and GPIO_A7
is available in the jumper area for general-purpose use. A future board
revision might drop the PHY interrupt connection from the schematics
altogether.

Update the OSM iMX93 and iMX91 Device Trees accordingly. Switch the PHY
to polling and move the GPIO_A7 pinctrl configuration to the GPIO
controller. Polling works regardless of whether the jumper is fitted, so
this is transparent across existing and future board revisions.

Fixes: e8a8c86875f4 ("arm64: dts: freescale: Add Toradex OSM iMX93")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: explain the jumper and board revision situation in the commit message
---
 .../dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi   | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
index 566671b32308..24b4bf579835 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
@@ -93,7 +93,7 @@ &gpio2 {
 
 &gpio4 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_gpio_a6>;
+	pinctrl-0 = <&pinctrl_gpio_a6>, <&pinctrl_gpio_a7>;
 };
 
 /* OSM I2C_B */
@@ -262,10 +262,6 @@ &mdio {
 
 	ethphy_a: ethernet-phy@2 {
 		reg = <2>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_a7>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 	};
-- 
2.47.3


