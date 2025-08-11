Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31946CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 00:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJSvwccYlDbVWEi/02PaExnnac+DRtMJUl8liOYYznU=; b=mHKzlp2S1UfQeNZJBPtFSnDdbt
	3K5ZTz05neOPFq/cRxLjCbIz+mopFKz/6m8AtvkqIfrIOGHbyal7nlAauDuC8Vr/taSlrhILzpi2L
	NYmso5sQlfUqzmGa/E8jz7Gp6Kxl5D5PhPqvRl+eZlslXiTu2w/tsy6A0+Y/qbhKqf7NSzrQNysZv
	Z+BywFxEZp159fVbJ2rvJK+lzphTlbmnjZMqQqhYfsrNNYoWsX4m63IOfO4ZMsZzW5C++Jm7iRG1w
	n5s6jXtJzAu0tEMolLf7n4omedu6xA8fsBSur9XdvgZ6VmHsrvtYuIJgx1nXL+rw/jLaecc7gthZy
	U+59sPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulcui-00000009RvS-1y6L;
	Tue, 12 Aug 2025 00:30:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulbVY-00000009KGQ-3XRL;
	Mon, 11 Aug 2025 23:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UJSvwccYlDbVWEi/02PaExnnac+DRtMJUl8liOYYznU=; b=pdf+1nngpW10OBr28+bdVRAA7y
	SW3+akflPU5yfVVZb0xeerjXDgomGUt+Q/yybXlaL5lrEMGg5wGfowjaR92NS2oMT2FZgqUnzAfDl
	XV0Eay6jveHyL4nQTLzK5i6KxUKVAp5dTzcM0k9/BnjI85KAHUGqvxgjoUSWTT2U/4O9SyZzYtXPl
	t9AGRahgSYc490NZjGcDgh0FoH0sIsmJ0J/Hd80tFVLy/zU4k7FEG/AFIglECurpB8xxm9FuuKGY6
	7H9IrHV0WTaSxPfUs9RQA9FAAj8D3C3/I7XRsK2RcsW65pGlMjkeM3JOrBtkgeQ6ayTR2yUIosdU6
	8nFf/XZQ==;
Received: from mail-mw2nam04on20610.outbound.protection.outlook.com ([2a01:111:f403:240a::610] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulbVV-0000000FbEM-2oI2;
	Mon, 11 Aug 2025 23:00:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FF2nYNhP3OS81It3BU3VW8yFVsltyMZX1XEQnZh4a94ZsJYAQRVC96PlXBl7Suy6uKJWFPlojDoXFUJ+hjRgULNy36ahlSnHIyamZFlwN06uEZ33pTuMu13IeMcffauGwlbGs6qnAVxFDIV8NsFn5+QPbHfgrRzmo3gn3vGVXfh+tzmlS6JHC+ymjCTe7x53q4ROC9cpMmq9uBkpwUktH70vdADA1Q4smQhi5luMYXiHxDwGUrxjkmtIAutHCL9dnJ7rmmPLWN9z7+7BQPZ8/6IuTUPq6Xiw5dV95QoHbaG7uoFo16+n9Wu5gCzWXmCtRFFgdc+loNQbqh0KQuSYKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJSvwccYlDbVWEi/02PaExnnac+DRtMJUl8liOYYznU=;
 b=OdjyEjutWlgXO2Z/DXe7/kkf9qKVVuJ5hi8hNcz+w67p6dGApmro7y/Fom+Db++kZ1VXufG+Ajp/buW4e4xRCFsj0uSU/JhIJzypN5M4K8bAz+u+43UrcPxqRj156TwF0ExLMnjonf/G1V7Q9JnUbGCLs3h1EwtovhPypVRlPInQTsXtPzOezH7LGJA4DFyJy5Z58+GzGCV++cIwsjB8TfcRzQQaOpGIwlxwI1VGrqDY4aqdUWmDjCwgAm4vxMZwT6OCGiO9AEitl941QjwbyUY7YTjAOZ5TsJ/gSV+Qr9S6Yu+JaXs3x8D9WdRbj9v7RlxftMpn9H6VH4PKfV27gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJSvwccYlDbVWEi/02PaExnnac+DRtMJUl8liOYYznU=;
 b=XRM3x54YhWlJpOcmIRKO474s3jyC1S3u+IIiNh3P2LpFg1DtdemW81aWpvVd0+EHERphmOSB7u8X4z1i+EEpB0AP8/e9eiJfHwJRxf4g1lC/n82z2o1YaBtkHLmrLHpee7FZVqsG359I175Li0+X9yp3LAQVk95vEEbJ8qpFnkSuR2aFzoM88hImKl+1d/EpFPS5KLSMw+JvGuTWmd8tMzQLf+eBeP0ipZi3WLO3u/rUJBeZ3uUrw48RR06FVCtWBBos+DSmUWEGfoKMpFx5B5kHzxsQJ7ihUwxWXXzhfKLdWKedOaLYf1Gpg7BHpGcgyhpW5GlmRvDrJ3/W7caKzQ==
Received: from BL0PR02CA0076.namprd02.prod.outlook.com (2603:10b6:208:51::17)
 by IA0PR12MB8693.namprd12.prod.outlook.com (2603:10b6:208:48e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 23:00:38 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:51:cafe::92) by BL0PR02CA0076.outlook.office365.com
 (2603:10b6:208:51::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.22 via Frontend Transport; Mon,
 11 Aug 2025 23:00:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Mon, 11 Aug 2025 23:00:38 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 11 Aug
 2025 16:00:14 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 11 Aug
 2025 16:00:13 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 11 Aug 2025 16:00:12 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <robin.murphy@arm.com>, <joro@8bytes.org>, <bhelgaas@google.com>,
	<jgg@nvidia.com>
CC: <will@kernel.org>, <robin.clark@oss.qualcomm.com>, <yong.wu@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<rafael@kernel.org>, <lenb@kernel.org>, <kevin.tian@intel.com>,
	<yi.l.liu@intel.com>, <baolu.lu@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<patches@lists.linux.dev>, <pjaroszynski@nvidia.com>, <vsethi@nvidia.com>,
	<helgaas@kernel.org>, <etzhao1900@gmail.com>
Subject: [PATCH v3 5/5] pci: Suspend iommu function prior to resetting a device
Date: Mon, 11 Aug 2025 15:59:12 -0700
Message-ID: <3749cd6a1430ac36d1af1fadaa4d90ceffef9c62.1754952762.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754952762.git.nicolinc@nvidia.com>
References: <cover.1754952762.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|IA0PR12MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b83d412-f63c-419d-779f-08ddd92ae387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Au0VMS8kEQrine+KHWf1gjljArI+81XlCUtHJ2i7u/WgTzWpcgZmHOCe/Si4?=
 =?us-ascii?Q?2CHmXuq0E2uD283G2QMk7APuobJJxfYFep+d4R19cZLUli36pm0ANrFwIN3/?=
 =?us-ascii?Q?Ab8HBUEOwFiU+4WMT9uRQsIQcZs9ViHAhD5Q0EaxseUvNACBcHpR/tCxbNBW?=
 =?us-ascii?Q?lblTR3Qs+x2n5NxhS950sLzC4jRTETT+QV8X8RxPlWcor4tPZOV2ftQJ8J0Z?=
 =?us-ascii?Q?vIC06oltGQ0trANjVt+MXiBnXCxsyUyuuBPO2f6gJ4uR+QWiSfgeBifSaXnM?=
 =?us-ascii?Q?n6neHvaYHUwZBX89C1UVWh16e7BSwjtvlzFQKztZLVylRhcdXeFmz/I/EiCN?=
 =?us-ascii?Q?UeEbl6Qf7zWc0+7AEud/cMSVim6H4tEubmliDDiXl10ywUdfh9hc+c6wKH31?=
 =?us-ascii?Q?xFX09jwNUrnMWDXx505a+SvEYdK5J4Ox3ViyTNs7zphcIv0QJId+vaDreKoO?=
 =?us-ascii?Q?2ydve5PrDsSczkrWWI3JX6jBRHcNQWBhMX/pyfgncWxcESV/pTnak755HXLV?=
 =?us-ascii?Q?tQhsyBdSM5I1MGbw5ng2kgisvzwvAZTFSOQvXUmhleF/5Hw7t+Bcjt1bEWR3?=
 =?us-ascii?Q?5rYkVVeseG5mT1LM9FGl1RqKBIrgHt6htyGbFEJfQ7mKdwEcfPaoipYB/0Uj?=
 =?us-ascii?Q?/E3oZ2gayT936ULtToVthlYzUhsovx5NsGo/gB9eDOmQIvzXQdLsvGh444DY?=
 =?us-ascii?Q?MP2vw+xZY3OJnTpr2WOrMJTIse7uzEb4zMu29NLN0GEG985hRpNL6fz6iflJ?=
 =?us-ascii?Q?FydNiU5iXIPi+l4sCSd5bekDEoAc/qVxiSPxPtrFOXd0WGg1fr6vePq9ZwVl?=
 =?us-ascii?Q?UWX5gZmK4SCQxwZ+QW2YoBnlmLVjWp1jLxcc54C7XmOnF5FHZpQUj7Xi4Iw4?=
 =?us-ascii?Q?tKIzsG2SM33h7PdgdDSGZXffoqPdz0V669O9c+ut7NRBEZMASVI8BVXazE0j?=
 =?us-ascii?Q?Phglnb+/WnrCa/xKDtQ9oB5qKbodT7R9q8RIgwtLB33RebU8aMv77ahKzfWn?=
 =?us-ascii?Q?BtdHu/2SaOmpMmQZ+lMQBnFQeZpDI1sqoWxUxxeiwoqrjUSe6YDNDhJswxZ6?=
 =?us-ascii?Q?ObiDdh2qlwpW1Kh7Qil8wOhnbuAN9sPmpADwoFyFFqWz6Wmeqw6LmPmgB35B?=
 =?us-ascii?Q?L8EiTVPNTePUbwHgPZiF/q51ebSQy2PZmV40f1teOoTXeM9TH2OGacrw6KLO?=
 =?us-ascii?Q?l9vCwOV0IPTEgA6+aot5sgMpOSO8uSYWTAMjCnrLW2tFVQpsy6190lZzJkZt?=
 =?us-ascii?Q?yqK60jnOLXv7LqwYvehI2uNP61zjDqNjQ5yTg6YYmvPAVuKXOsXi1iVQSB53?=
 =?us-ascii?Q?9WdNHFhl59wst5DKEw3RR1R4StJn/hkthFXvT70RWL7OD9ddw5q/TshpKX22?=
 =?us-ascii?Q?wT0yP3hiGqk+Ij/Swbikqd9q+ZxU8dxxte+DSTbjlXwgubMVeXvsOj9856n7?=
 =?us-ascii?Q?5yE2HDM+ph02qaJdi/FJehbkPhrAg/mBh2pXTjQjfXQgMj6pHomx0dZf+GJ2?=
 =?us-ascii?Q?O14877CwI73Dd5Z2dj7FyAImE0LWsxxRM6+Y?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 23:00:38.3750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b83d412-f63c-419d-779f-08ddd92ae387
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8693
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_000046_067062_A4407497 
X-CRM114-Status: GOOD (  17.85  )
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

PCIe permits a device to ignore ATS invalidation TLPs, while processing a
reset. This creates a problem visible to the OS where an ATS invalidation
command will time out: e.g. an SVA domain will have no coordination with a
reset event and can racily issue ATS invalidations to a resetting device.

The PCIe spec in sec 10.3.1 IMPLEMENTATION NOTE recommends to disable and
block ATS before initiating a Function Level Reset. It also mentions that
other reset methods could have the same vulnerability as well.

Now iommu_dev_reset_prepare/done() helpers are introduced for this matter.
Use them in all the existing reset functions, which will attach the device
to an IOMMU_DOMAIN_BLOCKED during a reset, so as to allow IOMMU driver to:
 - invoke pci_disable_ats() and pci_enable_ats(), if necessary
 - wait for all ATS invalidations to complete
 - stop issuing new ATS invalidations
 - fence any incoming ATS queries

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/pci/pci-acpi.c | 17 +++++++++--
 drivers/pci/pci.c      | 68 ++++++++++++++++++++++++++++++++++++++----
 drivers/pci/quirks.c   | 23 +++++++++++++-
 3 files changed, 100 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index ddb25960ea47d..adaf46422c05d 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -9,6 +9,7 @@
 
 #include <linux/delay.h>
 #include <linux/init.h>
+#include <linux/iommu.h>
 #include <linux/irqdomain.h>
 #include <linux/pci.h>
 #include <linux/msi.h>
@@ -969,6 +970,7 @@ void pci_set_acpi_fwnode(struct pci_dev *dev)
 int pci_dev_acpi_reset(struct pci_dev *dev, bool probe)
 {
 	acpi_handle handle = ACPI_HANDLE(&dev->dev);
+	int ret = 0;
 
 	if (!handle || !acpi_has_method(handle, "_RST"))
 		return -ENOTTY;
@@ -976,12 +978,23 @@ int pci_dev_acpi_reset(struct pci_dev *dev, bool probe)
 	if (probe)
 		return 0;
 
+	/*
+	 * Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software disables ATS
+	 * before initiating a reset. Notify the iommu driver that enabled ATS.
+	 */
+	ret = iommu_dev_reset_prepare(&dev->dev);
+	if (ret) {
+		pci_err(dev, "failed to stop IOMMU\n");
+		return ret;
+	}
+
 	if (ACPI_FAILURE(acpi_evaluate_object(handle, "_RST", NULL, NULL))) {
 		pci_warn(dev, "ACPI _RST failed\n");
-		return -ENOTTY;
+		ret = -ENOTTY;
 	}
 
-	return 0;
+	iommu_dev_reset_done(&dev->dev);
+	return ret;
 }
 
 bool acpi_pci_power_manageable(struct pci_dev *dev)
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b0f4d98036cdd..d6d87e22d81b3 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/init.h>
+#include <linux/iommu.h>
 #include <linux/msi.h>
 #include <linux/of.h>
 #include <linux/pci.h>
@@ -4529,13 +4530,26 @@ EXPORT_SYMBOL(pci_wait_for_pending_transaction);
  */
 int pcie_flr(struct pci_dev *dev)
 {
+	int ret = 0;
+
 	if (!pci_wait_for_pending_transaction(dev))
 		pci_err(dev, "timed out waiting for pending transaction; performing function level reset anyway\n");
 
+	/*
+	 * Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software disables ATS
+	 * before initiating a reset. Notify the iommu driver that enabled ATS.
+	 * Have to call it after waiting for pending DMA transaction.
+	 */
+	ret = iommu_dev_reset_prepare(&dev->dev);
+	if (ret) {
+		pci_err(dev, "failed to stop IOMMU\n");
+		return ret;
+	}
+
 	pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_BCR_FLR);
 
 	if (dev->imm_ready)
-		return 0;
+		goto done;
 
 	/*
 	 * Per PCIe r4.0, sec 6.6.2, a device must complete an FLR within
@@ -4544,7 +4558,11 @@ int pcie_flr(struct pci_dev *dev)
 	 */
 	msleep(100);
 
-	return pci_dev_wait(dev, "FLR", PCIE_RESET_READY_POLL_MS);
+	ret = pci_dev_wait(dev, "FLR", PCIE_RESET_READY_POLL_MS);
+
+done:
+	iommu_dev_reset_done(&dev->dev);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(pcie_flr);
 
@@ -4572,6 +4590,7 @@ EXPORT_SYMBOL_GPL(pcie_reset_flr);
 
 static int pci_af_flr(struct pci_dev *dev, bool probe)
 {
+	int ret = 0;
 	int pos;
 	u8 cap;
 
@@ -4598,10 +4617,21 @@ static int pci_af_flr(struct pci_dev *dev, bool probe)
 				 PCI_AF_STATUS_TP << 8))
 		pci_err(dev, "timed out waiting for pending transaction; performing AF function level reset anyway\n");
 
+	/*
+	 * Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software disables ATS
+	 * before initiating a reset. Notify the iommu driver that enabled ATS.
+	 * Have to call it after waiting for pending DMA transaction.
+	 */
+	ret = iommu_dev_reset_prepare(&dev->dev);
+	if (ret) {
+		pci_err(dev, "failed to stop IOMMU\n");
+		return ret;
+	}
+
 	pci_write_config_byte(dev, pos + PCI_AF_CTRL, PCI_AF_CTRL_FLR);
 
 	if (dev->imm_ready)
-		return 0;
+		goto done;
 
 	/*
 	 * Per Advanced Capabilities for Conventional PCI ECN, 13 April 2006,
@@ -4611,7 +4641,11 @@ static int pci_af_flr(struct pci_dev *dev, bool probe)
 	 */
 	msleep(100);
 
-	return pci_dev_wait(dev, "AF_FLR", PCIE_RESET_READY_POLL_MS);
+	ret = pci_dev_wait(dev, "AF_FLR", PCIE_RESET_READY_POLL_MS);
+
+done:
+	iommu_dev_reset_done(&dev->dev);
+	return ret;
 }
 
 /**
@@ -4632,6 +4666,7 @@ static int pci_af_flr(struct pci_dev *dev, bool probe)
 static int pci_pm_reset(struct pci_dev *dev, bool probe)
 {
 	u16 csr;
+	int ret;
 
 	if (!dev->pm_cap || dev->dev_flags & PCI_DEV_FLAGS_NO_PM_RESET)
 		return -ENOTTY;
@@ -4646,6 +4681,16 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
 	if (dev->current_state != PCI_D0)
 		return -EINVAL;
 
+	/*
+	 * Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software disables ATS
+	 * before initiating a reset. Notify the iommu driver that enabled ATS.
+	 */
+	ret = iommu_dev_reset_prepare(&dev->dev);
+	if (ret) {
+		pci_err(dev, "failed to stop IOMMU\n");
+		return ret;
+	}
+
 	csr &= ~PCI_PM_CTRL_STATE_MASK;
 	csr |= PCI_D3hot;
 	pci_write_config_word(dev, dev->pm_cap + PCI_PM_CTRL, csr);
@@ -4656,7 +4701,9 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
 	pci_write_config_word(dev, dev->pm_cap + PCI_PM_CTRL, csr);
 	pci_dev_d3_sleep(dev);
 
-	return pci_dev_wait(dev, "PM D3hot->D0", PCIE_RESET_READY_POLL_MS);
+	ret = pci_dev_wait(dev, "PM D3hot->D0", PCIE_RESET_READY_POLL_MS);
+	iommu_dev_reset_done(&dev->dev);
+	return ret;
 }
 
 /**
@@ -5111,6 +5158,16 @@ static int cxl_reset_bus_function(struct pci_dev *dev, bool probe)
 	if (rc)
 		return -ENOTTY;
 
+	/*
+	 * Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software disables ATS
+	 * before initiating a reset. Notify the iommu driver that enabled ATS.
+	 */
+	rc = iommu_dev_reset_prepare(&dev->dev);
+	if (rc) {
+		pci_err(dev, "failed to stop IOMMU\n");
+		return rc;
+	}
+
 	if (reg & PCI_DVSEC_CXL_PORT_CTL_UNMASK_SBR) {
 		val = reg;
 	} else {
@@ -5125,6 +5182,7 @@ static int cxl_reset_bus_function(struct pci_dev *dev, bool probe)
 		pci_write_config_word(bridge, dvsec + PCI_DVSEC_CXL_PORT_CTL,
 				      reg);
 
+	iommu_dev_reset_done(&dev->dev);
 	return rc;
 }
 
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index d97335a401930..6157c6c02bdb0 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -21,6 +21,7 @@
 #include <linux/pci.h>
 #include <linux/isa-dma.h> /* isa_dma_bridge_buggy */
 #include <linux/init.h>
+#include <linux/iommu.h>
 #include <linux/delay.h>
 #include <linux/acpi.h>
 #include <linux/dmi.h>
@@ -4225,6 +4226,26 @@ static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
 	{ 0 }
 };
 
+static int __pci_dev_specific_reset(struct pci_dev *dev, bool probe,
+				    const struct pci_dev_reset_methods *i)
+{
+	int ret;
+
+	/*
+	 * Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software disables ATS
+	 * before initiating a reset. Notify the iommu driver that enabled ATS.
+	 */
+	ret = iommu_dev_reset_prepare(&dev->dev);
+	if (ret) {
+		pci_err(dev, "failed to stop IOMMU\n");
+		return ret;
+	}
+
+	ret = i->reset(dev, probe);
+	iommu_dev_reset_done(&dev->dev);
+	return ret;
+}
+
 /*
  * These device-specific reset methods are here rather than in a driver
  * because when a host assigns a device to a guest VM, the host may need
@@ -4239,7 +4260,7 @@ int pci_dev_specific_reset(struct pci_dev *dev, bool probe)
 		     i->vendor == (u16)PCI_ANY_ID) &&
 		    (i->device == dev->device ||
 		     i->device == (u16)PCI_ANY_ID))
-			return i->reset(dev, probe);
+			return __pci_dev_specific_reset(dev, probe, i);
 	}
 
 	return -ENOTTY;
-- 
2.43.0


