Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22E5CC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GboN9DUCZqNahO4XvXD5zPpQKdGt2Yc6N+rShIKk0XM=; b=fi8ypHsZ86MMD3nP/zxAWp4vvl
	zZUiUEYAKNrbfuCs3QfohhnM8IU7WdoQEeiXJMH/TtuYPdEGN2He0Fpvbk9u9sgS5Ppv4aAAXNcKn
	GpWoQ/mQTc6jY6x0WpS4qG4SR/a9nJm57nGt/UkGfM+UOEIjc/IliQ9sg5/u5nfC4wxd83IIN1JLA
	Rut3rHnT63DYD9CSMKtN6SZ9ZTaEAYeezcZJSKP16tro0Tq0oNlUCL2U7jJ1j0D81Pl9l0Gc1NG/u
	bD6fas71oUg129nu8RVBDNvhANkeI0oqsX6FeRzPWQBP+E3auoQXmZEqHVsuXXw0+DrAeWLnXy8gj
	UWA3bpfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtsj-0000000EpmC-3o3X;
	Wed, 14 Oct 2026 07:58:37 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtsf-0000000EplO-1Kwu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:58:36 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6DC2222B63;
	Wed, 14 Oct 2026 09:58:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791964709;
	bh=GboN9DUCZqNahO4XvXD5zPpQKdGt2Yc6N+rShIKk0XM=; h=From:To:Subject;
	b=xKthjOObolv5rS1NFfb00J2+i5NzwS0n+icBxXzUz7wOx2vAg5ZXVZdDuCV8I16fs
	 1RT/PsX9XmefNPGDllWTTUt+3kswDwNdNJXtZ3xCkLQazu4pIwZdC3ONn+ssDEbA7q
	 fbLEhcq1A/I7JxfzOPwCoBOb0Of3WknmI9nZ8+23ygPshc7EaBc5niDvwWqt5ydoAk
	 qwxGG/39e0tYwOzsIpYEh+ltVQ81LPN7ph7SaWp181xxju/RjbQx7CWnDAe6lHCr6k
	 c0w+b3mAW7ZS3dFFMqYTuJ4GQto6gLMKpkXTh9OVVPyEfQzNVequbqDgzBgVKb0TRu
	 DSoz5SAHe1zxA==
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
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx95-toradex-osm-dev: Remove ETH_A PHY interrupt
Date: Wed, 14 Oct 2026 09:58:09 +0200
Message-ID: <20261014075812.29154-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014075812.29154-1-francesco@dolcini.it>
References: <20261014075812.29154-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_005834_665908_5865DBF7 
X-CRM114-Status: GOOD (  11.53  )
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

The PHY interrupt connection has been removed from the carrier board,
and GPIO_A7 is now available in the jumper area for general-purpose use.

Remove the PHY interrupt configuration to use polling, and move the
GPIO_A7 pinctrl configuration to the GPIO controller.

Fixes: 39be5a7e3ecc ("arm64: dts: freescale: Add Toradex OSM iMX95")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
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


