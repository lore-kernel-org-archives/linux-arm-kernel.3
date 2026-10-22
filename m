Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5D0606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MFTulCL5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=mayQFK4Y;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aeBybq9h;
	dkim=neutral header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aeBybq9h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2xhlA15/kW6lF5trHWVvtWzB0dpopSaBBhwpuou0/QA=; b=MFTulCL5h5jzMQaNd6/xy45WzA
	AVZ20hnk4LqojjtShH78yyqnpDX/Lexam4yDTP5oKz7RfKtyBNRn//8gE0aRMULaVCZLGUxiBULSg
	mnvFfugdYum82bOCILvATJ+2WnCS9G0B4/fKd/V3G1QFT6k4csac2zHpQOsZWZE/vx6SX/E0Tcc9X
	aIU36tkcPBJsADHevXomctlcIagNjD4AZU+V+CRBEzx4qPVPENLqnk5YVP3E7NcLunugOMh+fUdVU
	Rz0EvTjJxAwhTk0zEHtxFSUkqanbSk/XME1gdVV/h2SySUjDb/hIc3MyzeqLGwZt8W7Exc8jpcit6
	mCQRKDbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoUR-0000000Dkxm-0AUX;
	Thu, 22 Oct 2026 08:49:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoU8-0000000DkpV-3QIc
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 08:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=2xhlA15/kW6lF5trHWVvtWzB0dpopSaBBhwpuou0/QA=; b=mayQFK4Yv7EwFKUsIfLphxs50I
	mfa287pBAy2sVV1BsSj+j8zcW7CRgs3bbZbz4pUoo+gfoyybkcSto67ootz8uBHjy/iDvKy0im/gk
	M/ogcVxmJ4gwOO+t1LC4e6auOZ5WDC2Kb6iX2Lt+bfczRVZQlqiOWEkyqUaVLwzmXa8XHap0l8da/
	8Dfrguu+pRKn11VMyCwQduAv580lLDtyi8uI5kcGuC9OkZxQ70cNAakk9MYeisVtRXF0mVo5j3FvH
	kihIPNTSI/iZdTOBGXZ9Jxx94zQfb19Fztle9vfoqnlsQVcarzeCABU8CXxF9bYvLpPFQQ5kK31XB
	t5W4ZDZQ==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoU5-0000000HI6k-14Sz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:49:15 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2xhlA15/kW6lF5trHWVvtWzB0dpopSaBBhwpuou0/QA=;
	b=aeBybq9hVveqoDNm5akNMdv5GsnPBY0IiqzKR+WdCFzOaqzImjfh/vtbwtwboOA23uQ0UE9qV
	assD7oh9Y4Ij0GBmWouP8zfGuwnuLKA973+hxLCfcluBlxRIZ98EqQq+p+9o9OPd4VG8/Xr9Rrg
	PrbzAKjCAaZioqBq6bOr42o=
Received: from canpmsgout04.his.huawei.com (unknown [172.19.92.133])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4j9KZD02kLz1BG7d
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 16:48:52 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2xhlA15/kW6lF5trHWVvtWzB0dpopSaBBhwpuou0/QA=;
	b=aeBybq9hVveqoDNm5akNMdv5GsnPBY0IiqzKR+WdCFzOaqzImjfh/vtbwtwboOA23uQ0UE9qV
	assD7oh9Y4Ij0GBmWouP8zfGuwnuLKA973+hxLCfcluBlxRIZ98EqQq+p+9o9OPd4VG8/Xr9Rrg
	PrbzAKjCAaZioqBq6bOr42o=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4j9KZ815K4z1prjX;
	Thu, 22 Oct 2026 16:48:48 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A4596203C1;
	Thu, 22 Oct 2026 16:48:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:48:51 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 7/7] arm_mpam: resctrl: Add the L2 monitor read paths
Date: Thu, 22 Oct 2026 16:48:21 +0800
Message-ID: <20261022084821.4014873-8-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261022_094914_064199_2CEC737D 
X-CRM114-Status: GOOD (  14.76  )
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

Wire the L2 events through the borrowed-monitor paths:
l2c_occupancy borrows a CSU monitor like the L3 occupancy event, while
mbm_core_bytes borrows a bandwidth monitor. The L2 bandwidth event is
outside resctrl's L3 MBM event range, so the assignable-counter
machinery never applies to it; with CDP, borrow one monitor per partid
so code and data both accumulate.

Accept both events in resctrl_arch_rmid_read() and skip them in the
assignable-counter paths.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 62 +++++++++++++++++++++++++++++++---
 1 file changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 293122c0d0d9..3aa7ea996511 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -412,6 +412,7 @@ static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid,
 
 	switch (evtid) {
 	case QOS_L3_OCCUP_EVENT_ID:
+	case QOS_L2_OCCUP_EVENT_ID:
 		/* With CDP, one monitor gets used for both code/data reads */
 		mon_ctx[MON_CTX_DATA] = mpam_alloc_csu_mon(mon->class);
 		mon_ctx[MON_CTX_CODE] = mon_ctx[MON_CTX_DATA];
@@ -422,6 +423,31 @@ static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid,
 		mon_ctx[MON_CTX_DATA] = USE_PRE_ALLOCATED;
 		mon_ctx[MON_CTX_CODE] = USE_PRE_ALLOCATED;
 		return USE_PRE_ALLOCATED;
+	case QOS_L2_MBM_CORE_EVENT_ID:
+		/*
+		 * The L2 event is not part of resctrl's L3 MBM event range,
+		 * so the assignable-counter machinery never applies: borrow a
+		 * bandwidth monitor for the duration of the read, like the
+		 * occupancy events do with CSU monitors. With CDP, borrow one
+		 * monitor per partid so code and data both accumulate.
+		 */
+		mon_ctx[MON_CTX_DATA] = mpam_alloc_mbwu_mon(mon->class);
+		if (mon_ctx[MON_CTX_DATA] < 0)
+			return mon_ctx[MON_CTX_DATA];
+
+		if (!cdp_enabled) {
+			mon_ctx[MON_CTX_CODE] = mon_ctx[MON_CTX_DATA];
+			return mon_ctx[MON_CTX_DATA];
+		}
+
+		mon_ctx[MON_CTX_CODE] = mpam_alloc_mbwu_mon(mon->class);
+		if (mon_ctx[MON_CTX_CODE] < 0) {
+			int err = mon_ctx[MON_CTX_CODE];
+
+			mpam_free_mbwu_mon(mon->class, mon_ctx[MON_CTX_DATA]);
+			return err;
+		}
+		return mon_ctx[MON_CTX_DATA];
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -460,8 +486,24 @@ static void resctrl_arch_mon_ctx_free_no_wait(enum resctrl_event_id evtid,
 	if (!mon->class)
 		return;
 
-	if (evtid == QOS_L3_OCCUP_EVENT_ID)
+	switch (evtid) {
+	case QOS_L3_OCCUP_EVENT_ID:
+	case QOS_L2_OCCUP_EVENT_ID:
+		/* With CDP, one monitor is used for both code/data reads */
 		mpam_free_csu_mon(mon->class, mon_ctx[MON_CTX_DATA]);
+		break;
+	case QOS_L3_MBM_LOCAL_EVENT_ID:
+	case QOS_L3_MBM_TOTAL_EVENT_ID:
+		/* Served by the pre-assigned ABMC counters */
+		break;
+	case QOS_L2_MBM_CORE_EVENT_ID:
+		mpam_free_mbwu_mon(mon->class, mon_ctx[MON_CTX_DATA]);
+		if (mon_ctx[MON_CTX_CODE] != mon_ctx[MON_CTX_DATA])
+			mpam_free_mbwu_mon(mon->class, mon_ctx[MON_CTX_CODE]);
+		break;
+	default:
+		break;
+	}
 
 	wake_up(&resctrl_mon_ctx_waiters);
 }
@@ -557,10 +599,22 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 	l3_dom = container_of(hdr, struct mpam_resctrl_dom, resctrl_mon_dom.hdr);
 	mon_comp = l3_dom->mon_comp[eventid];
 
-	if (eventid != QOS_L3_OCCUP_EVENT_ID)
+	switch (eventid) {
+	case QOS_L3_OCCUP_EVENT_ID:
+	case QOS_L2_OCCUP_EVENT_ID:
+		mon_type = mpam_feat_msmon_csu;
+		break;
+	case QOS_L2_MBM_CORE_EVENT_ID:
+		/*
+		 * Served by a bandwidth monitor borrowed for the read via
+		 * resctrl_arch_mon_ctx_alloc(); the L3 MBWU events use the
+		 * ABMC resctrl_arch_cntr_read() path instead.
+		 */
+		mon_type = mpam_feat_msmon_mbwu;
+		break;
+	default:
 		return -EINVAL;
-
-	mon_type = mpam_feat_msmon_csu;
+	}
 
 	return read_mon_cdp_safe(mon, mon_comp, mon_type, arch_mon_ctx,
 				 closid, rmid, val);
-- 
2.43.0


