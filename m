Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E82BCA6013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LC/OjFTpCCvkIsv7pAPuEZkfOKc3BfQoa6IiutvgXsQ=; b=cKpni2HbDwdKnnfdzK46VTZy/F
	1y+Hnb/CFF7YEnfWHpa9BL/NOl/yU3N0NNWg+KPxKtNJkmQClZtm7ramPDrp6ZFIonwZ6HT9sHBUe
	Fj2Z2rFGhAewSy+02X2ZBNoqIIq+XMtIFtOPozl0DqQoYxwH5Er2giwWwAhn8fP6vt7XYAhlNAFsl
	1YSsxgI/CCsCgW9n32qPCUSsbQbTHcvnsQ/z0hJ5urUG0CRHtbRKc5ebeYokSUDCC0Zbil+DT5faI
	/C1p1ZKk8IYJ1y8JJT5J7PferPqPht3yCUsA9DhiHA5kO4Prvk2YlmG+DSHAtgvf/+Y4G+RRVnV7C
	D5ASCvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmIm-00000004F1I-3NVz;
	Thu, 08 Oct 2026 11:28:44 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmIj-00000004Eyu-1g4y;
	Thu, 08 Oct 2026 11:28:42 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 8 Oct
 2026 19:28:28 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 8 Oct 2026 19:28:28 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Thu, 8 Oct 2026 19:28:19 +0800
Subject: [PATCH 1/3] dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261008-aspeed_pcie_phy-v1-1-96764937aef0@aspeedtech.com>
References: <20261008-aspeed_pcie_phy-v1-0-96764937aef0@aspeedtech.com>
In-Reply-To: <20261008-aspeed_pcie_phy-v1-0-96764937aef0@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Manivannan Sadhasivam
	<mani@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791458908; l=1816;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=R1Rp45+kmKh9eM16JpYNajIX3lEUCLAV021oQUooi3w=;
 b=QtvZBxEegbrYy4Tja19fXhxOY7/V57v5Nz2LD/pFCWnOWiUGwKQFAr0KYu1YOiqpnntDbDZJ3
 Ma+fzCLojZEA0HqMt0u3AENCL8onaoZIpNyQfxhwXgOE4EnZ8YTEny3
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_042841_444084_4F9257A4 
X-CRM114-Status: GOOD (  10.14  )
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

Introduce device-binding for ASPEED AST2600/2700 PCIe PHY.
The PHY provides the physical layer used by the PCIe
controller when operating in root complex mode.

Describe the compatible strings, register range, clocks and
phy-cells value required by the PHY provider.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../bindings/phy/aspeed,ast2600-pcie-phy.yaml      | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
new file mode 100644
index 000000000000..686b2e3d9457
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/aspeed,ast2600-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED PCIe PHY
+
+maintainers:
+  - Jacky Chou <jacky_chou@aspeedtech.com>
+
+description:
+  The ASPEED PCIe PHY provides the physical layer functionality for PCIe
+  controllers in the SoC.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,ast2600-pcie-phy
+          - aspeed,ast2700-pcie-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      Fixed 100MHz reference clock provided on the board.
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@1e6ed200 {
+      compatible = "aspeed,ast2600-pcie-phy";
+      reg = <0x1e6ed200 0x100>;
+      clocks = <&pcie_refclk>;
+      #phy-cells = <0>;
+    };

-- 
2.34.1


