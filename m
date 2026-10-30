Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEF9606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EaBC5Ggx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XCewqnOXzkOZzOAIzMtrrLrJWrCsz1JxMTxxdgBr4jI=; b=EaBC5Ggxa4fo2i
	U5F+WEQpWy+cbgcnLUh3mp/5QT/9eZ2sXDEVY0QLSprXukarUV17i1rJS5Y6c3J84XlNmP4oajc15
	IS5a2VEp7r6Ez/FBZuUB0L5jL1MDWds1FNZu4C+aPqP8dm5UbpmKEvdkNywbKN86IMrmzI7zGzdwd
	96Cm0VsOOrp/8XYYm1nrL4F7wx682ygKFioIXGHqSWjdeAJkB6UZC2SaTNu2cqFUnDSuo+5U8jb+d
	PZzEL/FCeZiweYB3fjBVvfyVNHBHnshO064HYJjdYJCWd5tvXdQIEUrKPbIhKf1Oahnxqs1EbXAIM
	9xmpi9WDawzGDJ+gbx2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhLt-0000000B1yZ-3oUi;
	Fri, 30 Oct 2026 07:48:41 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhLc-0000000B1ha-41TD;
	Fri, 30 Oct 2026 07:48:29 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-05 (Coremail) with SMTP id zQCowABn0TusS+RqhTm6DA--.1494S3;
	Fri, 30 Oct 2026 15:47:58 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Date: Fri, 30 Oct 2026 15:47:49 +0800
Subject: [PATCH 1/3] dt-bindings: display: bridge: document TH1520 MIPI DSI
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-th1520-dw-mipi-dsi-v1-1-753f34fd304f@iscas.ac.cn>
References: <20261030-th1520-dw-mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn>
In-Reply-To: <20261030-th1520-dw-mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Icneowy Zheng <uwu@icenowy.me>, Han Gao <gaohan@iscas.ac.cn>, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: b4 0.15.0
X-CM-TRANSID: zQCowABn0TusS+RqhTm6DA--.1494S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXw13tF4furyfurW5CF48Zwb_yoW5AF1Dpa
	yfCF4xJF18tFnIvan3Kr18AF43XrsYyFn8Ww17J340yayYg3W2q39IkFn0qFyUJF1xZasx
	ZF4j9ryxKFn2v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2
	KfnxnUUI43ZEXa7VUUbTmDUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_004825_395561_F27BB2D4 
X-CRM114-Status: GOOD (  10.05  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T-Head TH1520 SoC contains two DesignWare MIPI DSI host controllers.

Add a binding document for them, referencing the common dw-mipi-dsi
binding file.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 .../display/bridge/thead,th1520-dw-mipi-dsi.yaml   | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-mipi-dsi.yaml
new file mode 100644
index 0000000000000..23c249f1c1b71
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-mipi-dsi.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/thead,th1520-dw-mipi-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-Head TH1520 DesignWare MIPI DSI Host Controller
+
+maintainers:
+  - Icenowy Zheng <zhengxingda@iscas.ac.cn>
+
+description:
+  The MIPI DSI host controller in TH1520 is a Synopsys DesignWare MIPI DSI
+  host controller paired with an integrated Synopsys MIPI D-PHY.
+
+allOf:
+  - $ref: snps,dw-mipi-dsi.yaml#
+
+properties:
+  compatible:
+    const: thead,th1520-dw-mipi-dsi
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: DSI controller APB clock
+      - description: PHY configuration clock
+      - description: PHY reference clock
+      - description: DSI controller input pixel clock gate
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: phy_cfg
+      - const: ref
+      - const: pixel
+
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the VO subsystem system controller.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - interrupts
+  - syscon
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/thead,th1520-clk-ap.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/thead,th1520-reset.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dsi0: dsi@ffef500000 {
+        compatible = "thead,th1520-dw-mipi-dsi";
+        reg = <0xff 0xef500000 0x0 0x1000>;
+        interrupts = <119 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk_vo CLK_MIPI_DSI0_PCLK>,
+                 <&clk_vo CLK_MIPI_DSI0_CFG>,
+                 <&clk_vo CLK_MIPI_DSI0_REFCLK>,
+                 <&clk_vo CLK_MIPIDSI0_PIXCLK>;
+        clock-names = "pclk", "phy_cfg", "ref", "pixel";
+        resets = <&rst TH1520_RESET_ID_DSI0_APB>;
+        reset-names = "apb";
+        syscon = <&syscon_vo>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            dsi0_in: endpoint {
+              remote-endpoint = <&dpu_out_dpi0>;
+            };
+          };
+
+          dsi0_out_port: port@1 {
+            reg = <1>;
+
+            dsi0_out_panel: endpoint {
+              remote-endpoint = <&panel_in>;
+            };
+          };
+        };
+      };
+    };

-- 
2.56.0


