Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEA4E74AFF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 22:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NCGCZqr17sVj2upoM7Gwc0ihyUUa8f5uRYg1Aproo8=; b=emGaEzBQ2gM7y4uwRJZPCukcXR
	nLejpCimYNjc+/1xUMnjJjJtbTn9FdKZi86DR3RC36r2HVK4W7B680cMKcjsbnn6PthTwJ0SO1ny8
	52hwHp7bcOy9S5pGJO4IjWwIVHgXj3DSA4akDaWookfNHz3FW1YGwCGm2ah0XAPa5L2eHf7cJjTUh
	PXV+QX3T2jc81LKXqOP5+2neq6ukmJRFdR8WJ4XQE7SLKGuppS0PrDGe3lja46NZ63y1I/bMIT2Ns
	CBfQEk486JYxnwtp2pFbQERAw2kJu2HQRkfX/Dp6nuwVVCMh6h2yoR8SBX3kaeswd8Zd73UPEmxnu
	MqRnAODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbFh-0000000Atra-0kYV;
	Tue, 03 Dec 2024 22:20:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIb70-0000000ArzF-3vtb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Dec 2024 22:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/NCGCZqr17sVj2upoM7Gwc0ihyUUa8f5uRYg1Aproo8=; b=AG+AdaxrjMkF5CK/Yq1qxN4jGL
	zOwFHHnFjzCrEnRpE7mWmoz9wNF+SsZbC+YCCU/waIgtPu1pCAreYsD4lBU2Se1CwG+2NnIKYHKGT
	z6mNpdLb8U/02chHwDNyFVGKNUye5jhkBKtEZS5ar8nLR6ED/wolJAxvdnPCEsHXFL23c3SIcbqpS
	pcLOrgNB59qCO/OctLHNgXFpH8xqlFZEuKwswsT82/m6usb06eLzaneiVCM5+XH+V0GETz9JlkGzO
	z5jVBAnwUp72eNQaKGLilrXvBSN7E64iokTqzHX5qbNgJtF05FRk7VhdExhBtYyg5GD39oZ3C5nFv
	GGybytWw==;
Received: from mail-bn8nam04on2062a.outbound.protection.outlook.com ([2a01:111:f403:2408::62a] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIb6v-00000002Suk-2mgn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 22:11:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lo3jqJwBufCZL6o0FE62TSfSkoT6E20LB9aGrdRHxxWnd2+MKxuWCywQ2z7d5OoXwQ2L3pf1x3zR8SW4mYmEsw00VMYYdFuHV+LlVTbqcjUk8yHkKuIdDd8dfP18jt0Uw5Meh4T1qNNH8/QYWkVZ1zRX8iu6GgxsL7HAvdomyFvpwCpEuJHVG7qFkAegFZs0cjqjEsuP1Ot31sBEBKboMw0iik0UxVMni1twbC2f+1wlyBU2OAvoyo/oadcnTj3fyi8zng414bcD89UA/y7bgfFB67aIfLEOvfZhaPmfNvnHdysmrwvURe6eP/1L8TTyKxVNcb1PPab1j4ftWOQ7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NCGCZqr17sVj2upoM7Gwc0ihyUUa8f5uRYg1Aproo8=;
 b=v2QIXLTjco2/N6cyxeYlsinxh9ANfzuqyRQeQQFKxdm8FL1pYGU9hzdHZywaIj134uLViMsMaEwbJuEnhBxug9nto4w3/vyzBIm9IDuqkvm3D7AUxCCDN0OIeewLTKhQJ0vJj647VHw3noL5qrZBwvpUHKtAj8MZO0xJ+ocQyu0n8LSTuVIa9fURyXjl+rUdtSblVVoibog6Ro+SfAZu1nJN6YtO8/zP2s1kSwuKhGBjGPTgmH2VnvQVv1ZoOJP1gs53LdaXwM851RSlxFYLzKM+KZI8ML/7qnab0xPeuBkeVqf/MOtL+trnJZqQjgsJHO2RjbMlFNPQ/v+mDl9hgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NCGCZqr17sVj2upoM7Gwc0ihyUUa8f5uRYg1Aproo8=;
 b=EPe9B0UMCnqA/Cd3HNhV6cBQkFZZBrVUzJSSUTsDBPYkXUN9qiwKwnHYugxRxnVqqno2wE/nlypBApvpHpDMVIhY7J7r1Y653CiA43twclLRP44kuFzMO5vlT9q5Zy+jPBZ2kiiJI40Theyzhek0no1lUtpmXBVgtasOlWwQJyFgAtlf463tfvkrdZIYXUvC7qsYeLlHAvQ/WxnqyiecCushcM07eE6E7QuwTTTfanrv3xT1F6TchdKilfwmi+bPtw0SHJhbOZJIOebPcyoEj7mlKG/se8hwU/PZRcx+fDD6PXOJ/iEpx2mTnTLkCItH8ugR67qjMUcPsCgTwk6BeQ==
Received: from SJ0PR13CA0044.namprd13.prod.outlook.com (2603:10b6:a03:2c2::19)
 by DM3PR12MB9286.namprd12.prod.outlook.com (2603:10b6:8:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 22:11:03 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::5b) by SJ0PR13CA0044.outlook.office365.com
 (2603:10b6:a03:2c2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.8 via Frontend Transport; Tue, 3
 Dec 2024 22:11:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 22:11:00 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 3 Dec 2024
 14:10:45 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 3 Dec 2024 14:10:45 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 3 Dec 2024 14:10:44 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <will@kernel.org>
CC: <corbet@lwn.net>, <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>
Subject: [PATCH v2 09/13] iommufd/selftest: Add IOMMU_TEST_OP_TRIGGER_VIRQ for vIRQ coverage
Date: Tue, 3 Dec 2024 14:10:14 -0800
Message-ID: <7993411d7634d6bf5e7da4459ca4ee540f59188a.1733263737.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1733263737.git.nicolinc@nvidia.com>
References: <cover.1733263737.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|DM3PR12MB9286:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c6a2d5-dfa6-4e46-0ecf-08dd13e75ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+D23Hh75keIEiJHAMbFaw1W44unuDMPoRo9gE0o5BP/o8j/Nuy84yZ8pSWe3?=
 =?us-ascii?Q?AsfKf5psCeVkH39lp/Rf9I/sa4n7tbIeovIIO6h6tfyP4Px3WwKfoQs8x+NR?=
 =?us-ascii?Q?T4gXy8THUblFevOMkzokOxN2DDcRxN+pHySDhbZlUG+wd7NuxLy/DkmW35j4?=
 =?us-ascii?Q?SxDZyFHzFy1V48otwtNyDElRLn1tVyJ3PmNWscB8jveNgR87O9/yhEgaOTcM?=
 =?us-ascii?Q?r640C9uPo33yogoP+nxx0jGuzqFCayb6n2Klzayh4o0UkFwkECyHJKeFziJ0?=
 =?us-ascii?Q?kSDOemTt4ojwg35FuNtdw8cmdYtoOi6bszVcR+c2AjefQTToqkoBQlyqqu2C?=
 =?us-ascii?Q?39AaIzPWyr+6TlVNaXYdMXVi1ozd43zXBD8BBBoaD5UkV/7hCOZiofMPw8BK?=
 =?us-ascii?Q?KeoubFi3cwwcfQIrV6E25gvdsbwiV7m8HzrShSLrj1533TUGNBjN24ULvdPr?=
 =?us-ascii?Q?B1m5b+rRczgSIVI3UZ77RfXy6X+41bYZRQ3JK5kIU3ZOPuNb+13CoegL6SKb?=
 =?us-ascii?Q?Y90ZVkhmlH4ls9Zv8EejlZZYjhW7cmTDmHsEPlFdQ1CvtOeR1+HWpa7I8OUl?=
 =?us-ascii?Q?taxuPYXYEAzGjaCmNLkn9V9aA4DvdhZY9ib0mSbUFQQYYR4t/ckSJzYCXVN8?=
 =?us-ascii?Q?nFy2DzJ7t4rMehx4Jq03+eWQaBL8SHzjB+u64BtAHcuOzAApCC9tkdrUJvvA?=
 =?us-ascii?Q?OJ47TEuvZZ7efc/cRG069HneplcQYu+i9lFhi+7Eivkf19TPCgF3Rk3wYSxj?=
 =?us-ascii?Q?WQPjQ13AK25aAftvqs7A12+lA59nHQHvAjMxMLfCfEUcpbIuJQNpOYerxI7k?=
 =?us-ascii?Q?9jR4hxQ7yAi87HDxGS7NujeMLqgspxbvstT8T9flnFkFLz+yvbGWiARl0gYE?=
 =?us-ascii?Q?kcQ2o/g+UeLZd+7drfvnVzc/HwbP/PRTeQFODtRkwmE8wgb7bD/4OHVeij7K?=
 =?us-ascii?Q?tSx2J8cXHACU4ocCj8jwmYHVs/ZVoK+7W0zS1ckXwjvGnic8uzu1Rj5UfEr+?=
 =?us-ascii?Q?PEl86TegAWSSmBjRs7mc3GnIBGbwu6l/SvGIbup3evS6Tvzby/3Zn+fTjIQQ?=
 =?us-ascii?Q?sVO23Dv0tfSaqtRsXIV4GuFR7VpRrU9UmXfaKfq/p9F//cOQRnr34nMh2ztJ?=
 =?us-ascii?Q?XdbefHymlfQ4/B2cRpJjOaB0vbOsDDKc0k5ntGZhPJ4uMXHvyH/HtqOTaeLG?=
 =?us-ascii?Q?Ebis3pgOuhG29BmLd5s5gCOjWiRJDOhGRFgQoWvCZZja/NUcrnARVN7NUZex?=
 =?us-ascii?Q?GGsb/zeEBjakLx212GTMK+vyUknPPNryNXExdCCq4nEN01/LUiPpFyEJFhkW?=
 =?us-ascii?Q?TDpFJIYBprX4vBllzreQhNnbOzqyRIScLRdF6+lVFXYJIC33y8MK8usciQkN?=
 =?us-ascii?Q?mXpdJgDdIF0II222/64EgqUF15twYlY+W6Xa5xwQ2JX3E89aAGhM+TOuH+vP?=
 =?us-ascii?Q?XJ/9C0GZKAy+GGEAHn+0Fa5Q4mcWbL/4?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 22:11:00.5993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c6a2d5-dfa6-4e46-0ecf-08dd13e75ede
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_221113_881601_8ADCA6B5 
X-CRM114-Status: GOOD (  11.37  )
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

The handler will get vDEVICE object from the given mdev and convert it to
its per-vIOMMU virtual ID to mimic a real IOMMU driver.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_test.h | 10 ++++++++++
 drivers/iommu/iommufd/selftest.c     | 30 ++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/iommu/iommufd/iommufd_test.h b/drivers/iommu/iommufd/iommufd_test.h
index a6b7a163f636..3037904f2e52 100644
--- a/drivers/iommu/iommufd/iommufd_test.h
+++ b/drivers/iommu/iommufd/iommufd_test.h
@@ -24,6 +24,7 @@ enum {
 	IOMMU_TEST_OP_MD_CHECK_IOTLB,
 	IOMMU_TEST_OP_TRIGGER_IOPF,
 	IOMMU_TEST_OP_DEV_CHECK_CACHE,
+	IOMMU_TEST_OP_TRIGGER_VIRQ,
 };
 
 enum {
@@ -145,6 +146,9 @@ struct iommu_test_cmd {
 			__u32 id;
 			__u32 cache;
 		} check_dev_cache;
+		struct {
+			__u32 dev_id;
+		} trigger_virq;
 	};
 	__u32 last;
 };
@@ -212,4 +216,10 @@ struct iommu_viommu_invalidate_selftest {
 	__u32 cache_id;
 };
 
+#define IOMMU_VIRQ_TYPE_SELFTEST 0xbeefbeef
+
+struct iommu_viommu_irq_selftest {
+	__u32 virt_id;
+};
+
 #endif
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index d1438d81e664..0785c9447102 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -1631,6 +1631,34 @@ static int iommufd_test_trigger_iopf(struct iommufd_ucmd *ucmd,
 	return 0;
 }
 
+static int iommufd_test_trigger_virq(struct iommufd_ucmd *ucmd,
+				     struct iommu_test_cmd *cmd)
+{
+	struct iommu_viommu_irq_selftest test = {};
+	struct iommufd_device *idev;
+	struct mock_dev *mdev;
+	int rc = -ENOENT;
+
+	idev = iommufd_get_device(ucmd, cmd->trigger_virq.dev_id);
+	if (IS_ERR(idev))
+		return PTR_ERR(idev);
+	mdev = to_mock_dev(idev->dev);
+
+	down_read(&mdev->viommu_rwsem);
+	if (!mdev->viommu || !mdev->vdev_id)
+		goto out_unlock;
+
+	test.virt_id = mdev->vdev_id;
+	rc = iommufd_viommu_report_irq(&mdev->viommu->core,
+				       IOMMU_VIRQ_TYPE_SELFTEST, &test,
+				       sizeof(test));
+out_unlock:
+	up_read(&mdev->viommu_rwsem);
+	iommufd_put_object(ucmd->ictx, &idev->obj);
+
+	return rc;
+}
+
 void iommufd_selftest_destroy(struct iommufd_object *obj)
 {
 	struct selftest_obj *sobj = to_selftest_obj(obj);
@@ -1712,6 +1740,8 @@ int iommufd_test(struct iommufd_ucmd *ucmd)
 					  cmd->dirty.flags);
 	case IOMMU_TEST_OP_TRIGGER_IOPF:
 		return iommufd_test_trigger_iopf(ucmd, cmd);
+	case IOMMU_TEST_OP_TRIGGER_VIRQ:
+		return iommufd_test_trigger_virq(ucmd, cmd);
 	default:
 		return -EOPNOTSUPP;
 	}
-- 
2.43.0


