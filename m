Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F981C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 20:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvhDhdq8BqMWYZAy8VZpGH4FR6q5dbcFBgzSx7Z7lc0=; b=DDLShoqxtczVEQfp7B+svtejwj
	NfsMiUS+qRyY6ZBxC8Vq5Syp/ymzmhjyYJszmZC7wTZISm/0WmVPXHR9gk0cpbo0iPzt4YaltjhwG
	ZCsrV/GLYseSdYvnJncD8IquCeaJpy7kCgLkT8uv0iKPC3e7vHY6joFpz4tV0beOsSGgh0FUZzirq
	nqjB/mmRBGeL1+lrk4Py0ATfTgVtthtJ34nSr65idIp1S0r3dTdrg/QWu3rkMZgwUQ+Y35ft477iU
	+OwL/xKHYT9qiPeRc0rg8Ec74wjw7MnMDOKofHV2Pa4DUybSexlBWlta2IUDwFDanVBHcbC6H9PTF
	9Wm89AwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5n1-00000006ro3-19O4;
	Tue, 11 Mar 2025 20:01:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5Xr-00000006oR8-1aCs
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Mar 2025 19:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WvhDhdq8BqMWYZAy8VZpGH4FR6q5dbcFBgzSx7Z7lc0=; b=ij5ARA3iGV09xac267+ZMH1AUE
	2ZhwVe5k0aE2Gl4560p9AwHVutOa34bREzAr1zgfU0J033f3zyJ70fH/99pMOYzQNwA16PeUWhSG/
	3juBvCweas4wHK6M9nnrj9IHMgP+3gBEBFaF3JWLujRTt70yODz8mM19x9L+nIzNCSIXIBD7NzjPu
	ELe0hFmehLwyjS6ZiwzT1OlDX0anY8wHDsdZXIMMMXCmdzqY300C3KOCkCqvTLejXo9/nbIpihMm1
	4YPTUpSOEtfNcN/uF4aao0WvL4mbwisthyY1htgC3htshGvHYMbIcQX+ppm92P1KEoQv1RVtA0R2p
	cREQIRew==;
Received: from mail-dm6nam11on2062b.outbound.protection.outlook.com ([2a01:111:f403:2415::62b] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5Xo-00000002Ek2-1Y1p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:45:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHk4Xy4aHB3YKgG/kK7O/k5DlzZQpdiC9lpM9ODSaGdfr5RIQMgr67PEAlWut1YtOKtjGij2FxrnPjITOxlSPAliree1RORkCH+fTD6zi80eHbXVhW+IobJyIEiLQTP0pKT08FWz3cz1E4HilZNExzoj6Dr/MxRCIyCEW5fb+1xxFeMv/hyYkuu7qHyFHUC2I77eeyCb6aX8G97kDQz75uW4zIFJCpLKElUzz3OltcDJ+NXomWLn3S0kYxlWPANyYwafh+DulDwrNMUO6bqmJXJWI5jIBm6MO5sgxn7kOEpnR031kIEuB7epbZxv0nSQOCSdLgzkmns0T+rE7XrXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvhDhdq8BqMWYZAy8VZpGH4FR6q5dbcFBgzSx7Z7lc0=;
 b=YoVGecYLJbdBz9BxiAjCHVOd3SCbRerCEkTfch+ZjVPIBSrbqb97tID1Nf9C0JfVBhrkWhdmo+TTrxpmbxLWxB327GBkYBrqQIoVTqlyizuOCEX0+VundfMQipuU1Hj9KI1P2rbm+0LjHKUoTJHg85eL6JqPHufB50M9ShBH3lcRcU+K+zs4Q+rEFJEL4FA/1724jIg7kcsuLm8LIbBdGKmNhzFvyhsn57qLu0aTGwOIQ4KgmN4OR7KTFsHvr3LTj3+lewNjVBL7vSZWDJkx+AcW8Ty6rB7tRsx9xim34qpkCZIko5PXhcMmonievqqc0MrS5mCNZLKYQg3T/FsZNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvhDhdq8BqMWYZAy8VZpGH4FR6q5dbcFBgzSx7Z7lc0=;
 b=i0spDSxiWCffECqLyhhhTP6V3tfvMMSpBcaBbHXwcu0bFBfXiCaievqOxdxEpXiDmf2lnWnq0XjybbMVvjuTUgyP4LOWdSjdn3+VYddQmNBAXkM5veFs/GTA7VcGxjvpgstS899OPqv4p4WPRp+4rvCI95JlqIEhlpQ1+BjQYhwdbsnymQ81DXKxA+LPztJf+BK9KpUXwkAEbJrxZTX3g0K7STFEiFxthN+Kdg+w45vojmgcvcZP47qxgxcHLsknHXMWhAjXvi70qBB7eF1henGacQOnCbnm/vutnche/ZDcDXeRLfmY5R/AwCRCoHUgVT7MnK9+NtuelhLqFVV3+A==
Received: from BN1PR10CA0002.namprd10.prod.outlook.com (2603:10b6:408:e0::7)
 by DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Tue, 11 Mar 2025 19:45:30 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:e0:cafe::b7) by BN1PR10CA0002.outlook.office365.com
 (2603:10b6:408:e0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Tue,
 11 Mar 2025 19:45:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Tue, 11 Mar 2025 19:45:29 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Mar
 2025 12:45:18 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 12:45:17 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 11 Mar 2025 12:45:16 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <joro@8bytes.org>,
	<suravee.suthikulpanit@amd.com>, <will@kernel.org>, <robin.murphy@arm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <praan@google.com>,
	<patches@lists.linux.dev>
Subject: [PATCH v9 06/14] iommufd/viommu: Add iommufd_viommu_get_vdev_id helper
Date: Tue, 11 Mar 2025 12:44:24 -0700
Message-ID: <18b8e8bc1b8104d43b205d21602c036fd0804e56.1741719725.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741719725.git.nicolinc@nvidia.com>
References: <cover.1741719725.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|DM4PR12MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa852be-075a-4dbb-ab9c-08dd60d54724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wRfPtIoLaNdvqHlFt9C3OJkTJqqk2qM5+a5Uf1UPVwe79z35JfxL6uyJW9j0?=
 =?us-ascii?Q?XlYcYAn64iSlsP0VZ2gl3GcejaS0BcHSSniG7muaCXxaie5aC5fJp2F1SbIh?=
 =?us-ascii?Q?oTEaqboj/y0ERAuqR+KmMze0cAQgh9VtJIpZEKZV2D70jZrAYV8jgrpL+y4i?=
 =?us-ascii?Q?5wrC+Qf15gYKXV9ZZxQtbbu+NGu9ofi9rBYd2aAppKfbrmYztBGTEuVCTUNV?=
 =?us-ascii?Q?Z3nlUpcDBMB9AfI4lm9Fdg+i/Ie1yff4j4d1AYQr9wogCQ8MkObaj9omZDWV?=
 =?us-ascii?Q?Kg28K3IUqqTk7K1g/N+sty94I085Pgimc2gPoLhZmXw9/la4DLykQOHysoy6?=
 =?us-ascii?Q?BEIw8O/oqYLC0jKZEP1pVT40Ip7Dc7aBQ+Tu6cL89mNjswsBICY5oQmhjK9B?=
 =?us-ascii?Q?eIwIJ/h0pPS8CU6f9M/ymKPpB2lxb6cLD28V+lgbG4ud4BmlP2T8Kacpx57l?=
 =?us-ascii?Q?g7MR5iucEdmJr1gfAWvhNHCUoeHgaOACWSG7SBmRpirIIa76wGD3J2inXjKL?=
 =?us-ascii?Q?R0hrFFUNHEC+Zb5ui/3Ca1A9NsxyenHxjw7U78nMRM+UPCn+IJArMGwFIiDc?=
 =?us-ascii?Q?as/lqZD5zGSyAI3gVaEM6EN2X6BkS3xW/e0YkytqCbyK6dAWAcqrQmv/43h3?=
 =?us-ascii?Q?prJFE8O9iyb9jLmJw8Dc45dIyzIgw/4A9lRyjgvrzWsBGEGNfm8lzEzMyGup?=
 =?us-ascii?Q?k3yGxICLhpljDf94uRwls1VA1mKx2E5qwHmntbNFXGtM852ghac1XWdEU6kS?=
 =?us-ascii?Q?C6QijIDIS2IFtr8Cys15z+9YUlbdfTRm8BSTMEKEOyVgmx+0Rocvcjrn5oNI?=
 =?us-ascii?Q?D/TpClEyvDZpljVH5i/HvA0PKv8ERfERAjwz7GM90AVgJzy+NamrrYxQKhyQ?=
 =?us-ascii?Q?QVnpqMYXqzqiPdATxQWMI/fjSeZNZ1WakdHKvptzQxJATHr+zXsnhibXRkME?=
 =?us-ascii?Q?TzuN+oA5tfyTs1Lc532Gz8gt+tn13nxITH/uIaTVTeSg97qZKzPyvzIaauBB?=
 =?us-ascii?Q?CbqxSpjWTQ/QdOMU4i4qfneerl1WYhJZNLKLNmeee4K2lnBWYZFsYTyoiBgU?=
 =?us-ascii?Q?8MFnC4EbATM3SMggcMe3jq8uah5/f90y22AYuL9N1zlPwvuSjd7TtS6JfxO0?=
 =?us-ascii?Q?StjQP01N1qb82zg9Xm5wSwArtSKVnM34VpyvVrtFpUKfefVQ5glEO1vOXrCj?=
 =?us-ascii?Q?ybRGAe6QdxBODDry46F2qz0Zq+d0fcyj7R9TjcYMfDEg0RXuCR/HOmfAm2qa?=
 =?us-ascii?Q?u1pPgy8QLU9cicU4fzMlT5jiATsAiwuuPhvh0MIiUTcY5Aje1zJ7hedAvZM9?=
 =?us-ascii?Q?qkZwC/xBzV9WuMOj/GjfEeoFZslaQ0apFxocYv6OzVaz6/kNiIMZst78vK0h?=
 =?us-ascii?Q?yiev1ovaMEWQYAIgAmG/Dt831uFLuqsYfh1cQlEFCV4S/xHEqnF72TyGYXJH?=
 =?us-ascii?Q?P4zXampS0Kqb9ypqmP2Jqo/bVmM4VR6zNYfRntZ+gtNKgwc445uE7dSEjX2T?=
 =?us-ascii?Q?fKCXLQGdXQC9wZ0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 19:45:29.2489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa852be-075a-4dbb-ab9c-08dd60d54724
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6448
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_194540_512399_40719BC5 
X-CRM114-Status: GOOD (  12.11  )
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

This is a reverse search v.s. iommufd_viommu_find_dev, as drivers may want
to convert a struct device pointer (physical) to its virtual device ID for
an event injection to the user space VM.

Again, this avoids exposing more core structures to the drivers, than the
iommufd_viommu alone.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommufd.h        |  9 +++++++++
 drivers/iommu/iommufd/driver.c | 24 ++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 8948b1836940..05cb393aff0a 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -190,6 +190,8 @@ struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
 					     enum iommufd_object_type type);
 struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 				       unsigned long vdev_id);
+int iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
+			       struct device *dev, unsigned long *vdev_id);
 #else /* !CONFIG_IOMMUFD_DRIVER_CORE */
 static inline struct iommufd_object *
 _iommufd_object_alloc(struct iommufd_ctx *ictx, size_t size,
@@ -203,6 +205,13 @@ iommufd_viommu_find_dev(struct iommufd_viommu *viommu, unsigned long vdev_id)
 {
 	return NULL;
 }
+
+static inline int iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
+					     struct device *dev,
+					     unsigned long *vdev_id)
+{
+	return -ENOENT;
+}
 #endif /* CONFIG_IOMMUFD_DRIVER_CORE */
 
 /*
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 2d98b04ff1cb..f132b98fb899 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -49,5 +49,29 @@ struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_viommu_find_dev, "IOMMUFD");
 
+/* Return -ENOENT if device is not associated to the vIOMMU */
+int iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
+			       struct device *dev, unsigned long *vdev_id)
+{
+	struct iommufd_vdevice *vdev;
+	unsigned long index;
+	int rc = -ENOENT;
+
+	if (WARN_ON_ONCE(!vdev_id))
+		return -EINVAL;
+
+	xa_lock(&viommu->vdevs);
+	xa_for_each(&viommu->vdevs, index, vdev) {
+		if (vdev->dev == dev) {
+			*vdev_id = vdev->id;
+			rc = 0;
+			break;
+		}
+	}
+	xa_unlock(&viommu->vdevs);
+	return rc;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_viommu_get_vdev_id, "IOMMUFD");
+
 MODULE_DESCRIPTION("iommufd code shared with builtin modules");
 MODULE_LICENSE("GPL");
-- 
2.43.0


