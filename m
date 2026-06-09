Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2A5CD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 07:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jaMPIM6KX+UST2o1FwG6tW3QIGROy+dkeeNMng5ZTg=; b=yEqSTtjtQ/hWpdFY0G0p0AyRcd
	4DFYIFcPCfrcwB4Dr7FisxdvCG1BtV69PZIlfZHHk6zoIhPJ8zMWw0xn7ZUNjdFayqoH8jHoAs+al
	BuakWTCBVIbWYH7BFjYraVbpc2iqmk6NApEcbtk6u/03MM4sYpKG+lGPwh9FjbNstmn1H5vEAN51w
	WFTB0HWl+RW4skxo35LNnj1pCFjQQD2ao6A5DDaZ5+Yt6jahGOxpu+bHftPdza69OesajU6gxWDCZ
	0RbsT0/SXBaldxgFlN3izHS6BgtJLyYIWENbtt1LQB+QmL4mAxrAw7Y30jUd3vasz+HKxb2fICyac
	cYTwMRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqx2-00000004yCh-2oSX;
	Tue, 09 Jun 2026 07:32:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqx1-00000004yBY-1J3E
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 07:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1jaMPIM6KX+UST2o1FwG6tW3QIGROy+dkeeNMng5ZTg=; b=L5dk9jUGb48x9PyIu7L7bRUBqi
	G4qkT5aKjwvrEneBfXaou/9jvDqP4/HqVih7V4ImnryGlK0WrFEwUS0c74WkN0q7URJxpVkl6g0bW
	VYzOCL2S0jC0xae47WemybT/+jmRuBhlqaL0d2F2rYyZ3g9YZuUCgKWeOk8kJ1/ST/D2U0GUTfHnQ
	k3JYGu1rcGpnkJS26VFKz+uHOecyrzfyVu7QM8prIUpo+h2bel1fUoL7sN3hKQNsjM/kDjVhem4Qj
	3rhr/XIoxxwaF5+29ldBokiiMz14baAiKes/dBMiF6dR9n3zJfmkfwC2pxFbYq5oRUfNz+j9ymS15
	bW5q86Pw==;
Received: from mail-westus2azon11012041.outbound.protection.outlook.com ([52.101.48.41] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWqwx-000000026Kz-3sAO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 07:32:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKqEVhJeOrQZ+5cr7VB/Qex4NSzF8g6ZHGTGw9sazPcjDwwKjaWvcnlutHxOOOct8pbKuQG+kUiTfrcBWuhL50Lg0hc/mvf3yXRYvxeDHA2KUdPTOULjFfEDQf3oK+vj4SDdm4jRNu6zNi5NJvTB5u7H/c4zxM6t844+zZKWsay1k9gJ0cYvLvqm+ODnBf1CLr1sQ6fTzRKz1ppo3TFRcBXd7KA2huB8RPNM5wNQ0+Xu6k3HjoG8HuJWKmlioCAoGsT4UyTZvnt/NIbd1AYnAvakilLbDNS+tQ9nx0Sg7x6wrwy4h0wlfLhy38oCrZq4y+n4C3Kq38Pu17CcBHkwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jaMPIM6KX+UST2o1FwG6tW3QIGROy+dkeeNMng5ZTg=;
 b=sAv8qz8vu2hwtq6mc0CqBiYSs4lIHMXkJmj/TevaRGbuUV3dGjDoMFf8a5l7xzFwDvqT7Wd8/VrCLh4G4z53/VM9JK1jIkwZWl0YjMVhQZPDJDbgIXCOeQJT/kb8fjNXQdQ8f3n+9UPVzLY69hu2eYxIy3gLoXhXP8mfGcA0iSuhuz3rv3xYiY/l48UDnuBJgTQX44mQcJHZYaqcSS/NjDVLY1PZ6BVFW5R8I81kVtr5UVxi+yU30xfbl56dxKBqW/kOXpFDHeCMxEhQArbbRqn4BBtRH7lUBUZMAmFYjZq9T6kV0HeJsKdUsceWULyAdzwfZaSOcSAFkG/1ehM+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jaMPIM6KX+UST2o1FwG6tW3QIGROy+dkeeNMng5ZTg=;
 b=GRAfGLrcHuYRveSRpsTkoYdtySkdBXhf1Hd0Xm/aMi7JKQkRKuCYv8P301hVeJV+/RajFaWlwR/HRHQH4b76Pw/P8Tk5rMh/hqtFa6qERiX2Awwn09NWo3X7hMEsIRMI2TzLI2Dfp8Dun2q590M/kVYkiEOJSZJpz3lE9Zw3wsP+v9XXNxqcRiAwszOCQ3KR/uG9/crgtE6I6kP6UZpnepJVKCKpSg1EinjbxFMuGvY8b/LL04EIcVQu4WbfY2jSaS+Jp0uXPLchYQVf388OjvrV+ttO5WyEHfpV/CtVFAdlkOw8Ynck1gGmLmFA9ej6YKGLz/V19u1f8PFgJIonHA==
Received: from SJ0PR03CA0342.namprd03.prod.outlook.com (2603:10b6:a03:39c::17)
 by PH0PR12MB7816.namprd12.prod.outlook.com (2603:10b6:510:28c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 07:32:26 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::64) by SJ0PR03CA0342.outlook.office365.com
 (2603:10b6:a03:39c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.14 via Frontend Transport; Tue, 9
 Jun 2026 07:32:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 07:32:25 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Jun
 2026 00:32:08 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Jun
 2026 00:32:07 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 9 Jun 2026 00:32:07 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@ziepe.ca>, <nicolinc@nvidia.com>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ashish Mhetre
	<amhetre@nvidia.com>
Subject: [PATCH v4 1/3] iommu/arm-smmu-v3: Factor out CMDQ batch force-sync conditions
Date: Tue, 9 Jun 2026 07:32:02 +0000
Message-ID: <20260609073204.1760077-2-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260609073204.1760077-1-amhetre@nvidia.com>
References: <20260609073204.1760077-1-amhetre@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|PH0PR12MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 40360114-49cb-4c6e-6334-08dec5f940f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Dd3g0kLTBXy476Q9C+TnkhYrps6CEAKZkO0taHIcaQBIrGoPcbjV0SYzok7f+UyLGu+fWE4TtWh4Q0RQyviPMuSf4ye6aHxLZzo63CvIUd+A8ft5hd3IjE1pdRf1eMuga7BLmaJqEJ+l8njyRDjhn9yMpamjnuwVHJiH80yOtoaJ1QX/tLflZDt2mo1pb3XmmkNJunyugT+4USd/r4sc+fKD1JHcnJmI795ofSaSzB75mb/AluXB7DNPnW4sMc7rqSDAPDb0pOqcSEpe5yBaZQFlKvo+QUP2uW0luAWrXdvHyVFsMfnoG0Y1qPDdL2gNb7nlfGBgm8blESI4KO2s6tlxQ5YUWPhDYUhszfwkKlpTHcrbGb8LGYM7ouKqYgk8gMrOLqGlYtrQvwsyQ1qJX/Gy6AmKT9cnY602sHr4GqDsCOiK3y/5PSwS3y20D2aFs2wAIEa49vTsIudcZpqrEf1FR5/RD1MRnW7wUOfI0ygePwgxbHNsG9C4CDxuMDB0/PQ09PBJhrDXSlExlDHxJGSlOT5iT7IHefhA3jT33LuVSWVqN7EzhhrGGmhqQuohodBBaeU7IE4/G1Fxi8NCiKyrtqK5nxAgj6hYPDgcjy5wC6YIyAMzph8o54cEWAVMRQalihiOlNLZzjXOEIUQgMNqhPop8THJKyTPHTfABS/vOn2e+oG0q17wXGl2z2TJT/mEiWzZHFT/1ge1YUVo4Prjq8hAp6+cdIuZqQEyjaE=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8+Eu2dZ//Jz3OHYYzLYbdt0ADHDhoAUqX2LBC/4OLAYE3M7Ly3aNreX/02DHSYiFLXl65CekPj22y4d2yfkoasHPgMZ9a9DTjGXzIl+5Ovm62FxHM5rvSUBUUlvqQBjeUWnFDgh6QNuI8Ia/nTSWuZ9WEwsG5wh8BwRrxGz3PP82sU+V+xOZcjUJwoSm+WH4V90l4nJ+hEeRTeNT0WqOvAu+dHPZ+rtBxvwd5tfhevrRthW6qW5luiQj62XbR78CrdfF4AIsSP8XhlV4maZGkU2159AsfuCl8jWvNZpe/muoqq23W5B97AnnFxC6slLJzlnHFL/jYpZtApNeP7KJUXXBer0HhiFqdWYvWibC+sDM9DMX9VAmEQUNEcM5G5BQJvBTYsNBhdTiuNTu1gf/GmuqW/beLWYJTYwIaIvf9XYaYklAmdH7j9FdWT5V4/qS
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 07:32:25.9798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40360114-49cb-4c6e-6334-08dec5f940f9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_083240_373867_EBE8F7EA 
X-CRM114-Status: GOOD (  12.21  )
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

From: Nicolin Chen <nicolinc@nvidia.com>

arm_smmu_cmdq_batch_add_cmd_p() carries two distinct reasons for
flushing the current batch with a CMD_SYNC before appending the
new command:

  - The batch's pre-assigned cmdq does not support the new command.
  - The Arm erratum 2812531 workaround (ARM_SMMU_OPT_CMDQ_FORCE_SYNC)
    forces a SYNC at one entry before the batch is full.

Lift those checks into a new arm_smmu_cmdq_batch_force_sync() helper
so that adding another force-sync condition becomes a one-line
addition. No functional change.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 23 +++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a10affb483a4..76efe479e80f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -847,16 +847,27 @@ static void arm_smmu_cmdq_batch_init_cmd(struct arm_smmu_device *smmu,
 	cmds->cmdq = arm_smmu_get_cmdq(smmu, cmd);
 }
 
+static bool arm_smmu_cmdq_batch_force_sync(struct arm_smmu_device *smmu,
+					   struct arm_smmu_cmdq_batch *cmds,
+					   struct arm_smmu_cmd *cmd)
+{
+	/* The batch's pre-assigned cmdq doesn't support the new command */
+	if (!arm_smmu_cmdq_supports_cmd(cmds->cmdq, cmd))
+		return true;
+
+	/* Arm erratum 2812531 */
+	if (cmds->num == CMDQ_BATCH_ENTRIES - 1 &&
+	    (smmu->options & ARM_SMMU_OPT_CMDQ_FORCE_SYNC))
+		return true;
+
+	return false;
+}
+
 static void arm_smmu_cmdq_batch_add_cmd_p(struct arm_smmu_device *smmu,
 					  struct arm_smmu_cmdq_batch *cmds,
 					  struct arm_smmu_cmd *cmd)
 {
-	bool force_sync = (cmds->num == CMDQ_BATCH_ENTRIES - 1) &&
-			  (smmu->options & ARM_SMMU_OPT_CMDQ_FORCE_SYNC);
-	bool unsupported_cmd;
-
-	unsupported_cmd = !arm_smmu_cmdq_supports_cmd(cmds->cmdq, cmd);
-	if (force_sync || unsupported_cmd) {
+	if (arm_smmu_cmdq_batch_force_sync(smmu, cmds, cmd)) {
 		arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmdq, cmds->cmds,
 					    cmds->num, true);
 		arm_smmu_cmdq_batch_init_cmd(smmu, cmds, cmd);
-- 
2.50.1


