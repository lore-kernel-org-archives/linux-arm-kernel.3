Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C42FCCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 00:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsLssDW0EuGv4CeSYPsGZdg+1OhxCVbuf7gfS+B65w4=; b=cqgEWWSlAfmKcHJk8cT4v8aL1T
	9LVLHXcaHHEuUdpKH6T3VCD1iKD+dh3geySsQ50FeEFL2Z96SpNPFUyYMr5AjeUyhf+wUuipNO0Rn
	Xl7YLKpg3c+DgJSE75jEEI83TwzXxr0hlyF/StZK8ZeBDruvv8IQruBG08iB/Jam/WgI9cwD2Ek/P
	u95O61y2M4kgE2nMT1gT7wDEqj7Vv6EMy/o0UKNBFV0eW5/8NpRu8cYbbVRiITwdHL42N2FDXYBfw
	52DsBk5bzinipf7mSyePnEKL5fnFyTF9WIs1KWTo2nqcW1ujUb6ZCgWQVUASWCcC9fKukZhc/ZCuZ
	xhGm9+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v866p-0000000BwbZ-1Ww4;
	Mon, 13 Oct 2025 00:08:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v865F-0000000BtuR-2F3M;
	Mon, 13 Oct 2025 00:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=xsLssDW0EuGv4CeSYPsGZdg+1OhxCVbuf7gfS+B65w4=; b=FgW6kJ+89/xppR0bqhYmr8QkwK
	QjiCO8FzGl7F3Oyij1yH4igOX4IVbuStncP4FDOSCUgC0qHNjeoHXlVRn3c891DBx+dbDb9DyXprC
	HemNOCFPuTKhn/QAS+kmeLBHKhn1Ux+psbEsI71eR0bnQJgR+kBAkvypDgTlbmB1CqQptyoYT4mh6
	QxSmXsER73dx6fSYXi+puT1B9x+j4Ht3MQHYZQgBclrFgS9NStvJrMoEZXTSKroObmsOxHdpgrl8a
	sLqGfSt9Bd8ffZ4Xy447+RJlznBforrAgU84ZvS+JvRCO5z3JNWdYiQtKbqK2URDqQOxqanW+HxSM
	bzn4m8Cw==;
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v865A-0000000BF4K-1bJV;
	Mon, 13 Oct 2025 00:06:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfvsypoAgTVe7MQWX4XVGmfheHCDlCaAirU1PfDbf12r+WkEuy7fBQ8yJUMdZc55+qXkHTANylgaO3Xqq5mPzBJ44xrHhTnGtxOA9qRTLore3tx1juCt84lfom5ktufWeDz1UigFQeIBH1PtLs96Uyu+2vIpbafTbYugg4Er2y9eXc+XWNZK/beF0VHMD9VyYGyDUjh7KxTw+AGLACF44tO4Xfw8N9Ey/AFpD72+LrxaT1iNZyLAml2zxTW9lRIDN1cOhK9BZ7J+dDjbDKlQEXKS31MICQrBvnS4+CQrG8FbDfGkInuLf7rXk7G4jyPfuBMUjCNUh6aC0/Itmagnbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsLssDW0EuGv4CeSYPsGZdg+1OhxCVbuf7gfS+B65w4=;
 b=jknuK0qYT458aijU11uAVWa25Nh7eLkTArmwi231dRFgcPuKo3Tnux6lJ5Y+JS69YWzA+0yfkhM4ET5YaXly+y+zfHJR/EeZc8Q0F1AcGXCQ2USTxvxlQUyoIrUDCYZzkwTNxA6g4TTuPQdcXbA82BHuD2MuGfYydSeK8P1/juvlFFsHL/c3jjMYmjPWbmfDJwsgdRUKsVwcjyxf1E8yDK85TFWxjsXdBh6GBsGTEzBe1TG+cQDr195ft43Bh4ZJHJzsQhECXthUAY+uen0ZEcmZ5EObCNDStGX6niL0EZRYgl2/1YNOe0w1o5jFRKYYhlDK7Fii0lMWmUrWqK/j+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsLssDW0EuGv4CeSYPsGZdg+1OhxCVbuf7gfS+B65w4=;
 b=a0NfeflSTpzEnTF1XRjEwkTaVk9KH+YietEh4Z9p+/1JT428MmxJR5230GBcBSLrNMzbxzUsphD+Y9CtZEphLp4K59DHJBvSMxdSbuDSvSYKQo5BH2sPXOVs1wbpRAKqAA7ycD3r7BO6riU99LQsGtOMFNK4GjNmv/hwCZnqL80KTfybnRbnMQv0FEQpmPq7qGcnlg2NAwoMkY7HlNBm/rXCO8HyrZsSlg/m8br9LqejdJTYpmPh31McbRoCjCS5qz62SQcBv/BsxRBRaZhMR5F36hzmq9SMi8RaJxMLfLsIeDBXGyJDb5oh9zSC5UmziJG0PdZdjrCm/9FeSOEj/w==
Received: from PH7P220CA0133.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::20)
 by SA1PR12MB6799.namprd12.prod.outlook.com (2603:10b6:806:25b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Mon, 13 Oct
 2025 00:06:24 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:327:cafe::f2) by PH7P220CA0133.outlook.office365.com
 (2603:10b6:510:327::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.11 via Frontend Transport; Mon,
 13 Oct 2025 00:06:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:24 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 17:06:14 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:06:13 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:06:11 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <suravee.suthikulpanit@amd.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <sven@kernel.org>, <j@jannau.net>,
	<jean-philippe@linaro.org>, <robin.clark@oss.qualcomm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <yong.wu@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<tjeznach@rivosinc.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <heiko@sntech.de>, <schnelle@linux.ibm.com>,
	<mjrosato@linux.ibm.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
	<patches@lists.linux.dev>
Subject: [PATCH v1 17/20] iommu/s390-iommu: Implement s390_iommu_domain_test_device
Date: Sun, 12 Oct 2025 17:05:14 -0700
Message-ID: <792e825476efe58d14cc16cca18209a2b6088a4b.1760312725.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760312725.git.nicolinc@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|SA1PR12MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: 62766a9d-148d-428f-3aae-08de09ec58e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pYp+ICfEFqQUQUY/ydYHFnkJR4znATyhcdCLGd3W0f4VVhnDQloIvK8csF27?=
 =?us-ascii?Q?FyogxOV1R3cokNBys7DNRLSEGI5AmzcnJSUANyFxMAJlon0ElkIYLOU+wz0r?=
 =?us-ascii?Q?vurqqenaNA0VPFaUIZLQaTctnBqgZSl74C2qVEIKhWzfoNj+4rGvjAulDhxl?=
 =?us-ascii?Q?rS/6PrclOzihD0FB5azER3yZGemSgcGX1vYPprm1cTChiWqtbAZMTF5Ks/ek?=
 =?us-ascii?Q?gabORs25pk/B78lztgAO8n/cmweEKT7G42MJosI0bJ/FH3WSWyrcOxTHiusI?=
 =?us-ascii?Q?Re4e7VrOTMER+fw4x+hqcoSDvFWfFAltugEP39Q1nHploXB+WB8ehI6tjacb?=
 =?us-ascii?Q?iDIfrinNdtpbPzaiNeJuNQDIt1asW93kFASMcD6DeXTt9IGmLyp/RqaPM86x?=
 =?us-ascii?Q?zdcNSfd2EPT6xlwX2O79tkGYF8XOO+V8b2Y0wHbbYeywfRzWoQ2KtQvyxsuZ?=
 =?us-ascii?Q?iWohvTByDJQ7A9Afpn5nvvKbHJMEEDXb6FYaTqwXbUOtOlDB3kBpYXnKCuin?=
 =?us-ascii?Q?0IlcDYkA1QM3R2qh9yZqiuFGo3UrhXXVyI5qj9t/S2EHyIBWnsm7tSUxkL+Q?=
 =?us-ascii?Q?ef7vGLqzRfZVHVrQD7d6XrV2I5MzsHNrglSNuXOuDHD+L1ucjc1eEvJ/PtzG?=
 =?us-ascii?Q?NO6jdOztmSSXWGqhZdZEJ8HhJmOu0+zQlAvKHhoEg/WRUH8sFPu3dRYs1XJL?=
 =?us-ascii?Q?DwATg0HqpzN6xlGEuUExaWjwF4cgAeeHLLabGDB37ViEnyLOhOs9SdQZqUtL?=
 =?us-ascii?Q?cV7FjNQC+V+PFKFo3LtBzGBVFhL2U8vR51MqTrUETdYaZiBM5DgfLMuNnlJJ?=
 =?us-ascii?Q?cN3HOf5uaBOmRfkPMD4io+XT21IMK2xEgHmU6RMjCh6Bo0lJiqsmP/DE7MOO?=
 =?us-ascii?Q?cB83X8gLwfyd6Tf+qpviqtpBDnj33Q1Flj25GbDGve9StZPSUXXEiAZBahyt?=
 =?us-ascii?Q?opbApyslwR9S5FOu1iPgsk2goG1vEVwPZV0k9kiG7netgKxTBCU7doDpXloh?=
 =?us-ascii?Q?qNXY1MfMaMoZDWk+oJJcp6v7kOXJ08h6GCf2tHiZGreKJ3a/YIJzyD+WCIW2?=
 =?us-ascii?Q?m6b7/nAWS4OuBh0aCnmUHytyICimtrMsdG2t6duukyX5kzCJHA+7hB+xs8Kn?=
 =?us-ascii?Q?EOP+p8BkiTrBnt25CmKNBFpTYfAYSPR18TYnCxQkRIhZ+zcl6cV6D5liDpNd?=
 =?us-ascii?Q?GCW6/tDb5NL9+sgrhDoFVZxfhwT6HOa1jyjP8jGlI1Jw4pxRgSVxgSMEjva+?=
 =?us-ascii?Q?/4j8EgkGsu9R9kxK4xnkeURygDU5uVGM5/6H5MRXRwujWJLeePa95q6LOgot?=
 =?us-ascii?Q?5oQXmdpGB1T0L/rejnAXj2GDB9eVZFcRj7EHaHlHdLswB/umo+ALRgKXI52w?=
 =?us-ascii?Q?uQtrcqbjr2t5dBhER2r4SdxRIknX6N8KWegUDRSwWCGz42w9nFZ4/+vDw7oI?=
 =?us-ascii?Q?XdJD6zTfD4RaSYI9td25Tc0Hzp6MOHtGYsu7/zaSTcz/p81rQt6lAaebCZP2?=
 =?us-ascii?Q?tWELF9BEsKOZWqXhqHkZqUuzjJomD0xJOX8+Umks1xsc0eWBNIeGVOfbyY+R?=
 =?us-ascii?Q?cEw/zxJfM6iZi5hX5j0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:24.0454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62766a9d-148d-428f-3aae-08de09ec58e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6799
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_010633_646264_393E133C 
X-CRM114-Status: GOOD (  10.29  )
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

Move sanity and compatibility tests from the attach_dev callback to the
new test_dev callback function. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/s390-iommu.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index 366e47978ac07..3c6141a4a1faf 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -694,6 +694,20 @@ static int blocking_domain_attach_device(struct iommu_domain *domain,
 	return 0;
 }
 
+static int s390_iommu_domain_test_device(struct iommu_domain *domain,
+					 struct device *dev, ioasid_t pasid,
+					 struct iommu_domain *old)
+{
+	struct zpci_dev *zdev = to_zpci_dev(dev);
+
+	if (!zdev)
+		return -ENODEV;
+	if (WARN_ON(domain->geometry.aperture_start > zdev->end_dma ||
+		    domain->geometry.aperture_end < zdev->start_dma))
+		return -EINVAL;
+	return 0;
+}
+
 static int s390_iommu_attach_device(struct iommu_domain *domain,
 				    struct device *dev,
 				    struct iommu_domain *old)
@@ -704,13 +718,6 @@ static int s390_iommu_attach_device(struct iommu_domain *domain,
 	u8 status;
 	int cc;
 
-	if (!zdev)
-		return -ENODEV;
-
-	if (WARN_ON(domain->geometry.aperture_start > zdev->end_dma ||
-		domain->geometry.aperture_end < zdev->start_dma))
-		return -EINVAL;
-
 	blocking_domain_attach_device(&blocking_domain, dev);
 
 	/* If we fail now DMA remains blocked via blocking domain */
@@ -1177,6 +1184,7 @@ static struct iommu_domain blocking_domain = {
 	.device_group = generic_device_group, \
 	.get_resv_regions = s390_iommu_get_resv_regions, \
 	.default_domain_ops = &(const struct iommu_domain_ops) { \
+		.test_dev	= s390_iommu_domain_test_device, \
 		.attach_dev	= s390_iommu_attach_device, \
 		.map_pages	= s390_iommu_map_pages, \
 		.unmap_pages	= s390_iommu_unmap_pages, \
-- 
2.43.0


