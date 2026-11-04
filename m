Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D1C606EE98
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JaG4Ag7E;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=A8hzBcog
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5kPNcEfnqjNQ1ORpUXeWGUi7Yiwvvk8APLxu9PKpCXk=; b=JaG4Ag7E1fkNaX
	AQjtMeO3AOqjxtyE5mej+Pnz6vsvuwnv8xV0BIfiVGBfnIolZWym3rt2QyEwPGn0MxQFtEX2vZ295
	vmQ15hB6CNLB5qlmNuYDx4hRx8GqYvLPLHuy/DPQuWqZdtrrXudPTzn3ez9Gm154PztEiRpaRaQJZ
	ZL6XSr2glG+kUNgIHLUDwglw0gNYso9UjupgIDFmBEOVQaBH+iS0Oo5GDrlZWs1V8EfEyW7jGTjsb
	0iUKQpqZSI6lX3ZyBI5/GdKPH4Cs+gaxpZmCemASbEUfOnw54er8Eq//4J70e8y3W8CTfh93r9cm/
	p+zf9r5vlx8z1IR0HuZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcms-00000005lDi-17KE;
	Wed, 04 Nov 2026 15:20:30 +0000
Received: from mail-norwayeastazon11013016.outbound.protection.outlook.com ([40.107.159.16] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcmp-00000005lBs-2HWc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:20:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPOy9Hn/Mt+ijMW3BigSt9vjWW4L9wN+1SSS4YOPVYe2eXAzIOL5LtR7/IxDMSqNf1//aBqg0afQrjDmECIwyGB3O3xfc99bykE8JC/Zx5nQ6N416QZ4ALkcDeOUZl5LILjScy613E8gktYwM7Whp+HTRkLELxYcMDhOTYO2B6vgKbysi6ShUfEXOob4KaJnpj+Wc4XRhPN07pB9VsWq9Il2Cd9Y2IrLXalkX5vCkF0fw/FP3JvVaYFl7lZtOQ2V5NqGjHc5jpwAJxMynQ893IRbYBpFReT2e2T0mKBsdoj5ewtfIe9mgF8DxNtdiJnc2yTn4dIR/4xiNs1H3WbhCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kPNcEfnqjNQ1ORpUXeWGUi7Yiwvvk8APLxu9PKpCXk=;
 b=AMyXbxBcT8CzmGwAICnk9r5tQvyatl9ctGJJkmsNxS/obUot1AeaYXdCBFA7xCI4xq+gPitbl7nSsLskB80m+yje5RLyKPPi4S79NVyUdKtkWpDN7H5lggFuJFgyQ2wrx/QmJ3+7w9NEr5vnMFEXG9+gVDJxzX73rFRPtwJ11b25KAwgklZA8/egt+c50poXD8xqDD+M4YfEKUxWQrwuGmVUm1xRzNlEncU+AgJSQi43yqUhex19GMq92hYmd6zdEcr5jQYFkpQ0eFiSEdela/w0yU4v0kX+W+CXAg8hcvZb07yPDziYY23rvJsgqyqzGDmfVvDttyfRM/0tRKKk7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kPNcEfnqjNQ1ORpUXeWGUi7Yiwvvk8APLxu9PKpCXk=;
 b=A8hzBcogJD9WnG+MKvnC8qG1AJ4jvJSVVgLJ8/b8Pi0Plz3jiClBXwQdMVHCW0nVpEebMYWKuZqdfrhccMLQSv5y9QLEaU4BmTZm/ob2puOslOlZVgx/0Mb538bJb9k9J9FchKbLkwWSsW8uu8l2mQbcZ7LLKefapORV/oYwsc1V9J95ynljJ9XH8PvAA/DVOkD3gh9ZEgsYLzRoO7XDknKQPY1OmrVlvYasuL46wOF2mmBzX8G0kuOfmhuVC6b8LSP+8LonHhjeHIIBaBerCYjnQve95UYnlLq3mh4m3kXvY8xR/xOzZlmvsTWQ1WyyBIdQCq8xoDkKnrzgwzLpow==
Received: from PA7P264CA0501.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3da::21)
 by VI1PR10MB3568.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 15:20:20 +0000
Received: from AM7PEPF00000051.EURPRD83.prod.outlook.com
 (2603:10a6:102:3da:cafe::87) by PA7P264CA0501.outlook.office365.com
 (2603:10a6:102:3da::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 15:20:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM7PEPF00000051.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.0 via Frontend Transport; Wed, 4 Nov 2026 15:20:20 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 16:20:48 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 16:20:19 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 4 Nov 2026 16:20:08 +0100
Subject: [PATCH v4 1/3] dt-bindings: nvmem: add STM32MPX TAMP backup
 registers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261104-upstream_nvram_reworked-v4-1-144024496a44@foss.st.com>
References: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
In-Reply-To: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PEPF00000051:EE_|VI1PR10MB3568:EE_
X-MS-Office365-Filtering-Correlation-Id: 86eaaa30-df37-4eb8-9d76-08df3a872396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|56012099006|261021121427099003|261021135927099003|261009223027099003|261026121527099003|261102123227099003|261022105027099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: lko7R66b7jlEzu3Q+gol34tWxhhYUtKzDLw7zW7bC/r8yGyJFcqvdF8qZ29xugHjiVWgsAiEZD59Qd6QZMIs99KTGVW+fP1y+7F6fl0h5nz3GMQKV4tRw8O2vyqJmWIRTI8fL7oRlK3uwDs1vGdFDR6uF31fJT7O73UzFs5tFuWGqpEbs0G8ndxJJ2tM1BFz9mCQ2ohH/Vd23PUVygscPFFgVqds0YIhcisiGXataMjVE6EyJDfDiKrbrDUoAeXjY1nrRLNNxILoYy2LB4yOVsuD9ep0nu/wQ/Cl+so79Xw72kNxZq/8luFMnF1bHK/WBW7ffKAW6kqSWrsOZ1ji0HX1HixIDle1j62Ck/MmvIcU1kOznWcLbHumvsXAUyZXBJWW/v0Jmrunj8hVWXmdshPhpezeBTpUOZzeQcfDW97to6qGU9yuOOfMcDMCK7vNIxgYyk+TYWR+FkBHWVQe/kcS4acWhR6XxORwLGOUU5uOn2xKEpF1Jk6sYsT3tI1bUIWiQTq/bbqHsMJqlPZRXmc7KzBgSrWpv4kF0bbK0ava1XoP+QLzVhKKzz5dkdbbH60uYV1qhUjqSAIaAFnluZ5zT8Zar2ycLZtDDKmlDX4tjmIPPFyUvCZPVkQ/Omu3tNarMBhvU/BMXVV2AeStKg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021121427099003)(261021135927099003)(261009223027099003)(261026121527099003)(261102123227099003)(261022105027099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 67bomP0EZumwC6FKXADHqGV+B57K5/IVCcYmXkSQmQBnwNUB1jM7CSj0XUYIQjc6y4Q6gn5PWQLNZpoGDE8Q65uFTDm/NGeQUYbPONGoakFzac6dMiHiYmVYx5KeO1wMmE7fveEwP4cItqxXEnI1b6KnR+xwhe6xgMWzbME7hZGLEly1a+2WCGOMllOmZ8+lbFB8kOSn8lW349u4nHuX4c6sKMZ61fX6ZjpPAmGLisRxv6/DccH4hrh40yKdfBbrCB/JiuqoL+ql+pequBHgdG0mEnLOKQc2FCdwdSxpjwOSa+f1P0FQlLhSD837V+Ez3AXIkBvE+1nNkHMyUzn7Y3SCOrma7ysYuotCViEK5W9fmIS18eKxnlJGhQsX01xgXlUJQeRANUw20wkjxDlMXDFndkabryMhALUnGqq/IfLL2twd5q0WaEczxXt3Ufa7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 15:20:20.1167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86eaaa30-df37-4eb8-9d76-08df3a872396
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM7PEPF00000051.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3568
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_072027_828727_549762B1 
X-CRM114-Status: GOOD (  13.67  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Simeon Marijon <simeon.marijon@foss.st.com>

Adds the binding documentation for TAMP backup registers.
The backup registers is a part of the TAMP device of STM32 MPU.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 .../bindings/nvmem/st,stm32-tamp-nvram.yaml        | 57 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 64 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
new file mode 100644
index 000000000000..4af3b88db566
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/st,stm32-tamp-nvram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 backup registers as NVMEM
+
+description: |
+  This represents STM32 backup registers area presented as nvmem cells.
+  This contains various information (e.g. boot mode passed to bootloaders).
+
+maintainers:
+  - Simeon Marijon <simeon.marijon@foss.st.com>
+  - Patrice Chotard <patrice.chotard@foss.st.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - st,stm32mp15-tamp-nvram
+      - st,stm32mp25-tamp-nvram
+
+  reg:
+    description:
+      TAMP Registers bank location and size.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nvram: nvram@5c00a100 {
+      reg = <0x5c00a100 0x80>;
+      compatible = "st,stm32mp15-tamp-nvram";
+
+      nvmem-layout {
+        compatible = "fixed-layout";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        /* Data cells */
+        wakeup_sec: tamp-bkp@0 {
+            reg = <0x0 0x4>;
+        };
+        boot_mode: tamp-bkp@50 {
+            /*see boot mode selection feature*/
+            reg = <0x50 0x4>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..13f5c94b0bf8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26918,6 +26918,13 @@ F:	Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst
 F:	Documentation/devicetree/bindings/dma/stm32/
 F:	drivers/dma/stm32/
 
+STM32 TAMP DRIVERS
+M:	Simeon Marijon <simeon.marijon@foss.st.com>
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
+L:	linux-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
+
 STM32 TIMER/LPTIMER DRIVERS
 M:	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
 S:	Maintained

-- 
2.43.0


