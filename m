Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33925CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 00:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hk2cVIy8uwAn25YfiMtMX5GI5sI1IX2K4N1rX+eSuaE=; b=C8DJP6Smzlbc2MLV23uIbdJ0Tg
	j8sf8ZBWOmtsGScmiRAXUbc1fOvTFk/J+Img/mHwaNoT389MgilXzdf1UW+/4NIt0eaD1hjNRMMaU
	hJ+h8w0tdbSJcd8eNXqCZ+eM1J4RrnqDRK7RS4/fMpCeLR8ROv4KSrAJjsN6UDvs3rieSz61gOgcL
	LJTjj8fMC7WZf7a2doeABfyGoBmqNp6+vQY2irdvkMHqbXcx5E/ESPWftmPKKva/tqib2wcAqP7eC
	NOEEjGBBNEFUcatoo+BMbh90Ao/fmJR8mxFnAxap6gm4RoGaPirCU1YUD+EQUqZJbjOm2WQNOAVql
	QUgWMPcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v866y-0000000Bwsw-2IJu;
	Mon, 13 Oct 2025 00:08:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v865J-0000000Bu1Y-4975;
	Mon, 13 Oct 2025 00:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Hk2cVIy8uwAn25YfiMtMX5GI5sI1IX2K4N1rX+eSuaE=; b=NziVvqyyHsiQKkpfMYhKTuPOem
	kUmybU6UdbHwMhWxXZLf87v4xsdp9McdwrFEjUe+r6De3A3MFwwAIcicPP/5oC73ct3r8SPyMPCGG
	QPbA2HxwnJ6BwwnzRIo9HWjDoUtYDvRrP0K3ClA16ySDTrKwtSfah2hooP9d++DP3RW2yKyXChcmt
	lYBjS0O8+bcNNLHdRB6c2c6uCa6YSeRDZHx2iZxvD/Dz4SCpQVLi9w+jnBMBFDAULzkvMN/tSsb7s
	Sue0nwLwgL/fKKCWskPTu6RFAmRYb9BDeMY7g4X03W1d6zlOgKObfJWW582UsxcKOeIpTjj6Orggl
	w6mBBIBQ==;
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v865F-0000000BFGo-2IPk;
	Mon, 13 Oct 2025 00:06:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBKsW4NkesCoR3OlG8+OgPIT56nz3YScPBWy/g052WQQlHZ588LbebWgkfG6OVG9jWN0IgDRZ7Z1UhgDUnXAL8JoDLuQNER/i3V08kPFe670XHD5V/+rKFtYL8TH1xHYJ+PibMC6kVTJSlPFmbwZaNZyFAkHrlaboFG0YwaxVqPgW5G//kuasq4BfJAHaQUsVTCouiuPKxyTm9uKC0Y1C41K9HoCB5RD0m9kr9bf4W0lAhUtxreKY+S4EBm+ODzR963ePh6D/zwUgpXrRQOy9KKsETghMH5Hx+ICg7fApf0mq1ludp86Sq7EdqE6a652Adomjt1bHhHhGq+apah/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk2cVIy8uwAn25YfiMtMX5GI5sI1IX2K4N1rX+eSuaE=;
 b=mN2RtHQ1Q/yUt0EpGSGJPpLj5ED9vyzZnQ+vcVc5JGThJIpWnC9e/SPDNrUPo0GGNtVTzOdyPsEwPJrsbPHHQFAjZNradq7fWcQQ0YzFjyaBrX4l+/xmLjXfcKbYZIlQ4e7Ev+zzVxyCdnusE72QlTW9VBrEH2RCSbMEBYRGPOEMxOIse+w3vgImTHRwWiVQxByxhSFDxrln+tEwSi3PFy36u+Rj6evlmV9kGUT1KErCVXTxbHIAlCb0tICNItTBG0NEUwNsL5fkhtpgnJ7xIYl16jbOAJDK+m6GUc5Uq7jE8xaKCROYxfL4v3RhHWzIGTcj1rxIBIbyfH2KDsL/yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk2cVIy8uwAn25YfiMtMX5GI5sI1IX2K4N1rX+eSuaE=;
 b=MAMEBTEwDI1dCwVTGivMXwbn5P54HxGhMJ1labsU5BX4RWvsdkR5lO8lqQnC+MGjsoW4pbg+ZDt5/2ETHO+puRF82RTbkYifo5+AzRMxJCcrA3vnhyIqmiHW8KCJ0oyGaHZfkHKLAX6kdfhtZev8Z+eUni7x9dFssjTlKiOsanhEPsVBtVKESYJPP2dt8FiaLSMH4SeoKTHFxTmRq7INAlwePrEAwsmf8OuiB9CREFA6QOv8AQ5qE8n3pih07xv3oF95kXSphopgBs7XZ0Ki3IKkTI7A9bKzbiOODvljGUlFTTYpq7xGVM3CV3htklNwx/rbftMkPwjRDgwVTyAT9g==
Received: from CY5PR17CA0012.namprd17.prod.outlook.com (2603:10b6:930:17::18)
 by CY3PR12MB9704.namprd12.prod.outlook.com (2603:10b6:930:102::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 00:06:30 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:17:cafe::45) by CY5PR17CA0012.outlook.office365.com
 (2603:10b6:930:17::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:06:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:30 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 17:06:24 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:06:21 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:06:19 -0700
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
Subject: [PATCH v1 20/20] iommu/tegra-smmu: Implement tegra_smmu_domain_test_dev
Date: Sun, 12 Oct 2025 17:05:17 -0700
Message-ID: <7c06a0d6165e69b7a8aac10e5b8aea45c8e020f1.1760312725.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760312725.git.nicolinc@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|CY3PR12MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: d9bb0a35-4e89-446e-67cf-08de09ec5ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Txk4NSskoZkwOYl3/X/f/kcpNc0ofUJHsse7PoIuysRxafHaNUojgxxNlF7c?=
 =?us-ascii?Q?htKLe+Fa1mH8bFcUxlUXB5J8AyFP7zbQJ7ygpP+IZ2+N7lvVz/F5bXynE4Hr?=
 =?us-ascii?Q?824tBTBNC1mVX/JMDnASOIF88uFA4O8g6Bz2/DwAxApRlsptZF+aqYmxT8JR?=
 =?us-ascii?Q?Lcvx5Itujv/h98L6gojKQ/ReWj7JXmAaBP6M73gx4PCcik76X7pNUGNLoqJy?=
 =?us-ascii?Q?xZYGjTHfouZU+M2OFlzM6Qv4qLFINhYlPiAHv0slDqfNNXx347UBVzaeecNd?=
 =?us-ascii?Q?JEE0OQPIgxmO2Ek9jtrsc1bY5qxRwBM+45rqzmxExhXiHHKgUlTOhb+vANlD?=
 =?us-ascii?Q?iuAJOf7Pg0CN1347+0oExp05rg6ie54BjiA90pjDx/VYKgWbY1HNEVkjfBrz?=
 =?us-ascii?Q?UQ5xen4xvD4N7YkAcCC8d8L/r2tN5FcadSc+2ry7eoKzIUwTQZJVXg2M71KE?=
 =?us-ascii?Q?o9Vxx5GGtxLWzddLboo8ZZVu8U7JGErcJP5LLevqrN/KPsIdGzxmKWnqyXwn?=
 =?us-ascii?Q?X14eiDrdccSXYmKDLYC5g86OtizZXXOvXPBZKpIZMyiFEVX6Q0UydSXNS1b6?=
 =?us-ascii?Q?q0RxCB6I+oc+kzh3V/klTxRBgi68zxrHyr+u1NSQLq0SxMNz9Z3dBisp1GqX?=
 =?us-ascii?Q?V39Tqu8PlC8JpZ3crpzfG+7iR1+hHludowJ6MTXk5ElQgcgYHw0Cl+e0jZp2?=
 =?us-ascii?Q?5EDjRcdQ/N+6Z1vNa+4lkfxKCvViIG2w1H4nCk+IZ5yEjLPvrxYlAx503/gy?=
 =?us-ascii?Q?5lmBkJMv8tdFCjhgkvFc+HIAg7BsyLS3FJT7iFmk/JtFuiY3X6vbD4uq9gy9?=
 =?us-ascii?Q?NFWU4e9sXRQV6bKjWaxiYRpB6u8/Ed1oypVHwQl4UvOcAEssq5Lk7BmOt6Ke?=
 =?us-ascii?Q?EcgHqAK33HZcegSPf4d08zisdyLf11L8cB706HjqJ1oEcKSd4VlnBHDuLE41?=
 =?us-ascii?Q?Kvw3JwcYuVkTk0W9I9f9vRaLe56V+MpDUqF7OiVLDnmVarqXY6FOe3e6jaNG?=
 =?us-ascii?Q?jcvVJkhjMBVAhoUe6WjA8hx9c3zyPIcgBV3H7qJeLs/5Hdujv0TpU5oJSbTp?=
 =?us-ascii?Q?BQWJZbTrtRQHTlHjs6czUOBHq4kJD1fza59sd1amo6dpA91cKVPL3WBKBswi?=
 =?us-ascii?Q?B2R0qE/0v/DwFoum9H+6lrozqb4P+4ybhqiKqf95aXSbYJmBxgHd8MhlakVi?=
 =?us-ascii?Q?9UNEexPMW8GiDF8v8fmXKzC/Nn6rgPzfH68G2W0eKBrOfqS6ac2s1iDRE1aw?=
 =?us-ascii?Q?pXOiCMumRM0P+txGGJbEsIz3iFXsG2tKAXPJEZRCZsQZqLT4ivI/fk8pOQdf?=
 =?us-ascii?Q?PhVI6AEDacVVsM+apcA9iK2osA5BId+UT/IulctHGyO+xPvd3pM+rm+7H42Q?=
 =?us-ascii?Q?sAf5sbyDYgq19WioflLb5aGgqCKSeMeMi/wF9A3UfzfWqmT0B0W2iZU9w/oi?=
 =?us-ascii?Q?hLxjJfVOgjS5mpCk8iCKD9nbZ+1/zqpBXQPIwCv7gtXakg95tvmvBBN0w8B8?=
 =?us-ascii?Q?eSypBK8aB+9hfT3gpFmIkrllTY4qd1zj7AKRqMOE3C4y/b7SyiDgZ16YKhdD?=
 =?us-ascii?Q?qcQthlTwRe40bG25Gsc=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:30.8053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bb0a35-4e89-446e-67cf-08de09ec5ce7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9704
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_010638_820849_2D29F2DC 
X-CRM114-Status: GOOD (  11.42  )
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
 drivers/iommu/tegra-smmu.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 336e0a3ff41fb..cfbe67678a426 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -489,6 +489,18 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
 	mutex_unlock(&smmu->lock);
 }
 
+static int tegra_smmu_domain_test_dev(struct iommu_domain *domain,
+				      struct device *dev, ioasid_t pasid,
+				      struct iommu_domain *old)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+
+	if (!fwspec || !fwspec->num_ids)
+		return -ENOENT;
+
+	return 0;
+}
+
 static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 				 struct device *dev, struct iommu_domain *old)
 {
@@ -498,9 +510,6 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 	unsigned int index;
 	int err;
 
-	if (!fwspec)
-		return -ENOENT;
-
 	for (index = 0; index < fwspec->num_ids; index++) {
 		err = tegra_smmu_as_prepare(smmu, as);
 		if (err)
@@ -509,9 +518,6 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 		tegra_smmu_enable(smmu, fwspec->ids[index], as->id);
 	}
 
-	if (index == 0)
-		return -ENODEV;
-
 	return 0;
 
 disable:
@@ -532,9 +538,6 @@ static int tegra_smmu_identity_attach(struct iommu_domain *identity_domain,
 	struct tegra_smmu *smmu;
 	unsigned int index;
 
-	if (!fwspec)
-		return -ENODEV;
-
 	if (old == identity_domain || !old)
 		return 0;
 
@@ -548,6 +551,7 @@ static int tegra_smmu_identity_attach(struct iommu_domain *identity_domain,
 }
 
 static struct iommu_domain_ops tegra_smmu_identity_ops = {
+	.test_dev = tegra_smmu_domain_test_dev,
 	.attach_dev = tegra_smmu_identity_attach,
 };
 
@@ -1005,6 +1009,7 @@ static const struct iommu_ops tegra_smmu_ops = {
 	.device_group = tegra_smmu_device_group,
 	.of_xlate = tegra_smmu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev	= tegra_smmu_domain_test_dev,
 		.attach_dev	= tegra_smmu_attach_dev,
 		.map_pages	= tegra_smmu_map,
 		.unmap_pages	= tegra_smmu_unmap,
-- 
2.43.0


