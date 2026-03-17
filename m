Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C15F3029A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 05:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCN3c/UA45BOu9jA0C3CEzVv2oYbn8t8QaEA0rB5IgM=; b=xGcIeNFKvNjSDzSwZITmzJ07xk
	4ndC/gkHoqkyhvbxM732mb2+yBYcbu5lEfmEI395vJGmncz7JcjwmufB+hVyFYoyMGhq8UjC6+cYu
	VRhljBoEUaIix917DnZVxshJFuPhJW3TVzkVe4/0gE71oDhSPmgbx99dmy909OJBnFmAp/nfN1BZ0
	Jysdieup1LUWddQc/V/cFqxBjsTMwYStRpUNxkbcuIGb56MpP3VR3gk2Ppx5kiGAICpz0hqMsbdF6
	y6cmpFCh4+jolwMRQPkdvBgFNhscGGCVyWXqEnYLFSN4iGDi6gsXHBeoI/bhCUgpZdKBV3xhyzwmd
	cMsFio/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2NQH-00000005SvI-0Wmw;
	Tue, 17 Mar 2026 05:56:57 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2NQC-00000005Stg-3eIs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 05:56:53 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 17 Mar
 2026 13:56:42 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Mar 2026 13:56:42 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Tue, 17 Mar 2026 13:56:42 +0800
Subject: [PATCH v2 1/2] mmc: dt-bindings: sdhci-of-aspeed: Add AST2700
 fallback compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260317-sdhci-v2-1-39b1f063061b@aspeedtech.com>
References: <20260317-sdhci-v2-0-39b1f063061b@aspeedtech.com>
In-Reply-To: <20260317-sdhci-v2-0-39b1f063061b@aspeedtech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773727002; l=2276;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=r1t1AZJ8z8H7pfOnc5U9FTp34IAllMI9HGRGoRCQodA=;
 b=0FGyjAaMtMOrLQQgrAvtSsvbidn/Q/mka34Kb4XpmawERthR0b1oiv51HX39qaNydpLidjVp3
 2U5Yx8sqaQ9DAY3cHhUeDpaQ+OXdjNNIXPBP6RYTPubsGHxz/uSBwi6
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_225652_912674_0F27B99B 
X-CRM114-Status: UNSURE (   8.37  )
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

Describe AST2700 as compatible with the existing AST2600 SD controller
and SDHCI bindings by requiring fallback compatibles in the device tree.

Also require `resets` on the AST2700 SD controller node.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v2:
- add missing blank line
- modify ast2700 compatible items const
---
 .../devicetree/bindings/mmc/aspeed,sdhci.yaml      | 39 +++++++++++++++++-----
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
index d24950ccea95..9c8e068964a1 100644
--- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
@@ -22,10 +22,14 @@ description: |+
 
 properties:
   compatible:
-    enum:
-      - aspeed,ast2400-sd-controller
-      - aspeed,ast2500-sd-controller
-      - aspeed,ast2600-sd-controller
+    oneOf:
+      - const: aspeed,ast2400-sd-controller
+      - const: aspeed,ast2500-sd-controller
+      - const: aspeed,ast2600-sd-controller
+      - items:
+          - const: aspeed,ast2700-sd-controller
+          - const: aspeed,ast2600-sd-controller
+
   reg:
     maxItems: 1
     description: Common configuration registers
@@ -38,6 +42,21 @@ properties:
     maxItems: 1
     description: The SD/SDIO controller clock gate
 
+  resets:
+    maxItems: 1
+
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
 patternProperties:
   "^sdhci@[0-9a-f]+$":
     type: object
@@ -46,10 +65,14 @@ patternProperties:
 
     properties:
       compatible:
-        enum:
-          - aspeed,ast2400-sdhci
-          - aspeed,ast2500-sdhci
-          - aspeed,ast2600-sdhci
+        oneOf:
+          - const: aspeed,ast2400-sdhci
+          - const: aspeed,ast2500-sdhci
+          - const: aspeed,ast2600-sdhci
+          - items:
+              - const: aspeed,ast2700-sdhci
+              - const: aspeed,ast2600-sdhci
+
       reg:
         maxItems: 1
         description: The SDHCI registers

-- 
2.34.1


