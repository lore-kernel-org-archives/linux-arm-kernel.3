Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76F4E8304E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 03:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVMAtFSJkOmWLNQOjwD3PHOyrL1IbxHoq2jDW6dhuac=; b=PwB7mXLF+dbxIwIG/dJ16U0CC0
	IvIvOvk+0qWhOThbvWWpCWRkhd5qTHYHPUJ2fusL7ZKCTECD7LeYzbS4uOP8GfYIZboMivrlt4zsy
	zKv91+Lj8fuZPijpVbhlcwSxFfoBMUj2gJo0OJfv9xV5HNLIPNJN+rF+nz2YbiMw98o9gWL8f+WrA
	zENuDB/JCM9uG3F74SEN6UcyYeietlLEBGbkgw0R/2PpVXRI8QYF3w1wV7LZPRgqqhRMAN4cqc8is
	3FjlLZmtSoqUk75fBgGL6s3VpPc4rNmhVeTCf9RTgclVSjMvTE8eou3zBOgAN7kxGxm5xYg/sFKvH
	KXu3MYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn78N-000000060bJ-3778;
	Tue, 03 Feb 2026 03:31:23 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn78K-000000060ZJ-3P1Y;
	Tue, 03 Feb 2026 03:31:22 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 3 Feb
 2026 11:31:04 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 3 Feb 2026 11:31:04 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Tue, 3 Feb 2026 11:30:53 +0800
Subject: [PATCH RESEND v9 1/3] dt-bindings: phy: aspeed: Add ASPEED PCIe
 PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260203-upstream_pcie_rc-v9-1-899ee4efe94e@aspeedtech.com>
References: <20260203-upstream_pcie_rc-v9-0-899ee4efe94e@aspeedtech.com>
In-Reply-To: <20260203-upstream_pcie_rc-v9-0-899ee4efe94e@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770089464; l=1554;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=nSo81XDH3g+0IhsQkmlg4apJPpZay88RgQZ5h1VpL2k=;
 b=EpOlOH6dAdG3xn3L59ETFlwWx4735wKZK8l4QYz3heoFxGnMWb1RSAldXKGknJ+uDgu7HbTDu
 Q8Tzg7MVvj8AHBIEDbCPoJS6PawWjxmlWuZxWASlNijDD9vSYUgSFmJ
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_193120_857751_69D1E0EE 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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
The PCIe PHY is used for PCIe RC to configure as RC mode.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/aspeed,ast2600-pcie-phy.yaml      | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
new file mode 100644
index 000000000000..71a5cd91fb3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
@@ -0,0 +1,42 @@
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
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@1e6ed200 {
+      compatible = "aspeed,ast2600-pcie-phy";
+      reg = <0x1e6ed200 0x100>;
+      #phy-cells = <0>;
+    };

-- 
2.34.1


