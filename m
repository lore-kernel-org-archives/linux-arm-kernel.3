Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F85CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvIWX7uR9LoK2ufZRaTg4MD2EPX+/rF4fST4C/0Vejg=; b=jbsWKrEl35MJH0GFGiMkKf9pyT
	g25hlG65i+KyO4OP7H/QKIZTdctgQRwhSBDw/ZzBtbLCwzeUga7hgFrZD4I4G0a6e/csHhl92wyPo
	ay/D3W6n7qor31DoRqyZhrL/D4HR0viComk6i2iqivdwXSBIOPkwWjwVmgM/fGjcli/CqR5gVzn5T
	zwkXDvnR/NXK9yP8giOBO9N2aGz9QGdp8tZaAyACaOL6OsyffCmNBWpBaAZqUE0mSvBbe679FuJiC
	Q1VGXRHsCngkJa9k9gKLgtBshRJRpjG3rnOhPs6O+um4Jp7+0yDuH6GPidz7sI13X/I0U6mqvnXt7
	wO/jjX5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLTl-00000002lH3-2IMF;
	Mon, 14 Jul 2025 15:52:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKlW-00000002Ytd-2l1K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:06:52 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58AF954E8;
	Mon, 14 Jul 2025 17:06:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505577;
	bh=uA4XBsmESZQqZTawC8KyBs9qAJ3n7fIDjQK7x7tXRew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PaQkxkLYHJTfnMao40CsHMXaJiEUDN6/MnYOpE6m+v3Q90cH91cXgELwIbOSebRpz
	 AIxcJzA32wTGa3e+5uODmfX7tAbIhLxYDNT/FhCnfnZkam9ytH+3z+7gUONeNpexfC
	 /AkM5XlS7fEcW6dR+YeB8SfIKM+Rl73KhYdDbiSU=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:33 +0100
Subject: [PATCH v11 07/19] dt-bindings: media: Add bindings for ARM
 mali-c55
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-7-bc20e460e42a@ideasonboard.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
In-Reply-To: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4026;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=uA4XBsmESZQqZTawC8KyBs9qAJ3n7fIDjQK7x7tXRew=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR0Ad0/qswToRaRCV4/I6WQ/lpHYPuUGGhb98
 4YruIrYkwyJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUdAAAKCRDISVd6bEV1
 MuDVD/9gQ82DQQY1rkR17cLKKMSJaIzb5fPQ8BAx0UxZkqf47Eu2CHPSi9JwJ0LQS3c2pKETzan
 vc31nEWvzLs+XRQl2clDShUe27fRo410vgWirOQr7/gaDaqOvONC2b5qfkS9HWhUqdP05qt6Zel
 2Vy2DzwpNzok9pl+mcVZROHrxM4oTHB1UHhSGKzWzYFO+RLL0oE1Wmn6u0iKQ4icNehjFhe6GU+
 Q0jKxGACEO6jKlIMckYggKIU0NzrNhPEfrNMCWcoUyJBOZz6mVde9nHRVLOtueecal0l+7a46hh
 Rt3boqBO96hpnGtjZfwid2WxpsKLSZhb8NT1gpehUiD7DdGr/G/VCmZpJszVd5jz4FsrFTDm+xd
 UMDQPsaxAIKujPW/sbG+qImCS2yFd7jSC0vQgYSWMPSeig8X+n6P8ZZshLYMTx8cj8LSaIdGnSk
 6V8p5F2Gwe4TXs2Xn+TT3jQ/TjrysFkKR4gU52Ie9x46dPzKKUf15w0hoHP38jKN0oOstkbt9+2
 2G09NOcLJhzGFOo4EprvWzmUDXOk6wzCWMDzxHt0dKlVHhlUS0sehX0/ZIMLw2VXlfcj7ynIXRk
 ux/dxtBbtyamBNIGFjIhojWGlPm2vaYzvMsx4EX/ehk/ZmKdwFNdZhe5/NCfGnzKjxXTYG0B5Iy
 isNyGT1CLNu5fug==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_080650_850985_2B46AE6A 
X-CRM114-Status: GOOD (  16.00  )
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

Add the yaml binding for ARM's Mali-C55 Image Signal Processor.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v11:

	- Dropped in arm,inline_mode property. This is now identical to the
	  reviewed version 8, so I have kept the tags on there.

Changes in v10:

	- None

Changes in v9:

	- Added the arm,inline_mode property to differentiate between inline and
	  memory input configurations

Changes in v8:

	- Added the video clock back in. Now that we have actual hardware it's
	  clear that it's necessary.
	- Added reset lines
	- Dropped R-bs

Changes in v7:

	- None

Changes in v6:

	- None

Changes in v5:

	- None

Changes in v4:

	- Switched to port instead of ports

Changes in v3:

	- Dropped the video clock as suggested by Laurent. I didn't retain it
	for the purposes of the refcount since this driver will call .s_stream()
	for the sensor driver which will refcount the clock anyway.
	- Clarified that the port is a parallel input port rather (Sakari)

Changes in v2:

	- Added clocks information
	- Fixed the warnings raised by Rob
---
 .../devicetree/bindings/media/arm,mali-c55.yaml    | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..539fa8163bd07cf8a80c361012400cbcc7d073eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Mali-C55 Image Signal Processor
+
+maintainers:
+  - Daniel Scally <dan.scally@ideasonboard.com>
+  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+
+properties:
+  compatible:
+    const: arm,mali-c55
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ISP Video Clock
+      - description: ISP AXI clock
+      - description: ISP AHB-lite clock
+
+  clock-names:
+    items:
+      - const: vclk
+      - const: aclk
+      - const: hclk
+
+  resets:
+    items:
+      - description: vclk domain reset
+      - description: aclk domain reset
+      - description: hclk domain reset
+
+  reset-names:
+    items:
+      - const: vresetn
+      - const: aresetn
+      - const: hresetn
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Input parallel video bus
+
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+
+  arm,inline_mode:
+    description:
+      The ISP can be either electrically connected to sensor and CSI-2 receiver
+      or driven through a DMA input device. This property declares the ISP as
+      being electrically connected to the source of image data.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    mali_c55: isp@400000 {
+      compatible = "arm,mali-c55";
+      reg = <0x400000 0x200000>;
+      clocks = <&clk 0>, <&clk 1>, <&clk 2>;
+      clock-names = "vclk", "aclk", "hclk";
+      resets = <&resets 0>, <&resets 1>, <&resets 2>;
+      reset-names = "vresetn", "aresetn", "hresetn";
+      interrupts = <0>;
+
+      port {
+        isp_in: endpoint {
+            remote-endpoint = <&csi2_rx_out>;
+        };
+      };
+    };
+...

-- 
2.34.1


