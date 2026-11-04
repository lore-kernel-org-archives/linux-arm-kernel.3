Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA56606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NXYi5eSh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pYCkqby7ZYFlZsTaRBTg/gKKYgtsIri+QbxQt94r4ig=; b=NXYi5eShRrURLPQ9E5o7oZ7cJX
	3VsDg57r4GwTkJfQCW7UyUBSJSXQF9UKNREVZTW6iYHsCtOpkGvVsNn/GitRHQBQlp0vfpcVrhMQN
	7mKK4UZI7lkphxy/E1YE6SzCPMNM2ecA2bORj71FapwQwdNu925oSd0qnmAiIYqtpvU+AiEQseIgq
	+sR1NFdiZUQo0POSzs8FTPBgT3Zr0fvPGR06hqLEzAKeisGvns+dfOOXeqLgCpFH/0VU4fea4WKk6
	AA8NWiL6wbvKPOiOFfy6EZ1grY6rXMqJow7oaHC7cr5U3ozuOz2gRQhKV7qYtQfL1sSAsWBKZRrJQ
	fXu2AESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRn-00000005No7-2QeB;
	Wed, 04 Nov 2026 12:50:35 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRe-00000005NgD-3oaM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:50:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqF5XUfMu7jyQOr01yaDyQM1m7/7gBR3JcI+p6PtbVz9dPTfOhlspiJ42HObi0tGF4APxSdamAPau8r7Qh8cS1sIy6nU0ToCXKCUcKOP0LbOlbo7P2ZwuuH5wcaIW+eeCN2CNJ3iEzoeZvl6wkSGDwa4SmkRdUQtYTrKMMlIbXseH7y71OD4w4/MSpsfpPomMsYMzC4d/C6YoP60s+FXTndHZ8e/CamsWYFvFgKpeCvDgsmYOEgfcEcxUfPUf6h++KWIZI924Qy1TMvY/oxRXeeuQIPT4FKgj812fJayLN6i/m7ADrjkq0I7yDi0PH22vetEh5OXVjSZ+62F1FoAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYCkqby7ZYFlZsTaRBTg/gKKYgtsIri+QbxQt94r4ig=;
 b=IHRKCGCeTgTOJsV4ZfrGzOjEtflcFIREVaIW9H3fMOfWKw7W/AANvs+DgkGDUR0t1hQEOaz1BuH25P+mwDhoyAJ58WKprtB3mCfrgiXfGfqx4DhQt/biPGemP87JqelOzQ2xhTqsbMcCDs83Avovd6ypz1QM1icwPLUSifjmKbPshFZQnBiAJBBjx08+kkdkfadXQa0ASKGKX1/zx+V4QG1nqL3c46+aiaGr5glaF2HIqgWhyYKtJpRlEg2ucvYEXTAUgoOPxbTjBtEzJZpotRxLK7WIK8XomVwg9prVLbUvF5SdyZco60/DMUzvyapuJLk1KqXDr9fI5fj0dSaNhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) by KUYPR06MB8793.apcprd06.prod.outlook.com
 (2603:1096:d10:96::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 12:50:18 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:191:cafe::7e) by SI2PR01CA0005.outlook.office365.com
 (2603:1096:4:191::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 12:50:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:50:17 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CC97540A5BD7;
	Wed,  4 Nov 2026 20:44:13 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v5 3/5] dt-bindings: dma: arm,dma-350: Document optional clocks and resets
Date: Wed,  4 Nov 2026 20:44:09 +0800
Message-ID: <20261104124411.296640-4-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
References: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|KUYPR06MB8793:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 48459951-762f-4e3f-370b-08df3a722de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|261102123227099003|261021123027099003|56012099006|261028144727099003|261009223027099003|261021121427099003|261022105027099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: /1cg/y0N52EZzN6tDjno9EFKFPdYkDG5a+WcasBum/QzbMhHDCWX5nmvqTt7fkqEiVbqkd57bT1cUg8722v/8KeRmeu4gAhbXw9jNBMpz1R8c+U9ITMjFLIs92H2nMhGcCG42bxvjpz4x3EY7XSp3fSOOO4LvU7IIzHaKfVduZnYNA2f3pwKz7UWrrffqhHvCEIU+9cXJekJhpEEGY+YniG6B/TIRtKZjM/IUSiK/CKMyNl4VzUbdiEXeU9HPG77Q5Yp6KJMP8KrTuWMGpvuOgLrlzgKL33tFM40+WgedWQYc3faj39y0Ai3i/AmLIeepGj+qy0wlbRVpE+6NHL0mfGoZ+guleIsrqn/9SKkXdLlEw/EF/UNW1z/u6Ls6PWwc5ePiAZgLTmpLRx6OIiN/RV68ly0k1MxPaK+6goEyl9Zz0oY0r0qm+KgAgbDvsHGvUwKfC4vxjqYZFzV0zjuxllgOAkW62bEMUCa7SF6M7Ah+CbH5mlXSYUGmAp4y4XsqynAKXvnPoFr9gv/48L0eaiAUDye1QtiRHjBTotGyguYMRu7O2LxdcnUHgKtqD428iiumMeTZviGaJuKai2ZMfPl4GeABoLAHLwW/sCNa2bzopZCl4WmGu6QGUatQolIx148r8fq6u7JfitwTbjTwwCUme8k/DGOPv5ahl7kUDQq9rTvDKcu6ukD6rFBRYHMgENbXqKVR/S7jn91KWZULg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(261102123227099003)(261021123027099003)(56012099006)(261028144727099003)(261009223027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: t+/0qWRhDqUz8t8rKzanc/6KUTKGxeHrR2TfJ8pKrykJ+rCJLguSzdb/KJ1m6q8VB+B+wws1HbLTCnY/uPgxbLeE5V7OWdSSAeJjPF6xlqg/YESEdX+4kAG+GV1PmjGgerfmJo9TGn9rB07zoyBpey/pVtTbQS6lx3c+9S7VbH6SOwJEztwnPDS8b5ecM/VnGL8pKUGsi/n8k0AtFgnvAEy5cifnKlnwYqu1qObqz22BMAMgqMXhY5cSVU4x67vmnmYy6020kJw3tfdZlVrBl9Qt0c4JIrOIGLIOmLyQmybaOQtEqvC6XsaIcWIHtF2oxQhm+PYbaoiR3fBkwB5B7niqBuCZHBGmi0Ent0ROSWO7XG/Z/Ho/55J3qmYHAsRC/lMnd4Kc1/F7ohb9NjMBkIm7e3n7C33UdGozztHr/Jc6iHe0I5FmwQF8JBueZeLF
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:50:17.8507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48459951-762f-4e3f-370b-08df3a722de1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_045026_974270_83731A3A 
X-CRM114-Status: GOOD (  10.16  )
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

Some integrations gate the DMA-350 controller with a bus clock or hold it
in reset. Sky1 provides a clock for both its FCH and AUDSS instances, and
a reset for the AUDSS instance. Document these standard resources on the
DMA controller node.

Neither property is required, so existing device trees are unchanged.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 .../devicetree/bindings/dma/arm,dma-350.yaml     | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index 429f682f15d8..43279878207c 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -9,9 +9,6 @@ title: Arm CoreLink DMA-350 Controller
 maintainers:
   - Robin Murphy <robin.murphy@arm.com>
 
-allOf:
-  - $ref: dma-controller.yaml#
-
 properties:
   compatible:
     const: arm,dma-350
@@ -36,9 +33,22 @@ properties:
     const: 1
     description: The cell is the trigger input number
 
+  clocks:
+    maxItems: 1
+    description:
+      Optional bus clock, where the integration gates the controller clock.
+
+  resets:
+    maxItems: 1
+    description:
+      Optional reset line, where the integration exposes one.
+
 required:
   - compatible
   - reg
   - interrupts
 
+allOf:
+  - $ref: dma-controller.yaml#
+
 unevaluatedProperties: false
-- 
2.54.0


