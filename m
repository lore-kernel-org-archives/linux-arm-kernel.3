Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1139EFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2q9dPj7TNisCrTMpZ3igJmznQK/scPvx1hraOs9ZEkA=; b=WnXOsXv8yTmXr7Fr2B1DBuMTwh
	ox5kc5+ufVuN09U0FF17YOU29sXKux1LKt/V0Qd7ZzOt4X+Ms4NMZhk7qcoN43WhuU9584rjoyYB0
	E2HxWDjpqFmwdGJs/dTii6c4HOKg8pDzSG76BLcriWM56TPZV/Xn6LsnGR0jn1Lay/5Ayme1oD5GV
	th80Gj6PLbZL+hB8j5raKLZSabidrExSPn1Dc7uvLOaayD4l4AD91d3ygC7iPZ4B/A1PbKvdhcYu0
	6xznbaGoo/NCot4DfNfLZGjtTW28uPTTuCVOBkpdgyruFgqTzvmDD3PdALExNdLqc5/mdrErKe39c
	q41yLW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHytl-000000035ai-2wBw;
	Wed, 29 Apr 2026 06:59:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHytk-000000035ZO-2fva
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Apr 2026 06:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2q9dPj7TNisCrTMpZ3igJmznQK/scPvx1hraOs9ZEkA=; b=HFFVNDBCNbkhDqyVk09yfIb5T1
	bg7ffGab4RrICJxeQqWcYzbO/E8h6qfIYgGoYrX3axuDnJ6wj5HKDXJCNuexDCoCZRMil6zKMsFqv
	H4Z9xZOsLqyiPB5dpO4uaDOt3GE8PzrtgRIEHCl7zaSu/fsCHuT91m1xyBVsArJQ254hPGywsASp2
	C56w//xFKOKTPJGi4zyD5hazKchQJ6K8yHsN0n8mV3gz190QtDAKoDONJ68fVmYamM7qlmKV1h1Jp
	n142e+PKdrkIvuCkTgLlih9HvoPtk8Aa1STe/TwqaJfLr3OZyUN6I7k7OtxspuCmXYyEa/yw5q6ZR
	DxDVI/Sw==;
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHytd-00000004i4z-3Ak5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:59:47 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-82cf636dac8so5271764b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 23:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445983; x=1778050783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2q9dPj7TNisCrTMpZ3igJmznQK/scPvx1hraOs9ZEkA=;
        b=VoTaBsd53E7f5I+Pa43cIvyHThx2aIeqCkfOD4WtD84VdnPNEjjNm+7f+4p5OAyZ//
         R4n9QiCiqpHrvs2v8t63cHeJL1tR+nZSfvPTfeg0IXhGPti/Cj21vIjK4SqpgJ/VxxPq
         YQEUVpk56Zi0Y9iCym02lkI/grNeS4x/PWdjffEAebzZprOL2XmrjpeVr3POrz18P2GS
         2jYTNcdmqj06l5lcU2jdDRK/vLTiJlGegj9p1eYj1GShWkj//KNF0VcBkYsVWUIMOz2Y
         tDcC7ct+LNDAxlJOlgd2bWdbAAKOOo7LBUfP8juL6R8tYBEltOM/2adql7AyKtoypN49
         pu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445983; x=1778050783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2q9dPj7TNisCrTMpZ3igJmznQK/scPvx1hraOs9ZEkA=;
        b=F/eLlY9IMibHy40b3heIdGtxi/Sx4Bsob65fC0ddBVg97alDz4KPSqtRW+SPyDrTdC
         U8lDeUXNV5IBDUAKcQSJEhQ1x8LzP7gYYWxI/kixZiKci8AZTaeD56VYAQvN53QhpXeI
         7+afPNjIB78om0cQvExttuyw1Z6rgUJ5IBY9x8bqlOnpaPuKZbHfHbvtuepM4PdT5Tbt
         Q4BKVj4Kh/sHd0pkMRndIPAoQcNzGqV6pDK7epnkF/1znIoPxOeoNRjl/BwFTI8pofr4
         P4fgTPXBerdffJa193Il1D/uppmGEtCtwTJxy0DxQajEieHS0t03hsSw4KS2Qay3BdTE
         0Zkw==
X-Forwarded-Encrypted: i=1; AFNElJ81iDuUai8v/XHiX10LPTzNW4KWtjR4rQLp6D7KpVBiRCLArK/DEx6GMWUre/6BoOSilH9m3jiBZ57l5EOnwRP3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7ZsOXi5MhYEfoHpJNJ4Vvo2TvX3lv+1S5jaFudGXcUzvc/Q/8
	ZT0B5gw/WHTjK/mS6P3By6cdPN9nS3K31jNlzVi8qT/Qnxl01zzRN+an
X-Gm-Gg: AeBDieuy1F8XXI9OsgB7mt/maQCvb8XVD+SMpXf676HAnKPMDaSawR95aVXO3QQTUTi
	DVGImgSFBPLh1fUhsZXWBdTfoBW4etiP7If2uCJA0GNfUVl/Dg8KtHLaVsWV7h/NZXGeHz3d/FR
	RcQTxXROYNXtF8whDDH11bX65jRbBl5dL5rSVOrUfBDPmCr6i0gDGTmGtIhaSLkh5Z1miVzhx4U
	lmHIiWkuMh4CachgibXxVheZoW5VvT82QVy7ewSH+1ZGktUgLLupPq5otzTZ4bquXzWicrt0JBE
	tiT7WDcq9Z44WE4W2ddf01JKdYgyIDBueiMfWBTK1yZk6POG89pvJmPE/3rQSjjD8iFwmIZ31XQ
	nNDMJmS0AM8Tk2k5EP8aleLHeA/PUempVL/Oi2LVW+tJSMGobOOQqXv//82nMyRW8TDay8a+PPm
	uPuto60Y4UC1ivJyiS6Ivdgv9Q0K6xUUEamPV0st/f8vraGuvn
X-Received: by 2002:a05:6a00:1802:b0:82f:bd8:70eb with SMTP id d2e1a72fcca58-834ddb5b988mr6406851b3a.21.1777445983273;
        Tue, 28 Apr 2026 23:59:43 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:42 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 06/11] of: reserved_mem: save /memreserve/ entries into reserved_mem array
Date: Wed, 29 Apr 2026 14:58:26 +0800
Message-ID: <20260429065831.1510858-7-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_075946_184015_62EE1B41 
X-CRM114-Status: GOOD (  23.47  )
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

Save /memreserve/ entries from the FDT header into the reserved_mem
array so they can be consumed as vmcore filtering metadata by kdump.

/memreserve/ regions hold firmware or bootloader state that is not
useful for kernel crash analysis, so saved /memreserve/ entries
default to no_dump=true and are tagged with name="memreserve" so
consumers can distinguish them from /reserved-memory/ child nodes.

Some DTBs declare the same or overlapping range in both
/memreserve/ and a /reserved-memory/ child. Commit b41328187629
("of: fdt: Scan /memreserve/ last") describes one such case on
Khadas Vim3 where the range is in /memreserve/ and also in a
/reserved-memory/ child carrying no-map. The /reserved-memory/
node's attributes (no-map, reusable, linux,no-dump) are the
explicit declaration and must win over the firmware default,
fdt_reserved_mem_save_memreserve() therefore inherits no_dump from
the overlapping /reserved-memory/ entry rather than silently
applying no_dump=true.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 107 +++++++++++++++++++++++++++++------
 1 file changed, 91 insertions(+), 16 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index ac3d8b837d61..4b80420da2d2 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -252,6 +252,49 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+/**
+ * fdt_reserved_mem_save_memreserve() - save a /memreserve/ entry
+ * @base: base address
+ * @size: size
+ *
+ * Save a /memreserve/ range into reserved_mem[] with no_dump=true
+ * as the firmware default. If the range overlaps a /reserved-memory/
+ * child already saved in this pass, inherit that entry's no_dump so
+ * node-level attributes (no-map, reusable, linux,no-dump) win over
+ * the firmware default.
+ */
+static void __init fdt_reserved_mem_save_memreserve(phys_addr_t base,
+						    phys_addr_t size)
+{
+	struct reserved_mem *rmem;
+	phys_addr_t end = base + size;
+	bool no_dump = true;
+	int i;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		phys_addr_t r_base = reserved_mem[i].base;
+		phys_addr_t r_end = r_base + reserved_mem[i].size;
+
+		if (base < r_end && end > r_base) {
+			no_dump = reserved_mem[i].no_dump;
+			break;
+		}
+	}
+
+	if (reserved_mem_count == total_reserved_mem_cnt) {
+		pr_err("not enough space for all defined regions.\n");
+		return;
+	}
+
+	rmem = &reserved_mem[reserved_mem_count];
+	rmem->name = "memreserve";
+	rmem->base = base;
+	rmem->size = size;
+	rmem->no_dump = no_dump;
+
+	reserved_mem_count++;
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
@@ -260,6 +303,9 @@ static void __init __rmem_check_for_overlap(void)
  * "static" reserved memory regions, that are defined using the "reg"
  * property. Each such region is then initialized with its specific init
  * function and stored in the global reserved_mem array.
+ *
+ * In addition, /memreserve/ entries from the FDT header are saved into
+ * the reserved_mem array so they can be consumed as vmcore metadata.
  */
 void __init fdt_scan_reserved_mem_late(void)
 {
@@ -270,28 +316,32 @@ void __init fdt_scan_reserved_mem_late(void)
 	if (!fdt)
 		return;
 
+	/*
+	 * fdt_scan_reserved_mem() has set total_reserved_mem_cnt to the
+	 * total number of entries to be saved (reg-based + /memreserve/).
+	 * If it is zero there is nothing to allocate, save or check.
+	 */
+	if (!total_reserved_mem_cnt)
+		return;
+
+	/*
+	 * Allocate up front: /memreserve/ saves below may run on any
+	 * path and must write into a memblock-backed array, not the
+	 * __initdata reserved_mem_array which is freed at free_initmem().
+	 */
+	alloc_reserved_mem_array();
+
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0) {
 		pr_info("Reserved memory: No reserved-memory node in the DT\n");
-		return;
+		goto memreserve;
 	}
 
 	if (__reserved_mem_check_root(node)) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
-		return;
+		goto memreserve;
 	}
 
-	/*
-	 * fdt_scan_reserved_mem() sets total_reserved_mem_cnt to the
-	 * number of entries that need a slot in reserved_mem[]. If it is
-	 * zero there is nothing to allocate or save.
-	 */
-	if (!total_reserved_mem_cnt)
-		return;
-
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	alloc_reserved_mem_array();
-
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
 		int i, len;
@@ -342,6 +392,18 @@ void __init fdt_scan_reserved_mem_late(void)
 
 	/* check for overlapping reserved regions */
 	__rmem_check_for_overlap();
+
+memreserve:
+	/* Save /memreserve/ entries (independent of /reserved-memory) */
+	for (int i = 0; ; i++) {
+		u64 mbase, msize;
+
+		if (fdt_get_mem_rsv(fdt, i, &mbase, &msize))
+			break;
+		if (!msize)
+			break;
+		fdt_reserved_mem_save_memreserve(mbase, msize);
+	}
 }
 
 static int __init __reserved_mem_alloc_size(unsigned long node, const char *uname);
@@ -365,11 +427,11 @@ int __init fdt_scan_reserved_mem(void)
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0)
-		return -ENODEV;
+		goto memreserve;
 
 	if (__reserved_mem_check_root(node) != 0) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
-		return -EINVAL;
+		goto memreserve;
 	}
 
 	fdt_for_each_subnode(child, fdt, node) {
@@ -406,8 +468,21 @@ int __init fdt_scan_reserved_mem(void)
 		if (!err)
 			count++;
 	}
+
+memreserve:
+	/* Count /memreserve/ entries (independent of /reserved-memory) */
+	for (int i = 0; ; i++) {
+		u64 base, size;
+
+		if (fdt_get_mem_rsv(fdt, i, &base, &size))
+			break;
+		if (!size)
+			break;
+		count++;
+	}
+
 	total_reserved_mem_cnt = count;
-	return 0;
+	return count ? 0 : -ENODEV;
 }
 
 /*
-- 
2.43.0


