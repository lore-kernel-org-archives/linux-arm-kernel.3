Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7443CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 00:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJARpm0+6KDFdNkqAy5+22ObehEg1OFSTeUUABI5AN0=; b=R/f/2gDuw7odlBTJ4Fzw5ooSQ/
	pDWxgLgRKlHeI5DQwOY9gwaoAzLHxSmyxqZLpgcWRdevOfrXcuTnnMdRgKVwqdsvovqqSmty0nonS
	W/xjbzTaiQyOha1vWUfKXEc5LBraen5B+qip1plYNk9WBKsTpVMND90uw9DsLFqupMJ6b+f4bpvMw
	5yxm4W2hggg19ZWZjQsVeJzV7vCzcKQ7T4aFj+xzqyP9BxcQgzNE3/IGAQz6Qg9Brf2gIrEgZ66zt
	fwsO1m7RpvuA0yeRvdR8W8Ai6MCUnA1ak6zI/osT0cmZH4gn3tSohb5bHbuv1Dw0Ya5Z3HL0ITh50
	E3u6ByGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v866Y-0000000Bw8E-2Azr;
	Mon, 13 Oct 2025 00:07:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v865E-0000000Btti-1QHH;
	Mon, 13 Oct 2025 00:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xJARpm0+6KDFdNkqAy5+22ObehEg1OFSTeUUABI5AN0=; b=pqy4qq7Lc0i02GxC+9316dIilS
	uzYvOHdV+Yh1EjDGuKFGzEs0beJdNetb6xfWJGpcojpEEfyPXSXAlCUs509d4Fcj1KraUu0hkDOt7
	kGd53D1gGNRkLoKQd+14FcLGenmfhMBClQH+UvYnFU7I2Yb4Bok3XaqVWgSs+djLcgcwl8jIEGJdz
	IQCrYd54d5DJZP2yzjt6E9A7PO4nYGF7isoERlY8ploCVHU/m/kGrNAknKftfDmEqJ7aTA0HJvDgL
	wqP8XiQD9grgG0EgXQaOT/nV1fTvzrsMron/Hmdh/ToW51OUKi11zJGTTeYuEz7Bf+DNknS8jsqZ6
	EtgiOzbA==;
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v864x-00000003vWI-31cN;
	Mon, 13 Oct 2025 00:06:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2YAWYjNvhzAGB/hH4in4GCkExkZJnzqVTy2YFclKqDKVPCBqK6FJM17FPJgTWrxl9DFlB0YNiP1hnJJqWHMtFpXCFuQlmHp0DaCXcg+XQh/pcSFNG5zRmrIRijVdODt2j/GhsB04X+j6hPyr4HHYJvnHaz00EU8Wgk0k65D2VSHBRcFtaCjP7LHPyvcApNJaqUxcUa1PG2YOE8SskoskSwV0KWR71pof9oFLoWnX4zCrU11GjCFlJOhAlz9LdzXXj0ODB1/qAWrrAnltcOE+j6sCCqPmOsxCdDz7wVxdxQ7ozezpsdRZFN11xZEmVXpu6Nd7be6e9+IMVqUVe63tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJARpm0+6KDFdNkqAy5+22ObehEg1OFSTeUUABI5AN0=;
 b=D8xOgJ8Yy/4jraNRzhwWYyj5lkkZH+CscRifGoOSdjnYxrbCAyvBnIG6K47q05me4RMD6/YBXlAkVDs9fjjs98PD+OdjOK2KxxY+cH7/I6bNSgVWBM57h8edjQ1JfUzRE3LCmYrb9UX8eU/gOhE0XreCF0Cc0/BvrSU6wBsOk0tx1X3Lk2fbYit14G3OFYXW66kcI8gyfGurHXk9gcuPCrrD9gWTSI0mR3U0EhB0dxlnDc12gO82eeyync/AWX9k4akINFIqlYocXPuxZ0Hst0V/XStImJxWhe9byku1ndos2EhNy1ApICnyqp7omS/12JuqspOhjd1olXygOV5hNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJARpm0+6KDFdNkqAy5+22ObehEg1OFSTeUUABI5AN0=;
 b=ixJb7Ug3ywc9cC7zt0rH0ann2JKHCj+ihI9lAcYLG3oMIpmAg0PkkuW4b8dEGsk7XRX12bf6uPMbGIHYaPozCD6NGzLYpuYo5ejjGxi1CC3KVv6iCoOGYBxeRFYiBN97k2qIm1kOSXJfc/2PrXUCioPx9EkHJJsI7SQ8QmpiiDqS2/QtFGaF9jBIQH2X8tR3Tr+5kcLuAIofqf3q8DETBxYtKeFQpCIGXkB0rAHwMte0A7BXNo7FiGplxORPBlxnGHorf2f1kfCMKJoHNHJn0d+CjJzY+mCsLguUzsFTKew+6ZhpPvXhjQHZDXGXrO2Q23zBMhDUkOgFKsXmYXzZjQ==
Received: from BL1PR13CA0074.namprd13.prod.outlook.com (2603:10b6:208:2b8::19)
 by DS7PR12MB6168.namprd12.prod.outlook.com (2603:10b6:8:97::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Mon, 13 Oct 2025 00:06:08 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::56) by BL1PR13CA0074.outlook.office365.com
 (2603:10b6:208:2b8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 00:06:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:08 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 17:06:00 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:05:57 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:55 -0700
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
Subject: [PATCH v1 11/20] iommu/ipmmu-vmsa: Implement ipmmu_domain_test_device
Date: Sun, 12 Oct 2025 17:05:08 -0700
Message-ID: <9460b6fc29dc82ac38bdb5769e37c4814d8f2ad0.1760312725.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760312725.git.nicolinc@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|DS7PR12MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: d29668f7-b0f3-4d4d-7a7a-08de09ec4fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vuXvuekpdyn8qg/tBTu7TFp5SRHPdbszejxlEcxGpRWyf12LOYJqoLVzXNBa?=
 =?us-ascii?Q?KbPW7Da0pmyWKF620D2ZWmqyNJ6k82XjsQUZeLAStls5ziCSufSAtJdiWlQV?=
 =?us-ascii?Q?WmUcnD6o0KG13/6b+tKPXXHdkeigzo6Bbx+DWyW4o9BsUte+OXpm68vTDFHd?=
 =?us-ascii?Q?uzI8pnT30Gmq8GxIb3zGd/riBsacPQrTWeJPgh0xwFq0XJU8SHGKwo8BQJVL?=
 =?us-ascii?Q?NxCWWjLXV1FWYVZXXp2pkgcZkV+zBkxALj7/j26IBIOT2uZ6hn6Iy1BRMhcE?=
 =?us-ascii?Q?uUNvGQHWvpIPkvLVEyBURuITRlHNSYUIDVZpQuKtM9DxU1vFZnFAxvgAo0zJ?=
 =?us-ascii?Q?wYbXOG1fKhfVO932HEdKdRLR/FbtX9z8azxpvR7BsgICqkSFvA/ZBB2/1dXX?=
 =?us-ascii?Q?xOeIhJWsAloxJ5sg7IpaYTp+7++bkMUwV4os7j/vJ9Y5mI5TBy16Zu7XO7Et?=
 =?us-ascii?Q?MvzNFMa3CYrfTuhfZ/8ptIE/taZm02GHxM+iQp6XBUEj3ibRENObPli+8UcD?=
 =?us-ascii?Q?QUNDon6FdVfooa2uiK+qiRa2H8va5r+XZDiUkmkApzQ4+VpHyXviHvbyKhJe?=
 =?us-ascii?Q?y+XMDJPMDntlqtafgAU0riUGbxYvt5cfH4SihREHkzcsK5e8VeMq7NXSmFPq?=
 =?us-ascii?Q?Ff2j16b9iCKpAh7OoIYH5GD35X2lUbM9czc9YUkW6OiHTr/SxEuzb2xALt67?=
 =?us-ascii?Q?i9SLhS7DljPfueQXX/3vX2x3thOI83tY5CUXUsdfPv2u0+kuIA/LoLyNaqxP?=
 =?us-ascii?Q?O/RqeacAkZHm+XtSrHBWWi0bXt53ARApnWfPMK171pIRFLdPZK1ttkDFH6KB?=
 =?us-ascii?Q?S8DvEwWHhTtL5pZcjMtL7FTFIx/4HzYmMxOiZoynHOPCa2Oz0PS5CUEjN4VH?=
 =?us-ascii?Q?na1CrWVG//9cgIsoTOBnzAplanvBQQ3q3uaA+gHiHoN/auT7PDNopg6M9c/U?=
 =?us-ascii?Q?J13NAoBV4Evo4pb3l6vHjqY1MKUzdnQv2sOPeroOF13BWi3Ok4RgPkfk229V?=
 =?us-ascii?Q?nfAi3c2KgDz+1o0kJh868y6M5LALvhFRoUHYH6eOf4tubAmHK60I1lb4bTSd?=
 =?us-ascii?Q?W8V2zl4w7ik+MthcNzRx+NPeBSXOfF5dqzr63o80XSsHyqWVZS+TCycuV7/q?=
 =?us-ascii?Q?aQP0X6S0dDJ1rHF3FJ2b8esEbC9t4T/JZ20Ui46h+PBlW2WBeSBNIrlKPFZS?=
 =?us-ascii?Q?v01Ag5ypXSjq8977gugEVhxSawnO2Ak9yHV4ivoyWbgG4lx4S/MVpHexB8rR?=
 =?us-ascii?Q?M4cwc1TWXtAp7sxuzq2AeoAhzqU8luK3/W8WhwwysMS67vjJlnKO9ecQWmH4?=
 =?us-ascii?Q?GExSuTbKbOpLOOrptybnY19dV4UJ4Z2VfXxUpc7r2SJc5Hi8hNtnMprxw7RY?=
 =?us-ascii?Q?qr/rGfVdVCaXVWj80cVpGgiaeeZpILuDub7ByYCTc+ljOALywFl751shS4om?=
 =?us-ascii?Q?DnHZ5ohuOnLInusxQBjtSeoJRhb7wemgeXZvLlsIYfvguY7BQftNfxhZQMdF?=
 =?us-ascii?Q?kLCqvGApkO9g7eSgkKQfWuRz0lVGZZu1088ruObsFMoiw4Dxu/Zv7MJo9Guo?=
 =?us-ascii?Q?wjK+sUwinEFKI+U4BqY=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:08.5351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d29668f7-b0f3-4d4d-7a7a-08de09ec4fac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_010625_884372_5E95EAEF 
X-CRM114-Status: GOOD (  14.53  )
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
 drivers/iommu/ipmmu-vmsa.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 6667ecc331f01..fdbb26ec6c632 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -589,6 +589,30 @@ static void ipmmu_domain_free(struct iommu_domain *io_domain)
 	kfree(domain);
 }
 
+static int ipmmu_domain_test_device(struct iommu_domain *io_domain,
+				    struct device *dev, ioasid_t pasid,
+				    struct iommu_domain *old)
+{
+	struct ipmmu_vmsa_domain *domain = to_vmsa_domain(io_domain);
+	struct ipmmu_vmsa_device *mmu = to_ipmmu(dev);
+
+	if (!mmu) {
+		dev_dbg(dev, "Cannot attach to IPMMU\n");
+		return -ENXIO;
+	}
+
+	scoped_guard(mutex, &domain->mutex) {
+		/*
+		 * Something is wrong, we can't attach two devices using different
+		 * IOMMUs to the same domain.
+		 */
+		if (domain->mmu && domain->mmu != mmu)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int ipmmu_attach_device(struct iommu_domain *io_domain,
 			       struct device *dev, struct iommu_domain *old)
 {
@@ -598,11 +622,6 @@ static int ipmmu_attach_device(struct iommu_domain *io_domain,
 	unsigned int i;
 	int ret = 0;
 
-	if (!mmu) {
-		dev_err(dev, "Cannot attach to IPMMU\n");
-		return -ENXIO;
-	}
-
 	mutex_lock(&domain->mutex);
 
 	if (!domain->mmu) {
@@ -616,13 +635,7 @@ static int ipmmu_attach_device(struct iommu_domain *io_domain,
 			dev_info(dev, "Using IPMMU context %u\n",
 				 domain->context_id);
 		}
-	} else if (domain->mmu != mmu) {
-		/*
-		 * Something is wrong, we can't attach two devices using
-		 * different IOMMUs to the same domain.
-		 */
-		ret = -EINVAL;
-	} else
+	} else /* domain->mmu == mmu */
 		dev_info(dev, "Reusing IPMMU context %u\n", domain->context_id);
 
 	mutex_unlock(&domain->mutex);
@@ -885,6 +898,7 @@ static const struct iommu_ops ipmmu_ops = {
 			? generic_device_group : generic_single_device_group,
 	.of_xlate = ipmmu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev	= ipmmu_domain_test_device,
 		.attach_dev	= ipmmu_attach_device,
 		.map_pages	= ipmmu_map,
 		.unmap_pages	= ipmmu_unmap,
-- 
2.43.0


