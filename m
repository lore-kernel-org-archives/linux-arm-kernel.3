Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291D2606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4ubv10iy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=bR4aWT9v;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=JC1uN/SY;
	dkim=neutral header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=JC1uN/SY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1dYYtT/v0iiNI+ASt1KtR2FoOd/NoxccHRvq2jzcrrE=; b=4ubv10iyF5sO+LuNX7dvLeqvBA
	8psoPm7+q/XbaTPAuCEYkx/Kd5cQcfYsM9t8xBlj0P0udD7Ww4WuRRdPq/V/Aha5E2MHFwzaP99wT
	9qKtSNR54KxQ1q7QjKiZPEQxpnagUHdJAsuXtr7VMYlqg+qcfdAxSpq8cJ3ID4PE/VDkIpIMFLXZl
	VyBf3KpvIR5FKmVy+0J3x3uuBZhOJZfNJ7smCWyrYJcFwZzcZKS6slb5drwc2JAooTMzO8zqTtjOz
	Svku6XzBYALx2KleyoVcf+9bLHm+25U2wO/ro7q97s+KU+SVc1a0f8hca4fQbGKNgJC5AYg5ZIUGT
	BMYrTK9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoUR-0000000DkyF-0mhU;
	Thu, 22 Oct 2026 08:49:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoU9-0000000DkpW-0LX8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 08:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=1dYYtT/v0iiNI+ASt1KtR2FoOd/NoxccHRvq2jzcrrE=; b=bR4aWT9vgoTihvD0JbDOjIjs7z
	dsRELEsYM73SXPagl9LYyLCJCasq6IHc4jpOeTF9MFoosVAOiAj4BsLPEzNNdcWJ8V2xvzdqpMc5g
	QhAgz01WNvT1KG0TicEpU5si93PhExK4r7tj5x1T5uHsu7gPYPznUPAF6ndyNOhvKTK4b6k0Iz/ko
	BSkPudRcye6EdcJBpAlVgIdQfCLg0eX781/7YPFJxhVgAQy+N1b70Go8zbP6bG7ayl5MuCvT6zr6L
	4uz3Q3z2VF+IT3m2GUwksywdYYktekOJacx392ZDQvgBwFQXueBjmLyS90Vj+YMf4q1ZS3QDB2qJ3
	pZpKxhYA==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoU6-0000000HI6f-0D1g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:49:16 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1dYYtT/v0iiNI+ASt1KtR2FoOd/NoxccHRvq2jzcrrE=;
	b=JC1uN/SYZiCIjCYNjA7QnV/CMBx5qR178+5gdAL5KAgTdw2WwpxndjDJqBBU5I63io+6Z2YZK
	YrPRXJxY9gxFerE6XVu5NXw4H97ae8xXyxZfEcrikZuT6AYjJXPdCU1Bu0ibeAfzGYqCIRQK50N
	98Gk4Z82fDSCILzrbB7je40=
Received: from canpmsgout04.his.huawei.com (unknown [172.19.92.133])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4j9KZD0DPdz1BGB1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 16:48:52 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1dYYtT/v0iiNI+ASt1KtR2FoOd/NoxccHRvq2jzcrrE=;
	b=JC1uN/SYZiCIjCYNjA7QnV/CMBx5qR178+5gdAL5KAgTdw2WwpxndjDJqBBU5I63io+6Z2YZK
	YrPRXJxY9gxFerE6XVu5NXw4H97ae8xXyxZfEcrikZuT6AYjJXPdCU1Bu0ibeAfzGYqCIRQK50N
	98Gk4Z82fDSCILzrbB7je40=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4j9KZ517fNz1prm5;
	Thu, 22 Oct 2026 16:48:45 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A71F64056E;
	Thu, 22 Oct 2026 16:48:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:48:48 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 1/7] fs/resctrl: Generalize __l3_mon_event_count for non-L3 resources
Date: Thu, 22 Oct 2026 16:48:15 +0800
Message-ID: <20261022084821.4014873-2-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261022_094914_604163_9B4594DD 
X-CRM114-Status: GOOD (  10.72  )
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

__l3_mon_event_count() reads a single monitor domain. The L3 resource
name hardcoded in its domain_header_is_valid() check is the only thing
tying it to the L3 - all other access is through rr->r. Drop the
hardcode in favour of rr->r->rid and rename it to
__mon_event_count_one_domain() so other resources can reuse it.

No functional change.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 73413cb128ea..f9f4d4486c1b 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -422,7 +422,7 @@ static void mbm_cntr_free(struct rdt_l3_mon_domain *d, int cntr_id)
 	memset(&d->cntr_cfg[cntr_id], 0, sizeof(*d->cntr_cfg));
 }
 
-static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
+static int __mon_event_count_one_domain(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	int cpu = smp_processor_id();
 	u32 closid = rdtgrp->closid;
@@ -432,7 +432,7 @@ static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	struct mbm_state *m;
 	u64 tval = 0;
 
-	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3)) {
+	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, rr->r->rid)) {
 		rr->err = -EIO;
 		return -EINVAL;
 	}
@@ -540,7 +540,7 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	case RDT_RESOURCE_L3:
 		WARN_ON_ONCE(rr->evt->any_cpu);
 		if (rr->hdr)
-			return __l3_mon_event_count(rdtgrp, rr);
+			return __mon_event_count_one_domain(rdtgrp, rr);
 		else
 			return __l3_mon_event_count_sum(rdtgrp, rr);
 	case RDT_RESOURCE_PERF_PKG: {
-- 
2.43.0


