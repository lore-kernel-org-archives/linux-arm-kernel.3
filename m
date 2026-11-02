Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BD360A2615
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 05:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HgQ2jWa1;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BxUtDmxk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pICSg7mFZPqkrNVUiaMgHHQmaQDHmOfkVU6OPXiw+BA=; b=HgQ2jWa1OaaiZfOiN+a8tragAa
	noX+cc9ohswYyw/QDES3t9y3BjprTuBOhA4PqTJjHYA97UZoQn72SI3UAPumqRqZ09sBV0TtFxD4P
	1tQlWlNQcTdJm8tMC4EHePycrVnM3aN3/D4yg1JbzioxqI44ouc0k8UIg4OfWlhE0MedoG1roQOeJ
	uiLtWIuAO3MgsfZU5ZeA86tqC23QCiB8YQmsrayC8X7XLBmZcRc8Wp44i6rQ3sW5rUzdkdI7u4BYs
	KUr9OUPO3gIf9joJThRMplfEZj1Rp/itU57JOpZDDHYUK+6+E0iRgykVQn8rEDcpA0uWf3BXrJVa5
	NuoYFVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkSd-0000000FYiK-28er;
	Mon, 02 Nov 2026 05:19:59 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkSa-0000000FYep-2rTY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 05:19:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTHi/4oHuLymsX8/aq5R9aLpLPcdR4R+/G7n35FG/MIGWQq01F2eQcuIDc/7RGuJGPRm+InnRgni6TdZfxHbusKPMsUqx8pC3VgKPLlknqBBgXBauYeIqjPBUMlYr0UY9a0DgapLT23NjrnT9cEwqelm+a1LlgD3D88t94g519f0RD8fUv9OIsnsoOWVpGbc0QL4LORqSQ8pWFX1es+s5eDiANJVixtDNc2kSWDKFyT4I563FU38SYRgCHpgEdsktZ/OjpbFxaNm7ZpaWQMp1NIWJb/fxIgySh+rTdbewq5kPxXdB8g4IVtumkoqxCt/PR0TqVgmJAjSi4SU1xkqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pICSg7mFZPqkrNVUiaMgHHQmaQDHmOfkVU6OPXiw+BA=;
 b=Jm5462zw4cIUC03DiyUi1dx32HoJSFgharaU4Aj9DlaZlFuFDN644ydHlXNbsM5sDuQzLrWQk4QlXWGo4NDhvF45D9BjS3OmW/u5UvDLFFqi+fwFn7f+dyzFu+3TcXTHED8mD1mUYWBR6/wIlkwiRZ9lZ7ExxAGbqZXHXb59k2rFSqRMybcv1R0Nhb0fSt5cuu4KvJPD95dR1V3/tCxeRpIIB2WfhIZpVx1Q87lN6Hxe1YBRYMSMy8FJmRIT4Pj3J4vMjXvpP1nNQUUY6BBoLE8JJuCxGcllHH1cJEhtUP+LDe10BoXqgxEH9WJ2SvdPCYqGtC6e2ZkWycjwnu2VwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pICSg7mFZPqkrNVUiaMgHHQmaQDHmOfkVU6OPXiw+BA=;
 b=BxUtDmxkysJzFb/1yEjnHrFCglRbZr3hFTeoYSvwo17oKHQWve72sNH5e0oi7l5sA+QUCFL9ptZoKemM5DXERUcini77N/mrJJiCQwuXYeOlj9rLA/30fuDuXiuEO/q2UmxmGj9/ZZmOWVQGAokSmXN5xSe9z+B7LYl3tXzBCTWDi1/+VukXUJuX5hZvBn4xl9QJVL3Xoga61APRb6C4KDHSFvB4EXa01yDFiqAAryrQlAjW2aBI187tvg7SoDPyhtzeCyHBYHr8qprJB+iV2ElMj8gFFMvsAJHdkodqGzn4e6v4fJGuc5gj47xLLhTOOp8HpAc24moZqJZZbzZLuA==
Received: from PH1PEPF00013304.namprd07.prod.outlook.com (2603:10b6:518:1::16)
 by IA0PPFAF883AE17.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 05:19:47 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2a01:111:f403:c902::17) by PH1PEPF00013304.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 05:19:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 05:19:46 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 1 Nov
 2026 21:19:35 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 1 Nov
 2026 21:19:34 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Sun, 1 Nov 2026 21:19:33 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <praan@google.com>,
	<kevin.tian@intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>, <kas@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>,
	<xueshuai@linux.alibaba.com>, <john.garry@arm.com>
Subject: [PATCH v12 05/12] iommu/arm-smmu-v3: Add ARM_SMMU_FEAT_EVTQ for the event queue
Date: Sun, 1 Nov 2026 21:19:13 -0800
Message-ID: <9744e1695bc597bd9ddb88ace69ffb584b803425.1793593923.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|IA0PPFAF883AE17:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d82ac73-1f5d-47ee-867b-08df38a0e93e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|376014|1800799024|6133799003|10067099003|18002099003|22082099003|56012099006|5023799004|11063799006|261021121427099003|261021123027099003|261021135927099003|261022075727099003|261026140227099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: jIgUO1jFub9GRVi2yi1ZwsfKM2d1XRUtBXeBFaKxqN6EsgBzety+FzrLKn3QTxH5fOmg8N86VtzoyKBGEEoNpxzDrhBjrk1UeoASm9Sz5rX7MHskQ2YyzTPGRhUoAoyv8mj9A+9dH2eoDBgVPWMhl40EboE23z8fCi3FVYhc/Y3u7Ct7XYlfQ9S9mza7BTsNoOtlnlyyJD3ERHilcDV6aZYyT0Cj1T0xrfR+c8mfVGAau17QDuj3dMv57yVCE94wMU9LGgjTtbMNHsaY5fEvBrcQ8K032FjdycVmpmjcFep78bdNoga9vwIb8drbvNsDiwyF1WSo6txGQzc+dDKrvOkAUmiz5vL8aapVykxHXkhyFcWxkYtEmFF8oF7q25QQGweTNwaXQ6WYj7xVfvGBB+h0aWHyCkYy/tMRw5Y9dPZEbn6zQRXFwekozjXBTWbTb4JJsPAhjeH+qKhsakIuNM8hg1fUMGI3wmy5uT26pl6PDKLfViWkq3+akTones+kQVf7oesMZm03iqHnly6WT2rJ5Lih6siy95sTjLrnKT4TuULjONsRm/0z9MMSd2XFZFjWkA6SwrHUaaO+HL2n++KkXTfSKaAwwY2+P72NDqkwkub3jcbyWBsO9sHyWguRZVqFGct9h9unzAckD7eoqHr1rfIQmVKxUt3OwL0RVMYjOMPR9WVhXOzYE+Tbi4U3TYhNTzUHURq9VBKkyv7obQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(376014)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006)(261021121427099003)(261021123027099003)(261021135927099003)(261022075727099003)(261026140227099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0BNf4XvHwS5oebgpvrDcgXH4yHoEGnCxWnqVu6W2fc8l4Pj0RAAskogyvZqcaNx3SQONP4z2WiSVPC1p7oHRV0hcsTViOat91sEDfOR81U0Z6fO0rI3ykcbpeTqrTg8OndOaTNiipABauWQrFlVbUXx5l5wBHf2qMfMRqFpStnPA8Oy/6SjOQ7i55pj+cV0X9pmS4dHqS7khnzr8bjXXv6HG4xqLNMh0fgjF4I/TUuOrq8DWhga+E720BW89dUUz1Um0felda+BNQ4ndNNKSZBQoJJjY2wc6T69vn3hOmYqLmIbtUHAJ/I77gfBYLnOVedq5GbnuKQbao6T+6U2FOGoeXPKCZAhkbkGMFB9lZPy2akWU6bXQHzSJxKQ6mCIUMRJxS3Nqc95r0aH01AIlky8tQu8D3neDXeDIkKwHVYHUa0j9nQR5xrVkovCXk8Fl
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 05:19:46.8417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d82ac73-1f5d-47ee-867b-08df38a0e93e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFAF883AE17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_211956_771487_65A6A11B 
X-CRM114-Status: GOOD (  19.41  )
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

The driver programs and enables the event queue unconditionally, while the
PRI queue has an ARM_SMMU_FEAT_PRI gating each of its touch points. Yet a
kdump kernel wants to leave both of the queues alone, which would take an
is_kdump_kernel() test at every one of those places.

Add an ARM_SMMU_FEAT_EVTQ that the probe always sets, as the event queue is
architecturally mandatory, and gate the queue's allocation, its interrupt,
its MSI vector, and its CR0 and IRQ_CTRL enables on it. A subsequent change
will turn the queue off in a single place.

No functional change intended.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Tested-by: Breno Leitao <leitao@kernel.org>
Tested-by: Cristian Prundeanu <cpru@amazon.com>
Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 82 +++++++++++++--------
 2 files changed, 54 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index bce592fff0b12..aef12d8de9f05 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -979,6 +979,7 @@ struct arm_smmu_device {
 #define ARM_SMMU_FEAT_BBML2		(1 << 24)
 #define ARM_SMMU_FEAT_HAFT		(1 << 25)
 #define ARM_SMMU_FEAT_DS		(1 << 26)
+#define ARM_SMMU_FEAT_EVTQ		(1 << 27)
 	u32				features;
 
 #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a312984bc6a0e..b1222d6f771cf 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2374,7 +2374,8 @@ static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
 {
 	struct arm_smmu_device *smmu = dev;
 
-	arm_smmu_evtq_thread(irq, dev);
+	if (smmu->features & ARM_SMMU_FEAT_EVTQ)
+		arm_smmu_evtq_thread(irq, dev);
 	if (smmu->features & ARM_SMMU_FEAT_PRI)
 		arm_smmu_priq_thread(irq, dev);
 
@@ -2383,7 +2384,12 @@ static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
 
 static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
 {
-	arm_smmu_gerror_handler(irq, dev);
+	struct arm_smmu_device *smmu = dev;
+	irqreturn_t ret = arm_smmu_gerror_handler(irq, dev);
+
+	/* Without either queue, the thread would have nothing to drain */
+	if (!(smmu->features & (ARM_SMMU_FEAT_EVTQ | ARM_SMMU_FEAT_PRI)))
+		return ret;
 	return IRQ_WAKE_THREAD;
 }
 
@@ -4756,11 +4762,14 @@ static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
 		return ret;
 
 	/* evtq */
-	ret = arm_smmu_init_one_queue(smmu, &smmu->evtq.q, smmu->page1,
-				      ARM_SMMU_EVTQ_PROD, ARM_SMMU_EVTQ_CONS,
-				      EVTQ_ENT_DWORDS, "evtq");
-	if (ret)
-		return ret;
+	if (smmu->features & ARM_SMMU_FEAT_EVTQ) {
+		ret = arm_smmu_init_one_queue(smmu, &smmu->evtq.q, smmu->page1,
+					      ARM_SMMU_EVTQ_PROD,
+					      ARM_SMMU_EVTQ_CONS,
+					      EVTQ_ENT_DWORDS, "evtq");
+		if (ret)
+			return ret;
+	}
 
 	if ((smmu->features & ARM_SMMU_FEAT_SVA) &&
 	    (smmu->features & ARM_SMMU_FEAT_STALLS)) {
@@ -4955,7 +4964,8 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 	unsigned int nvec = 0;
 	int ret;
 
-	arm_smmu_setup_msi_vector(smmu, vec, &nvec, EVTQ_MSI_INDEX);
+	if (smmu->features & ARM_SMMU_FEAT_EVTQ)
+		arm_smmu_setup_msi_vector(smmu, vec, &nvec, EVTQ_MSI_INDEX);
 	arm_smmu_setup_msi_vector(smmu, vec, &nvec, GERROR_MSI_INDEX);
 	if (smmu->features & ARM_SMMU_FEAT_PRI)
 		arm_smmu_setup_msi_vector(smmu, vec, &nvec, PRIQ_MSI_INDEX);
@@ -4991,16 +5001,20 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
 	arm_smmu_setup_msis(smmu);
 
 	/* Request interrupt lines */
-	irq = smmu->evtq.q.irq;
-	if (irq) {
-		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
-						arm_smmu_evtq_thread,
-						IRQF_ONESHOT,
-						"arm-smmu-v3-evtq", smmu);
-		if (ret < 0)
-			dev_warn(smmu->dev, "failed to enable evtq irq\n");
-	} else {
-		dev_warn(smmu->dev, "no evtq irq - events will not be reported!\n");
+	if (smmu->features & ARM_SMMU_FEAT_EVTQ) {
+		irq = smmu->evtq.q.irq;
+		if (irq) {
+			ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
+							arm_smmu_evtq_thread,
+							IRQF_ONESHOT,
+							"arm-smmu-v3-evtq", smmu);
+			if (ret < 0)
+				dev_warn(smmu->dev,
+					 "failed to enable evtq irq\n");
+		} else {
+			dev_warn(smmu->dev,
+				 "no evtq irq - events will not be reported!\n");
+		}
 	}
 
 	irq = smmu->gerr_irq;
@@ -5033,7 +5047,7 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
 static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 {
 	int ret, irq;
-	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
+	u32 irqen_flags = IRQ_CTRL_GERROR_IRQEN;
 
 	/* Disable IRQs first */
 	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
@@ -5059,6 +5073,8 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 	} else
 		arm_smmu_setup_unique_irqs(smmu);
 
+	if (smmu->features & ARM_SMMU_FEAT_EVTQ)
+		irqen_flags |= IRQ_CTRL_EVTQ_IRQEN;
 	if (smmu->features & ARM_SMMU_FEAT_PRI)
 		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
 
@@ -5177,16 +5193,21 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		smmu, arm_smmu_make_cmd_op(CMDQ_OP_TLBI_NSNH_ALL));
 
 	/* Event queue */
-	writeq_relaxed(smmu->evtq.q.q_base, smmu->base + ARM_SMMU_EVTQ_BASE);
-	writel_relaxed(smmu->evtq.q.llq.prod, smmu->page1 + ARM_SMMU_EVTQ_PROD);
-	writel_relaxed(smmu->evtq.q.llq.cons, smmu->page1 + ARM_SMMU_EVTQ_CONS);
-
-	enables |= CR0_EVTQEN;
-	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
-				      ARM_SMMU_CR0ACK);
-	if (ret) {
-		dev_err(smmu->dev, "failed to enable event queue\n");
-		return ret;
+	if (smmu->features & ARM_SMMU_FEAT_EVTQ) {
+		writeq_relaxed(smmu->evtq.q.q_base,
+			       smmu->base + ARM_SMMU_EVTQ_BASE);
+		writel_relaxed(smmu->evtq.q.llq.prod,
+			       smmu->page1 + ARM_SMMU_EVTQ_PROD);
+		writel_relaxed(smmu->evtq.q.llq.cons,
+			       smmu->page1 + ARM_SMMU_EVTQ_CONS);
+
+		enables |= CR0_EVTQEN;
+		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
+					      ARM_SMMU_CR0ACK);
+		if (ret) {
+			dev_err(smmu->dev, "failed to enable event queue\n");
+			return ret;
+		}
 	}
 
 	/* PRI queue */
@@ -5334,6 +5355,9 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	u32 reg;
 	bool coherent = smmu->features & ARM_SMMU_FEAT_COHERENCY;
 
+	/* The event queue is architecturally mandatory, unlike the PRI queue */
+	smmu->features |= ARM_SMMU_FEAT_EVTQ;
+
 	/* IDR0 */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR0);
 
-- 
2.43.0


