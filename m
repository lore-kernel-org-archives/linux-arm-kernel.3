Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745A7EBFD16
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kspIqY3IxsH71BJIC1Olrnf73oXURAoru/Y0UiXkbrA=; b=IXk0JNNHxQuUr4QHeASfpYdoSj
	QI0jVGjZAgksWzME1025Vt3B5gaDW8WtQ8GDJhmtk0jCKFmo51oBwVAGMCxeSu8mb8s0hfa6s+qOq
	CpaPlcBNeUL2b9DZtJBOaCS7C19VNfA8XfcIqlx9oV3/Dq/Ab0mHPrJuMK9mJDDmalm1Vea7C7hFy
	PUGH3eJk+UF/py+7X21334BKeyYYJUO0udFF/vqae9yFXisoznUglXUgGoTKtcD4kZXoe/DLZR6mP
	u9ski+pWMuXIjiSIWu1vscVbVNqDrgoI/dpGDXZBgUzCuuYdA8h/AfW0oEEShl4kzmPmx5V/+ZJMs
	FTeCzARA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4r-0000000FJW0-2y6T;
	Mon, 13 Apr 2026 08:55:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4h-0000000FJLd-1MWH
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kspIqY3IxsH71BJIC1Olrnf73oXURAoru/Y0UiXkbrA=; b=lGwXPEMo3Geoemfj7qfC14DJw/
	altOfuR9Z7RJZsBMz6MhMtBPJAnLfjJuP/I3qWEwytyZiuPim1EfzCt38jchxpY4ZrZXvWYCdGJps
	Q0+Licae/ksNsjWsOXjg0AhYJY98LnPTgoEgUYyKsLGzMsgfPcN4p2lbWFSSyh3m0eAQbmaSmWJqd
	oVxe/fVYIIy69vAEyBrLBiW43AreNLUCTrcxUz0CGntAGbWIQ4JfDl0QhPgq/7AHemqjbsVyel1mu
	mpYM0qRyojZFol5jKLvyu610N9uZZo+8u7oyDQcyTXH04V5aouatpXUZIjqf2hlsxnI4wYSTIr1S6
	PW/F0dCw==;
Received: from [113.46.200.216] (helo=canpmsgout01.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD49-0000000GR5Y-0M9P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:55:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kspIqY3IxsH71BJIC1Olrnf73oXURAoru/Y0UiXkbrA=;
	b=qCq87qkVND4ZsKtl3U6cs/QKcooZ6FL5/Ya/MzsTDneaXpAGciGUnPQ0h5I3yLJvp66wKji8T
	OGfCxkpxyCksQc/bNtESubwyCs3iA35JY2OItBG0DjtxrLmzmebE+JF+VfLPZ6NrYvEJFz9Okyh
	MyOEV4DyYylwm0s91R2Y1rY=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fvLfF0ph5z1T4Gh;
	Mon, 13 Apr 2026 16:48:21 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id DCF4E4056E;
	Mon, 13 Apr 2026 16:54:18 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 13 Apr
 2026 16:54:18 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tan.shaopeng@jp.fujitsu.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tglx@kernel.org>, <will@kernel.org>, <hpa@zytor.com>,
	<bp@alien8.de>, <babu.moger@amd.com>, <dave.hansen@linux.intel.com>,
	<mingo@redhat.com>, <tony.luck@intel.com>, <gshan@redhat.com>,
	<catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>
Subject: [PATCH v8 next 06/10] arm_mpam: Add boot parameter to limit mpam_intpartid_max
Date: Mon, 13 Apr 2026 16:54:01 +0800
Message-ID: <20260413085405.1166412-7-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260413085405.1166412-1-zengheng4@huawei.com>
References: <20260413085405.1166412-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_095456_180318_998F71EC 
X-CRM114-Status: GOOD (  12.06  )
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

Add a new boot parameter "intpartid_max" to allow system administrators
to limit the number of internal PARTIDs used by the MPAM driver for
resource control groups. This provides flexibility to configure the
trade-off between:

* Number of resource control groups (CLOSIDs, limited by intpartid_max)
* Number of monitoring groups (RMIDs, limited by reqpartid and intpartid)

By default, the driver uses all available intPARTIDs for control groups.
With this parameter, users are able to reserve internal PARTIDs to create
additional sub-monitoring groups (provided that the narrow PARTID feature
is successfully enabled).

Example usage:
  mpam.intpartid_max=7

mpam.intpartid_max is set to the maximum number of internal PARTIDs
minus one, which is applied as the limit at initialization time.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/resctrl/mpam_devices.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 8fbc8f9f9688..2aeff798a865 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -3,6 +3,9 @@
 
 #define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
 
+#undef KBUILD_MODNAME
+#define KBUILD_MODNAME "mpam"
+
 #include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/arm_mpam.h>
@@ -18,6 +21,7 @@
 #include <linux/irq.h>
 #include <linux/irqdesc.h>
 #include <linux/list.h>
+#include <linux/moduleparam.h>
 #include <linux/lockdep.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
@@ -65,6 +69,7 @@ static DEFINE_MUTEX(mpam_cpuhp_state_lock);
 u16 mpam_partid_max;
 u16 mpam_intpartid_max;
 u8 mpam_pmg_max;
+static u16 bootparam_intpartid_max = USHRT_MAX;
 static bool partid_max_init, partid_max_published;
 static DEFINE_SPINLOCK(partid_max_lock);
 
@@ -2725,6 +2730,7 @@ static void mpam_enable_once(void)
 	 * longer change.
 	 */
 	spin_lock(&partid_max_lock);
+	mpam_intpartid_max = min(mpam_intpartid_max, bootparam_intpartid_max);
 	partid_max_published = true;
 	spin_unlock(&partid_max_lock);
 
@@ -2779,6 +2785,20 @@ static void mpam_enable_once(void)
 		       mpam_partid_max + 1, mpam_intpartid_max + 1, mpam_pmg_max + 1);
 }
 
+static int mpam_intpartid_max_set(const char *val,
+				  const struct kernel_param *kp)
+{
+	return param_set_uint_minmax(val, kp, 1, USHRT_MAX);
+}
+
+static const struct kernel_param_ops mpam_intpartid_max_ops  = {
+	.set = mpam_intpartid_max_set,
+	.get = param_get_uint,
+};
+
+arch_param_cb(intpartid_max, &mpam_intpartid_max_ops,
+	     &bootparam_intpartid_max, 0444);
+
 static void mpam_reset_component_locked(struct mpam_component *comp)
 {
 	struct mpam_vmsc *vmsc;
-- 
2.25.1


