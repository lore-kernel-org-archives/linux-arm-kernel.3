Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CCF106FD7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 05:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2AZ7nJTxh85jyBMjQZ+6yTZ/5s2Z8wG6IvqnF83U6I=; b=RFJ/zMdjmGt0IkPdGC2jHoaARr
	gLeGtBUbvWx7yMEadX21eZmPSnZXWA8AWEUoDZ47MYD1WZYaU0NJgRW/HN96p2EqSkh1aUk9lxcMc
	MVVsphLG3EWjuFmaW+jkWJIUR8K8BmyzV5HK0EH8zUa7kYrHaMHQH9SemdCtiHe0kyWFCsT/ZNUIg
	ldT+QCry9DvYaWbbze+f0j2t/CzjEwXFA23Z1aOkcvD9LLb2uHZ6ytoLdIL+GNeWCRlMRx08tki9G
	DyvgeALN9TwobnXb/iwWJPrlwU/3kTRcOjOqfFj31zl1PRtvUtQMnqEvGaUu62Bz4QsNvyx2M3lDb
	NtUBe1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0v4I-0000000GeHc-1ZRh;
	Fri, 13 Mar 2026 05:28:14 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0v4E-0000000GeEs-1XST
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 05:28:11 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Mar
 2026 13:27:57 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 13:27:57 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Fri, 13 Mar 2026 13:27:56 +0800
Subject: [PATCH 1/2] dt-bindings: mmc: sdhci-of-aspeed : Add ast2700
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260313-sdhci-v1-1-91cea19c8a67@aspeedtech.com>
References: <20260313-sdhci-v1-0-91cea19c8a67@aspeedtech.com>
In-Reply-To: <20260313-sdhci-v1-0-91cea19c8a67@aspeedtech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773379677; l=1588;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=q02tFnoGppa7W4iZi/yxC4p7ULpWPHKGK+xBBuI6DQI=;
 b=tPuwiH/wlFeRK57OmtmPuPTeGLy5Gna1WX3SgFWWsijMl4zAe9YFqsG3IVSTnVJRi+UVewyzg
 4JPKEb8JmZPDM1xfahIUGMKwoFtm/bp1Ces22FDee1T4qdrpwWVR3Iz
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222810_409132_FEC100F2 
X-CRM114-Status: UNSURE (   7.62  )
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

Add the "aspeed,ast2700-sd-controller" compatible. The ast2700 sdhci
controller requires an reset, so make the "resets" property mandatory
for this compatible to reflect the hardware requirement.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
index d24950ccea95..a2ff9a94db13 100644
--- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
@@ -26,6 +26,7 @@ properties:
       - aspeed,ast2400-sd-controller
       - aspeed,ast2500-sd-controller
       - aspeed,ast2600-sd-controller
+      - aspeed,ast2700-sd-controller
   reg:
     maxItems: 1
     description: Common configuration registers
@@ -37,6 +38,20 @@ properties:
   clocks:
     maxItems: 1
     description: The SD/SDIO controller clock gate
+  resets:
+    maxItems: 1
+if:
+  properties:
+    compatible:
+      contains:
+        const: aspeed,ast2700-sd-controller
+then:
+  required:
+    - resets
+
+else:
+  properties:
+    resets: false
 
 patternProperties:
   "^sdhci@[0-9a-f]+$":
@@ -50,6 +65,7 @@ patternProperties:
           - aspeed,ast2400-sdhci
           - aspeed,ast2500-sdhci
           - aspeed,ast2600-sdhci
+          - aspeed,ast2700-sdhci
       reg:
         maxItems: 1
         description: The SDHCI registers

-- 
2.34.1


