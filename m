Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA28606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nN6+V98/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SESczS/q1YLMBZXT3cKcd36pJ1CvkoXdN2+do27f3Ww=; b=nN6+V98/8RBdf8/+Do+b2k2/Fl
	6xWVGB+e31J4Q5och2qKqRFCliso3ENriGLoQJiPU/cFSyO45cdK1hrFc6KL1zYqfz/KGDg3fHRoH
	U6SB0R8A7LJSmHgIJByNNnRuUuBa66M2eKyeOU6SphkVgaTmGIUy1XjyY+TWK2834uOVAA1mxKrcM
	JSLpKkTC2tFw8cuUzhO1lKALYVFxEKQWvnWayTz/+ij6tbS+KizNeDfxqIw+phWWFcY1J63p1JPLR
	nbeKHSTBbfAPXc5vFyMykWrod5y2IC21/wgAiwh7Tw5PJc1iA3daMVvHxQTLUGcZjdT7s6unhxufu
	KntaPqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRn-00000005NoU-354z;
	Wed, 04 Nov 2026 12:50:35 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRf-00000005Nh1-0Ad3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:50:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mm1IkyH4vsSAzvD2XMkzprEXIPC1ciaQXhV0o562l1mOSNmuJbs2J2AJeh0bpcRKYrwNo8GhX+riiSLygxqj2NBztIXKQ+JEdO2XiHyjOFrOLMyCREJuvjLyZ0dv3EUikW3oElPrhWuOPlqh8+frRLWrX60MO8NYqePQwJXM+gRtzCcH2EuhFgVYHtHnHJQ8d6LxR7SXJA2YT6KVHXwQle1frnMwgEdJaFeb5yfzCLoTqdV8U9MVhtoey4lUOsH0+dPDxSm4sjw0iXWNdYMGqm5zqaJ2giVdw0jDF4Yl957iUu0zQanNwd7IhXzsni4IUa8n6KezHL4E+f8qiTDC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SESczS/q1YLMBZXT3cKcd36pJ1CvkoXdN2+do27f3Ww=;
 b=Y8X1k5l4n6IaCQyBugmEGZiaPafa3/SCitxbjOIkA8GsDjJA6ijx4edWbJht3J98ojwnA5O3+AOda4sZ7FHkg2Vmty9GqDi28FGdbQbAGOHy5ia/A1YNkygo5W/K6++DMIeO4v9znYCSSpuHdmhr7sZ+XUfzeBZM3IOz3A3CxTeXs6HySwFjRcB60KqRUaPDzop7mW7TSV8Isb/BnUq3RvTL9F00DfvnCau88/vVGo8dyHZ81/IBhLEbuMJ5U0yx5cqawn80T83bfiBmDyyLmZEWWfUyr3UXZtRHZhdbq8SJUx/t328x5mNvSqWBUqITdgFsyynq0b/bq56sZH9Cgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0010.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::13) by
 TY1PPF4A2CDB296.apcprd06.prod.outlook.com (2603:1096:408::910) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.9; Wed, 4 Nov 2026 12:50:20 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:140:cafe::1c) by SI2P153CA0010.outlook.office365.com
 (2603:1096:4:140::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Wed, 4
 Nov 2026 12:50:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:50:20 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 872BF40920F7;
	Wed,  4 Nov 2026 20:44:38 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com
Subject: [PATCH v2 1/5] dt-bindings: soc: cix: Describe the Sky1 AUDSS DMA IRQ controller
Date: Wed,  4 Nov 2026 20:44:33 +0800
Message-ID: <20261104124437.296753-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104124437.296753-1-Jelly.Jia@cixtech.com>
References: <20261104124437.296753-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|TY1PPF4A2CDB296:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7a7c5198-9c1d-42a4-4940-08df3a722f3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|82310400026|36860700016|56012099006|261021121427099003|261021123027099003|261009223027099003|261026140227099003|261102123227099003|261022105027099003|261026121527099003|261028144727099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: DekKW72KU2SYPJngJK7BT+FCZs8PCAzz+jhbC1VyXdPZZzAwQLNrUYPk5jGZuXd+0w8o8Q0eJw3kf38/4vsp97gsMwFrrUAuRuXZfOw6Ev7Wr2uizloTaERnGoC4llah3ILNk9lH9sDisOqVoX8KK1bhtYhg2aOUeLQEQqgopQaK3jQ3YuXT9vCGdUZlneQkPdLVHX3ZcttIXTatiamcdf+PsKgva+pDWyfHwNAAISxbRxhSUDClghlmLOzZ5PrJdA8Lsjh836z3R3uyElH8i7S5JwDmMAht+Psq0ld/ZsC08jXO12rz8pCFfiOjUOlMQOiZEjWIjd6edKw7T2/PMI/qL0isuPgyKr9ixP/8Qc1LygKbm1gxpqjtebIxZa2rjikgfhD/4KtgWrwQFeGY73u1cN+xIoLQ3knZD51C5Q59GpIRFREWHJiA8yf+tBUAUnZeHRFlmQokr5nubHU683I06Dwau4rqEljblVYoJOVNkHWu152VFyWMONKZHLvn45atT2lhbZtz48OGMtuE+DyBDWg+0dlKx2Nk3eCv1vXNjBC6L9flL8hIc/fpL+ofq1U2cUUlqEAcGqz/JLRoxfa//lsge1PpcauaFn2eAplT93xsdV0nBq/TXKg8FlO0k3hSY4lYWe7leHkXSIu7PeKtv7TxGea5Zun8vi5RiPLLs2SQcq1uErGSi+n+XdEj9G40wCqOsGP2ubGJe6BfMA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261026140227099003)(261102123227099003)(261022105027099003)(261026121527099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lAqKGEuoRhhmSrBONapvi1VFQFUgRzokd8hCK6KL/mId09ojcqGmN9TbkHt+SCP0rfhMhVgxnUzK1M/ADXnLfswIbNcvw/yr+s/4b0Bf/wdBf9wqj0XnGMQlj5BMIb8LV1JyYikEg/wE1GEfMjb1Yqjr1A0L6fynYKDGGdWcN40+0tYTyWd3UCKR7gz2QB2FlUka7u7LJZ06kKXXm8O4FHrnsnBLQoJyS4syCH/61sqesNlSwhomJ6fIrwUMWt0siaonraTx5wMgttNUCeRlr9+lw0y5qEgveXb8d+EDdXSywPPhRwNkvC9I8JIsvD4R7zHAHq7hD8G5jqQDpD+2lE165ghW47/0HGQx/YJSKRYcD0qCaOFjEe2rrQSSHtKocKwe44XSVP/DA5pUn8v1agXokRcysQpcEva8ZNnTWDzCuTmzHRnjz+72CFcDZC6M
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:50:20.1380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7c5198-9c1d-42a4-4940-08df3a722f3d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF4A2CDB296
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_045027_083070_AAFF3EBE 
X-CRM114-Status: GOOD (  13.51  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The AUDSS CRU contains a separate AP interrupt gate for each of the eight
DMA-350 channels. The enabled inputs are combined onto one GIC interrupt.
These gates are part of the CRU register block, not the DMA controller.

Describe the CRU as an interrupt-controller in addition to its clock and
reset functions. A child interrupt specifier contains the DMA channel
index, matching the corresponding gate bit; the parent interrupt is the
combined GIC line.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
index 50dd0593e1d9..aa0c557abec0 100644
--- a/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
+++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
@@ -28,6 +28,12 @@ description: |
   The SoC syscon NoC (or bus) reset is described via resets. The audio
   subsystem power domain is described via power-domains.
 
+  The same register block contains the eight DMA-350 channel interrupt
+  gates at offset 0x54. When the node is an interrupt-controller, the
+  cell is the DMA channel index (0 through 7). The corresponding gate
+  bit is unmasked while that interrupt is requested, and the eight
+  inputs are combined onto the parent GIC interrupt.
+
 properties:
   compatible:
     const: cix,sky1-audss-cru
@@ -45,6 +51,18 @@ properties:
     description:
       Reset indices are defined in include/dt-bindings/reset/cix,sky1-audss-cru.h.
 
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description:
+      The cell is the DMA-350 channel index, 0 through 7.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Combined DMA-350 channel interrupt after the CRU gates.
+
   clocks:
     items:
       - description: I2S parent clock for sampling rates multiple of 8kHz.
@@ -75,18 +93,33 @@ required:
   - power-domains
   - resets
 
+allOf:
+  - if:
+      required:
+        - interrupt-controller
+    then:
+      required:
+        - '#interrupt-cells'
+        - interrupts
+
 additionalProperties: false
 
 examples:
   - |
-    audss_cru: clock-controller@7110000 {
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    clock-controller@7110000 {
         compatible = "cix,sky1-audss-cru";
         reg = <0x7110000 0x10000>;
         #clock-cells = <1>;
-        #reset-cells = <1>;
         clocks = <&scmi_clk 76>, <&scmi_clk 78>,
                  <&scmi_clk 70>, <&scmi_clk 71>;
         clock-names = "x8k", "x11k", "sys", "48m";
+        #interrupt-cells = <1>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>;
         power-domains = <&smc_devpd 0>;
+        #reset-cells = <1>;
         resets = <&s5_syscon 31>;
     };
-- 
2.54.0


