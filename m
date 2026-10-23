Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69200606C91D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e4EFKFGR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pYCkqby7ZYFlZsTaRBTg/gKKYgtsIri+QbxQt94r4ig=; b=e4EFKFGRToGFfGX8ck7bdoUqgv
	AyU3MXXaTGpwgpc7qi7yJPTyVkqIwRTE9paT4NaA3+qHATaL6cfJdAoLS1V/aQgmvEXJ4MSdg4I+c
	WUjhK/nMRTHd0WEym6hUFo8IYO0kwOZOeAwnq0N1cK2Gz/WTSrOpY7xKXV3z5BavCEhAJJKj6Yq+l
	p1VDiZeyGih+KPg3RoPmIU1SiNjqFxOR1xk365KodSd3Lo91d3JPEbKOi72pzirRxMDRbzgXQ6P1g
	vlffo7qVZ6rCx4mb7qwH3MXEj58MgbHinr4pQ0Suad16i9JmMzoKkQXnaajBymJF4cTRF/w5SQij7
	zDz8gOMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBbz-0000000G2b3-2wiH;
	Fri, 23 Oct 2026 09:30:55 +0000
Received: from mail-japaneastazon11022085.outbound.protection.outlook.com ([52.101.126.85] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBbl-0000000G2Rq-1T0f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nplaYi5oPT3IQxAPX8Sknm9eGwFo37EyvA6sdmbTxoZsiDtgiUdK7Sakb7oXuLWe4VoVU1mA+hAnRTS8h8jzD0QcfwAA6mDQd9JVGH6J0D1n+KCCEdnd5An0Bxxs6xFLfAqjJwtnuKh07i2+ZX8UfFwqTE/9Llh+aVtR8AOikvXY9Az0AFxswEQMz+1bX0zpOumTCBjVjkYgp7KarJnvcv4567RGix4zEYOvZXraU35zt3PDUDPSv+8J5KwBo7bsKav8Fpidtx1ft3j0uDOaBDF5xHXEQBCnIAFcRMGqPri0fN+ebr3X9jT4BSRoSESWSp88YbkSpkwM5MYISx3S6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYCkqby7ZYFlZsTaRBTg/gKKYgtsIri+QbxQt94r4ig=;
 b=cqejeOgnz/j8ZH5FOkebrJEI9jqdmmz0nih5khWw6/DeLPmd/nXihpvSRxdr1dn/wVLW9MBvCo0HuBEw9dySgRI2TQcM81eyauLqggBpvzYIdI+ekiRcenbS1u5dqFRzQLKQXzzFuK6yC7M4WtRZDM57DhuJXuNbC/jv4QaC8Zuv/jVSA2AWLdvLRgNInsVPpoCBs7vKCfmh3Gl1bf0LgrFEof8Dc2+VbhB7rShDj4jP4xoRUkazIrYaIG9xO91rB+hXCB9U3LqxZm2/g7Q4BfQdftq4UM17uO48dt55//cBcw3jsB/H9y1G+xfW95M4CoWkWHLVpK97TTcKaApB6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS3PR01CA0080.jpnprd01.prod.outlook.com (2603:1096:604:da::13)
 by TYUPR06MB6078.apcprd06.prod.outlook.com (2603:1096:400:355::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 09:30:20 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:604:da:cafe::82) by OS3PR01CA0080.outlook.office365.com
 (2603:1096:604:da::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Fri,
 23 Oct 2026 09:30:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:30:19 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CD5D440920E2;
	Fri, 23 Oct 2026 17:30:18 +0800 (CST)
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
Subject: [PATCH v4 3/5] dt-bindings: dma: arm,dma-350: Document optional clocks and resets
Date: Fri, 23 Oct 2026 17:30:15 +0800
Message-ID: <20261023093017.3248454-4-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
References: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|TYUPR06MB6078:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dddd38c7-a459-47a5-1c23-08df30e84169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|23010399003|376014|1800799024|6133799003|22082099003|10067099003|261021123027099003|261022105027099003|18002099003|56012099006|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: NCFCSX4X90kbO2S/C9vbB5YQaGUJvPMf/eZLyaQJvq9mhouWj92T2auGaXx5qK81m0MI/BmPluw9Xpfq/2hk9ev7SRXxunb4ilS+HvAkNn0KS+5SHY9tgDW66a2Mjkmv8oh4bFE9+aYRItOTK6YsN+RrnlAJM36a+g3F18h5x1L9j32fDAGqKHGisPIZf45MwT5IZsMORH6QioD0y9qjdE5dXLiYkb3MLDfP0uMMZGvBL2+hs/u8eYIh6kVxAJKwFjx6ARmlZxPDajhWHIHHwpGEpd2z0BOb7zfelvZurJ25Qin+/5oVtq85vlezlyqFgESIk0zA0lrs6ctSd9eHZoX4C5ESBxoNJ3Jbc7gbtoRXo3VsuKEsuucnZn7k77+58q/s1FId4A3YtKO39e4zLVMUwf1QNt83KZRFTxCyvzJFhwhzFrATqAxoIBu1TMXPYGsJByTtJYu4p1MM86oHjHPXT49lfA9rqLCSyXPsAdQmY7p4OEjxDDpXULMhJRBIyxbrCooHXrqWT53k02073uB1IdnVU82ZnlIi9F7VCeLNorbtiWY1VivKbDX80SbghygRIlFG2maUsmvwGLT9f+13lRRWcuDUlsKvo1ayq4VY58p0OsLbf5K9OZJJ3mF6vbAMFX3mg6FeN+iEu+5tXO293B2rOxv2jBuvt1I2jF+yisNv7yG4MVocA+dy5okH5fk6BH41w18Q1Aqn7HVCuQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(23010399003)(376014)(1800799024)(6133799003)(22082099003)(10067099003)(261021123027099003)(261022105027099003)(18002099003)(56012099006)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +JKhoMr6FzWAgLRjfWlJUx1kcWlIyNehVgisebA5YbXMNC3zkAahGPGLjthovROqnaFzcETiQ9ZYRaEie5HHp6QB/WQY2cff2whqcRCdmPlIKxFATaFRnAUmE1Iq2YuQ1rmFzjY3bC8ZWB9MXeltJRhd2BKeovOXJ7KSAl97BMFha8g6nxNFZ+DnG21j4Ho6KuQCD4caFtj2eBCfmPJalkk1u8r8PTLfHtm5/MhcqGij5RsNYlgif+JqItXmNjyNOYrnDzogopXpekY38UMei0T30f74WZ3RgpkbeiDKrVKUZaH9AXte8TDLXcLpvSDfNLrjUK/6LDCf82T5KeoZcJtwpnHnv2zs9ghb+sD75tyY1CeAg5I7kZC+2rR24+nxSVPA5axY6+qy0YtFHK453w15noa4/l70OEwccmGB/dirEtB0NLvWOKASfnBLzgKY
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:19.6134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dddd38c7-a459-47a5-1c23-08df30e84169
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_023041_395339_16F2A6BE 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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


