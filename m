Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E08D6552F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/11PSfoNJiCB0S3r7lxetYykBp8m2J09NrdyjAFKzW0=; b=haLabK+hkz2BZVtwJvNLJiPpBT
	tyGhiK69hUKdhVSp3KHOdjrKTsHTSFWYA82TBsF6zqFCxcMk7ZqEu04vg3erccpy66yYpzvOPUat2
	flrh435kOmDy32BkgY0WkLmP3U1M9zdeWnQSdx/0x/mto8kj4/QIE03lNVvmYDmwWGEWqJKHOvjN6
	/kIcKhHI+/oJEPkWL7dbomaWgMIYjxxmU1LAC8C3m73JtgHZBUWgvRBo3V9hsI8jSsr+116Qp4C7E
	JIe71DIcYfm85BCz5i7TRNpMIW/3h8SNY9hVwi/nhcHg/wYoS4gHbr/N9JlA+ZiYVLzGCVSq9s5GP
	KNYc3Ovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoha-00000006dRc-1OgH;
	Wed, 17 Dec 2025 10:24:14 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVohW-00000006dQ9-3jPQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 10:24:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/11PSfoNJiCB0S3r7lxetYykBp8m2J09NrdyjAFKzW0=;
	b=V75LHEwzoX+WZ+qwBi2raIZc6V3x+6v/Pj1S9pQU3RirSZ4DPt+SGAY3Y8YoO+C06h8Z/TB/k
	Pf20zG8wbR3n3NriNojMJfvxsXDDRX23q6+Vj8T6AQbOo6SQV8y88DzBu8dgwfqqZOwvSQGWoSP
	gk7XtqUpELVGNW/i2upeGuM=
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4dWVGH3VywzmV6s;
	Wed, 17 Dec 2025 18:21:59 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 5325A140109;
	Wed, 17 Dec 2025 18:24:00 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 17 Dec 2025 18:24:00 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 17 Dec 2025 18:23:59 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<xuwei5@hisilicon.com>, <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>,
	<Jonathan.Cameron@huawei.com>
CC: <liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <alexandre.belloni@bootlin.com>, <arnd@arndb.de>,
	<fustini@kernel.org>, <krzk@kernel.org>, <linus.walleij@linaro.org>,
	<will@kernel.org>
Subject: [PATCH RFC v2 3/3] Documentation: soc cache: Add documentation to HiSilicon SoC cache
Date: Wed, 17 Dec 2025 18:23:57 +0800
Message-ID: <20251217102357.1730573-4-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20251217102357.1730573-1-wangyushan12@huawei.com>
References: <20251217102357.1730573-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_022411_231585_7E7B04A8 
X-CRM114-Status: GOOD (  20.01  )
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

Add necessary documentation to HiSilicon SoC cache for reference.

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 Documentation/driver-api/hisi-soc-cache.rst | 62 +++++++++++++++++++++
 Documentation/driver-api/index.rst          |  1 +
 MAINTAINERS                                 |  1 +
 3 files changed, 64 insertions(+)
 create mode 100644 Documentation/driver-api/hisi-soc-cache.rst

diff --git a/Documentation/driver-api/hisi-soc-cache.rst b/Documentation/driver-api/hisi-soc-cache.rst
new file mode 100644
index 000000000000..3c17de79bba2
--- /dev/null
+++ b/Documentation/driver-api/hisi-soc-cache.rst
@@ -0,0 +1,62 @@
+==========================
+HiSilicon SoC Cache Driver
+==========================
+
+Introduction
+============
+
+HiSilicon SoC cache provides the capabilities of preventing given range of
+memory from being evicted from L3 cache. The driver exports the lockdown API to
+userspace, allowing allocation of memory that is guranteed to be placed in L3
+cache, thus decreasing average memory access latency.
+
+Usage
+=====
+
+Kernel built with CONFIG_HISI_SOC_CACHE on will have the device file at
+`/dev/hisi_l3c`, cache operations can be performed through it.
+
+mmap():
+-------
+
+This interface can be used to allocate memory that is guranteed to not be
+evicted out of HiSilicon L3 cache. Newly allocated memory will be prefetched to
+L3 cache automatically.
+
+Users should set `PROT_READ` or `PROT_WRITE` to enable read/write to the memory
+region. Once mmap call succeeds, read and write can be applied to the memory
+region indicated by the returned pointer.
+
+Calling `munmap()` to the pointer can be used to unlock the memory regions.
+
+Restrictions of the cache lockdown are listed below:
+  - Only limited number of memory regions are supported, the exact number is
+    reported by firmware.
+  - Sum of the sizes of locked memory regions should be less than 70% of the
+    total size of cache instance.
+  - Lock/unlock can only be performed during allocation/deallocation, locking
+    existing memory is not supported yet.
+
+ioctl():
+--------
+
+This interface provides useful information of HiSilicon L3 cache.
+
+HISI_L3C_LOCK_INFO
+  - struct hisi_l3c_lock_info (read)
+
+  Gets detailed information of L3 cache lock restrictions.
+
+This ioctl call returns the detailed information of HiSilicon L3 cache lock
+restriction. Information will be presented in the form of::
+
+        struct hisi_l3c_lock_info {
+                unsigned int lock_region_num;
+                size_t lock_size;
+                bool address_alignment;
+                size_t max_lock_size;
+                size_t min_lock_size;
+        };
+
+User may perform a query before issueing cache lock to check for available
+resource.
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 1833e6a0687e..a1d4bf2a22de 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -95,6 +95,7 @@ Subsystem-specific APIs
    generic-counter
    generic_pt
    gpio/index
+   hisi-soc-cache
    hsi
    hte/index
    hw-recoverable-errors
diff --git a/MAINTAINERS b/MAINTAINERS
index f09b718f59fd..bb79ed1f9d45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11369,6 +11369,7 @@ F:	drivers/soc/hisilicon/kunpeng_hccs.h
 HISILICON SOC L3C DRIVER
 M:	Yushan Wang <wangyushan12@huawei.com>
 S:	Maintained
+F:	Documentation/driver-api/hisi-soc-cache.rst
 F:	drivers/soc/hisilicon/hisi_soc_l3c.c
 F:	include/uapi/misc/hisi_l3c.h
 
-- 
2.33.0


