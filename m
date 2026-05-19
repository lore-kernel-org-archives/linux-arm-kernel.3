Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44482CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 03:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pa1yrbhiHR4h8OTSAieayjCH2R8IIsbkTLfMDnGh/c=; b=nN44vMzeHYvPDQ3WvJLnA+UEDJ
	l/nWKhHA1wPmi6woLLBo0GD+6OmVzj+GnWqBNr7UtTbyPTvtIjUheH9OPPROEIvVwAiuGP9o5tDgG
	+BIog7z8X+1WKY8Pidn5lji2gRBtorXpUUZJYhxQA8hjh5MfYZ7eb1OZkGScGTgH6lQ3yLCwi+Hvw
	uxENK6c9fcT7nRxyHZQ5+7QLw/oiIrvjrFNc0BLW9rmE76LCdjwBhGReF33A2VEUJldMTGw4p9Zhb
	OVlSUfpQK8nCJRqp2jbZlEhj8huAo725zxWT6I6SN9AbDbPgdzUXXgE9N5ndYNJJQzkiUSeomGHfg
	SNJeGIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJp-000000000gY-3DrH;
	Tue, 19 May 2026 03:40:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJh-000000000Os-2yCK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 19 May 2026 03:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4pa1yrbhiHR4h8OTSAieayjCH2R8IIsbkTLfMDnGh/c=; b=KjMprNaD1O7JweLK5ZmxRnraqJ
	pW/PkvPhQ6bFXnBTcdpt6Rsi6XicqzcPBMMeKoi1j0duyqttekIZf1xlJRcTGW6AgRgRUSiL+1tKe
	6nSUE+3zK0mvdcl2hZn1B7aQSDxIZzdpcTB/hnDtIvemoYNJimrAPuxj0iMI9AAs23yehYtqFqZcH
	dDsB+nvBz2dLeeXlDvFyUr9wANGpA3dHquiyizY+gAUEdv2Qx32rELm+uN506zTSuPyogZJAbZTPu
	qm/hyoM0OFNwm+DgGBA7pfqPkPh1J+Fn7G3OmomOuPLlUW6Ot5PkLgftk8dnlGQA1+ziKORCcjOWP
	ReaQ+6HQ==;
Received: from mail-eastus2azon11011006.outbound.protection.outlook.com ([52.101.57.6] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJO-0000000D02Q-1wCj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 03:40:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GghMYdsZS9c8Iya5H8jlJ2QhfXzIjozwdubfF2EhoHBXMXhLxdszg2eTeZ5ttJQ+ay0T896NZilfRVMzkMvoJ8OYq6C1iTJSQYUCBn4QbSzkCeoj+NjNjXQeFpU+KhaivWc+p05wGLzCZVDOURghWlrDkpUtwKMRog8eSshk+R9np6NRs2jBPLCFuXyHHPH3HPifT8p2iZOzYpS06qWO2ot+LUwaQd4eHroumc07UIfjeTFbCtABkEaRiZvinFrb24Wfyfw6y3DYrVemYQrfSCAwnU5oKeeNXsfjY/lXLAv00HGtZ0NtUc1wivuVxVL2Uig59/ttKOgqtrQ/wHHaoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pa1yrbhiHR4h8OTSAieayjCH2R8IIsbkTLfMDnGh/c=;
 b=YcHfXNDvp5r2l93L0vYpIXHD1SKxacYS0MgTznZQAjQSVmEsJmt0rwmoTWRXluzeuHnqdz+SHoh7DxUI1ToGVDJkYe8QWFCZ8MZ/DG2VjCmWhl8hkYFKcL3V5lVG1ISgQV3zEkfM2w8IUKYvT/p7ArM7Kz0HRNnuuxk9WA1M3xcI0tE/RQtUPKPmG6KL1tc+liQ+IB3xxvbiZh5E1zaJ0PYZlS2omDKw3oWQxHk49S9X6LxudHklnPSK8v7i0Oa3QKx4E66HC00Fv/FvT3V3sdjN741qhqYdUhq1i1oMIT69O6KVVQs4XODeomFgiOqhZjcl59T0vk5+oOV/gmR6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pa1yrbhiHR4h8OTSAieayjCH2R8IIsbkTLfMDnGh/c=;
 b=I4d8Ngh6R+BN+vydno9ZwXVpq8263R56w8YbwN1+UTCVJLyf0mJr90xAkRtG52mGOjwMSvxOFJuH9UMQpBGF3VTpIdK5zXfzuViAilw1YFBT9I3uOZ2uJ1XafCjppf25vU4d8W5rGA69tyDjfUQsnSGs+2eQfKjmh65D+FLcRgGrgU3uYnF/9IQBBnGquPCK8seMryv7YHUV1gFzs95HRZEqgWG0J7XiOjfMlGp5kyhClRYb8/MmMnWDKkMu+zHMXqYl98a/XsVrhuFcm4qfNjD36TWE/gxvKlH+0Qd6PafcSIGZ7uBd2uc8byBQY0BHQbksXx1i14qgRDq/Ave8eA==
Received: from DS1PR04CA0001.namprd04.prod.outlook.com (2603:10b6:8:44f::8) by
 BL4PR12MB9481.namprd12.prod.outlook.com (2603:10b6:208:591::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.19; Tue, 19 May 2026 03:39:58 +0000
Received: from DS2PEPF000061C3.namprd02.prod.outlook.com
 (2603:10b6:8:44f:cafe::6d) by DS1PR04CA0001.outlook.office365.com
 (2603:10b6:8:44f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 03:39:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF000061C3.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 03:39:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 20:39:44 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 20:39:43 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 20:39:42 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>
CC: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <vsethi@nvidia.com>, Shuai Xue
	<xueshuai@linux.alibaba.com>
Subject: [PATCH v4 16/24] iommu/arm-smmu-v3: Co-clear pending CMDQ_ERR when queue_has_space() fails
Date: Mon, 18 May 2026 20:38:59 -0700
Message-ID: <69eb2fb1d32e5a6e6f23d3e01cb6ee7c2da766b2.1779161849.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779161849.git.nicolinc@nvidia.com>
References: <cover.1779161849.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C3:EE_|BL4PR12MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: cb36f2f2-7ffb-4c74-9651-08deb5584c83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|30052699003|1800799024|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: B8It24c4dhcCxeVKfijZpocO9/lnHmTHiniVY4gXVySgMH6ukktFXxvKInWa9jXnU3xNCo3b9im0FV00YrotJiioHDS3y++RyUifBGukezVxqfIMuqtI7SUBU1ZwOBUniI9Szu6bm/QNYNFCYySqcKm0GcqiRlGWtBYTPK11micqs2G0LQGT9tum3qF9cFG8vJoh9QvnTDL+VwFhP/zwaHYLAMZZl80PNZndFEnA94danj2guE5rhAi5I6AoCqL9gdhEFKgzx2IPlZpv/UIlPnUygAE3FymROzMS95dUbmyl7lxUhugZvRHXV+twSPgm+nzOsfoKestAX4WBStAPp88aGbNgDCJo/10lCwgmAz8AhMuEd1bQwORInWyPL9bCAJtV8rqsx9DUKAQBDXFkrwhqMvC14S8Kipipgzi8BFNyzHGzXAgojI07Wd33H9GeDzdE4XqTVECqrIxelaq2pOcx2UwXidOpxkn8f/uVUQioc8SJLkWPKKGiXbgvTeMR3Omv/1uSNSiEG4FByXqwdOF7yQqYKl6LQOA/Z4FEv9wiXd+xD/qhEeVBesbdwcdA/nrum7LByec7zWZP8EBGqRvO1Hs+6wPSKOwrXZ7xmlUUQoAN8tqDvXdVeIiQL11myREpYHTJcNPyLH94wubdVtP5WjytIYgDtxanvRgTKkhBCffIcZDzh38YwpEoZJx3y1iX5L2/dNx6ZEgN3RW930W0xmox93ZK1Q/rcEiPIVc=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(30052699003)(1800799024)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ckf7irXdNqSmvwUp1Ill7whtCOscEECMAMb7Fj4Rwb/nZ6n4+dly8b7P1i3OXDnpLK/h3anstdeV0ilxKrtYajeH1hwtnDkhhky5IU2rJS9KNbmBxqsIlPjSQvAqejjaUidk8lCfkI3+vYLSismLY1L2NrzM0mEnGvHUOJPGIOyjV3/NLfyRjX+NER7fQm+WFu/7vlsecp0QSlGXMkRCdW9wee0b57HYmIF8LJJGf6LzDRd+yAYByNcsv8ZuP7DWLsdOaXcZamlJxUE4kP/FMpQQn/lRB7IYMONOqLV3lsTu/5T7E2S6tmT5WoM5JxrBkZyFEcS6Z6pFtXNrYHO1mR17jaidq3rjyg37rPQiMxeHLzlrcTBGdSrlCfptcg31bjWEyYiqMxpcGDprd6aHTPQEvKQmpm4OnFMlR3usmNJ7TWQZU5ApwKLufVCq8yUJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 03:39:57.7284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb36f2f2-7ffb-4c74-9651-08deb5584c83
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9481
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

It's unusual when the command queue fails the queue_has_space() test. There
must be something stalling the HW so the queue does not advance.

Currently, a possible scenario: arm_smmu_cmdq_issue_cmdlist() may be called
in an IRQ context where IRQ is already disabled. E.g., ata_sg_clean() in
drivers/ata/libata-core.c

When GERROR is affined to the CPU currently running with IRQs disabled, the
GERROR ISR will not run and a CERROR_ILL will not be cleared, which stalls
the HW; arm_smmu_cmdq_poll_until_not_full() then either times out or loops
without seeing CONS advance.

The window is narrow and it's very difficult to trigger this lockup. Yet, a
subsequent change requires serializing the STE update routines between the
attach_dev path (mutex-ed) and the invalidation path (non-mutexed), where a
spin_lock_irqsave is inevitable. And this would expand the currently narrow
window to a wider range -- arm_smmu_write_ste() as well.

Since we have a cmdq_err_handler, call it when queue_has_space() fails, to
give the CMDQ hardware a chance to advance its CONS.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 7f81fd2e92480..0e4f34ed036c6 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -723,6 +723,13 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 
 		while (!queue_has_space(&llq, n + sync)) {
 			local_irq_restore(flags);
+			/*
+			 * If the CMDQ is nearly full, it's possible that the HW
+			 * is stalled by an unhandled GERROR_CMDQ_ERR. Thus give
+			 * cmdq_err_handler a chance before each poll.
+			 */
+			if (cmdq->cmdq_err_handler)
+				cmdq->cmdq_err_handler(smmu, cmdq);
 			if (arm_smmu_cmdq_poll_until_not_full(smmu, cmdq, &llq))
 				dev_err_ratelimited(smmu->dev, "CMDQ timeout\n");
 			local_irq_save(flags);
-- 
2.43.0


