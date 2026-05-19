Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BC1CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 05:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQq3aVfqt1N43D66BL0k9/HeNQ1xI8wSPBMYSlAmAc0=; b=o4RoAuStOKApqb+ZUtmfux/yc1
	zv9P1/EZSfc2pk9uyoyngckhjYg09dFI1VgmL7jYjVB5GXco4zOZqTeD7R+W1MslBAI4gt6Vvcw0q
	RLMq17KIwjzR7hbH1ptygbpRuVgE6pw9sApigueIQc34V39JRFR74xnHyiC7Q1WSuWpRkkkhNoL54
	yOjpN/dNOtcR3ftXmeE4YHUtKWVVwo1JTCBqtSqaSeDPvA6UH1Jjgjh/PPuD5KP60EIXwywXFZmnW
	C2AFzRbdo01NOEp9PZ7ZGDoZIor1ovC0KWdjSBbnIaB7UL46S94J5imunIchDSde+CwAYccRz/dRz
	UzsGOP3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJS-0000000Hb4w-1f9W;
	Tue, 19 May 2026 03:40:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJL-0000000Haxs-1q2p
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 19 May 2026 03:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TQq3aVfqt1N43D66BL0k9/HeNQ1xI8wSPBMYSlAmAc0=; b=GAQTTmgO6qQq+SIIagyF8+0XmK
	D3rFhcVndNh4+di6GPbT476xM4ZnA4ysOU+Ui18lGNtxB6p7gmALFBhMH2VlCtDaKJWw+TZ1yvv6w
	sjnRyizLBaHqaq6rFMznVUmaj6A8E2wsYOZ8zihJSo9kPOvYHCHWsEqt0/khCIXp8E6IsGQcRJKlq
	mlfVIvsANApdFCUbUwtAJ+LiWVVonMj+aMoCgfbjjwBpBDjhc/Pp4iKDgIOE0MpyqM6YiXuvDCEjr
	nKWaUG3oBIrdkuc1F6L2vql4ED46IQn1KO58nQCSZaqChVcG5oId3a37pNb24aWPYLfbs8KM16saW
	6oe8Y5rQ==;
Received: from mail-southcentralusazon11011007.outbound.protection.outlook.com ([40.93.194.7] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJG-0000000Czyo-3q1d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 03:40:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPknR5zbB/HYsiIV0fnqF+czsHxZF913O5TSRVrXZFMLBsaDCR3ga6ZH4/ofv+mxMftGPglkvDfzMwgzbZmofEBpNFzhshcxDG64cj2xki2q02ftkrmeDutqEbUvsYQRG0hkXRxkD7+pR04YIZeasueSgHWg2wP9cBBJ5dQRWu7GC50WDyudYVFSvAWmwnHmYxvxg4s6ID39OTSkX6IcTT4eqPd3XoPJjCPjqmyKZjhPUcYPN/FwQTM2420gfY12yTzLm0wFlXp4CgRQrlOEV6xvgW9VE3F+VmHMQ+1hawdLasgxVmC4DGV1R/4OJQgkYR0OOyv+TwhlVgCFgmv5eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQq3aVfqt1N43D66BL0k9/HeNQ1xI8wSPBMYSlAmAc0=;
 b=dNNeGJZ2gVAeL0clP3Lq/0k+6inu9wcakWQ8+hXkSJMhcWVTm0EtKHEKaisBrW6aAQg55zprAlzmg0NtmzNPo4QMgLG9DziDfQucYJGfTFSSYzFs3JvDBAyA62vjhPKgdrSiZEcjCBKm6Z+alHW0BdFR0XqcYhg0JpO0IjXqVh5lBX3BzXUaS1Q2ue8fjEH1kVz58pOodbvd3lF7VUUG7VxVhZUBDS/HQVlh7lcQKLkw/T8QMVd4HHwwvi8X2+9CO/N5SJJwlj0FmJf+TRZk34onvsLR+qQm7tvHxL/KXP28kpEzCA3GvGBq7IerthefBRdmfGpLjc33TzXadc5iww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQq3aVfqt1N43D66BL0k9/HeNQ1xI8wSPBMYSlAmAc0=;
 b=Rkp/Clxe1hrft0QnnF0yjHjf8nKiUvtug2OzuC4C2uebSCDzlm6RpEIpxNO6DZFzehTq7KixM+sayxXw4VF+T9tKK3gK3iZvKwTQnV2ua/X3l8wjO8CtZynBWKjtkOAJyKyo3OksFWRDj0JL9RkuYKj63aH+BFC9XwYzVSQdmJwZx5NBs8cjg9Aq/iGpXH9eG9eFSVK7nF4Dqf/mroXtueBhLMFIBFKC/QtoqThDWyZFhlZWET6XQi8pkP9G2Yed2btNMG8sHtWmKtXZWtA/kruzGEbfKyfQAORl57esBbLNSG/fXSW/nsPNFF0rb/kB816kj9KFY3FswJ22De2zEQ==
Received: from CY5P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:b::30) by
 BN7PPF0FD1DEA27.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Tue, 19 May
 2026 03:39:48 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:930:b:cafe::b1) by CY5P221CA0002.outlook.office365.com
 (2603:10b6:930:b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 03:39:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 03:39:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 20:39:32 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 20:39:31 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 20:39:30 -0700
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
Subject: [PATCH v4 08/24] iommu: Change group->devices to RCU-protected list
Date: Mon, 18 May 2026 20:38:51 -0700
Message-ID: <5eee6cadabf8976eb3abe03306eaf0bc5d9d73ec.1779161849.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779161849.git.nicolinc@nvidia.com>
References: <cover.1779161849.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|BN7PPF0FD1DEA27:EE_
X-MS-Office365-Filtering-Correlation-Id: dac03f84-7b69-4d0c-535c-08deb55845ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|7416014|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: Q394jQBf3qbnOSXPxqsUn1SSvSVhDlbpjhVMH4y0pKyhNBuGJydasm/eov35OWxskOfzKgYdAUrm/p1txNZLAbDHd8nZNxX769LRUJ54xLroVNoEj58IBJ6Vo8B0+PAM7M2ZaJj4TUOvE8aedJ3QSxmHMfKlramo4nOSjJ/WigbUYe0aTBaPw8yP6g+vals7cduF4s/DmDh2bSeo+/+uYq5MbMkj1+mdm4IJZwXWHU5cKquSnfdYLnyA4mb2wtQN4M/lAiUCrVRtpZn9TaLiJwauQcvJ4b+hSDc1xZx3DGi6KNQKZd7FNGRubeKM/JDZn5xZTJXQHJoWSRGMxA8e0rCwbBTwVw4Mxy/UmluSrimK0Ukptdcx1tt1aEkvnUHMm8P2Wtalj0gVNtwtmJ9eb67LBIb6i5si2aVH2sOFdjlb1aEelGmKht6x8k4JZq2Ci1JcxVsxjQKl+j9ocSl0teUrWHN49bissv/NJ4KH3LuHKdUBY07O3KNgizGeWquGb5zkMWRTkKth4ZvN0bjHUHhjSvHJmw6SzFuMM31tx/sGDY0+L01YTnm5yiaMpOmK5d2lQFoo7JET5cLqhchqGGdIU1uA6OZoas7BzfzYSf+jDOouquEzflhJlqev5VKu0HD25mWGD+HFv9dsNAxHlwCzAmYhHNmnuf/ndpvFXu2aimcZ96yQSk/qdFgJLHIgInAWWfVrsay7kGd6WUU7sDAiHyxE5GvoJXSHTwTBOxg=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(7416014)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4wqwFOYjVOuqnjmplkOOHNTpkzCgYDw2KFPT1D6q5HPLKwHfsevxpZpJ5TVBrjb2HHyOr2opFRe3mVdK2S0HJerZYsn3fxrlGPDkV4IWyw+Z5FBNSB9cwiKC9ASQj4NWVShOaL30yeiOBiZDEiwmUWuGsMfp4O/ikhs6KLihs0w1rsAGa1dtM2tbbJ4ECA/QBHJaqGCHS991kvBi3csS/rENNQoovRt3smfKA//AOSLeunYM6WWoV+tgv60ggnz72dlWG6zmVVAESeBmJwqxynMFY6VClcuN4YUCZCx6WUEpef4yhc9jqssp50BPV4GF9mhCbO2VdhPe9xapFDIbGCtE2tth40EMIqnfZ46splIJjMr5qCzBmVr8lLyBJnKFnA+FYkv6N1qXNP80ce18TGKzEhmZEFVFlhR0s9rA5QzNmxWhSov09PlPlUvdkckw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 03:39:46.6495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dac03f84-7b69-4d0c-535c-08deb55845ed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0FD1DEA27
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_043959_495158_392BDFF9 
X-CRM114-Status: GOOD (  17.20  )
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

To allow lockless iterations of the group->devices list in an ISR context
that cannot hold the group->mutex, change the list to be RCU protected.

Mark the existing __dev_to_gdev() for group->mutex case only. A subsequent
change will add another __dev_to_gdev_rcu() for RCU case.

Hold grp_dev->dev across the RCU grace period using synchronize_rcu(), in
__iommu_group_free_device(). Without that, the driver core might free the
struct device while an RCU reader is still mid-iteration.

Note: a call_rcu() callback runs in softirq context, but put_device() may
sleep -- the device release path can invoke devres_release_all() and
->release callbacks that take mutexes. Use synchronize_rcu() to defer the
put_device() to the (sleepable) caller context instead.

Note that in bus_iommu_probe() there is a for_each_group_device marked as
FIXME, which can't take either mutex or RCU read lock. Plainly replace it
with list_for_each_entry for a status quo.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommu.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 2f8f3ea13f490..4116b28258bde 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -97,8 +97,10 @@ struct group_device {
 
 /* Iterate over each struct group_device in a struct iommu_group */
 #define for_each_group_device(group, pos) \
-	list_for_each_entry(pos, &(group)->devices, list)
+	list_for_each_entry_rcu(pos, &(group)->devices, list, \
+				lockdep_is_held(&(group)->mutex))
 
+/* Caller must hold dev->iommu_group->mutex. */
 static struct group_device *__dev_to_gdev(struct device *dev)
 {
 	struct iommu_group *group = dev->iommu_group;
@@ -688,7 +690,7 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	 * The gdev must be in the list before calling
 	 * iommu_setup_default_domain()
 	 */
-	list_add_tail(&gdev->list, &group->devices);
+	list_add_tail_rcu(&gdev->list, &group->devices);
 	WARN_ON(group->default_domain && !group->domain);
 	if (group->default_domain)
 		iommu_create_device_direct_mappings(group->default_domain, dev);
@@ -719,7 +721,7 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	return 0;
 
 err_remove_gdev:
-	list_del(&gdev->list);
+	list_del_rcu(&gdev->list);
 	__iommu_group_empty_assert_owner_cnt(group);
 err_put_group:
 	iommu_deinit_device(dev);
@@ -762,6 +764,10 @@ static void __iommu_group_free_device(struct iommu_group *group,
 	trace_remove_device_from_group(group->id, dev);
 
 	kfree(grp_dev->name);
+
+	/* Wait for any in-flight reader to drop the reference to gdev->dev */
+	synchronize_rcu();
+	put_device(grp_dev->dev);
 	kfree(grp_dev);
 }
 
@@ -779,7 +785,7 @@ static void __iommu_group_remove_device(struct device *dev)
 		/* Must drop the recovery_cnt when removing a blocked device */
 		if (device->blocked && !WARN_ON(group->recovery_cnt == 0))
 			group->recovery_cnt--;
-		list_del(&device->list);
+		list_del_rcu(&device->list);
 		__iommu_group_empty_assert_owner_cnt(group);
 		if (dev_has_iommu(dev))
 			iommu_deinit_device(dev);
@@ -1298,6 +1304,8 @@ static struct group_device *iommu_group_alloc_device(struct iommu_group *group,
 		return ERR_PTR(-ENOMEM);
 
 	device->dev = dev;
+	/* Keep dev alive for any in-flight RCU reader of grp_dev->dev. */
+	get_device(dev);
 
 	ret = sysfs_create_link(&dev->kobj, &group->kobj, "iommu_group");
 	if (ret)
@@ -1337,6 +1345,7 @@ static struct group_device *iommu_group_alloc_device(struct iommu_group *group,
 err_remove_link:
 	sysfs_remove_link(&dev->kobj, "iommu_group");
 err_free_device:
+	put_device(dev);
 	kfree(device);
 	dev_err(dev, "Failed to add to iommu group %d: %d\n", group->id, ret);
 	return ERR_PTR(ret);
@@ -1362,7 +1371,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 	rcu_assign_pointer(dev_iommu_group_rcu(dev), group);
 
 	mutex_lock(&group->mutex);
-	list_add_tail(&gdev->list, &group->devices);
+	list_add_tail_rcu(&gdev->list, &group->devices);
 	mutex_unlock(&group->mutex);
 	return 0;
 }
@@ -2011,9 +2020,11 @@ static int bus_iommu_probe(const struct bus_type *bus)
 		 * FIXME: Mis-locked because the ops->probe_finalize() call-back
 		 * of some IOMMU drivers calls arm_iommu_attach_device() which
 		 * in-turn might call back into IOMMU core code, where it tries
-		 * to take group->mutex, resulting in a deadlock.
+		 * to take group->mutex, resulting in a deadlock. Unfortunately,
+		 * as iommu_group_do_probe_finalize() can sleep, rcu_read_lock()
+		 * cannot be held to mitigate this.
 		 */
-		for_each_group_device(group, gdev)
+		list_for_each_entry(gdev, &group->devices, list)
 			iommu_group_do_probe_finalize(gdev->dev);
 	}
 
-- 
2.43.0


