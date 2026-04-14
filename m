Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F35BF531EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 03:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kf26vYYknevrMgWVWkOZATmzSLLE6pMpr1SBawQYMHs=; b=1k86/d6WcH47vRQeQ1cZ0sKgQC
	qtD2LQEZNkh84BCqg77VcMo6gkV26kJvQ1WejuVI2MaYcA82/QMHc5mYf6j1g+qNe/MnTJGNYJkte
	S8L5Y/FYfLSlPfwh0JlDIkHhPQk1uFgqanrunXsmvYexPkVonNKokz7LcoabpY0X4y1aMLCHTFPIU
	/oygKm3NSV/3jtDaDlOxrGM67NGulcXsFzdP+K7GYCpynbR9Q2Zwha8w5BamHEUhdibe8IzZQ8UJe
	aDnUuGJfaN7k3SOPwRTjB9H1JniYjtdsqLake+osS5qVIGqq9wfMh17z0SkNzvkRgSs8bpDZNQtBr
	73ffsKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUQW-0000000GdhX-0D7C;
	Tue, 14 Apr 2026 03:27:00 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUQM-0000000Gdeu-45Ua
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 03:26:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Kf26vYYknevrMgWVWkOZATmzSLLE6pMpr1SBawQYMHs=;
	b=hWL112wdtl8oI8IWY0hVCb0Dl4PdMXEQLLhvMbEshsbm/Lj1Kzwn/d2JEehQMrLVVOOZdivPC
	03Jfqt8PBls0dvfoQaRgGYh76OqOZ8KNugB3Sav5YXZ1g+b30POqi5d8Er9hVrF7sIjsSRVlyp2
	yxrbNrpgT214gIX927K2lQI=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fvqKN5Xp5zKm4w;
	Tue, 14 Apr 2026 11:20:24 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 3889940572;
	Tue, 14 Apr 2026 11:26:44 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 14 Apr
 2026 11:26:43 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <james.morse@arm.com>, <Dave.Martin@arm.com>,
	<fenghuay@nvidia.com>, <reinette.chatre@intel.com>
CC: <xiaqinxin@huawei.com>, <sunnanyong@huawei.com>,
	<jonathan.cameron@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH mpam mpam/snapshot+extras/v6.18-rc1 v2 2/3] fs/resctrl: Remove unused 'of' parameter from rdtgroup_move_iommu()
Date: Tue, 14 Apr 2026 11:26:09 +0800
Message-ID: <20260414032610.1523958-3-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260414032610.1523958-1-zengheng4@huawei.com>
References: <20260414032610.1523958-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_202652_027527_DEE974D4 
X-CRM114-Status: GOOD (  10.69  )
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

The 'of' (kernfs_open_file) parameter in rdtgroup_move_iommu() is
not used within the function body. Remove it to simplify the
interface and eliminate the unnecessary argument passing.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 fs/resctrl/rdtgroup.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 1810ace9538f..e92b5dcb6f2e 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -767,8 +767,7 @@ static int rdtgroup_move_task(pid_t pid, struct rdtgroup *rdtgrp,
 	return ret;
 }
 
-static int rdtgroup_move_iommu(int iommu_group_id, struct rdtgroup *rdtgrp,
-			       struct kernfs_open_file *of)
+static int rdtgroup_move_iommu(int iommu_group_id, struct rdtgroup *rdtgrp)
 {
 	const struct cred *cred = current_cred();
 	struct iommu_group *iommu_group;
@@ -849,7 +848,7 @@ static ssize_t rdtgroup_tasks_write(struct kernfs_open_file *of,
 
 		is_iommu = string_is_iommu_group(pid_str, &iommu_group_id);
 		if (is_iommu) {
-			ret = rdtgroup_move_iommu(iommu_group_id, rdtgrp, of);
+			ret = rdtgroup_move_iommu(iommu_group_id, rdtgrp);
 			if (ret) {
 				rdt_last_cmd_printf("Error while processing iommu_group %d\n",
 						     iommu_group_id);
-- 
2.25.1


