Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1363C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+5U0mBmKNYx44klRe7/0sqwAEdWPb5c0/ZKhWrq2vE=; b=CFX9JI1d/nN4qVZqV0SBZ/2P6b
	XYppcu8P2yDjco9W2cAZPYQPCH1u3kMEzM2wcPppLrQTeNm8guisiaoTY8slNAmriWhjiptkMYPYf
	h2SfypJpenLjPc0eswuU7+9qrEEyXLkRBSR200NlPTb4E663b/x519PqLTqztUsdQGBY8h29Afg3p
	rblsUQuzczHqIcV96qicEX1nbmjPmUYm87VFMqBUjprcHrZht4Sfi8zWA/YOElCpiuAaIZ8xuqi1J
	7p61DZqb+RKWjNJcuJdc2iSfl1gf5mByYfHgL5rMoC0V0/1siUV9+pWEa9Yb40NTumsxsQYOwA0OF
	ywewkgAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V9R-00000007B6T-0vzZ;
	Tue, 15 Sep 2026 15:32:53 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V8x-00000007Aa0-1x0N;
	Tue, 15 Sep 2026 15:32:25 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260915153219euoutp020a2ec4a1f55740f03ed6e5edd73d328d~ViFgfnmxm0071100711euoutp027;
	Tue, 15 Sep 2026 15:32:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260915153219euoutp020a2ec4a1f55740f03ed6e5edd73d328d~ViFgfnmxm0071100711euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789486339;
	bh=w+5U0mBmKNYx44klRe7/0sqwAEdWPb5c0/ZKhWrq2vE=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=oFRkSElSxl1XeaudyrqOAg6hn10Ern57bpu1NyWXK0GDUWF7xGacy9RKbGrc66Ekj
	 FzGs0f9ErwPAFTJNuW6ef29crgVoS0pMhwt/QnHk3Dfq/+7lniPT8QfHo8HDbNNfO0
	 dMDeFUX2Ql5mqetKmGAsNQloEbDSA5i3VCGyaa3k=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260915153218eucas1p278c4870936afe1aaa52438660418f8c8~ViFgMFtea0983909839eucas1p2a;
	Tue, 15 Sep 2026 15:32:18 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260915153216eusmtip1dd6540af2d56a1daf5accfe6232d611f~ViFeipRGL0419704197eusmtip10;
	Tue, 15 Sep 2026 15:32:16 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 15 Sep 2026 17:32:11 +0200
Subject: [PATCH v4 03/20] dt-bindings: mfd: Add
 starfive,jh7110-hdmi-subsystem
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-jh7110-clean-send-v4-3-f0e4fd6f2cc8@samsung.com>
In-Reply-To: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260915153218eucas1p278c4870936afe1aaa52438660418f8c8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153218eucas1p278c4870936afe1aaa52438660418f8c8
X-EPHeader: CA
X-CMS-RootMailID: 20260915153218eucas1p278c4870936afe1aaa52438660418f8c8
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153218eucas1p278c4870936afe1aaa52438660418f8c8@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_083223_796493_7A0E3EDF 
X-CRM114-Status: GOOD (  14.54  )
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

Add the dt-binding for the StarFive JH7110 HDMI subsystem.

The JH7110 HDMI IP is a monolithic block containing both the digital
controller and analog PHY in a single register space. This binding
defines the parent device, which holds the shared register map and
populates its two children: the PHY and the controller. This is
necessary to resolve a circular clock dependency between the HDMI block
and the VOUT clock generator.

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../mfd/starfive,jh7110-hdmi-subsystem.yaml        | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-subsystem.yaml b/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-subsystem.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..18034d8273b860b71d386cfc63a125f21b20a6b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-subsystem.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/starfive,jh7110-hdmi-subsystem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 HDMI subsystem
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The StarFive JH7110 HDMI block is a monolithic IP containing both
+  the digital controller logic and the analog PHY logic in a single
+  register space. It sits inside the video output subsystem, which owns
+  the NoC bus clock and reset gating this region and the power domain it
+  belongs to.
+
+properties:
+  compatible:
+    const: starfive,jh7110-hdmi-subsystem
+
+  reg:
+    maxItems: 1
+
+  phy:
+    $ref: /schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
+
+  controller:
+    $ref: /schemas/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml#
+
+required:
+  - compatible
+  - reg
+  - phy
+  - controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        hdmi@29590000 {
+            compatible = "starfive,jh7110-hdmi-subsystem";
+            reg = <0x29590000 0x4000>;
+
+            controller {
+                compatible = "starfive,jh7110-inno-hdmi-controller";
+                clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+                         <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+                         <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
+                         <&hdmi_phy>;
+                clock-names = "pclk", "mclk", "bclk", "pixel";
+                interrupts = <99>;
+                phys = <&hdmi_phy>;
+                resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+                starfive,vout-syscon = <&vout_syscon>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&dpu_out_dpi0>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&hdmi_con_in>;
+                        };
+                    };
+                };
+            };
+
+            hdmi_phy: phy {
+                compatible = "starfive,jh7110-inno-hdmi-phy";
+                #clock-cells = <0>;
+                clocks = <&xin24m>;
+                #phy-cells = <0>;
+            };
+        };
+    };
+...

-- 
2.34.1


