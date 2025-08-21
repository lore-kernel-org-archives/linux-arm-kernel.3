Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA8BCA0FE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGYlFPfb87VFFBc+Q7HFF7jL4AT0Rrj7gtPhDY2gBrw=; b=rwiVWACmdVwmAqQTSPiugMLLij
	W9x2lZqXf2ZAFyH4htSZqZoWECy0ig2WGQGyz/qTcmRusAshfDawB/WbYn/eDbGIx437GhPggnJ3m
	VmO8TdMUGDf+NfHw5hFs7ULflO/MImLxJs0WXTcgXqb8QW7GwcJFEYVQsm/h7/NR0/FvGej2P/vem
	0SNcA2jA7myBAUFc5o8WhpGO6uofmYxsxt/hDEHW8WFuP4coQV9FaLFGFzmyxhWlcLXIi6B6Jp5XL
	5h3xMdr5SIieh9qfnom2hXVDWd34Ad2VJvY/bI/xsvBiH+t/OnkYgaYw0zDaBfHcxir+79xTU1os4
	uxLEfzAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAhp-00000000ERW-2223;
	Thu, 21 Aug 2025 19:12:13 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5h0-0000000H7Ra-0AvG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 13:51:03 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4c74Sh6YPdztTKF;
	Thu, 21 Aug 2025 21:49:56 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 9F16C180485;
	Thu, 21 Aug 2025 21:50:55 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 21 Aug 2025 21:50:55 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 21 Aug 2025 21:50:54 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <robin.murphy@arm.com>, <yangyicong@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <hejunhao3@h-partners.com>
Subject: [PATCH v2 9/9] Documentation: hisi-pmu: Add introduction to HiSilicon
Date: Thu, 21 Aug 2025 21:50:49 +0800
Message-ID: <20250821135049.2010220-10-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250821135049.2010220-1-wangyushan12@huawei.com>
References: <20250821135049.2010220-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_065102_450027_11C4FC8B 
X-CRM114-Status: GOOD (  16.14  )
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
as well as the newly added ext operand for L3C PMU.

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 Documentation/admin-guide/perf/hisi-pmu.rst | 38 +++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
index a307bce2f5c5..4c7584fe3c1a 100644
--- a/Documentation/admin-guide/perf/hisi-pmu.rst
+++ b/Documentation/admin-guide/perf/hisi-pmu.rst
@@ -12,8 +12,8 @@ The HiSilicon SoC encapsulates multiple CPU and IO dies. Each CPU cluster
 called Super CPU cluster (SCCL) and is made up of 6 CCLs. Each SCCL has
 two HHAs (0 - 1) and four DDRCs (0 - 3), respectively.
 
-HiSilicon SoC uncore PMU driver
--------------------------------
+HiSilicon SoC uncore PMU v1
+---------------------------
 
 Each device PMU has separate registers for event counting, control and
 interrupt, and the PMU driver shall register perf PMU drivers like L3C,
@@ -56,6 +56,9 @@ Example usage of perf::
   $# perf stat -a -e hisi_sccl3_l3c0/rd_hit_cpipe/ sleep 5
   $# perf stat -a -e hisi_sccl3_l3c0/config=0x02/ sleep 5
 
+HiSilicon SoC uncore PMU v2
+----------------------------------
+
 For HiSilicon uncore PMU v2 whose identifier is 0x30, the topology is the same
 as PMU v1, but some new functions are added to the hardware.
 
@@ -113,6 +116,37 @@ uring channel. It is 2 bits. Some important codes are as follows:
 - 2'b00: default value, count the events which sent to the both uring and
   uring_ext channel;
 
+HiSilicon SoC uncore PMU v3
+----------------------------------
+
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
+provides ``ext`` operand to allow exploration of even finer granual statistics
+of L3C PMU, L3C PMU driver use that as hint of termination when delivering perf
+command to hardware:
+
+- ext=0: Default, could be used with event names.
+- ext=1 and ext=2: Must be used with event codes, event names are not supported.
+
+An example of perf command could be::
+
+  $# perf stat -a -e hisi_sccl0_l3c1_0/event=0x1,ext=1/ sleep 5
+
+or::
+
+  $# perf stat -a -e hisi_sccl0_l3c1_0/rd_spipe/ sleep 5
+
+As above, ``hisi_sccl0_l3c1_0`` locates PMU on CPU cluster 0, L3 cache 1 pipe0.
+
 Users could configure IDs to count data come from specific CCL/ICL, by setting
 srcid_cmd & srcid_msk, and data desitined for specific CCL/ICL by setting
 tgtid_cmd & tgtid_msk. A set bit in srcid_msk/tgtid_msk means the PMU will not
-- 
2.33.0


