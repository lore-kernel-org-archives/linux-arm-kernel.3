Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E84CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 18:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKzWoToGF6KBZRZAi9EoBF1CZPYTdT+6FbxEaMlOyT0=; b=otaiCJjXxssgW9bAVyYqe8yPqx
	Uc+cAeJsx0gXS7adshcpzb8tL+V74iFpyk0gEhyOWA6zsS11yCXnselJMMWfVTlrgEGp+eOz/bHMb
	DUBBvMQ67aqM1CfbesaNcw3NVmxiE7HCogiWy6tKexStN2qIqJdGh+t7V+jAFngG9vdJsgORc+sNm
	sQ9R4k5s/vl4XuA3yUZboYtgUIXqTLJrqngS/PabhZJnAMnjvbHGUip+/l0/mCS1nIVlbHCUUFdaY
	1l1g8x65T6APwRREl4RCuR9cBBdczbiiCur2bb2YtebfH5ZN24MnpIdzSpIIIOZk4Zjch73UbeiDa
	vbmpDf6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJho-00000000ult-3Rdx;
	Thu, 18 Sep 2025 18:50:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJhf-00000000uf7-1vHX;
	Thu, 18 Sep 2025 18:49:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F1C76026D;
	Thu, 18 Sep 2025 18:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EE02C4CEF1;
	Thu, 18 Sep 2025 18:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221398;
	bh=Htg5Xkrs9v7XuZNYgTVERiSjoemIaBO0jN/nY/LLRAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kSeEVrWav2PG5BgRSfOW1+KN7xeUTx2UR9FezgyY5IT12g/PUtMp2vUOvtErW5Hqz
	 L4lvjDfIh822AGzZF8Rc2+bR7WtWU5MBxHmv5rB+YNEP/IKaalXx4JuIMSxnMrs/z6
	 MIjIc22S0O87HdVQThIwIAucZnr+aIDqboY09i5RZOwt2llByAFZiaFdVfQ1xxAGKA
	 u13ap5mUeHsygRDzLGDJAun08wJnZBlmCtScaJyTZnhWpHIgNvQKMiyPAiYZTShAuh
	 oghbtZY3/4l4751hxq9OUirOKjeRtV9IpiF8V65IvFuEG3YWwrsZmcXquKxP6mcVUV
	 /RpETgjRTJXPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FE7CA1013;
	Thu, 18 Sep 2025 18:49:57 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Fri, 19 Sep 2025 01:48:43 +0700
Subject: [PATCH 03/10] dt-bindings: dma: Add RDA IFC DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-rda8810pl-mmc-v1-3-d4f08a05ba4d@mainlining.org>
References: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
In-Reply-To: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758221395; l=2618;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=fdIibseK6J9eF4DEbb0by9y6/svLXlDdAKxdYmnzlAc=;
 b=QviwbPBtxpdoWdT5r4lpY8XknciVPiPjmERLRTaOaBzvDTRddjvGsVcO6iHE8kT4emUpiQt4E
 1MLJW+wwCTHAOBt+3nucNpqiToQ4PDL0uwMLtxtR+eUzpkVGgG8tCe2
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
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
Reply-To: dang.huynh@mainlining.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dang Huynh <dang.huynh@mainlining.org>

The Intelligent Flow Controller (IFC) is a scatter/gather DMA
controller.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 Documentation/devicetree/bindings/dma/rda,ifc.yaml | 45 ++++++++++++++++++++++
 include/dt-bindings/dma/rda-ifc.h                  | 28 ++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/rda,ifc.yaml b/Documentation/devicetree/bindings/dma/rda,ifc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..323e1e87cee09cfc7b64bf44bef61e4d1e91afa5
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/rda,ifc.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/rda,ifc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RDA Intelligent Flow Controller (IFC)
+
+maintainers:
+  - Dang Huynh <dang.huynh@mainlining.org>
+
+description: |
+  RDA IFC is a DMA controller, it only supports scatter/gather lists.
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - rda,8810pl-ifc
+      - const: rda,ifc
+
+  reg:
+    maxItems: 1
+
+  "#dma-cells":
+    const: 1
+    description:
+      The cell corresponding to DMA request ID
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    dma-controller@f0000 {
+      compatible = "rda,8810pl-ifc", "rda,ifc";
+      reg = <0xf0000 0x1000>;
+      #dma-cells = <1>;
+    };
diff --git a/include/dt-bindings/dma/rda-ifc.h b/include/dt-bindings/dma/rda-ifc.h
new file mode 100644
index 0000000000000000000000000000000000000000..af4bae0542aa71690351e2406d0945a61eff72c1
--- /dev/null
+++ b/include/dt-bindings/dma/rda-ifc.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+
+#ifndef __DT_BINDINGS_DMA_RDA_IFC_H__
+#define __DT_BINDINGS_DMA_RDA_IFC_H__
+
+#define IFC_UART1_TX		0
+#define IFC_UART1_RX		1
+#define IFC_UART2_TX		2
+#define IFC_UART2_RX		3
+#define IFC_SPI1_TX		4
+#define IFC_SPI1_RX		5
+#define IFC_SPI2_TX		6
+#define IFC_SPI2_RX		7
+#define IFC_SPI3_TX		8
+#define IFC_SPI3_RX		9
+#define IFC_SDMMC1_TX		10
+#define IFC_SDMMC1_RX		11
+#define IFC_SDMMC2_TX		12
+#define IFC_SDMMC2_RX		13
+#define IFC_SDMMC3_TX		14
+#define IFC_SDMMC3_RX		15
+#define IFC_NFSC_TX		16
+#define IFC_NFSC_RX		17
+#define IFC_UART3_TX		18
+#define IFC_UART3_RX		19
+#define IFC_NO_REQUEST		20
+
+#endif /* __DT_BINDINGS_DMA_RDA_IFC_H__ */

-- 
2.51.0



