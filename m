Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE402F3D60F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gb1OEmdc6nHnegssDa+XgzmRMUmtqiRcJwYrGyz0B+I=; b=enVlLKrrxsXPpsCam+3OGl4Zo7
	A+h/BOhM8vuiFn9hD0rDGnFVZa9g+zBdHRJNoHPXihop04Cz/L2t26WB8sSyfQ0uxU7VE45zseyce
	W+jdGSsU9gQAbkbeHc0a9oF+BlerSWsU3QOUSbGHrycclpMlbIsdkzs1vvNZ070RoZr87Ewt68VoF
	GwxtAGMdTduskUDcnK1eZiP+WwS1JOLBly0iMlZ038LLuDY077qOb7xKaCK9McWSVUzC4tNdKONCL
	h8RsPHcJhuuATjo21ec0Lvtmc0JxCnlHEMXVrrkuuuXUJo2Q/NvegF7eZ9qOKkE0KayHcKvxVFhTc
	TWTki69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77sm-0000000AqBM-3myV;
	Mon, 30 Mar 2026 08:22:00 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77sg-0000000Aq8U-3IKc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:21:55 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 30 Mar
 2026 16:21:47 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 30 Mar 2026 16:21:47 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Mon, 30 Mar 2026 16:21:47 +0800
Subject: [PATCH v28 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and enable-dma properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260330-upstream_i2c-v28-2-17bdae39c5cb@aspeedtech.com>
References: <20260330-upstream_i2c-v28-0-17bdae39c5cb@aspeedtech.com>
In-Reply-To: <20260330-upstream_i2c-v28-0-17bdae39c5cb@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <andriy.shevchenko@linux.intel.com>, Andi Shyti
	<andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, Rayn Chen
	<rayn_chen@aspeedtech.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774858906; l=1878;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=Z2AXlRcw8rroVI4rnpHgF+99FZI/yNPMg8RNUT8tbwc=;
 b=mRu3dj7XE8wlOn99k+9o1IjAAtiPtC4krH7vcIPJvKLUcC8Mo/TQob7qLzxbb10+44H3WcEbG
 O1gXVUoJBpIAqYXpj+1/h707e1Uzv7zRg1QBWHqw1f7Awi/EM2OCbhU
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_012154_827127_68A4CB96 
X-CRM114-Status: UNSURE (   8.58  )
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

Add aspeed,enable-dma boolean property to indicate that DMA is
available for transfers on this I2C bus.

Also add the aspeed,global-regs phandle to reference the AST2600
global registers syscon node, containing the SoC-common I2C register
set.

These properties apply only to the AST2600 binding. Legacy DTs remain
unchanged.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v28:
- update commit message correspond with aspeed,enable-dma.
- remove aspeed,transfer-mode and add aspeed,enable-dma property and
  description.
- Fix aspeed,enable-dma description to reflect hardware capability rather
  than software behavior
Changes in v27:
- change aspeed,transfer-mode to aspeed,enable-dma.
---
 .../devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml          | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
index de2c359037da..67b23d1a4cec 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
@@ -37,6 +37,16 @@ properties:
   resets:
     maxItems: 1
 
+  aspeed,enable-dma:
+    type: boolean
+    description: Indicates this I2C controller instance has DMA capability.
+
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle reference to the i2c global syscon node, containing the
+      SoC-common i2c register set.
+
 required:
   - reg
   - compatible
@@ -59,4 +69,6 @@ examples:
         resets = <&syscon ASPEED_RESET_I2C>;
         clock-frequency = <100000>;
         interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+        aspeed,global-regs = <&i2c_global>;
+        aspeed,enable-dma;
     };

-- 
2.34.1


