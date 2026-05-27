Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AAACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxyO1vdQIioBST6/se+LFHwKyw/fhXDOexNC3wOgNGg=; b=IYLYEC3Z9yjqynssj62aVg9vWs
	iQzFuLtvVh+Pw12q4QD/Hp2YuZyP4zF2d7aKE2dWanqwiYRsRdyg+rVggUTo97f32vIZJk2pKh3JC
	ak1TWnlUCAUcdpDpDlVRjQgnsfHGtLIyWrCA896MS7dLSzHt00Bhs0h2zbO/rAbqyvwLEDPRhXIu/
	/PkU81UwPUKZBVJ1Vh4ASZhc5ZAchmbrDXjvskYcdbpDZynf/k3Bvo4BDIlLhDfHaraD2odWs0ij3
	2nZizzdss1KmDhsKo5ja+hLqCcDIC5KMgDusQjFsD5TykTu5cEAEjiNJnND2ju2FDeGCc6e5RgS+e
	/LVOeSWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS5Nn-00000003Hxo-3TtM;
	Wed, 27 May 2026 03:56:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS5Nm-00000003HxC-2jSb
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 May 2026 03:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AxyO1vdQIioBST6/se+LFHwKyw/fhXDOexNC3wOgNGg=; b=adf70Fmas0Qs9oE8LpQ3UgkjcF
	zIWQXeiyyEljz+kSw+L3y107Ab+3/v0tsPRIfJNyDVjGvhSUn5/o85nuFky/ygcBuDP/LiJICvdFB
	YEkj/N9684lUlLkpmlSmEYVHoPcNSoV5tSNgPNXD87izQQNxv2n2l76aIHJdQ4EDpYnRNcXJ3gTnF
	hn2rnDSAyoCouf1eMyrDM1xTvb/LugJJUHdnB3flR/Y/PEeNhW8Z4BB4TIEImFAMIXVDzlhzy2XqQ
	ou2yGg5TSPyCFoRu0Bt3Gmbz937/Ro0NvT1W95MJseIHt/+ebLceEVpOqcvW4Nu84m4UyV2A5oxSs
	WLHc62Mw==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS5Ni-0000000CtVS-0eII
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:56:37 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-36810434abaso1150058a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779854192; x=1780458992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxyO1vdQIioBST6/se+LFHwKyw/fhXDOexNC3wOgNGg=;
        b=aGgx7TbiP30YrFvXI31/tYtcgVYF5elECbLkxUr7rZgbruvoGYKEMQUPA0eQI0AiPf
         emFRn0zaxfWOt0aesHD6Mno22gpzKTnLcnJoor7uGoW1LrKRAE0xNNsQSS0vvt3XebDA
         u4/+UyNEY345X5MFWgmSlUcL9VSDyP3SrG0Q3056dtOSigHENWkLzoO5OPLuy2cg4np3
         O+cfRx6i2INHhst+HQx1+tlwNSp2+9phrv6e2MLS43wtoQkm+UmA/1zOgmFKNn1mkJNM
         25oliTmpdLmRYtnEBmAxH7HgIbZ5gJawtK/+J3sMm/jmbElU4OOzgdwvxXovaTOMf14n
         r/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779854192; x=1780458992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AxyO1vdQIioBST6/se+LFHwKyw/fhXDOexNC3wOgNGg=;
        b=K/Ym4YfOajtyhyjuMEwG8Su+EawAfi8d1gaecD8LV3LI5tuKSKmlsn/6J40ixtNX3Y
         kRrhzoIQ2Pn7cJi7lPPemTnFn2ludI2VhHceU+mzqR+4NWIK6nFFD1L/G+GXEmpP86Q+
         Xfg6OMaoA3HWMlT+4vLq9AO9osQhFABUXZ75g3Z6z7sktgJi4IUZ62LEBtkJOVTuwNSp
         yv7pP9wNvyezqP6om4ZHv7CJaolkCLMJy5fos+eQ5d7NZyUkE9xTdMGjsQkZHU/1P3M8
         5T4t6mlwrCaB7hO9NOcjOfTzwL5gAZ7NR3u2YTXBPHuqMkWfjkokrDF+jNXEJnpgWOAA
         1Q4w==
X-Forwarded-Encrypted: i=1; AFNElJ/kpcobS2EC7aWVAjPSlV77Gtl6PECzvK1XkRySQu6LVJwJ1JbGGqyTzKqDF+OPHJbtaqY4Lbse0B/r9v7/weIr@lists.infradead.org
X-Gm-Message-State: AOJu0YzPWNEhYp6M4wqaLhB0JJq7DxOUTHhtKGg50nU2HQxAq05NffFZ
	ipDuU+d5M55WPTil+q32e1VAfgrlz47lWiVXy2NyWbpGzEgKN7sH+QSo
X-Gm-Gg: Acq92OF7i1nPaIrc7REjS4jnWPh+XSbu7KncbpVlTAK00dqtxSMNi6NcCPnlxni+dg2
	PmYt2s1HSIAFReuyeyW5AJpb2Gz2Ij/BS2Hstq9AHor9hhpv/DSAOsRh7UFxSA9ocHKmoJ7XHLL
	TubNllA28MmfdaJoRt3f4IYgTH5nfEYP1I34b/bY2lgMHDImxDxErG7AwaLIx/kKa78Jk2TGpdU
	/CrLAA1wnPtxXGfcbs19XvM0AgZQLRH8xhjdgRoXlqwLBbi1iKMZF7T9GnP+O2E38UQyq1O2wgP
	adaQVXNW6YzKmI2urM0rAtYMkin8Xxd7jvVPNqsc8T2lU3wlPrDvr+edHXHEebaxN4KPqmFInZt
	aGPEe/bnI7bYCwizbE/2rVrTcB6fajMELC1JD3eGQsDfmncdIxgf5kmMwtPijCeg2Ecjk2Ud5z6
	ho181GVZyGuepOm4n43mK3mkme2duQ5hVQRar+iQ/h01UwrvznkM/CE8DhzsBpL0SHVd58/oLoA
	Gas4WcDHeCXO4dYBzv0tdcpZdKB4YX+Typ9Lw==
X-Received: by 2002:a05:6a20:2a26:b0:3b3:ccbe:dbe0 with SMTP id adf61e73a8af0-3b3ccbee28cmr796935637.3.1779854191930;
        Tue, 26 May 2026 20:56:31 -0700 (PDT)
Received: from firefly-aio-3588q.. ([36.28.158.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70f1ed8sm828385b3a.43.2026.05.26.20.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:56:31 -0700 (PDT)
From: Xueyuan chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	yang@os.amperecomputing.com,
	jannh@google.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [RFC PATCH 2/3] arm64/mm: make huge zero folio read-only in linear map
Date: Wed, 27 May 2026 11:56:06 +0800
Message-ID: <20260527035607.14919-3-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527035607.14919-1-xueyuan.chen21@gmail.com>
References: <20260527035607.14919-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_045635_827718_F127F343 
X-CRM114-Status: GOOD (  12.62  )
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

From: Xueyuan Chen <xueyuan.chen21@gmail.com>

Implement arch_make_huge_zero_folio_readonly() for arm64. Once allocated,
try to make the folio read-only in the linear map so unexpected writes
fault instead of corrupting shared zero contents.

Respect can_set_direct_map() before touching the linear map, and treat the
pageattr update as best effort: it can still fail while splitting a leaf
mapping or applying new permissions. If that happens, generic THP keeps
using the writable persistent huge zero folio.

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/Kconfig       |  1 +
 arch/arm64/mm/pageattr.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fe60738e5943..3cd705dd5251 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -44,6 +44,7 @@ config ARM64
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_READONLY_HUGE_ZERO_FOLIO
 	select ARCH_HAS_HW_PTE_YOUNG
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SET_DIRECT_MAP
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index ce035e1b4eaf..51ce31e74a18 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -3,7 +3,9 @@
  * Copyright (c) 2014, The Linux Foundation. All rights reserved.
  */
 #include <linux/kernel.h>
+#include <linux/init.h>
 #include <linux/mm.h>
+#include <linux/huge_mm.h>
 #include <linux/module.h>
 #include <linux/mem_encrypt.h>
 #include <linux/sched.h>
@@ -147,6 +149,20 @@ static int __change_memory_common(unsigned long start, unsigned long size,
 	return ret;
 }
 
+#ifdef CONFIG_READONLY_HUGE_ZERO_FOLIO
+bool __init arch_make_huge_zero_folio_readonly(struct folio *folio)
+{
+	unsigned long addr = (unsigned long)folio_address(folio);
+
+	if (!can_set_direct_map())
+		return false;
+
+	return !__change_memory_common(addr, PMD_SIZE,
+				       __pgprot(PTE_RDONLY),
+				       __pgprot(PTE_WRITE));
+}
+#endif
+
 static int change_memory_common(unsigned long addr, int numpages,
 				pgprot_t set_mask, pgprot_t clear_mask)
 {
-- 
2.47.3


