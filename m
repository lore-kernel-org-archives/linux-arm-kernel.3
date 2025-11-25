Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB543CFD315
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 08:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIhvSaeXNVcgqaB/0/kSz3ZRqQlMg/6LhK/Kbe7gdXA=; b=Gk+EgY1RjmOuN8Nt4cjsOri93k
	Xe7QnIjn4NV09KTJQf0/+UjBXpzhdSdUSzrinYMzdhmhL2qomw86XaKK7RnxPFmYcsymjPgkU/aV3
	9xoi622ua/NxWzAD82x75UK/BBrCpVVXoFttcEX5DeZfdh06kQXtJveDK/77s58vjrBvEc/nB6Zks
	Dt8mXpdwXF/XXR7zpg4z6VJlt5ruo0QyOXNWVlt7TFOVpaMu1HPtft5zRC1q8TInL2vBORbBIZD3W
	mmWcwjXqlKGXOxw9TesQw54kz5w/0m8TFjnaYXbzj7LebwPAYLik8/B2VQBsuWq6l97MPv4rmFEHy
	wOIt6XKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNo3h-0000000CxDB-3GnL;
	Tue, 25 Nov 2025 08:05:57 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNo3e-0000000CxCA-2ZnA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 08:05:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FIhvSaeXNVcgqaB/0/kSz3ZRqQlMg/6LhK/Kbe7gdXA=;
	b=DoBGe1S1EeQpw8EMjWENPNfAJYc4TlyAaXdEboG+ccEeiPuSFWR30xsQ7Yyc9niq5iykCpf3v
	hzSG88BluTdFACffiKDvfr1+kXSKAYyDGfIZtEt+wBDdSyTGGLBG7wbo4PvzHLhjvZT1mRbZHx0
	wSFjxCcisZQDFOyN6btCvi0=
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4dFwF95BPzz1cyrt;
	Tue, 25 Nov 2025 16:03:57 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 6912D1402C4;
	Tue, 25 Nov 2025 16:05:45 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 25 Nov 2025 16:05:44 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 25 Nov 2025 16:05:44 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <xuwei5@hisilicon.com>, <Jonathan.Cameron@huawei.com>,
	<wanghuiqiang@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>
CC: <prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<wangyushan12@huawei.com>
Subject: [RFC PATCH 3/3] Documentation: soc cache: Add documentation to HiSilicon SoC cache
Date: Tue, 25 Nov 2025 16:05:42 +0800
Message-ID: <20251125080542.3721829-4-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20251125080542.3721829-1-wangyushan12@huawei.com>
References: <20251125080542.3721829-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_000555_152862_48594750 
X-CRM114-Status: GOOD (  19.69  )
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
 2 files changed, 63 insertions(+)
 create mode 100644 Documentation/driver-api/hisi-soc-cache.rst

diff --git a/Documentation/driver-api/hisi-soc-cache.rst b/Documentation/driver-api/hisi-soc-cache.rst
new file mode 100644
index 000000000000..a0da7ff20e44
--- /dev/null
+++ b/Documentation/driver-api/hisi-soc-cache.rst
@@ -0,0 +1,62 @@
+==========================
+HiSilicon SoC Cache Driver
+==========================
+
+Introduction
+===========
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
index 3e2a270bd828..a4be1fc67230 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -94,6 +94,7 @@ Subsystem-specific APIs
    aperture
    generic-counter
    gpio/index
+   hisi-soc-cache
    hsi
    hte/index
    i2c
-- 
2.33.0


