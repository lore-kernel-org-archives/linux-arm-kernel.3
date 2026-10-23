Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF25606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GKLgMxYV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x3GxfN3mjsJ1t20onZkL5dLoaq+tcYQ175ViAxmLkJA=; b=GKLgMxYV8zl3xXPcstznvWvu59
	US8HejRYnCWeBHAdU/qmvhLTPslYhS7CJfE75biDlknQW1nG+Bm3eukc0RQQWRmeP2Ib95M5fMNGs
	oo8wsLXzdpOrqBXgNZ4a6E21x4LtFs8wI72rjRtrwAUB5Zhrcvkwz62GGVkVMNjEiJM//IB+KsI+e
	x3DlaQeu3X3YIds0Y5L36Kcv4prjEMW9oPEyKdO+dMqlkcWRZ+/t4gk5P+occV3la0XHN0WWwbjEW
	Cm5ArMMOHvUz7OlDQ9EC8JXhDboqBoW5mlWPQB3LGUymmqU4G1l7dTUmZLc5rRGRZDdH2YbkMa5AQ
	AHktbkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBbz-0000000G2bd-3fYT;
	Fri, 23 Oct 2026 09:30:55 +0000
Received: from mail-japanwestazon11022131.outbound.protection.outlook.com ([40.107.75.131] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBbv-0000000G2Xb-1ykZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:30:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkFlKWQUo+AydTQ3zS53Ru2aC07Q1tCyF6yny1FsEj7Tnk6/L1hIijm43xjmdoT+T25yjbiwR335o69Y7tPRQ1tei3O73uigHrfTe1f2BiIvys7PzqEHQydbTbBRtki6gCeK7U4r3/Pw3VLK6WvzGugsTpMLmH7DAViawvQfMGxjNbY2dnsgHHC50YRAK/VD4johYdoq7fWJC4OG4rxwEMmR0zKOLxBLjz92fliJRNqcSsAOkjGf+fOAaNWbVOI4h8XxjRQmSCkksDelZk8TsvAZQXwk2HRfzvP9QLuF1v+1ai7U3gTnoCLKxmHRpXUocHG7ZMM5mYoeV7xBMfhRoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3GxfN3mjsJ1t20onZkL5dLoaq+tcYQ175ViAxmLkJA=;
 b=H34zIYvkCUVdOjnARrsUQTj35wDXbUG3qH6WxJS2Cf1pcOTzyjn1ZHPDNUVSIMDvFlAv6QmTMGTZ7eZ0avHgPDYxDOC4Or79vwBKD97zaqFbgBxyTtZRuwDKi38QZRpoEjw/7MBX3EAFMMPjwED8X6c20m68O2quso+NIp+Y36z6vYlGc9Z1K560JFOA5YHhLRZcCQ9cwteqho7siDTOvS6lzA+CtAjVzTYWGAJl4Hd9nZ8Q12+s4QmuAvEu6AVIV4GKRP2y4eRNwy8pVq4jDtlaWg6pssdZ95xkwsNj1SSzgRYsmhG+gNsITwQ3THf6dJJLI/1j3u2mmGCsFIF49Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0137.apcprd02.prod.outlook.com (2603:1096:4:188::17)
 by KL1PR0601MB5598.apcprd06.prod.outlook.com (2603:1096:820:9a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.3; Fri, 23 Oct
 2026 09:30:47 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:188:cafe::37) by SG2PR02CA0137.outlook.office365.com
 (2603:1096:4:188::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.18 via Frontend Transport; Fri,
 23 Oct 2026 09:30:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:30:47 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 243F14102B47;
	Fri, 23 Oct 2026 17:30:46 +0800 (CST)
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
Subject: [PATCH v1 1/5] dt-bindings: soc: cix: Describe the Sky1 AUDSS DMA IRQ controller
Date: Fri, 23 Oct 2026 17:30:41 +0800
Message-ID: <20261023093045.3248630-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
References: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|KL1PR0601MB5598:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4f9272dc-3249-476b-29f7-08df30e851d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|23010399003|7416014|36860700016|1800799024|261022105027099003|56012099006|261021123027099003|261021121427099003|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: VQc3LTDzNotH2o6qvST/vHaLZ/8wGkTIPzXJaWdGe07zIiOC4mMgIEtRiM47kNIwkhr/VdR0EZBGASzkjFNrXyRAtSAdR0R1oDXBItWgifqlDRwBI5eDk8LGTfON6fpP2D1u4AxGxnXAc42cAcrfaHWhGXlRyV5O9w7XjAQgwwjDhtdZ7gBGGQbmekjnQdQtGcXYJlqxfxrFRxubKaprOh8EwbBamJx2MzSQ9n4Mr1kVzb1ULMhgmAV8VInDNwEFchugpGyRJwxgzL0NXmm627KPZHIuoVdGd+8XWwIBOe1JeXs5Y+pO3P/0XfaAUDIlXzSY9Ytpq7z/SaK+6oXhPoNQjobLKjLlIcAM14X8WQWl1DavSkjDxQlumM2gDm/bX56CXaf116btNI59cfIvoMHdTueHLi9vou65wsjFx55OsPU5Al8dCEyhhSHFZ/UyQtXFQmeJb2FN2Pubt14ISHnyF7QTte5P1CsaPw6SegdRTgQxxIZFNVpQQCtA1z6jcSuew0ya7AnbGPR5a+ZXjqMr92T5fPwVfmt1u61ZDy+Xi+Z5SpWZJEVxpfKrK6kNPHF0U1tjWDdvmncO+qR4/Tm33p83pCbO5dqFbZEP0/5O3Ae48uASP1mUMpRpFWsEtnxA9JfzFJ76TXdZoFkzvefWpF7h3n/GrD+mVrZ1bWzAZ7M5d2s+YG2rUKYlRrGN495DFnOyZ5huEPsZhY/KvA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(7416014)(36860700016)(1800799024)(261022105027099003)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CnSEEYRK5lc9yujFMILv7JFMHmNQj2ZcuIKmTLtBziUS2Fp82cE2NXnDOg6gcijeirmpZafRYxmcgfTp6fLMs9V0gwTRpu9MlZ+hFCKuh0XNGuviXpIeKTAmwcjpN4CgUTe9+gabvcWlAfU5jqQk5U2XndyGi/rVGekQ3MXlshTmd1/0zIBPICr2NOZJvhF3LO11acU0tikQGmhJRbfx4eKzIIVZtAC/OQvdPVoq9eaqSVEIK7547qCKTllxBSdvUlZKtYr3qYS3c/ssrLI1Th2gp8Yzbj2j9XUbA3lDflB6zjlLAAPuVrEsg/Pw7ZdTDIbVir1LsJJVMDKKG2v4Anbca8FHa54GVncFEn+FVTabL+h0oB95LnhJN0rcqP3y5C5MeMzFk9Nc3GAvHrU3MSXKWr1qDE4/sQ1oOSYuBzA3+AnTKSRoo+1BDfoE4g/q
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:47.1243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9272dc-3249-476b-29f7-08df30e851d1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5598
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_023051_521298_ECB2BB5F 
X-CRM114-Status: GOOD (  11.96  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
index 50dd0593e1d9..a296b59516f2 100644
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
@@ -75,18 +93,40 @@ required:
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
+    gic: interrupt-controller {
+        #address-cells = <2>;
+        #interrupt-cells = <4>;
+        interrupt-controller;
+    };
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
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>;
         power-domains = <&smc_devpd 0>;
+        #reset-cells = <1>;
         resets = <&s5_syscon 31>;
     };
-- 
2.54.0


