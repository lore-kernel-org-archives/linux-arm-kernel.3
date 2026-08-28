Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5C4C61DDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FNVkoCj+rUBQs5sF0+gEF30Fzp817jl+zaghdPRBDI=; b=a9zwiGpceQh2Ht/rDrA/lrn5Fb
	Vuw3igmq6Y15+vUweDSlIHEsSdIWuQnc8yCly+W3Zfv1l8p8WjBwk2IAcF3ecRkBg1RQ9CeBPylXf
	8jG8w+MRWhgcH4DIc6unJ+qFQUqbeJN1EVKD7kNbDbuuIQ0CdeoF+VOWjdBdzSS+7Y7JFb4PWvVsK
	26y+IOKesDM9jrHF0j1rGJvfz4pqVpIarznsqGI8Ek6zeZgNGcIAw/DJTqsoPxuYnc+HkE+MWKRlD
	WkTt8SXpdYfwCldv3RHdSYyS11Jklsn+6A8RMqCy7cFMbVj7ymnUgZf7buzyq1L8sSYKQ9AEgPuhm
	FfP3offA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwwq-00000005rQ8-1lUr;
	Fri, 28 Aug 2026 13:48:48 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwwO-00000005r0I-25aY;
	Fri, 28 Aug 2026 13:48:26 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260828134818euoutp014bd7f860d90d0ea018a93dab00064d46~P-DjRIa-22677826778euoutp01p;
	Fri, 28 Aug 2026 13:48:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260828134818euoutp014bd7f860d90d0ea018a93dab00064d46~P-DjRIa-22677826778euoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1787924898;
	bh=3FNVkoCj+rUBQs5sF0+gEF30Fzp817jl+zaghdPRBDI=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=Dfwsxnt/WVHDbjOgNfop4KqlsaRnJdeIxWUe0FntCXWAhlSWhblZ8kPOwXafZuwQY
	 KdogJqSQpeixfczifupD7zwzWNxga3a3YMAZN/muHLysYkHQHVGIFE9LegnxBvkjVN
	 +V84JMf/nXvwVlMA5ulakN+o6Flac7VlkiPsczv8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260828134817eucas1p2e2756deff8871be4ea8bb5c65f9c179d~P-Di5h09s1637816378eucas1p2I;
	Fri, 28 Aug 2026 13:48:17 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260828134815eusmtip14def0533d74c34de71cd13bac4bd71f3~P-DhGGsh43269032690eusmtip1D;
	Fri, 28 Aug 2026 13:48:15 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 28 Aug 2026 15:47:26 +0200
Subject: [PATCH v2 02/15] dt-bindings: display: bridge: Add
 starfive,jh7110-inno-hdmi-controller
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-jh7110-clean-send-v2-2-331680c8b9d1@samsung.com>
In-Reply-To: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
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
	Belhachemi <db@domibel.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>,  Andy Yan
	<andyshrk@163.com>, Marek Szyprowski <m.szyprowski@samsung.com>,  Maud
	Spierings <maudspierings@gocontroll.com>,  Graham Markall
	<hello@big-grey.co.uk>,  Michal Wilczynski <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260828134817eucas1p2e2756deff8871be4ea8bb5c65f9c179d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260828134817eucas1p2e2756deff8871be4ea8bb5c65f9c179d
X-EPHeader: CA
X-CMS-RootMailID: 20260828134817eucas1p2e2756deff8871be4ea8bb5c65f9c179d
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
	<CGME20260828134817eucas1p2e2756deff8871be4ea8bb5c65f9c179d@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_064820_810756_17E24C4A 
X-CRM114-Status: GOOD (  14.01  )
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

Add the dt-binding for the StarFive JH7110 Innosilicon HDMI controller
(DRM bridge).

This device is the second child of the starfive,jh7110-hdmi-subsystem node.
It consumes register access clocks (sys, mclk, bclk) from the voutcrg and
both the pixel clock (pclk) and the PHY from its hdmi_phy sibling.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../starfive,jh7110-inno-hdmi-controller.yaml      | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml b/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0e584e7b756e24e2f99a62daab3117bbf4b472b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Innosilicon HDMI Controller
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The controller portion of the StarFive JH7110 INNO HDMI IP.
+
+properties:
+  compatible:
+    const: starfive,jh7110-inno-hdmi-controller
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: System clock for register access
+      - description: Module clock
+      - description: Bus clock
+      - description: Pixel clock from PHY
+
+  clock-names:
+    items:
+      - const: sys
+      - const: mclk
+      - const: bclk
+      - const: pclk
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: hdmi_tx
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: hdmi-phy
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      A graph node with one input port and one output port.
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - phys
+  - phy-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  # Shown as a child of the HDMI subsystem node; see
+  # Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-subsystem.yaml
+  # for the full node.
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    controller {
+        compatible = "starfive,jh7110-inno-hdmi-controller";
+        clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+                 <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+                 <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
+                 <&hdmi_phy>;
+        clock-names = "sys", "mclk", "bclk", "pclk";
+        interrupts = <99>;
+        phys = <&hdmi_phy>;
+        phy-names = "hdmi-phy";
+        resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+        reset-names = "hdmi_tx";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&dpu_out_dpi0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&hdmi_con_in>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.34.1


