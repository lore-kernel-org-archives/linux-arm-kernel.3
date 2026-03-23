Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1911D58CC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 02:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8iQRX6QnfhkFbPyZD+d/T4tMg2h+QnjsJXeuu6xzz0=; b=Ul/xBPylHTs224N2n2z00RcJLG
	uoXWpPS9VKiftVGePb3gb/EhbdDdIywEdFSxMvTTeJ6Nj4aau/jL+0m5Hfp5M/U+i7jNdie/FcqAg
	3GPlSfNw/f9PvAPuB8blssjv18o3hv1mXSgIKyf3Fwb+jrHQdyKNFA33INDAMNU6+UDSon2L/gbNx
	D8n1XAiskaKqQeFaWOHYlpLDxgijMWiUq3x/p0Ns7i+EGb52iTeU2mkuKq9CdNN+YYlUa3Ljtq8du
	3qkeW0bA3uE/Ry4yFAqJxxOo7lkgjmnAPl+l46B1tRUOzwMQ9p65epG2PztZhCBpS53CHGYjjGqH0
	Dp9KeJzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4UhV-0000000Ft2G-0pt3;
	Mon, 23 Mar 2026 02:07:29 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4UhO-0000000Fsyf-3O2M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 02:07:23 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 23 Mar
 2026 10:07:07 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 23 Mar 2026 10:07:07 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Mon, 23 Mar 2026 10:07:07 +0800
Subject: [PATCH v3 1/2] dt-bindings: mmc: sdhci-of-aspeed: Add AST2700
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260323-sdhci-v3-1-93555b8f6411@aspeedtech.com>
References: <20260323-sdhci-v3-0-93555b8f6411@aspeedtech.com>
In-Reply-To: <20260323-sdhci-v3-0-93555b8f6411@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter
	<adrian.hunter@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Andrew Jeffery <andrew@aj.id.au>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774231627; l=2522;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=jdzbRuodmDOa4Rz8PKWhhJ6GdFCSrpEzLrR1LcRWhN8=;
 b=4EdN1Pbm/olA1ehS/4Wg9tcediCzCAre0wopiJ6/Evw3ha8JJDuq5b3h4PViy9ycjeuR6a3Vz
 GsYzhSmUJOODuCKoj/UEitmcX4oEa5jTgoMztAoRXA5HFR6FJnNk5zz
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_190722_850688_EC3E51CF 
X-CRM114-Status: UNSURE (   8.81  )
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

AST2700 SDHCI controller is fully compatible with AST2600.

However, it is necessary to take the AST2700 SD controller out of
reset, so require the 'resets' property.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v3:
- Add items list const for ast2700 ast2600 compatible
- Move if/then/else block after required: (per example-schema)
Changes in v2:
- add missing blank line
- modify ast2700 compatible items const
---
 .../devicetree/bindings/mmc/aspeed,sdhci.yaml      | 41 +++++++++++++++++-----
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
index d24950ccea95..e4a9c2810893 100644
--- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
@@ -22,10 +22,15 @@ description: |+
 
 properties:
   compatible:
-    enum:
-      - aspeed,ast2400-sd-controller
-      - aspeed,ast2500-sd-controller
-      - aspeed,ast2600-sd-controller
+    oneOf:
+      - enum:
+          - aspeed,ast2400-sd-controller
+          - aspeed,ast2500-sd-controller
+          - aspeed,ast2600-sd-controller
+      - items:
+          - const: aspeed,ast2700-sd-controller
+          - const: aspeed,ast2600-sd-controller
+
   reg:
     maxItems: 1
     description: Common configuration registers
@@ -38,6 +43,9 @@ properties:
     maxItems: 1
     description: The SD/SDIO controller clock gate
 
+  resets:
+    maxItems: 1
+
 patternProperties:
   "^sdhci@[0-9a-f]+$":
     type: object
@@ -46,10 +54,15 @@ patternProperties:
 
     properties:
       compatible:
-        enum:
-          - aspeed,ast2400-sdhci
-          - aspeed,ast2500-sdhci
-          - aspeed,ast2600-sdhci
+        oneOf:
+          - enum:
+              - aspeed,ast2400-sdhci
+              - aspeed,ast2500-sdhci
+              - aspeed,ast2600-sdhci
+          - items:
+              - const: aspeed,ast2700-sdhci
+              - const: aspeed,ast2600-sdhci
+
       reg:
         maxItems: 1
         description: The SDHCI registers
@@ -78,6 +91,18 @@ required:
   - ranges
   - clocks
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: aspeed,ast2700-sd-controller
+then:
+  required:
+    - resets
+else:
+  properties:
+    resets: false
+
 examples:
   - |
     #include <dt-bindings/clock/aspeed-clock.h>

-- 
2.34.1


