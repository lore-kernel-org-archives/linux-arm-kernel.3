Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEA6606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 05:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JAdguZNc;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rmSsIcj+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q5QnmhwZuDC9ObQDFL5JnuDhfnM+slGOt7CAo4RC9hc=; b=JAdguZNc+oPl3ECKOJWUzBxrK8
	J2MaGF7X5mGtv36a0itAEfCk954Q4sH+4Nm2R/GhyMHWVGYqyMDTl/rJTVz7gk+zaFS6qKfICdZ3F
	QAKvEpu0WppVFdz8NFTMvHogqI7Elyc6z+bRkxyPtSq9rAYd6ANaHwOu10kRSlySvP7j5QuA8MBeH
	4c7Lx5Wi6x3lWPOjcsEBAjmZ6XbXPjI23bNv5nrjkqlID2NScAVObQ8DTBY8iA+PR0NjswD+TnMXH
	B1UImLprh7k7H6WE1Lw6A93XcUMf6ebm4vY+bERGuluGtcIyX1Eha6Pdbc8LduN08erK9ZxsNjBUF
	Z9gW4VWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkSe-0000000FYkM-2fdh;
	Mon, 02 Nov 2026 05:20:00 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkSc-0000000FYgb-15oT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 05:19:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0tXrRkMSiWwziAL0+Jt1jCmwHwRVMu1mVbACj0HuaXQj92jAZZw++bOx2VkGw+Z9Ktz/sKTg0GmhweTIuEtrRn2a60mqIS/GmRVxVVVuOpTWzHWI8sf0xGRACUZBa7GpQjo0xi0QfUa3gAoZnCip9T6myhKGGv3j1E/cowBF9cC5aFDm/I3peAWdsVOV31wbjxwo/IUxBS8wQ3U3C7Gc4i4gv3wFkCpV3qqyQ9Sa86K1x5T5fjLuDxzmd2wvhr/gNOpOim1xcSFji/X/MHDusnzTR4PYaUBZHhbe1h7fpKyE6QfhBXYvRhsxHLRRF83VV+WkqE+i4cqQj87NQqyWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5QnmhwZuDC9ObQDFL5JnuDhfnM+slGOt7CAo4RC9hc=;
 b=jqUYl1eVxZEHFvoiYwO8X7craq9iNrYwPhzehrbYcKhFEjgaCHXb5H4n7CwHVXpaEpkcaTUyWWRWb4wwAI/YeBBZNkRic2KBCG3mut9k2/AYKlxfUZr5/axX0b/GEZYYcQFpoHTtk3mMljkNpfRbK+heccDWZn/MXT1x/GlQGQTwXK88VAlIBxp4TCjUpXJc09YGpCMDlCJPSdcKLL5WJauaCoy6nietDca8Gu6ZWZ2Crjja8VZkdQZ/bMaah2irAHM6Cjn5/+kRTtKMcX8f6m3TiQ/rOy4q1AtlSBcXF/KJQNqYw6NEoXctoaA4siiKfogtRIaVqE77h1bvHjLcRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5QnmhwZuDC9ObQDFL5JnuDhfnM+slGOt7CAo4RC9hc=;
 b=rmSsIcj+LSuDazvs4NqpEmPUjzPQI7xaHw6wRHweeLwqoC1EDVmIRJ6YTK6YAUu0RCFk56nXe8d9dvXFQbV/6RzjxmZZHCUo7KWw8COMWvV1vOtFf/mj7ycpjLQ9LJTRf4KqO8g3Ee3wcKsGnkp5NwpWxtNrnJSOjcZOVtVKxJ5ja/BDk9DDOSVuAy03WXrFOClx9nlTF4mYrypC37fI3ww6lo/EWieZhNDaRFw+nfGlerz50XaE7IsOoMDabqCvV85ODimSD+IUN05pcbDbLqAWK6YFe8u23u5CWX1XaOdmexAHDv5NDmBbaqcZuAoJ+HeYP1ZKeAR/rIHKg9Jlbw==
Received: from SJ0PR03CA0300.namprd03.prod.outlook.com (2603:10b6:a03:39e::35)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 05:19:50 +0000
Received: from BY1PEPF0002696B.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::53) by SJ0PR03CA0300.outlook.office365.com
 (2603:10b6:a03:39e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 05:19:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0002696B.mail.protection.outlook.com (10.167.244.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 05:19:50 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 1 Nov
 2026 21:19:36 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 1 Nov
 2026 21:19:35 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Sun, 1 Nov 2026 21:19:35 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <praan@google.com>,
	<kevin.tian@intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>, <kas@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>,
	<xueshuai@linux.alibaba.com>, <john.garry@arm.com>
Subject: [PATCH v12 06/12] iommu/arm-smmu-v3: Disable the EVTQ and the PRIQ in a kdump kernel
Date: Sun, 1 Nov 2026 21:19:14 -0800
Message-ID: <325a9bb2908f4a163dd3a82099341dbac4ad304f.1793593923.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0002696B:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 371cfbec-f011-466c-d5bb-08df38a0eb2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|7416014|261021135927099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261028144727099003|11063799006|10067099003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: iCDO7Uu5oVGa0+JdELYxD7qBAFZ8GdOCYAfxpcSR8i5j8XfA/vQ1+OTyw4bDp0ZO06naDWMm/h8gkmS1edVqJFRtg41Nxpcu2yZqJ2xD/EJ9KhaS+YDixp7Rd10lCweM5btpj8lrd48MBd5No6JogrPCFgc5iRM5B1/PtXBqFb05f+q2hcGtiWO15bSimApGuLVtH/u3HQaOUGtQQlq8ZAdBNsSsSqMXK+o/VopPpwDI3xxy/8U/X7gUgOVTlI/SOLEFNdMq2fGB+Ie36QJlJAKbpn4yGu/28E2WbTgsgOUAHawnd408o8Z+Km8kxT46g+8V9S1GvonrkIraCk/k3p4w694BDe9ahB2AzQi7iXCQkKk8e2XMpXzCWEdPjo+O95beSAXLPK7bjoco9I25LIVF8Cu7nfFVB5wKTRTWeRRG7Q93yV8eLJ26QcwXvHMzNWhLgsEu9uET0xnvHWPzoQ+scWNRNIGs+b7Ktl7bnsaWVEv9zbQ83OpH3uSaqJDdJRj6mHXtCJZI07l9Y598w6nm3P78/8z/X82iGhpDqiAlcMcW9j6FzUhbNvIBgj1G8QZUQKARaQ08at4FrA2WvOPGF/cI+4pl+eXjQd8NQhvfRcNlnnfSY2n3krSBsF74CkUrV8+7fTRNEuk3WtYI6WFgucS/RrmhLjisoplm4Y8eTBtDV9A6fH4M/w6gjiuXr3yPICv4MPnyjJcuhDzQSA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(7416014)(261021135927099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261028144727099003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5RH/LjmaMjpZb/P9zYeufRmNOx3nNJvo3aG3yTwPIbLSJTsaTt9ML8H1yd/ZrTKU+Ue9gu2mgKLNsQYlz5urFeN7FL72EMydUZPJ9Mjmqh4/iRRtw/1N2Z1EMelB2Y7Zb2rWYhsA1dUOPxLZpuhIs9SEF1YkpZdDT+8jBci7hxBqulair7hqTUlmTB+lA7pCpBonRgvvVb5KNtVIIyhGLpfhCJSc3DvDYB1fSoJ7aUTzqICqh63NxhUcWCCcwcWIFxAnK9LYQVVnkFF3GmAwE+8pP7ZL/PTrGabIOk9ndGHf6OX1QM3hd/F4AjqQGd4olL7ioulKDepVJpoUrhjkTazBbifuiARP6bH3jUBBkqgcUOwATQgMAbg6SbI0LINZySE2CSofikhvuKqloEDovouToTu1vTYlYepNAhapPBfYIjeB9pw+O4GhWKN9wCBr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 05:19:50.1090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 371cfbec-f011-466c-d5bb-08df38a0eb2b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0002696B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_211958_306821_4D88E512 
X-CRM114-Status: GOOD (  11.84  )
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

A kdump kernel cannot use either queue. The crashed kernel's CDs and page
tables might be corrupted, so events would spam the EVTQ, and there is no
way to serve the page requests that would arrive at the PRIQ.

The reset routine still enables both of the queues and then masks the two
enable bits back out, having already programmed the queue bases and taken
the interrupts of both.

Clear ARM_SMMU_FEAT_EVTQ and ARM_SMMU_FEAT_PRI in the probe instead, so as
to entirely skip the queue initialization and handling in a kdump kernel.

Suggested-by: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/all/amiBagGKn-Aym1DK@willie-the-truck/
Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Breno Leitao <leitao@kernel.org>
Tested-by: Cristian Prundeanu <cpru@amazon.com>
Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index b1222d6f771cf..18ba48464da0b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5244,9 +5244,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		return ret;
 	}
 
-	if (is_kdump_kernel())
-		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
-
 	/* Enable the SMMU interface */
 	enables |= CR0_SMMUEN;
 	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
@@ -5573,6 +5570,15 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	if (arm_smmu_sva_supported(smmu))
 		smmu->features |= ARM_SMMU_FEAT_SVA;
 
+	/*
+	 * A kdump kernel wants neither queue: the crashed kernel's CDs and page
+	 * tables might be corrupted, spamming events, and page requests cannot
+	 * be served. A disabled queue discards new records without raising any
+	 * global error.
+	 */
+	if (is_kdump_kernel())
+		smmu->features &= ~(ARM_SMMU_FEAT_EVTQ | ARM_SMMU_FEAT_PRI);
+
 	dev_info(smmu->dev, "oas %lu-bit (features 0x%08x)\n",
 		 smmu->oas, smmu->features);
 	return 0;
-- 
2.43.0


