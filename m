Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238ADCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 12:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsFRwURR7syZvRH1IFkpjcDow1QekRqKo8lFsp2sZ2o=; b=cBVN2ttNs8tdqVpqdA8h79VpBt
	eW/55wskpOsk/2Q0yjT5wjI+5QKdPMKd1RcD3B6+4ErHhIiwxxBK4Qurrf264Cwyfo5q/U1y1DveY
	d1N6iv+nZboshoMfpTB3DMsOZASkKMcvg13S2/fPmRAGI6FJQ9pxYSwlf5IF+MI18lnb3bAbyra8v
	H5nHt1H6ciDmpwA0Wd12WFAhaqqoTpuc61FwIeZ1UbfE5AhWbRYB8Wp+z0KRWYMtNL7XciiUYBnX4
	w3DotU8PSdsXLODx3b9GrOfmoyJa0bsuwR7b8vh3M/xT/yWexB+40GLFDljK82+iULqhgTnX89DTq
	BYTrHxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urySI-00000005hDn-3xcE;
	Fri, 29 Aug 2025 12:43:46 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urw7w-00000005HSW-0ouV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:14:42 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cCvC91tGMzPqXq;
	Fri, 29 Aug 2025 18:09:57 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 7E875180486;
	Fri, 29 Aug 2025 18:14:33 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 29 Aug 2025 18:14:33 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 29 Aug 2025 18:14:32 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <robin.murphy@arm.com>, <yangyicong@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <hejunhao3@h-partners.com>, <linuxarm@huawei.com>,
	<fanghao11@huawei.com>
Subject: [PATCH v3 9/9] Documentation: hisi-pmu: Add introduction to HiSilicon V3 PMU
Date: Fri, 29 Aug 2025 18:14:27 +0800
Message-ID: <20250829101427.2557899-10-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250829101427.2557899-1-wangyushan12@huawei.com>
References: <20250829101427.2557899-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_031436_565540_11A379D3 
X-CRM114-Status: GOOD (  12.83  )
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

Some of HiSilicon V3 PMU hardware is divided into parts to fulfill the
job of monitoring specific parts of a device.  Add description on that
as well as the newly added ext option for L3C PMU.

Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 Documentation/admin-guide/perf/hisi-pmu.rst | 33 +++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
index a307bce2f5c5..b78381a1e5e9 100644
--- a/Documentation/admin-guide/perf/hisi-pmu.rst
+++ b/Documentation/admin-guide/perf/hisi-pmu.rst
@@ -113,6 +113,39 @@ uring channel. It is 2 bits. Some important codes are as follows:
 - 2'b00: default value, count the events which sent to the both uring and
   uring_ext channel;
 
+For HiSilicon uncore PMU v3 whose identifier is 0x40, some uncore PMUs are
+further divided into parts for finer granularity of tracing, each part has its
+own dedicated PMU, and all such PMUs together cover the monitoring job of events
+on particular uncore device. Such PMUs are described in sysfs with name format
+slightly changed::
+
+/sys/bus/event_source/devices/hisi_sccl{X}_<l3c{Y}_{Z}/ddrc{Y}_{Z}/noc{Y}_{Z}>
+
+Z is the sub-id, indicating different PMUs for part of hardware device.
+
+Usage of most PMUs with different sub-ids are identical. Specially, L3C PMU
+provides ``ext`` option to allow exploration of even finer granual statistics
+of L3C PMU.  L3C PMU driver uses that as hint of termination when delivering
+perf command to hardware:
+
+- ext=0: Default, could be used with event names.
+- ext=1 and ext=2: Must be used with event codes, event names are not supported.
+
+An example of perf command could be::
+
+  $# perf stat -a -e hisi_sccl0_l3c1_0/rd_spipe/ sleep 5
+
+or::
+
+  $# perf stat -a -e hisi_sccl0_l3c1_0/event=0x1,ext=1/ sleep 5
+
+As above, ``hisi_sccl0_l3c1_0`` locates PMU of Super CPU CLuster 0, L3 cache 1
+pipe0.
+
+First command locates the first part of L3C since ``ext=0`` is implied by
+default. Second command issues the counting on another part of L3C with the
+event ``0x1``.
+
 Users could configure IDs to count data come from specific CCL/ICL, by setting
 srcid_cmd & srcid_msk, and data desitined for specific CCL/ICL by setting
 tgtid_cmd & tgtid_msk. A set bit in srcid_msk/tgtid_msk means the PMU will not
-- 
2.33.0


