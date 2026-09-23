Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6411C98311
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zaV92e09m6jj8CC50ciRxAosC+BCO8CLiXdHTXL57A=; b=FvWe13HEd2peAa6xL33dpT1/lb
	niCrAyHh7E80cVgt+cs4/jnfkyS+aSH3zxqLM5jjwST0YlaJk7mpHqii/z8vgt/rkVUXetR5NCjsK
	D2l+R4o+05Pu4EQus0XtfNPXGVMgVCgj33I1NF0cDCIDcpK6lybh/1mU62Hj8LdPukOwmIeIJJzNL
	i9SZ6QNcgfOU2tdpCsJcprJiCoy35z/WYX0Rm1ZMef0KnzaWGSLPLQKP8gogPvsZF0PYTS4AoZUuo
	RgcGKE1Bto7x4yZP4o/GF2fDQm18bVrO6aZPN75la82m6aRpP+6tYiV+kjCiuD3AvUoLb5u2GUVOs
	bPIiofLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TLG-00000009Q0b-3kvZ;
	Wed, 23 Sep 2026 20:13:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TKf-00000009PbW-2T1b
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 20:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/zaV92e09m6jj8CC50ciRxAosC+BCO8CLiXdHTXL57A=; b=kkHnQV+Cm3CQGEjAUG89xaxiEl
	NQrgcNy1aLHJsIj47mEVEu4CVxkUzHoyHc4q+ZoAOEQcc85YWJUbMzNJrexGSbfXyKK8QoO+FZ15e
	7X+Ut/mkf+GdqindFp5ICdzjrApyvs0FbMLcugaQ/ARZlYTsK93T31b9QiEkQy9knHjv3Qg4bJYVM
	SQukQ/UlwYsaT5/9V7xE7TyPqsLWqPkBPubDDoSwNJFfBy1ZXPliH3krg7Xp94VGFLLXZGskk9hTl
	VfErSfFHMqMDnJmCSubDu8VMvsOEtPrYFBL7s9fHEwo8FCs4IGdbqpS2Yh5KEc5tzwaWhBQL32S6+
	oIYf9nhg==;
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9TKc-0000000FErQ-2Ztt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:12:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecRuTZWpTMsxWfOBO6XMtysHI+nLhtdhkf9qgCBu9izhXT20Moy4RdPfT7MVzlX8F/pEt4scBW8oYrTdHW2uBdh7lYkMBDzvavEyPuWi/YWT1f3g7oeFuGyfaHPsN1f66OsdeRTi7EWoMoAASzOrUn4ET9N2477V4vmBpF3hVbAbg6BC81z6C50AWZzuQcOgOp1UxWRFSbHfVIlg7H4SeHpj9fZZjwac8q3eGjf6/cqmucAng9uj9fX6b1RhsCJSX9bWN1hKZZ86TAT7cHq8nyuuH1pBo31wj3es+YwGyveWxzJ7ARb5PvZf6Jo4PJSssrPfwL7Bvwg+kcLn1jit9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zaV92e09m6jj8CC50ciRxAosC+BCO8CLiXdHTXL57A=;
 b=pvjMnvZezrvferRrT8KIayBQF0en5cK5lnwGsQZ3O0bH6l7KY7x5n4IMeHfG54cJ/8sEPZ6EnAUzak/9/AtXFhqwZdoDWXLp6zLoy3E7kLG4U403y1sHadw0LVeLS05ELD3psdGXZxswr7adAWCwEGZ5a+RF5x7ZEW6zQY6A39Rg7LHUCXAk38p87pHehZDtg4wOU5rQyo7aUBZaJbrILl60EayhKP3/KL+E3+F1BxUSogNm7RkqMCJ+ZZSOB8lw2ynutjHAh6sk8z1/S8rYV4Q8Ntyz2w93der+FQMJWrTs3TCzhcHYzlrx/2M+TXsgJhxkNHLa5SDONLSj0r0bzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zaV92e09m6jj8CC50ciRxAosC+BCO8CLiXdHTXL57A=;
 b=ByGdt8dGTMblfXpqBgB4jtPn3Y5NLvFxCMu9Px/uDhkpLHMWh8GNYYt+13oEemOHrxcKXTY9It21Yoaxk7UChpnMweLID1ID9pSU0OHG7yV+JCRCLcnfhEoQoGPlPkm7Ff5Wg+txqnV7REMohsSh0kTf+5ELJaddx83cXiQRSeR71DkFRZjjtuKgIlJaJLhF+FMcYidX2kKfixuWjXUh8az7kjIbfooa4Pk9UEg1HRdGb9h7wEweoCuWzExP2GgU7ZXFDawAYP8AcTA6Xx5mMdPimGGGayAfmbs7LDOQKwS5/VIdjp3xZsSrDejsJoMep1iVCAFr46+Fe47c1LLDXw==
Received: from MW4PR03CA0091.namprd03.prod.outlook.com (2603:10b6:303:b7::6)
 by IA1PR12MB9738.namprd12.prod.outlook.com (2603:10b6:208:465::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Wed, 23 Sep
 2026 20:12:32 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:303:b7:cafe::4) by MW4PR03CA0091.outlook.office365.com
 (2603:10b6:303:b7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 20:12:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 20:12:32 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 13:12:07 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 13:12:07 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 23 Sep 2026 13:12:06 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>
CC: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <linux-cxl@vger.kernel.org>,
	<vsethi@nvidia.com>, Shuai Xue <xueshuai@linux.alibaba.com>
Subject: [PATCH v6 12/17] iommu/arm-smmu-v3: Introduce arm_smmu_cmdq_batch_issue() wrapper
Date: Wed, 23 Sep 2026 13:11:31 -0700
Message-ID: <234616c89cd2703e1d4682a22da46eff410f2607.1790188511.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790188510.git.nicolinc@nvidia.com>
References: <cover.1790188510.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|IA1PR12MB9738:EE_
X-MS-Office365-Filtering-Correlation-Id: d849fbde-5d4b-4e64-6d6a-08df19af0051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|82310400026|23010399003|56012099006|10067099003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: FpXT0BMscHzpk1DPkUOhNYP4/LFqaWSkRy4iXaSrgC893o6B2AJ6cBrB1QmGT8JusfYF4u862ALb6DOS43wNVleY8Vyi4E+8vCADre05K/kHslieGv7FIYwh4eSLwcAEgtBYPw8Nt5Bkxyenq4ZczsDW8/WG9G8qAsovjpv/bkGsQxP3eLFpRHN2H8y7YsG0hEjXXDwAjVSEMUUWuIiawN1k7lRxwszT2OuX1BVvrOHJ1Sg2E3Dg6CPp79HSonnSEwPLt7FqNCk1vUxFap39JxKyJaEvbtnzfXJOQNc73ocrcX2jjlAuJiQBvB/mnjp0EuptWOvEZHf6NA/exUoAMM/4vXAiez7Um1SHCd7MxUgnBx3rL89CaXSIDXSsrbrHMHX82qVJ7Q4YLbKDTwAExU4dKmbDby/iEkhVQg7BKy7jhAQj2MpZksHB28p6bhCvcRYYQrrE5ZFarTuNc2hIMttjEhpKHK6dk1f76waM6Zq+gKsb00l8bNMt/BW4LADuUb2mjmjq+wwgpfT9Zq1vhYHQGK+FlL9sfdeYJVYWF0a67vbHtBh8JltliMos0w9mnjY0300ACFwbZJ10TEKmPuwP0m6Ra7cWr/Js/eOGUy/Uy/fvnNlCyVU2w3yqY27d3NPBoZpNPLpGC4gAQNFyGcbXPJDnXMDCzELcxSgXdOWfuBpfE1XOWCKRgCQpxu0DADk3B+dpIy9zN9DrrjJf4g==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(82310400026)(23010399003)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PxF6dDa0Sb9a1yYwwCho41PiF+Q6sZ09vg5zO9sEMSgM536MgUoBvQ58Is706jztUZltZlmU2ttHXmzkQM6Ya+a2N6plwB8lS7i6iRbYCl+2j4rSqMwtgOkXQlMSDzgcN1oo5oTGSNrx2cNUOUJUrT1BO60zETIUIr27DLBwQBCwg2/nqJYSNYp42848NZ2PqryJAxr89iGa2l7/PkUUUbVQSW3w8Oxl7bstYJ4DPwoWK9ATOZp6MQaymxOS7vd9TSQ2tKljUg+OKwmwIhZBsCXzq5rpdwtUjOxyUM+2aiC9hXyIF+8dvZtZCdeHj6atFs/B1vl5ae76DIyPXJ82Vs9mRDHuxQlPY+MpBjfR7dE/5cUlr0duXQI4Ma3BcN4qvKSUjHusTOzdQ5JMUbMCs3oEYzA2SC4sCu72GNNQ7fIPvUBHNzlFTU5xS0LdOodV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:12:32.4155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d849fbde-5d4b-4e64-6d6a-08df19af0051
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_211242_818963_E43565D5 
X-CRM114-Status: GOOD (  11.50  )
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

Both arm_smmu_cmdq_batch_submit() and arm_smmu_cmdq_batch_add_cmd_p() call
arm_smmu_cmdq_issue_cmdlist() to flush batches. A future change will retry
the issued commands on -EIO, using the arm_smmu_invs carried in the batch.
So, a single hook point is preferred.

Introduce an arm_smmu_cmdq_batch_issue() wrapper, so a retry logic will be
simply filled into the wrapper.

No functional changes.

Assisted-by: LLM
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 3081ef407fd69..c3c31d4010a0a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -965,6 +965,14 @@ static void arm_smmu_cmdq_batch_init_cmd(struct arm_smmu_device *smmu,
 	cmds->cmdq = arm_smmu_get_cmdq(smmu, cmd);
 }
 
+static int arm_smmu_cmdq_batch_issue(struct arm_smmu_device *smmu,
+				     struct arm_smmu_cmdq_batch *cmds,
+				     bool sync)
+{
+	return arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmdq, cmds->cmds,
+					   cmds->num, sync);
+}
+
 static bool arm_smmu_cmdq_batch_force_sync(struct arm_smmu_device *smmu,
 					   struct arm_smmu_cmdq_batch *cmds,
 					   struct arm_smmu_cmd *cmd)
@@ -994,14 +1002,12 @@ static void arm_smmu_cmdq_batch_add_cmd_p(struct arm_smmu_device *smmu,
 					  struct arm_smmu_cmd *cmd)
 {
 	if (arm_smmu_cmdq_batch_force_sync(smmu, cmds, cmd)) {
-		arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmdq, cmds->cmds,
-					    cmds->num, true);
+		arm_smmu_cmdq_batch_issue(smmu, cmds, true);
 		arm_smmu_cmdq_batch_init_cmd(smmu, cmds, cmd);
 	}
 
 	if (cmds->num == CMDQ_BATCH_ENTRIES) {
-		arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmdq, cmds->cmds,
-					    cmds->num, false);
+		arm_smmu_cmdq_batch_issue(smmu, cmds, false);
 		arm_smmu_cmdq_batch_init_cmd(smmu, cmds, cmd);
 	}
 
@@ -1017,8 +1023,7 @@ static void arm_smmu_cmdq_batch_add_cmd_p(struct arm_smmu_device *smmu,
 static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
 				      struct arm_smmu_cmdq_batch *cmds)
 {
-	return arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmdq, cmds->cmds,
-					   cmds->num, true);
+	return arm_smmu_cmdq_batch_issue(smmu, cmds, true);
 }
 
 static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
-- 
2.43.0


