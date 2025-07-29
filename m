Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE6AC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 15:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTxgvrlySJUQpDLRkvofgC6qNlD+2jgcJt8wG1mQaMg=; b=V4+mjRHoq4jLQYHfGpCtDKTzik
	ug78IotXY5kb/LMXOFFXSgqmXALZtLmDdg6Fo+GYMD0nEmpMFUghoERuuv1O/nlH7l6jkGHsQTqt3
	u739DR2R0kAzzfZfcH93diqxzrJSzmWolq1A0ss6DwQi4lEFDYZLGSaL/wjGf9lXMJRYeY75NClJS
	jm+fTrq5gu75mwAbR3iZbXtKeT74LGT4q8LZmtPB27vdcXsJXkWKj5jJyhSesCiooGb4bKDN53tUN
	hJPRnS9IwVHj7XYyN0GbJn+dUebSLL9nI2aKOH1Q5EDebh3m7bmQ4eCMa30fjtHI2SrTa4/ShHwbV
	263M1M7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmaN-0000000HBP7-2vh1;
	Tue, 29 Jul 2025 15:49:51 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmPS-0000000H9rE-3ee1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 15:38:37 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4brzvq2FLVz23jcW;
	Tue, 29 Jul 2025 23:36:07 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 31C2B1A016C;
	Tue, 29 Jul 2025 23:38:28 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Jul 2025 23:38:27 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Jul 2025 23:38:27 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <linuxarm@huawei.com>, <yangyicong@hisilicon.com>,
	<wangyushan12@huawei.com>
Subject: [PATCH 8/8] Documentation: hisi-pmu: Add introduction to HiSilicon V3 PMU
Date: Tue, 29 Jul 2025 23:38:23 +0800
Message-ID: <20250729153823.2026154-9-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250729153823.2026154-1-wangyushan12@huawei.com>
References: <20250729153823.2026154-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_083835_278684_927D54D2 
X-CRM114-Status: GOOD (  15.66  )
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
 Documentation/admin-guide/perf/hisi-pmu.rst | 43 +++++++++++++++++++--
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
index 48992a0b8e94..4c7584fe3c1a 100644
--- a/Documentation/admin-guide/perf/hisi-pmu.rst
+++ b/Documentation/admin-guide/perf/hisi-pmu.rst
@@ -12,15 +12,16 @@ The HiSilicon SoC encapsulates multiple CPU and IO dies. Each CPU cluster
 called Super CPU cluster (SCCL) and is made up of 6 CCLs. Each SCCL has
 two HHAs (0 - 1) and four DDRCs (0 - 3), respectively.
 
-HiSilicon SoC uncore PMU driver
--------------------------------
+HiSilicon SoC uncore PMU v1
+---------------------------
 
 Each device PMU has separate registers for event counting, control and
 interrupt, and the PMU driver shall register perf PMU drivers like L3C,
 HHA and DDRC etc. The available events and configuration options shall
-be described in the sysfs, see:
+be described in the sysfs, see::
+
+/sys/bus/event_source/devices/hisi_sccl{X}_<l3c{Y}/hha{Y}/ddrc{Y}>
 
-/sys/bus/event_source/devices/hisi_sccl{X}_<l3c{Y}/hha{Y}/ddrc{Y}>.
 The "perf list" command shall list the available events from sysfs.
 
 Each L3C, HHA and DDRC is registered as a separate PMU with perf. The PMU
@@ -55,6 +56,9 @@ Example usage of perf::
   $# perf stat -a -e hisi_sccl3_l3c0/rd_hit_cpipe/ sleep 5
   $# perf stat -a -e hisi_sccl3_l3c0/config=0x02/ sleep 5
 
+HiSilicon SoC uncore PMU v2
+----------------------------------
+
 For HiSilicon uncore PMU v2 whose identifier is 0x30, the topology is the same
 as PMU v1, but some new functions are added to the hardware.
 
@@ -112,6 +116,37 @@ uring channel. It is 2 bits. Some important codes are as follows:
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


