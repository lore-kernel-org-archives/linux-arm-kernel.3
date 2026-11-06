Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A23606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 01:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qz5T3ZNk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SESczS/q1YLMBZXT3cKcd36pJ1CvkoXdN2+do27f3Ww=; b=Qz5T3ZNk9VMus1iO0JwObBvqgF
	l5yVKHwZKBqwHe8BtNm2ywAXOKu/zfY/M7Fod5Cndt3W8687bQvLD3QI3gD/t/kGjbxXEVeOF6ugR
	VAse8Ysx/myZMmC9pUsOcpeH0X+3/2cvBHjTIiUyDu/kZ9dE7N9stBOAlBERQfu7ySx5ru4Ta+N21
	xa/osQAw6R20KDMu1ckJL6Ue3HeR/gLvDUH/exgWR9WWZYlV/JzqSlSJag1+95cVh2lGRgE/IG4wT
	oQQ+7GAcM+EUcXqS8ekpntG7x63tThzm91jNO4D2BSb9YQp+sDeXgF0zc3DGep6fH/h8P3O/i6Oem
	5rk/a0/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8rZ-0000000AzJy-26k6;
	Fri, 06 Nov 2026 01:35:29 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8rX-0000000AzGz-04BC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 01:35:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Is7lazxH+6VvWQ3k/s4CNP0urufAOFr6+DHtw+rkasIhY9KWvJzOoD3Ow7NnLnf4WI7v6AILRVGePIUkBP0NIL0igTc2Y96TDfjTM4UnKU9dE4faVVnfcLbp7tY7N5MQpnu/d3NZSrUOjiDwibIspIi2TSmdHuRHXhJM3JCYCQ8DEAfN2POBJbvCS5UVcaF9kPM85QmUt+Ut2eZUcFdsBvWI7LZJlUO0is3KZGzdQb65zbMNHbdTCoLWqiTZZlCMQwhcQ68IyEBSdKXLMTPlbeZTTbXci4wtcwhqsxm12wQNkfytl2mk2DbwyaC49KpJah3snRkgkPyPOAz1wMseaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SESczS/q1YLMBZXT3cKcd36pJ1CvkoXdN2+do27f3Ww=;
 b=ikWxtEgVyiu8D95ZNDN5VYilBnMqVf9Bngqwn/X/8cvy8xl+GkiBftKPMmAYCohPnEHdeBPiREC8KBGhxC8bT4Yqc4kDVpfk53xVmknXXbwXNUioSvp2QZm7xBBV3G4F0R7bxIBUHsfTh5Gz1CfG13TrQUAujxDZIo3tqapAwMzYAwW77gp7gDKzRse3eKw7MADNoLOAkd8q32pClRImFtBLHHZFdHv/kScDADWusbUzF3jaLR49M4iMOkLYomiqQF+8KEAqgHX6hLlQ7Y4cSAqvzfj7xhnwVnaa4R/WMDYItTKbjMmvg5f0opD7r+VpPB1GP0NwEkGw7uPs0vULug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS7PR01CA0131.jpnprd01.prod.outlook.com (2603:1096:604:24e::19)
 by KUXPR06MB9059.apcprd06.prod.outlook.com (2603:1096:d10:67::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 01:35:22 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:604:24e:cafe::97) by OS7PR01CA0131.outlook.office365.com
 (2603:1096:604:24e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:35:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:35:22 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2539E4102E68;
	Fri,  6 Nov 2026 09:35:21 +0800 (CST)
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
Subject: [PATCH v3 1/5] dt-bindings: soc: cix: Describe the Sky1 AUDSS DMA IRQ controller
Date: Fri,  6 Nov 2026 09:35:16 +0800
Message-ID: <20261106013520.1134450-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
References: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|KUXPR06MB9059:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9e0913fd-1a7c-4109-94e4-08df3ba63981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|7416014|261009223027099003|261028144727099003|261026121527099003|261102123227099003|261022105027099003|56012099006|261021123027099003|261026140227099003|261021121427099003|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8YdyaEJxD2VIWZZSr2N53w8a9pl709f/78oHacmllZ2LbqPXBcPfvz1Sa1RQNoDnQnQrPi+e2BqYTLAm2RucduSYhxLlYeJF7BRjFSs42oqNL16pXV9OC1c00LF6c/lENzrMx7LnqwmhvWDH2XtjbXhEwqJiIJKzGjgGAkyAd/E29g4GJSUdJQNwQkKdTaQx6VUTMErdlr2GEtteCdul3AAWvs08HNZ9JP3+h/ulXaOtcozrio7qjiqCLYP7Cq7z63KxaB/fykqrnQPmm46iDj+9msMbkdSBQ32aXfQkh+VR3uvCvqajpfvjpsLvCyPlsOgEgS7g9a0HGsGvniVwCzq+pKBGzzw6eaoI+i3JFXaeODlvyzeubSbYcFqxAGeA6ICsT02w+lZmJ9wXuHfhUibKakcwcTrgiy00zC5Zl57gO78xz/GNbTTJk19s4FvLqQ9h6CUsPsPFgK8bACIjgCxcPlzEzz+5i1h2rkbXRv7t2A3mxPKqv8/+Bbll+iSh6wLlbJZMWyHuc3BUyaHa7Z091c7f19WQXkwogd4XMw4vZIdfPLatU+A9qFAlqYfhR6jp2aKgYRCSQ7bxgH7yZcxaavwRC85Ct8w1k3b+St0LirIhahRPIlu6hpTU4Uxin/AImzZmlsUHiKnGAJo2PbVFhZqcCOysTya7BMBHOXixIsShkFqLLAFk8VdQ+d8mhQYcN+CM3cc9nnJDPB4Eeg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(7416014)(261009223027099003)(261028144727099003)(261026121527099003)(261102123227099003)(261022105027099003)(56012099006)(261021123027099003)(261026140227099003)(261021121427099003)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sLkoCad3blkLvzM+0TL1BLK5tDet9RqRXRv0AWZ3Pylf1vgL/16ZoCkHGMRHPJjdIGDUUCXhSxFqavGDk3Qu2WkKrsvQFJ9Jdg/7jhaianwtAH0/73CDOFMFRI3N7CvQ5/UvwQ0a/e8CBNK5ZXjdLn6QnDnsF4AtGaL2lrMNZ0dlEfap4o4Q8FtVoawBQ+G4NOM8Ftrn1FthWaAa1dKE7OmQhnDB+0W5IGfRMwURrSAkmqWS8MH3KxoZu0e+JaboQgWeLpKcTlwFl9eWbsf5DbeANRlhzjihrNy5QuJYVhkmy/EV61mTihSHtVjmx5uTvwrCqOLW0f1I8dXhEHZgWLE/Onsmr1nO4QCPOAL9KFtippxtRDmdjpTgOHwbCghqoK3IrjvjAf7hrpQ1D3pi7QBP+4EAcHGQza3qw+tk0i+zzafM1RdNiyZzCJTYDHR0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:35:22.3026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0913fd-1a7c-4109-94e4-08df3ba63981
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB9059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_173527_064734_06BF8D13 
X-CRM114-Status: GOOD (  12.11  )
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


