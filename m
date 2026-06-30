Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A572CC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nur8Ymdh1FRAljY2SkKXlWeVVD/O0p+FPkDXgbutnT4=; b=WztWsjmBkxzrvBMIdq3cL0DguU
	RHwwc42O81WTUL76BEmxR3dCaTTcyfQPiZUSoXERcRaThD4A+8yJEgyxMQGaLwFOO1H76TqcSq+0e
	jyXUPHSrtR124q82GxboIEN9G4miHkWupayKK8KoqHu/uGicHeF3Nv0U3uV3uIVsstgpaXRTd0n7/
	VWt2VRsYTnTp0G++FrTKZXLXZ6fghDDdeP3YX11pdlfad8Sl4yubH+XrZQIfh2zAnwSdsLtJ+xTMa
	Ko0YYkvXbUm4vbPDMlibOncTWs+kSWQoOPJGoEKtYhlcWiajTjECUH8LukgrJ5P4wrk4Erq4FcaCU
	hWZMpCUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTD6-0000000GAF5-0Qd3;
	Tue, 30 Jun 2026 07:48:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTD3-0000000GA9p-3nXc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 07:48:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nur8Ymdh1FRAljY2SkKXlWeVVD/O0p+FPkDXgbutnT4=; b=Y2Bot9TANQTPSPTKWpN+HHBMEJ
	Kh+vj+fq5BHms+dprZrHtcw0IYn/OP8yxQMaLN6Ju5iVP3gf0WcYxz45YkrpC4Dox9S+YePwwz+BS
	c1Xn3pNi7nl8X3exacJzG3iX5y3G2pF6IO9GRyXVoowBwUDE9qVAgcU57i+3DdWzqRD2lt4aJAw6V
	Ns27pRS4j0fXnXj3GuFZ3DOXZ8Ch8qrFM9EdO7KpNWqX+DVUNwN6YWs1NuSwBa0qbgs69g4r8sow1
	RQS1VatXrMEV2ANEpk+s2bN2fEXKkDWESbu18F+DoaUi5eY5MEVBIHv6S4hFMs/xYJ2QyTHkhSrtO
	Wvpzs9ug==;
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTD0-00000004XYU-3NRU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:48:44 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2c82538b6c0so24611555ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 00:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805720; x=1783410520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nur8Ymdh1FRAljY2SkKXlWeVVD/O0p+FPkDXgbutnT4=;
        b=PJhn2Hq2sx31wkhsPtNucYJx+zE2iibLxk5rr4zXMDzeMt6dzpRslxdiuTaULiJhHu
         TGmMnwvgdLtPEkYzVvjbBIyBPIR1okLCFhrTr/MlbzCvLJM6/CIx0uKxjk7ca67nxVNu
         hJUqG1GjdTp0KgZTw06M8s2u07At0L11URpS+i/j6lHxP3V74Xgrj97Tp6WSaCFLF5cV
         AhKGGqRF1zU3COwkvvh+NYn735xo8Cu8AQDqW2iA7mEEUo/Rc8O6eGvCEdhGwWwyi3GX
         OMiRz3MlkseA7M0TCFnibSrh7+QoYwiwAU337qc9p/WjBPgOceTx0VsOGMmGheFV2A5s
         pV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805720; x=1783410520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nur8Ymdh1FRAljY2SkKXlWeVVD/O0p+FPkDXgbutnT4=;
        b=UtFBfeQX5rMHmSO4x3dJuimHRuVZGQ1Ta+nOrylk+vHb0IqaWLIDe40vYfbYVVbzjN
         8657WFfcH8h1gCkXgxIMU9Y2jHd23WOhHIZ3MJOlopry/D9Urp2KB3IlMY7PxRQ4JbWs
         A4qijquqlK7vO2Gz7tJhLj8slBKFBJP99qulrbl0FcSp9maCL4gEEPEudv3sTO7hLGxA
         9cN6uTjleSsjaEiniKfHbhaFOVj9tNxZ1AeNuG6W+YWtvJ6E/6JXwTe7LcH8zuDPJzE7
         lS/rFuPiKPtI4O8BhwgpxIpxNnVMnzFBy4KjhhOzdgoz3PS0GzdE2z0ymMG+5dUv8Arm
         lsUA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/sAs9roA0D298xWxVK8qCibR2J1gUHFFqPpoZYV0aXseDqCUkCVMJHZ8fVVtVUfIrMU+OC1GnBPCHD41h3VHB@lists.infradead.org
X-Gm-Message-State: AOJu0YzVq3PRanlnfBf8lz6mZO3bNJutd+gdditTLfEXDdXWGSnY2pkf
	xasmxYQQN6Jl1tbryZtzkTPGnaJitpTnqANG7XPT5CH+JoNt2MOaWnl6
X-Gm-Gg: AfdE7ckuO0V0pRekK2tsjG+aUAz8t5y8XESsmS7GrjDJQe6YvQQiC3t1ix2OWO4wqWD
	dp/bIUox85ROOFRWZ1gNYAzJJTJEosQ1o1uAlF4f4qhnERLShhD3mEHiz4TFaKo7UAxV9Q7gmiO
	m7xQHSIvj0ydkCAXfwLSDOz+OjoB6A1qe+pknT7kgZvsV1pApxdpI12KxCeQmK1Kg/PG84OQ2QK
	fPE7XhD+cCNhYjfG2/Y/TXcJ5kOzY7DsDDYI+YcyJQ2f9dFbukTAF+DUT1CGy3FkC/UoYGU607m
	QkDF4sL0ijdy3Rq8erup1UDmZ0yQ2mhudmraWyyEJAY6/nD+v1T+2hoABroJAz8z4WxvY89KPZ8
	6HDs36083W/4Qdfl8Qa1JAioPwlRDAIfDkxyvsYk15+xEjdcoz8VaUN3HDPJttgbyJeaUTK4xYR
	b0Gu35XQy9dQm45ERQ6pBk63uGhA==
X-Received: by 2002:a17:902:ecc1:b0:2ca:1b97:70c5 with SMTP id d9443c01a7336-2ca2d52aa74mr18805135ad.4.1782805719998;
        Tue, 30 Jun 2026 00:48:39 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:39 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 07/10] of: reserved_mem: add kdump helpers to exclude non-dumpable regions
Date: Tue, 30 Jun 2026 15:47:11 +0800
Message-ID: <20260630074715.4126796-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_084843_004552_D2883CE5 
X-CRM114-Status: GOOD (  17.24  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Add two helpers to exclude non-dumpable regions for arch-specific
code.

 - of_reserved_mem_kdump_nr_ranges() returns the count of regions
   that are not dumpable. Each excluded region may split an existing
   crash_mem range into two, so callers use this to calculate
   crash_mem allocation size.

 - of_reserved_mem_kdump_exclude() walks reserved_mem[] and calls
   crash_exclude_mem_range() for every non-dumpable region.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c    | 34 +++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h | 14 ++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 9db0502989c3..c83ef88dffe2 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/crash_core.h>
 
 #include "of_private.h"
 
@@ -856,6 +857,39 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
 
+/*
+ * Count non-dumpable reserved regions. Excluding each one may split a
+ * crash_mem range in two, callers use this to size the allocation.
+ */
+unsigned int of_reserved_mem_kdump_nr_ranges(void)
+{
+	unsigned int i, n = 0;
+
+	for (i = 0; i < reserved_mem_count; i++)
+		if (reserved_mem[i].size && !reserved_mem[i].dumpable)
+			n++;
+	return n;
+}
+
+/* Exclude non-dumpable reserved regions from @cmem. */
+int of_reserved_mem_kdump_exclude(struct crash_mem *cmem)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserved_mem *r = &reserved_mem[i];
+
+		if (!r->size || r->dumpable)
+			continue;
+		ret = crash_exclude_mem_range(cmem, r->base,
+					      r->base + r->size - 1);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 /**
  * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
  * @np:		node containing 'memory-region' property
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 55a67cee41ea..70db99f1fbff 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -8,6 +8,7 @@
 struct of_phandle_args;
 struct reserved_mem_ops;
 struct resource;
+struct crash_mem;
 
 struct reserved_mem {
 	const char			*name;
@@ -48,6 +49,9 @@ int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
 					      const char *name, struct resource *res);
 int of_reserved_mem_region_count(const struct device_node *np);
 
+unsigned int of_reserved_mem_kdump_nr_ranges(void);
+int of_reserved_mem_kdump_exclude(struct crash_mem *cmem);
+
 #else
 
 #define RESERVEDMEM_OF_DECLARE(name, compat, ops)			\
@@ -92,6 +96,16 @@ static inline int of_reserved_mem_region_count(const struct device_node *np)
 {
 	return 0;
 }
+
+static inline unsigned int of_reserved_mem_kdump_nr_ranges(void)
+{
+	return 0;
+}
+
+static inline int of_reserved_mem_kdump_exclude(struct crash_mem *cmem)
+{
+	return 0;
+}
 #endif
 
 /**
-- 
2.43.0


