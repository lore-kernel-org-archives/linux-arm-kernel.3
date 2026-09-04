Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF635C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqgpvaKLAvptLZijlTzxE1ODqj6NzC7DwSCGsLNIbnA=; b=Rj70zNOyRGOegJ8p2EplfX9aKl
	LLUe9tToqaE+VYp5v5hZm8gfx1Ld+VCN4ZzzYm0O3av/pAYv3GFlkTi2H9KGVPJesczsvgnqgquMT
	sgVntbKm4ZRzypB4g4nQ8au25pw1G2f8kHurCVeLYkvWRZnMwbnQiGbrr/tyQhEnLm5Lz0Ls711nU
	9d5wKitZjZzn47NOAQy5IMsKpC+RwalGVFvs1ZOCkCI54cYpJBPnGiABH04sO7jIwF6AEeEYajT3w
	WvqjA5fBlmv8CfHXwBjD71tHlaoTGVjtYCeHTe9ir4KNLsIK62+PDbGkk7cWIkPR0UXaVYnNPz3h2
	jDwntF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tx8-00000002AA8-2S2M;
	Fri, 04 Sep 2026 13:27:34 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Twu-000000029vf-3byx;
	Fri, 04 Sep 2026 13:27:23 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260904132718euoutp02109185d318a43a782663f50a7187f73d~SISOcCHZB2525625256euoutp02H;
	Fri,  4 Sep 2026 13:27:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260904132718euoutp02109185d318a43a782663f50a7187f73d~SISOcCHZB2525625256euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788528438;
	bh=ZqgpvaKLAvptLZijlTzxE1ODqj6NzC7DwSCGsLNIbnA=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=nlQH2E+v8Q40gW1cBIykTskDYFAH1SOXhDHWpagYUfUt4v58GPNaSPTnIW6ocGrSV
	 f62xBw9paK/XDNtCLEo6j+V3h4eCk9MsZaC++xltKdCrFDD9TfljT3SgRMf7p/pycy
	 TYakv30wphZDAnJMKkDknfomACfktzSS+lPg4s6Y=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260904132718eucas1p1b25abe6cd0562e47dfeb75f8877e47b0~SISOIGl3a3177031770eucas1p1P;
	Fri,  4 Sep 2026 13:27:18 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260904132716eusmtip1a093d0361b7dd61855fbb66927001ed4~SISL6y_131747217472eusmtip1P;
	Fri,  4 Sep 2026 13:27:16 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 04 Sep 2026 15:27:06 +0200
Subject: [PATCH v3 05/19] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-subsystem
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-jh7110-clean-send-v3-5-484f9ae72715@samsung.com>
In-Reply-To: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,  Simona
	Vetter <simona@ffwll.ch>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,  Heiko
	Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,  Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260904132718eucas1p1b25abe6cd0562e47dfeb75f8877e47b0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260904132718eucas1p1b25abe6cd0562e47dfeb75f8877e47b0
X-EPHeader: CA
X-CMS-RootMailID: 20260904132718eucas1p1b25abe6cd0562e47dfeb75f8877e47b0
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<CGME20260904132718eucas1p1b25abe6cd0562e47dfeb75f8877e47b0@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_062721_182876_9C0ED918 
X-CRM114-Status: GOOD (  14.00  )
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

The JH7110 groups its display hardware into a video output subsystem,
dom_vout_top, covering the DC8200, the HDMI transmitter, the video
output clock generator and the video output system controller.

They share one NoC port whose clock and reset gate access to every
register in the region, and the region sits in the PD_VOUT power
domain. Describe the subsystem as a bus node so those resources are
owned by the block that shares them, rather than by whichever consumer
happens to probe first.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../starfive/starfive,jh7110-vout-subsystem.yaml   | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..17a6bf61df1e7ca95c07e15347c9d688163c926f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-vout-subsystem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 video output subsystem
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The JH7110 groups its display hardware into a video output subsystem, named
+  dom_vout_top in the documentation. It covers the DC8200 display controller,
+  the HDMI transmitter, the video output clock generator and the video output
+  system controller, all behind one NoC port. That port's clock and reset gate
+  access to every register in the region, and the region sits in the PD_VOUT
+  power domain, so this node owns those resources on behalf of its children.
+
+properties:
+  compatible:
+    const: starfive,jh7110-vout-subsystem
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: NoC display bus clock.
+
+  resets:
+    maxItems: 1
+    description: NoC display bus reset.
+
+  power-domains:
+    maxItems: 1
+
+  dma-noncoherent: true
+
+  ranges: true
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+patternProperties:
+  "^display@[0-9a-f]+$":
+    $ref: /schemas/display/verisilicon,dc.yaml#
+
+  "^hdmi@[0-9a-f]+$":
+    $ref: /schemas/mfd/starfive,jh7110-hdmi-subsystem.yaml#
+
+  "^clock-controller@[0-9a-f]+$":
+    $ref: /schemas/clock/starfive,jh7110-voutcrg.yaml#
+
+  "^syscon@[0-9a-f]+$":
+    $ref: /schemas/soc/starfive/starfive,jh7110-syscon.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - power-domains
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/power/starfive,jh7110-pmu.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        display-subsystem@29400000 {
+            compatible = "starfive,jh7110-vout-subsystem";
+            reg = <0x0 0x29400000 0x0 0x200000>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+            clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>;
+            dma-noncoherent;
+            power-domains = <&pwrc JH7110_PD_VOUT>;
+            resets = <&syscrg JH7110_SYSRST_NOC_BUS_DISP_AXI>;
+
+            syscon@295b0000 {
+                compatible = "starfive,jh7110-vout-syscon", "syscon";
+                reg = <0x0 0x295b0000 0x0 0x10000>;
+            };
+        };
+    };
+...

-- 
2.34.1


