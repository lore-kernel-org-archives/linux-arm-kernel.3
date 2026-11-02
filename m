Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEAA606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 05:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oLp3AZ8O;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=np0xJ2Xu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g0QnbWoaY2LEGdUv6kRlJZxExGgoNcoWnukNbun0hNo=; b=oLp3AZ8Ozj3vQXRzIXc35fc1gw
	RXOFgo8Jmmfrt1qfsi2zsKLaHYldVAPg75MCzPzq6/ywzgtxXlymLbpsjDkKMLwfMZ7NnYE3c244H
	arS7TD769xGVQCXHeSUwv1+HQ7qCBHmFxFGrJOIbbEHKstdlDYloVpFlw3Ot3EIXX3mcxASbv3tcj
	lAF5flmq/1hxJzvn79wSHmyHWeqracsBMP1H091Dd1ioKfBXHD0kAAbGpk2hASo9zxrxMdOixk1GD
	6EDmGNUTKv7XGfcUrObISCnHHsKImPQobZ/oOZD+W3pqZVyLz5C5At8Dq361wD5MQvKDIzPo1oab+
	tyPNJ0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkSm-0000000FYwN-1TTY;
	Mon, 02 Nov 2026 05:20:08 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkSg-0000000FYmd-3KYp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 05:20:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGZLvARpWc0B6ajpor/D6Fj/6nemo0Zh+zgiaOPtbaNRCVeMYKoh23TUYSsDl6yUrluhp3wHBEPo2kQA6s7h9PVSOX+0z97DsH6VGIh0jHr6NzLTlr5QwN9R/u6EI/v6gOnda1ekDSBL5P2VgaBqiOxMxOVSrQ3ycmMF+Nc4bobuPD/CeAcHbLy8nY63EV3IQxDR+P7UDWc8RKSq5+eQW6TGrC61M/9Q6IWQYaAmQPuY0o9+Hlbu1DRbcWSm40SUvggX9sA+ZgpBE+fCgeb9zCvCJHossVLTasbEj5H07O3XiK+xjmzrujjB5GQ0d9yIGyIZ/bjAZATlxfvdLPJE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0QnbWoaY2LEGdUv6kRlJZxExGgoNcoWnukNbun0hNo=;
 b=rM2GbcMc/mC3tRQdLr7Ltfi7u8iT4xCNoSDNCg5X1BouH17IwcjU4MaJUO3V8LG+maGLDgld7NFFaWzABf4R83lPZYfiSFm0/393p4Kq4ulWLtHRwgjR3jP9yRh1b8xqj4wIPc5/QRmBFOBa8crXSKOVzUpjHkpSIGlT0rm4vBoGs+Y7sXZe8SbgrkOX2s80vDyGwylonMcGtZ7w6l4Vz/lj9bOxu2KWbkmlD5ZBzf/GkjdT7oEGQdJP6jP2FiZLWXh8uiNsXOgUfOu9f5pgzy+1FmMYSbtiJvvbq40PbV4G1LwhmIE7D8E2osd4q4mIKkGDKfxX+OjL4ma1UoT68w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0QnbWoaY2LEGdUv6kRlJZxExGgoNcoWnukNbun0hNo=;
 b=np0xJ2XuswWPJOa4Fs/7tYJT9u05DF9sM9cCjVfWyV0tNVZvbKHPgIUeuWToSBCWfUyIcbq2zCgqXl4km6ChHbfUrixDeQni4prluog8TjWs9xxmHX5UM8shVB1WfD0uB74iiLfDuymWn/yEWwiRHsfDtMUl2nLH8ImRmk3/LKMLgkzukj/s55t+bknNhd4/luBEuVD6NVJRAYg4kYr38pMJ+V5FdbdfJ4GiEd9F52Sj5XlOHU57wuXECygYLl8EQB+Zg1qzFp0kEOVL7RpXN4FbPUd4kxU+5diuZfgMLTtMaR25Dt/EvWvZxQ4hC/OD+ECO65dQwVB8N3gtxlKa9Q==
Received: from PH8PR07CA0019.namprd07.prod.outlook.com (2603:10b6:510:2cd::18)
 by PH8PR12MB6842.namprd12.prod.outlook.com (2603:10b6:510:1c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 05:19:53 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:510:2cd:cafe::52) by PH8PR07CA0019.outlook.office365.com
 (2603:10b6:510:2cd::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 05:19:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 05:19:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 1 Nov
 2026 21:19:42 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 1 Nov
 2026 21:19:41 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Sun, 1 Nov 2026 21:19:40 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <praan@google.com>,
	<kevin.tian@intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>, <kas@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>,
	<xueshuai@linux.alibaba.com>, <john.garry@arm.com>
Subject: [PATCH v12 10/12] iommu/arm-smmu-v3: Retain CR0_SMMUEN during kdump device reset
Date: Sun, 1 Nov 2026 21:19:18 -0800
Message-ID: <f458ce5587ad991c85e65ee12e8f5b271e5f6745.1793593923.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793593923.git.nicolinc@nvidia.com>
References: <cover.1793593923.git.nicolinc@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|PH8PR12MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: cd908263-e15d-4344-059b-08df38a0ed40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|36860700016|82310400026|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261021135927099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: +3o63CG/brdagkSKvSdpIvQ0mYk2dFtXSsLbE/G3ZbVHxp4dwA6XLMYIqVYGQkX0DK5y1cPlpJpoms4ioxUWYbRE8pALrOK35Sj90+E7Sp/4Q6Y5VVXo/y3Sxq1yu8BDIDcHghn0zIYFpWIpsabS5GZyYNYIa1BgMApYDc5PFr2CPXCZH+GGD8ddhVyZKx0jTGibnDIx6zwzDX+htZYMICKRBA1smGSoFxhSCS4LBZZQcAUt5PPywlNH1Ydjay1v46IsxtpOJ2r64+PD2GKv4a3SKJHFgFSw2FU2cLhaDeWYatj7qwEY+DZ8mL4WDHOnswMqzL1O1DCe3boltf7srDYOI1zLNDFhZrNMthE032McRVVNi70VOPVExzD5sUGcfZg8pKWRRRi7Z4F339f7U6gh+JXCwG75IQ/wYw3ip6dTMSkGhf1D0a0XizNjZEO9VINcK59OyC6++0dEoTJYq/nKdegrOHFTzwAGUdCoPDZ/6/P4F5u6HQ2A6DI/dJHIcC4kSPdsxsgCeuXBeMCURlR/kwqjJAuFqR0oWwKKQJI+WDsQP6EMKoyxWMBXHArFNOrjQ70JNK4Mmxd+5hBXaba2+cZCjT21xVEjfIThXM/RyPRmvEutNAWT42uuM8zJJ3Im01o0QwOwUtzVMIsISK/feU8ktvSPutuFg2q/UA0Oi85Maa14QsD6VZp8jUYLUYFZy4M3DNj8EE/8eMdCgA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261021135927099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: D6foJGW0Roqt7bDAr8t4SJipoyaMWOryPeYyJmENRVKbrEAN9ffUhucY2JGOfIx9gW8Q7M8/Rs+wa68LjZUWTLpHvf8ueHKJG1x2bOTTE2S34BN1KSmfCWxnTWEqVpH+oYKdmOtncEt3klRDV7+SUuf/X2XzhCi9IzrT6NimySV6lBgrveYASF3dWcBNupx2AZOosVivaZxGHVeEp/WZs7OqIcZ35y1vE2Rqhsf9JUPj+uv/anbuNcdUledgAQkw+qsKBMemW/fcESRFPff58PnPfvTOeupa8rbhCugeTiVdjKvkEhF+m8F8gGoOGtLUfUzaMHep0vLXEBUnN1h+VPOI5zQQHgEhishuUcYl1lQ4FTxGCm4WnfyjN3FNBMi9fmjcR/588V2L/oA+YJ9Tq1KxV45DR2ZOP147HVq0u+clqIp37SzjcFBW7nr4K2Ph
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 05:19:53.5971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd908263-e15d-4344-059b-08df38a0ed40
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6842
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_212002_843666_E6511498 
X-CRM114-Status: GOOD (  18.06  )
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

When ARM_SMMU_OPT_KDUMP_ADOPT is detected, do not disable SMMUEN and skip
the CR1/CR2/STRTAB_BASE update sequence in arm_smmu_device_reset(). Those
register writes are all CONSTRAINED UNPREDICTABLE while CR0_SMMUEN==1, so
leaving them intact lets in-flight DMAs continue to be translated by the
adopted stream table.

Initialize 'enables' to 0, so it can carry the retained CR0 fields in the
kdump case, clearing only the queue enable bits. Then, preserve them when
enabling the command queue.

The retained CR0 keeps the crashed kernel's ATSCHK too, which selects the
fast (0) or the safe (1) mode for the ATS translated traffic. Switching to
the safe mode would start checking the in-flight traffic against STE.EATS
fields that the crashed kernel never set up for a check, aborting the very
DMAs being carried.

Clear latched gerror bits if necessary.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Tested-by: Breno Leitao <leitao@kernel.org>
Tested-by: Cristian Prundeanu <cpru@amazon.com>
Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 57 +++++++++++++++++++--
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d45ce33334ce2..1c53c690a2b02 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5145,10 +5145,39 @@ static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
 static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
-	u32 reg, enables;
+	u32 reg, enables = 0;
 
-	/* Clear CR0 and sync (disables SMMU and queue processing) */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
+
+	/*
+	 * In a kdump case (set when CR0_SMMUEN=1 and !GERROR_SFM_ERR), retain
+	 * all the live CR0 fields, e.g. CR0_SMMUEN to avoid aborting in-flight
+	 * DMA and CR0_ATSCHK to carry on the ATS-check policy, while clearing
+	 * only the queue enable bits for this kernel to take over the queues.
+	 *
+	 * According to spec, updating STRTAB_BASE/CR1/CR2 when CR0_SMMUEN=1 is
+	 * CONSTRAINED UNPREDICTABLE. So, skip those register updates and rely
+	 * on the adopted stream table from the crashed kernel.
+	 */
+	if (smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT) {
+		dev_info(smmu->dev,
+			 "kdump: retaining SMMUEN for in-flight DMA\n");
+		enables = reg & ~(CR0_CMDQEN | CR0_EVTQEN | CR0_PRIQEN);
+		/*
+		 * Disable queues since arm_smmu_device_disable() is skipped.
+		 * CR0 fields are independent per spec, so the queue enable bits
+		 * can be cleared while retaining SMMUEN=1.
+		 */
+		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
+					      ARM_SMMU_CR0ACK);
+		if (ret) {
+			dev_err(smmu->dev, "failed to disable queues\n");
+			return ret;
+		}
+		goto reset_queues;
+	}
+
+	/* Clear CR0 and sync (disables SMMU and queue processing) */
 	if (reg & CR0_SMMUEN) {
 		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
 		arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
@@ -5178,12 +5207,27 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	/* Stream table */
 	arm_smmu_write_strtab(smmu);
 
+reset_queues:
+	/*
+	 * GERROR bits are latched. Read after queue disabling so that unhandled
+	 * errors would be visible. Ack everything prior to re-enabling the CMDQ
+	 * as a stale CMDQ_ERR would halt the CMDQ and new command will timeout.
+	 * Acking SFM_ERR is defined too, although it would not exit the SFM.
+	 */
+	if (is_kdump_kernel()) {
+		u32 gerror = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
+		u32 gerrorn = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
+
+		if ((gerror ^ gerrorn) & GERROR_ERR_MASK)
+			writel(gerror, smmu->base + ARM_SMMU_GERRORN);
+	}
+
 	/* Command queue */
 	writeq_relaxed(smmu->cmdq.q.q_base, smmu->base + ARM_SMMU_CMDQ_BASE);
 	writel_relaxed(smmu->cmdq.q.llq.prod, smmu->base + ARM_SMMU_CMDQ_PROD);
 	writel_relaxed(smmu->cmdq.q.llq.cons, smmu->base + ARM_SMMU_CMDQ_CONS);
 
-	enables = CR0_CMDQEN;
+	enables |= CR0_CMDQEN;
 	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
 				      ARM_SMMU_CR0ACK);
 	if (ret) {
@@ -5239,7 +5283,12 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		}
 	}
 
-	if (smmu->features & ARM_SMMU_FEAT_ATS) {
+	/*
+	 * In a kdump adopt case, retain the crashed kernel's ATS-check policy
+	 * captured above rather than forcing it on.
+	 */
+	if (!(smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT) &&
+	    (smmu->features & ARM_SMMU_FEAT_ATS)) {
 		enables |= CR0_ATSCHK;
 		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
 					      ARM_SMMU_CR0ACK);
-- 
2.43.0


