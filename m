Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311D7CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZMUo7WLXMOMQHzwFbOsQWPJOJMT7XainwvPXkjTvQ0=; b=X/TKeegCCSHWr8+cwZSuHMeUTF
	I/UfriqBiBkZw40Sm7ZPfkZSwk8kcjeRdr7+hbu4LcmG+RZyvwXrFrXTpDh4WE74+WX7lOoihIBH5
	y7xDitk+xnMdJ7q+phATeHhPQ9SuuXq4RNMp29fa6tq4CVDZUvzetrzpMix7vLaJAtOcjSZ5oJuQT
	ReFroEKSPC/WLOAEu9MixH1+C6HcQ2WU/9war3ks13VMMNC0Iua2yngq3/rTs3dUVpxcWIoEqZl1e
	E2iVE46SALQVs0sVG27+qjK6SkFkyl4equIvMAgd+8f8vCKja0w+XjEvwkNY106hujv8gEvp5+J9j
	EMz6Ys0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQOW-00000002PLt-2oAL;
	Fri, 22 Aug 2025 11:57:20 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLS7-00000001iJq-2pAj;
	Fri, 22 Aug 2025 06:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=AZ
	MUo7WLXMOMQHzwFbOsQWPJOJMT7XainwvPXkjTvQ0=; b=GS8Ck+mPGVyjDQ/fpi
	+kmcJ7CZ+tipU5bW12VurVk0HpEKdlSeADsLSPXCbzVQIyIqYKHWBzvKYaW5wW1V
	4KlkT1uo3DKNvUYpag1BBLanNKxSSOzyRwlyPfT1SlbhedwcgXwu2LdXh7/FKYLd
	6ahCgrKoURcJry7jCKJLKbnX0=
Received: from ProDesk.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAn9_zCEKhoYtibAA--.23257S3;
	Fri, 22 Aug 2025 14:40:14 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v7 01/10] dt-bindings: display: rockchip: Add schema for RK3588 DPTX Controller
Date: Fri, 22 Aug 2025 14:39:45 +0800
Message-ID: <20250822063959.692098-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822063959.692098-1-andyshrk@163.com>
References: <20250822063959.692098-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgAn9_zCEKhoYtibAA--.23257S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryfKrWfCryDXFW7uF13twb_yoWrCF4xpa
	n3CFZ8JrW09Fy7Xa95tF1kCrsYqw4kA3y7tw1xXw17tr4agFyYgw1a9rn8Z3srGFnrZay2
	9FW7u34xtw47Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jz4E_UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hmxXmioDHlwegAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_234044_050597_52247B8C 
X-CRM114-Status: GOOD (  12.34  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The Rockchip RK3588 SoC integrates the Synopsys DesignWare DPTX
controller. And this DPTX controller need share a USBDP PHY with
the USB 3.0 OTG controller during operation.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

---

(no changes since v2)

Changes in v2:
- Link to V1: https://lore.kernel.org/linux-rockchip/20250223113036.74252-1-andyshrk@163.com/
- Fix a character encoding issue

 .../display/rockchip/rockchip,dw-dp.yaml      | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
new file mode 100644
index 0000000000000..a8a0087179972
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip DW DisplayPort Transmitter
+
+maintainers:
+  - Andy Yan <andy.yan@rock-chips.com>
+
+description: |
+  The Rockchip RK3588 SoC integrates the Synopsys DesignWare DPTX controller
+  which is compliant with the DisplayPort Specification Version 1.4 with the
+  following features:
+
+  * DisplayPort 1.4a
+  * Main Link: 1/2/4 lanes
+  * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
+  * AUX channel 1Mbps
+  * Single Stream Transport(SST)
+  * Multistream Transport (MST)
+  * Type-C support (alternate mode)
+  * HDCP 2.2, HDCP 1.3
+  * Supports up to 8/10 bits per color component
+  * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
+  * Pixel clock up to 594MHz
+  * I2S, SPDIF audio interface
+
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3588-dp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Peripheral/APB bus clock
+      - description: DisplayPort AUX clock
+      - description: HDCP clock
+      - description: I2S interface clock
+      - description: SPDIF interfce clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: aux
+      - const: hdcp
+      - const: i2s
+      - const: spdif
+
+  phys:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for RGB/YUV input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for DP output.
+
+    required:
+      - port@0
+      - port@1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - ports
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/rk3588-power.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dp@fde50000 {
+        compatible = "rockchip,rk3588-dp";
+        reg = <0x0 0xfde50000 0x0 0x4000>;
+        interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&cru PCLK_DP0>, <&cru CLK_AUX16M_0>,
+        <&cru CLK_DP0>, <&cru MCLK_I2S4_8CH_TX>,
+        <&cru MCLK_SPDIF2_DP0>;
+        clock-names = "apb", "aux", "hdcp", "i2s", "spdif";
+        assigned-clocks = <&cru CLK_AUX16M_0>;
+        assigned-clock-rates = <16000000>;
+        resets = <&cru SRST_DP0>;
+        phys = <&usbdp_phy0 PHY_TYPE_DP>;
+        power-domains = <&power RK3588_PD_VO0>;
+        #sound-dai-cells = <0>;
+
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            dp0_in_vp2: endpoint {
+              remote-endpoint = <&vp2_out_dp0>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            dp0_out_con0: endpoint {
+              remote-endpoint = <&dp_con0_in>;
+            };
+          };
+        };
+      };
+    };
-- 
2.43.0


