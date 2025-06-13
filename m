Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85A0C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 03:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDpSHFX5/iKofQqkW2v7Wb8RTbMe57FisKpAdF+H81o=; b=i82NRSBCOoXVJk2GRlo7mnDHSg
	OG1oBlZPA03DFXa80RaO+HmqfrloTXl/+j6EdP7HoAUOGagrveqn0Y3VwrrHMVaui9KBnh+T9Klxs
	DvV1YblQ6X2WPq7M7/k0OzT9H3o3Ej74hnvBCGxDHjkYMdj1SzK6sJVSCZ1jD9peLJ1ClHjsCXewd
	ppUP0tC3qukfkqEdD9WhEpUoT2W/O3ptW2xgnKpLioOoht9uWoSq9I9/jrRQWVvDXSjnazqgcTu+7
	N07LKs/NZwjFU1JFTd0CJYXl9VvzhVHqZ2+iNigMR9aMiRXKZ0ppW0LNmkY7tDbxVsyRBORPjoY2h
	0NuuU16g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPvBs-0000000FEtE-0gJr;
	Fri, 13 Jun 2025 03:34:52 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPv7S-0000000FEOC-3bjC;
	Fri, 13 Jun 2025 03:30:20 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Jun
 2025 11:30:02 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Jun 2025 11:30:02 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <bhelgaas@google.com>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<mani@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <linus.walleij@linaro.org>,
	<p.zabel@pengutronix.de>, <linux-aspeed@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <elbadrym@google.com>, <romlem@google.com>, <anhphan@google.com>,
	<wak@google.com>, <yuxiaozhang@google.com>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 1/7] dt-bindings: phy: Add document for ASPEED PCIe PHY
Date: Fri, 13 Jun 2025 11:29:55 +0800
Message-ID: <20250613033001.3153637-2-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_203018_900437_C8629340 
X-CRM114-Status: GOOD (  12.63  )
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

Add device tree binding YAML documentation for the ASPEED PCIe PHY.
This schema describes the required properties for the PCIe PHY node,
including compatible strings and register space, and provides an
example for reference.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../bindings/phy/aspeed-pcie-phy.yaml         | 38 +++++++++++++++++++
 MAINTAINERS                                   | 10 +++++
 2 files changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
new file mode 100644
index 000000000000..762bf7b0aedc
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/aspeed-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED PCIe PHY
+
+maintainers:
+  - Jacky Chou <jacky_chou@aspeedtech.com>
+
+description: |
+  The ASPEED PCIe PHY provides the physical layer interface for PCIe
+  controllers in the SoC. This node represents the register block for the PCIe
+  PHY, which is typically accessed by PCIe Root Complex or Endpoint drivers
+  via syscon.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-pcie-phy
+      - aspeed,ast2700-pcie-phy
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pcie-phy@1e6ed200 {
+      compatible = "aspeed,ast2600-pcie-phy";
+      reg = <0x1e6ed200 0x100>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a5a650812c16..68115443607d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3696,6 +3696,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
 F:	drivers/media/platform/aspeed/
 
+ASPEED PCIE CONTROLLER DRIVER
+M:	Jacky Chou <jacky_chou@aspeedtech.com>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+L:	linux-pci@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/aspeed-pcie-cfg.yaml
+F:	Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
+F:	Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
+F:	drivers/pci/controller/pcie-aspeed.c
+
 ASUS EC HARDWARE MONITOR DRIVER
 M:	Eugene Shalygin <eugene.shalygin@gmail.com>
 L:	linux-hwmon@vger.kernel.org
-- 
2.43.0


