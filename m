Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F86CD6E6A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 05:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0W5IynKjZb9qrF9//+WtLwUT+g/PsxlXT4pC7Ev7e0=; b=tyCK7g6AtsPZ6EG2Gb0h2pn9ce
	uJkoPH9KM37Z2uLduRqzV6+T09PtJj9V/l8T/PwOuYs/GmjF+CiZcxLkM/C7vlN90bWX9PSPaUId1
	mbKc+Jb8XotWYX/UOlRKG0mNbssihSsoePLJBOMVG+2CvJLm34C/qpvvZCxxXwWXrBoepRp2uO/WN
	MAfPwJmWz6MtFC776ZIkvsg3MQ1hFqNe3LNYTJXWiN36we8sqGsM+Lrj8uxB1HY7sX2i4F0tgauRx
	fnmqNtBHe8C4o6LDBiRooKDFXzPNj1MzWCV9MwDsg3fpkWQ6QpP2U3QEMCqM6RW4F4ivJzY7fPxmO
	jQCuMx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeUo-0000000EJOD-1GId;
	Wed, 03 Jun 2026 05:50:30 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeUl-0000000EJKV-44lK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 05:50:29 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 3 Jun
 2026 13:50:14 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 3 Jun 2026 13:50:14 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 3 Jun 2026 13:50:15 +0800
Subject: [PATCH v31 3/5] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260603-upstream_i2c-v31-3-ba7a02714f22@aspeedtech.com>
References: <20260603-upstream_i2c-v31-0-ba7a02714f22@aspeedtech.com>
In-Reply-To: <20260603-upstream_i2c-v31-0-ba7a02714f22@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <andriy.shevchenko@linux.intel.com>, Andi Shyti
	<andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, Rayn Chen
	<rayn_chen@aspeedtech.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, Ryan Chen
	<ryan_chen@aspeedtech.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780465814; l=1769;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=P8FOm2OlqLJ/+F1CLt832mjsrW8d4pnBuooTxj2MoGw=;
 b=6bkT8VCm4y2Fw2+xp4f2lDpHbvzxgNBdDOdZ5PTWcuHEYDFw4tgZlQZr3r/D4I3jQQwnsPPuW
 5Zt/E9Kk2RhAVpnpXOKHQQjYQqmAfeqkH02ImwqGwDwIea9YCfnAigI
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_225028_018675_63BC4185 
X-CRM114-Status: UNSURE (   8.60  )
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

Add the aspeed,global-regs phandle to reference the AST2600 global
registers syscon node, containing the SoC-common I2C register set.

These properties apply only to the AST2600 binding. Legacy DTs remain
unchanged.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v29:
- remove aspeed,enable-dma properties.

Changes in v28:
- update commit message correspond with aspeed,enable-dma.
- remove aspeed,transfer-mode and add aspeed,enable-dma property and
  description.
- Fix aspeed,enable-dma description to reflect hardware capability rather
  than software behavior

Changes in v27:
- change aspeed,transfer-mode to aspeed,enable-dma.
---
 Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
index abc614315dff..21469715d845 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
@@ -48,6 +48,12 @@ properties:
   resets:
     maxItems: 1
 
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle reference to the i2c global syscon node, containing the
+      SoC-common i2c register set.
+
 required:
   - reg
   - compatible
@@ -70,4 +76,5 @@ examples:
         resets = <&syscon ASPEED_RESET_I2C>;
         clock-frequency = <100000>;
         interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+        aspeed,global-regs = <&i2c_global>;
     };

-- 
2.34.1


