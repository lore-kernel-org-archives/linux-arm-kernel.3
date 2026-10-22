Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06AB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GpQQQWNU;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KFYlIyDl;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KFYlIyDl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b0wRLcy0ggQaa8LoaAXhe35ntO48tNtFxyE60noBeWY=; b=GpQQQWNUBg+f/Ifp6bY4S3krOn
	Rq/L1Y6BPe+kaL6wp+wDasZuhHsfpT53sEHdh3pf753rSMroV5mDZrVavbdTXzE1k6gGJLU+Nop1a
	FH+lfkBBHx3+GhekAGkNCxwFpuEra/pKuqNpVcmQ1niUijKMjQvGmIIgrNHvxh5xFQGhGa2kAEB0C
	nobVJmkrUg/lzowU0nMufo6hYJGaicYsDs9TKjozl1OFQyuO8k3OJrICtjvhFRd5XQWjXI1SBycU8
	Ox97LBDpSCu5/LHkLjomLSz0tUfvwPbOiAx/xh2HToG5fE8GhX4QK28iTYmUdLv5jRuAfkBUZL2FT
	n+iM8WkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoky-0000000DnQE-0z2t;
	Thu, 22 Oct 2026 09:06:40 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoku-0000000DnPV-3Fy7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:06:38 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=b0wRLcy0ggQaa8LoaAXhe35ntO48tNtFxyE60noBeWY=;
	b=KFYlIyDl6H9LGK69jDlK0ZZMjULU3bBHG9Nxno2IGZ8nmpors7Sj0pQH0XDxK/tNIAlu+WDZI
	LAtAtxx/MfbOBd7IIxgSZeKrQ2b+hUfLZkB0w9iXPFidHQPfUmN9hlHE1VWus9fk7tzStqrqReS
	mot3OG4qv5g57rp0YCBHOa8=
Received: from canpmsgout03.his.huawei.com (unknown [172.19.92.159])
	by szxga04-in.huawei.com (SkyGuard) with ESMTPS id 4j9KYj2xFFz126Ly2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 16:48:25 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=b0wRLcy0ggQaa8LoaAXhe35ntO48tNtFxyE60noBeWY=;
	b=KFYlIyDl6H9LGK69jDlK0ZZMjULU3bBHG9Nxno2IGZ8nmpors7Sj0pQH0XDxK/tNIAlu+WDZI
	LAtAtxx/MfbOBd7IIxgSZeKrQ2b+hUfLZkB0w9iXPFidHQPfUmN9hlHE1VWus9fk7tzStqrqReS
	mot3OG4qv5g57rp0YCBHOa8=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4j9KZ92MtFzpSvH;
	Thu, 22 Oct 2026 16:48:49 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2A1C740537;
	Thu, 22 Oct 2026 16:48:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:48:50 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 4/7] arm_mpam: resctrl: Halve num_rmid for every mon_capable resource on CDP
Date: Thu, 22 Oct 2026 16:48:18 +0800
Message-ID: <20261022084821.4014873-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022084821.4014873-1-ruanjinjie@huawei.com>
References: <20261022084821.4014873-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_020637_128259_F656083C 
X-CRM114-Status: GOOD (  13.49  )
X-Spam-Score: -4.4 (----)
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

CDP emulation consumes two PARTIDs per closid, halving the PARTIDs
available for monitoring. resctrl_arch_set_cdp_enabled() only updated
the L3 resource's num_rmid, which is fine today but leaves the L2
monitor's num_rmids stale once L2 monitoring exists.

Loop over all mon_capable resources and halve each one's num_rmid.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9ffee18e657c..efb9ce76acb4 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -189,8 +189,9 @@ static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 {
 	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
-	struct rdt_resource *l3 = &res->resctrl_res;
+	struct rdt_resource *l3 = &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res;
+	struct mpam_resctrl_res *res;
+	enum resctrl_res_level i;
 	int cpu;
 
 	if (!IS_ENABLED(CONFIG_EXPERT) && enable) {
@@ -212,10 +213,22 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	cdp_enabled = enable;
 	mpam_resctrl_controls[rid].cdp_enabled = enable;
 
-	if (enable)
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
-	else
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	/*
+	 * CDP emulation consumes two PARTIDs per closid, halving the PARTIDs
+	 * available for monitoring - no matter which resource the mount
+	 * option was for. Update num_rmid for all mon_capable resources,
+	 * e.g. the L2 monitors as well as the L3.
+	 */
+	for_each_mpam_resctrl_control(res, i) {
+		struct rdt_resource *r = &res->resctrl_res;
+
+		if (!r->mon_capable)
+			continue;
+
+		r->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+		if (enable)
+			r->mon.num_rmid /= 2;
+	}
 
 	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
 	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
-- 
2.43.0


