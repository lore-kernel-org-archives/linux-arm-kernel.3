Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C54606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PjhJQDDy;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=DXm9RIM8;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=DXm9RIM8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MSj8Z2rdiJcCmb6g+ksU9pujYJJSBwXRRnHKZsAXkzM=; b=PjhJQDDyzOQR5l2ljG2/eJltr0
	Bl0UDr0lgi25EuiKnTXez3dPs4ScU8ETcE47WHsMtCzvgD9bAibX17xc44CXPtInoVawbZklK28tv
	ECr8wS3c9g3cRNca7K+ShwUlb40EBtDBZnwP4ist1QqwtBBJK3Oxk08mWTcxrjv5DiaPWDAVAdZP2
	kpNHv+3bw2sPX1PManiJHsHZewlnRvx07y5RS1x2uGeNtYzi9ITStkt+o1zwrLdt2ZY4QRou2jtz6
	A5uShMkT96PPQ05+ggH9XOeDUzcNlUsIzsWiH+ZbYvbKrdrLEyJGe2pD6B9TlRRRI8uNLg9Mx+WAz
	vPu5pGdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoU9-0000000DkqJ-2K69;
	Thu, 22 Oct 2026 08:49:17 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoTv-0000000DklP-2Jzc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:49:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MSj8Z2rdiJcCmb6g+ksU9pujYJJSBwXRRnHKZsAXkzM=;
	b=DXm9RIM8qiuobe+ZROE2pradlOxRflOwNz1pekBkK/ugRTTImsDmjyLBuSYanaDzTdScKVnzZ
	Mm/Z/CP6wBvEAzYS61ivVUsNObQgNzu5hnkegwsYdqdf6Bd5TYL6ouP4afAQfm/yu6S2DYYwJ3n
	6QaZpevzI6K3nG1rdIGf3jc=
Received: from canpmsgout04.his.huawei.com (unknown [172.19.92.133])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4j9KZD06y7z1BG8B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 16:48:52 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MSj8Z2rdiJcCmb6g+ksU9pujYJJSBwXRRnHKZsAXkzM=;
	b=DXm9RIM8qiuobe+ZROE2pradlOxRflOwNz1pekBkK/ugRTTImsDmjyLBuSYanaDzTdScKVnzZ
	Mm/Z/CP6wBvEAzYS61ivVUsNObQgNzu5hnkegwsYdqdf6Bd5TYL6ouP4afAQfm/yu6S2DYYwJ3n
	6QaZpevzI6K3nG1rdIGf3jc=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4j9KZ74gzpz1prjX;
	Thu, 22 Oct 2026 16:48:47 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 29EDD40538;
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
Subject: [RFC PATCH 6/7] arm_mpam: resctrl: Pick L2 classes for the L2 monitor events
Date: Thu, 22 Oct 2026 16:48:20 +0800
Message-ID: <20261022084821.4014873-7-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261022_014903_941671_2AE889CF 
X-CRM114-Status: GOOD (  19.90  )
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

mpam_resctrl_pick_counters() previously skipped every cache class that
was not the L3. Allow L2 classes through, route the CSU pick to the
l2c_occupancy event by cache level, and pick a class for the L2
bandwidth event from any L2 class with usable MBWU counters.

Grow MPAM_MAX_EVENT so the counters array, the monitor-init loop and
the per-domain mon_comp array cover the L2 events. Once a platform has
an L2 class the L2 events are described and enabled; the read paths
come next.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 48 +++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 50e5035dcc9d..293122c0d0d9 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -37,15 +37,16 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
 	     rid++, res = &mpam_resctrl_controls[rid])
 
 /*
- * The classes we've picked to map to resctrl events.
- * Resctrl believes all the worlds a Xeon, and these are all on the L3. This
- * array lets us find the actual class backing the event counters. e.g.
- * the only memory bandwidth counters may be on the memory controller, but to
- * make use of them, we pretend they are on L3. Restrict the events considered
- * to those supported by MPAM.
+ * The classes we've picked to map to resctrl events, indexed by event id.
+ * This array lets us find the actual class backing the event counters: the
+ * L2 events use the L2 class, while the L3 bandwidth counters may sit on the
+ * memory controller or another class close to the L3.
+ *
+ * The range also covers QOS_L3_MBM_LOCAL_EVENT_ID, which is left classless:
+ * MPAM cannot distinguish local from remote traffic.
  * Class pointer may be NULL.
  */
-#define MPAM_MAX_EVENT QOS_L3_MBM_TOTAL_EVENT_ID
+#define MPAM_MAX_EVENT QOS_L2_MBM_CORE_EVENT_ID
 static struct mpam_resctrl_mon mpam_resctrl_counters[MPAM_MAX_EVENT + 1];
 
 #define for_each_mpam_resctrl_mon(mon, eventid)					\
@@ -93,7 +94,10 @@ bool resctrl_arch_mon_capable(void)
 	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
 	struct rdt_resource *l3 = &res->resctrl_res;
 
-	/* All monitors are presented as being on the L3 cache */
+	/*
+	 * resctrl monitoring is anchored on the L3 group; L2 monitors are
+	 * additional resources, and monitor-only platforms fake the L3 group.
+	 */
 	return l3->mon_capable;
 }
 
@@ -1128,9 +1132,13 @@ static void mpam_resctrl_pick_counters(void)
 	guard(srcu)(&mpam_srcu);
 	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
 				 srcu_read_lock_held(&mpam_srcu)) {
-		/* The name of the resource is L3... */
-		if (class->type == MPAM_CLASS_CACHE && class->level != 3) {
-			pr_debug("class %u is a cache but not the L3", class->level);
+		/*
+		 * Cache counters are presented as the L2 or L3 resource,
+		 * matching the cache the MSCs were built with.
+		 */
+		if (class->type == MPAM_CLASS_CACHE && class->level != 2 &&
+		    class->level != 3) {
+			pr_debug("class %u is a cache but not L2 or L3", class->level);
 			continue;
 		}
 
@@ -1150,7 +1158,10 @@ static void mpam_resctrl_pick_counters(void)
 				if (update_rmid_limits(class))
 					break;
 
-				counter_update_class(QOS_L3_OCCUP_EVENT_ID, class);
+				counter_update_class(class->level == 2 ?
+						     QOS_L2_OCCUP_EVENT_ID :
+						     QOS_L3_OCCUP_EVENT_ID,
+						     class);
 				break;
 			default:
 				break;
@@ -1174,6 +1185,19 @@ static void mpam_resctrl_pick_counters(void)
 			 */
 			counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
 		}
+
+		/*
+		 * An L2 MSC measures the bandwidth of the traffic its cache
+		 * sees from the CPUs that share it, which is what resctrl
+		 * presents as the per-L2 mbm_core_bytes event.
+		 */
+		if (class->type == MPAM_CLASS_CACHE && class->level == 2 &&
+		    class_has_usable_mbwu(class)) {
+			pr_debug("class %u has usable MBWU for the L2 resource\n",
+				 class->level);
+
+			counter_update_class(QOS_L2_MBM_CORE_EVENT_ID, class);
+		}
 	}
 }
 
-- 
2.43.0


