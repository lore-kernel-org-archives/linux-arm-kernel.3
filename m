Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06E6CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 02:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49v5GLIwWBsFll/wGf1Zus8BTJJ8as8JwMwd7qIk3hU=; b=yUZSyS2lEAahU/obHncLk2cECZ
	U4OBHTsCFpYeuOmO9k8EwVnlVpQgrvpCl3n5u7qPXqqkFJBkVW5UkM4Lxi/ZeiS3V1e1VlUIirgPT
	/8bECFYfJRCcK2HN9uvR5TRxnJ0gBK1MOR3f1HVJCX9dTA8ej/aoTfuq4vHoaS6Nq2btit2ilclr4
	SytmAnd+wd/xOnQCAMMrtvoJvKZXVi38sIR2v4rR4Mowd2xBSbyD3UoL7wT0qG8qt8CyzeIRMzH5v
	pMSaRCy1IF7m05cinbf8LCz2oTcGnImDNjyynrVjR4UNAcZ4KHxZmwtSxQSfWNbz9M0OdKoVwCLCL
	8qqTKdZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usXlZ-00000008o9Z-2A1W;
	Sun, 31 Aug 2025 02:26:01 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usXao-00000008kya-1cQj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 02:14:55 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 31 Aug
 2025 10:14:39 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 31 Aug 2025 10:14:39 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Eddie James <eajames@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Lee Jones <lee@kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 3/4] dt-bindings: interrupt-controller: aspeed: Add AST2700 SCU IC compatibles
Date: Sun, 31 Aug 2025 10:14:37 +0800
Message-ID: <20250831021438.976893-4-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250831021438.976893-1-ryan_chen@aspeedtech.com>
References: <20250831021438.976893-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_191454_427906_9B5C10BA 
X-CRM114-Status: GOOD (  10.77  )
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

Add compatible strings for the four SCU interrupt controller instances
on the AST2700 SoC (scu-ic0 to 3), following the multi-instance model used
on AST2600.

Also define interrupt indices in the binding header.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../aspeed,ast2500-scu-ic.yaml                     |  6 +++++-
 .../interrupt-controller/aspeed-scu-ic.h           | 14 ++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2500-scu-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2500-scu-ic.yaml
index d5287a2bf866..d998a9d69b91 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2500-scu-ic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2500-scu-ic.yaml
@@ -5,7 +5,7 @@
 $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2500-scu-ic.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Aspeed AST25XX and AST26XX SCU Interrupt Controller
+title: Aspeed AST25XX, AST26XX, AST27XX SCU Interrupt Controller
 
 maintainers:
   - Eddie James <eajames@linux.ibm.com>
@@ -16,6 +16,10 @@ properties:
       - aspeed,ast2500-scu-ic
       - aspeed,ast2600-scu-ic0
       - aspeed,ast2600-scu-ic1
+      - aspeed,ast2700-scu-ic0
+      - aspeed,ast2700-scu-ic1
+      - aspeed,ast2700-scu-ic2
+      - aspeed,ast2700-scu-ic3
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/interrupt-controller/aspeed-scu-ic.h b/include/dt-bindings/interrupt-controller/aspeed-scu-ic.h
index f315d5a7f5ee..7dd04424afcc 100644
--- a/include/dt-bindings/interrupt-controller/aspeed-scu-ic.h
+++ b/include/dt-bindings/interrupt-controller/aspeed-scu-ic.h
@@ -20,4 +20,18 @@
 #define ASPEED_AST2600_SCU_IC1_LPC_RESET_LO_TO_HI	0
 #define ASPEED_AST2600_SCU_IC1_LPC_RESET_HI_TO_LO	1
 
+#define ASPEED_AST2700_SCU_IC0_PCIE_PERST_LO_TO_HI	3
+#define ASPEED_AST2700_SCU_IC0_PCIE_PERST_HI_TO_LO	2
+
+#define ASPEED_AST2700_SCU_IC1_PCIE_RCRST_LO_TO_HI	3
+#define ASPEED_AST2700_SCU_IC1_PCIE_RCRST_HI_TO_LO	2
+
+#define ASPEED_AST2700_SCU_IC2_PCIE_PERST_LO_TO_HI	3
+#define ASPEED_AST2700_SCU_IC2_PCIE_PERST_HI_TO_LO	2
+#define ASPEED_AST2700_SCU_IC2_LPC_RESET_LO_TO_HI	1
+#define ASPEED_AST2700_SCU_IC2_LPC_RESET_HI_TO_LO	0
+
+#define ASPEED_AST2700_SCU_IC3_LPC_RESET_LO_TO_HI	1
+#define ASPEED_AST2700_SCU_IC3_LPC_RESET_HI_TO_LO	0
+
 #endif /* _DT_BINDINGS_INTERRUPT_CONTROLLER_ASPEED_SCU_IC_H_ */
-- 
2.34.1


