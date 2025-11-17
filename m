Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55208CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t9V36LK4duRtYZbWY4PLHqlm0tdSmL++GHQdZoya/jc=; b=FJej0i7KQ1qDrGJKQbnorrV/yt
	eElDKr5oK15z3QNFNaBCKl25sYB6R+cCDn++5Nc/GOgKiSegt11337+4fezoC6nq2VDcATQVpJF9j
	VNyoXRRV8yt33nhvTB37LbZ45B5AAb7/Lsj8ZOtCZQ75PVTVVLiqH69mcqW5tRW40xUHnSFt9GM98
	1dQ+ONKBVEExFS++2/9vo2V3PVQU6k/9hNRDB4TZBw83K36rhS5pWdCh928WET/I8n7XGtx+Ce51L
	hBgYvWHtZZ1zMxZiH9CY0KxoFYZ9bl/s0PayDJpjCAxnobDpFJnIy1TVAkv4KdeLOqL3ZM3iVaZLZ
	brnKGSAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL26u-0000000GOci-2xNP;
	Mon, 17 Nov 2025 16:29:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL26t-0000000GOcX-0VGy;
	Mon, 17 Nov 2025 16:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48A72601EA;
	Mon, 17 Nov 2025 16:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B97C113D0;
	Mon, 17 Nov 2025 16:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763396986;
	bh=0k5mR40qmeCxrKeXa+VfhKq6tty412bsrbm9w0g98Cw=;
	h=From:To:Cc:Subject:Date:From;
	b=bMV/850B7PPh9ft0sYYM8BHDWHuUMsdalXTPEt/+javid34XRFEWVe6NGEi333dgc
	 0JNMz1iw2l7qM0zQQFD9UYbtPQls62f489+4yrEkYaAMllE4CXghQ4V03HZMV5w221
	 XMadMCenWGM2s+UA22EbHazv+6FkajZQe/CWPusY+WUDzdSC5yx2MAh8E1Uv3wdTTL
	 y0LWX9ZCOtj9bHfxgMz5+HOnJfiivwbI6bu/5PxgkJNeI9S591Hl5hYYMD1EQ4UDN6
	 ImCyr3twIyvGYqUNP2EfeAOH+yodxM4ORX6leIBpUOv7zXmFc8v06zZ0rmV3yQ+4gZ
	 NIG5QWHiNrLjA==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: mfd: document control-scb and sysreg-scb on pic64gx
Date: Mon, 17 Nov 2025 16:29:29 +0000
Message-ID: <20251117-aeration-smock-5e7ac06e2942@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9655; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ChDTUZ9MY24jy5W4apv1nC1KHi7HZfRF9Amxe1XkbGQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSvukSWzbM7V2nPWOS2JfVsg8X+y+tevFvk2Bv676nD 7S4b7J3dJSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAi5ncZ/tluihKd3rt/zzLr niyP4yvne/+c5Tgz90mdvMGniP7arfWMDPtTSrznsBRv/C7e0aodc+Epb8WFQ2/XBX/+qRhrEqX WwQAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
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

From: Conor Dooley <conor.dooley@microchip.com>

On pic64gx these syscons are identical to those on mpfs, and should use
a fallback. Add support for multiple fallback compatibles to syscon.yaml
with these as the first two users.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Awful diff, sorry!

CC: Nicolas Ferre <nicolas.ferre@microchip.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: Lee Jones <lee@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org

---
 .../devicetree/bindings/mfd/syscon.yaml       | 219 +++++++++---------
 1 file changed, 114 insertions(+), 105 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 657c38175fba..50f0012f4ebe 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -133,111 +133,120 @@ select:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - airoha,en7581-pbus-csr
-          - al,alpine-sysfabric-service
-          - allwinner,sun8i-a83t-system-controller
-          - allwinner,sun8i-h3-system-controller
-          - allwinner,sun8i-v3s-system-controller
-          - allwinner,sun50i-a64-system-controller
-          - altr,l3regs
-          - altr,sdr-ctl
-          - amd,pensando-elba-syscon
-          - amlogic,meson-mx-assist
-          - amlogic,meson-mx-bootrom
-          - amlogic,meson8-analog-top
-          - amlogic,meson8b-analog-top
-          - amlogic,meson8-pmu
-          - amlogic,meson8b-pmu
-          - apm,merlin-poweroff-mailbox
-          - apm,mustang-poweroff-mailbox
-          - apm,xgene-csw
-          - apm,xgene-efuse
-          - apm,xgene-mcb
-          - apm,xgene-rb
-          - apm,xgene-scu
-          - atmel,sama5d2-sfrbu
-          - atmel,sama5d3-nfc-io
-          - atmel,sama5d3-sfrbu
-          - atmel,sama5d4-sfrbu
-          - axis,artpec6-syscon
-          - brcm,cru-clkset
-          - brcm,sr-cdru
-          - brcm,sr-mhb
-          - cirrus,ep7209-syscon1
-          - cirrus,ep7209-syscon2
-          - cirrus,ep7209-syscon3
-          - cnxt,cx92755-uc
-          - freecom,fsg-cs2-system-controller
-          - fsl,imx93-aonmix-ns-syscfg
-          - fsl,imx93-wakeupmix-syscfg
-          - fsl,ls1088a-reset
-          - fsl,vf610-anatop
-          - fsl,vf610-mscm-cpucfg
-          - hisilicon,dsa-subctrl
-          - hisilicon,hi6220-sramctrl
-          - hisilicon,hip04-ppe
-          - hisilicon,pcie-sas-subctrl
-          - hisilicon,peri-subctrl
-          - hpe,gxp-sysreg
-          - loongson,ls1b-syscon
-          - loongson,ls1c-syscon
-          - lsi,axxia-syscon
-          - marvell,armada-3700-cpu-misc
-          - marvell,armada-3700-nb-pm
-          - marvell,armada-3700-avs
-          - marvell,armada-3700-usb2-host-device-misc
-          - marvell,armada-3700-usb2-host-misc
-          - marvell,dove-global-config
-          - mediatek,mt2701-pctl-a-syscfg
-          - mediatek,mt2712-pctl-a-syscfg
-          - mediatek,mt6397-pctl-pmic-syscfg
-          - mediatek,mt7988-topmisc
-          - mediatek,mt8135-pctl-a-syscfg
-          - mediatek,mt8135-pctl-b-syscfg
-          - mediatek,mt8173-pctl-a-syscfg
-          - mediatek,mt8365-infracfg-nao
-          - mediatek,mt8365-syscfg
-          - microchip,lan966x-cpu-syscon
-          - microchip,mpfs-control-scb
-          - microchip,mpfs-sysreg-scb
-          - microchip,sam9x60-sfr
-          - microchip,sama7d65-ddr3phy
-          - microchip,sama7d65-sfrbu
-          - microchip,sama7g5-ddr3phy
-          - mscc,ocelot-cpu-syscon
-          - mstar,msc313-pmsleep
-          - nuvoton,ma35d1-sys
-          - nuvoton,wpcm450-shm
-          - qcom,apq8064-mmss-sfpb
-          - qcom,apq8064-sps-sic
-          - rockchip,px30-qos
-          - rockchip,rk3036-qos
-          - rockchip,rk3066-qos
-          - rockchip,rk3128-qos
-          - rockchip,rk3228-qos
-          - rockchip,rk3288-qos
-          - rockchip,rk3368-qos
-          - rockchip,rk3399-qos
-          - rockchip,rk3528-qos
-          - rockchip,rk3562-qos
-          - rockchip,rk3568-qos
-          - rockchip,rk3576-qos
-          - rockchip,rk3588-qos
-          - rockchip,rv1126-qos
-          - st,spear1340-misc
-          - stericsson,nomadik-pmu
-          - starfive,jh7100-sysmain
-          - ti,am62-opp-efuse-table
-          - ti,am62-usb-phy-ctrl
-          - ti,am625-dss-oldi-io-ctrl
-          - ti,am62p-cpsw-mac-efuse
-          - ti,am654-dss-oldi-io-ctrl
-          - ti,j784s4-acspcie-proxy-ctrl
-          - ti,j784s4-pcie-ctrl
-          - ti,keystone-pllctrl
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - airoha,en7581-pbus-csr
+              - al,alpine-sysfabric-service
+              - allwinner,sun8i-a83t-system-controller
+              - allwinner,sun8i-h3-system-controller
+              - allwinner,sun8i-v3s-system-controller
+              - allwinner,sun50i-a64-system-controller
+              - altr,l3regs
+              - altr,sdr-ctl
+              - amd,pensando-elba-syscon
+              - amlogic,meson-mx-assist
+              - amlogic,meson-mx-bootrom
+              - amlogic,meson8-analog-top
+              - amlogic,meson8b-analog-top
+              - amlogic,meson8-pmu
+              - amlogic,meson8b-pmu
+              - apm,merlin-poweroff-mailbox
+              - apm,mustang-poweroff-mailbox
+              - apm,xgene-csw
+              - apm,xgene-efuse
+              - apm,xgene-mcb
+              - apm,xgene-rb
+              - apm,xgene-scu
+              - atmel,sama5d2-sfrbu
+              - atmel,sama5d3-nfc-io
+              - atmel,sama5d3-sfrbu
+              - atmel,sama5d4-sfrbu
+              - axis,artpec6-syscon
+              - brcm,cru-clkset
+              - brcm,sr-cdru
+              - brcm,sr-mhb
+              - cirrus,ep7209-syscon1
+              - cirrus,ep7209-syscon2
+              - cirrus,ep7209-syscon3
+              - cnxt,cx92755-uc
+              - freecom,fsg-cs2-system-controller
+              - fsl,imx93-aonmix-ns-syscfg
+              - fsl,imx93-wakeupmix-syscfg
+              - fsl,ls1088a-reset
+              - fsl,vf610-anatop
+              - fsl,vf610-mscm-cpucfg
+              - hisilicon,dsa-subctrl
+              - hisilicon,hi6220-sramctrl
+              - hisilicon,hip04-ppe
+              - hisilicon,pcie-sas-subctrl
+              - hisilicon,peri-subctrl
+              - hpe,gxp-sysreg
+              - loongson,ls1b-syscon
+              - loongson,ls1c-syscon
+              - lsi,axxia-syscon
+              - marvell,armada-3700-cpu-misc
+              - marvell,armada-3700-nb-pm
+              - marvell,armada-3700-avs
+              - marvell,armada-3700-usb2-host-device-misc
+              - marvell,armada-3700-usb2-host-misc
+              - marvell,dove-global-config
+              - mediatek,mt2701-pctl-a-syscfg
+              - mediatek,mt2712-pctl-a-syscfg
+              - mediatek,mt6397-pctl-pmic-syscfg
+              - mediatek,mt7988-topmisc
+              - mediatek,mt8135-pctl-a-syscfg
+              - mediatek,mt8135-pctl-b-syscfg
+              - mediatek,mt8173-pctl-a-syscfg
+              - mediatek,mt8365-infracfg-nao
+              - mediatek,mt8365-syscfg
+              - microchip,lan966x-cpu-syscon
+              - microchip,mpfs-control-scb
+              - microchip,mpfs-sysreg-scb
+              - microchip,sam9x60-sfr
+              - microchip,sama7d65-ddr3phy
+              - microchip,sama7d65-sfrbu
+              - microchip,sama7g5-ddr3phy
+              - mscc,ocelot-cpu-syscon
+              - mstar,msc313-pmsleep
+              - nuvoton,ma35d1-sys
+              - nuvoton,wpcm450-shm
+              - qcom,apq8064-mmss-sfpb
+              - qcom,apq8064-sps-sic
+              - rockchip,px30-qos
+              - rockchip,rk3036-qos
+              - rockchip,rk3066-qos
+              - rockchip,rk3128-qos
+              - rockchip,rk3228-qos
+              - rockchip,rk3288-qos
+              - rockchip,rk3368-qos
+              - rockchip,rk3399-qos
+              - rockchip,rk3528-qos
+              - rockchip,rk3562-qos
+              - rockchip,rk3568-qos
+              - rockchip,rk3576-qos
+              - rockchip,rk3588-qos
+              - rockchip,rv1126-qos
+              - st,spear1340-misc
+              - stericsson,nomadik-pmu
+              - starfive,jh7100-sysmain
+              - ti,am62-opp-efuse-table
+              - ti,am62-usb-phy-ctrl
+              - ti,am625-dss-oldi-io-ctrl
+              - ti,am62p-cpsw-mac-efuse
+              - ti,am654-dss-oldi-io-ctrl
+              - ti,j784s4-acspcie-proxy-ctrl
+              - ti,j784s4-pcie-ctrl
+              - ti,keystone-pllctrl
+          - const: syscon
+      - items:
+          - const: microchip,pic64gx-control-scb
+          - const: microchip,mpfs-control-scb
+          - const: syscon
+      - items:
+          - const: microchip,pic64gx-sysreg-scb
+          - const: microchip,mpfs-sysreg-scb
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.51.0


