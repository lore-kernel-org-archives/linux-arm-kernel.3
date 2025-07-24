Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9EEC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5mN880WCISqsqqypOE0OCrYzPzbEuiPZ0HVDAJk/kA=; b=22w9zNWO+Az//hbuTp/yQgYWbv
	CKvLnmf74aZtdOXLCw9MPe3n7h1AWVAzFdfdMRlJTE6yGDni3L/FvmCIArjg8QnrF7AvTAgmUOrUo
	QbZA6WdpwIqNhlZc+wQ5CT3vjrg5DqWS3g8X20Tm2IZIPnKPxrKlBpj3wAULyTrru6awTFLOLXd69
	URcCXCc9OrOI6FPbiO651Brd/n6+SBz3ZaKgndWONoQmwhZoXxMkZcomfUk9IfaeNF8kR2xL9Xcnj
	2hiq6V8CnTlesgL3DcBaJHNYpDz0fI39bHiQunD17JTgS0H5ae/Bd5HSokplRA4hXoqYlhbZWyDen
	fd7I/5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrg-00000007rbf-0hyT;
	Thu, 24 Jul 2025 15:28:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewRE-00000007evq-2QbN
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Jul 2025 13:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=h5mN880WCISqsqqypOE0OCrYzPzbEuiPZ0HVDAJk/kA=; b=P5H9aK+pf7MH5uck71c/F7A2bF
	ykjXcgydufldi6Fot9o/uYLi1xqVSQ/wZ8Eq56gYLv72Zyzsj4iJIMUti6li4oErD6MB9aiNs5iW4
	TXFGYd2n/Twbh4lTtlQcHdhF1XJ9LzZ6Tir9BGNBtXP5KvoKjiz/zAkxDtd/Q7V0XcdMewVSYeHp4
	e07Qo4zi09xGVStnxRkGp/jb2lcI81wGzVTEBBkZYjqrY3aFXUkUJ5YiNdF6NeBEDRNQZqw5+5Rm7
	JkDZdnuwLNd5wIIBYEwoyJWJ9Am+M+Dn4oj60BW25Z/G7h4qlXcfOOY/C/ypXXCGgNQDTcdjQ2xKp
	oVTkzckQ==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewRA-0000000Bd5L-2YJ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so7222905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365403; x=1753970203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5mN880WCISqsqqypOE0OCrYzPzbEuiPZ0HVDAJk/kA=;
        b=EaayAnHpbG0qDwn7ilQSJcsq+9LaL0qBsCTYmlVtdzgtiZeZS1RLzaf65DS25S85gm
         5YQAO+eWNUe3jVt1og2QmUkQIQN5m3ceoEh9e1rbC3rebup8+/geeynPvjeXdmavev9Q
         Hilc3e6lkF24+Pz6QrLk7zk42XyqftZxWezgibqpC+QUpNyFVjHdotqpCYjkG3HprfPX
         twKJc7m5lqZf9IBPdywvORLClMnehvp9TX5FlYmv50tVf/S4rmTxPBmtc/GY6uHthiel
         PUir7k6QMoOFgDTcaS1S2EXomK6yEJ5V9FSPA4OoZMDs+LVmpiw74e+01urNEsmqkYzP
         uh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365403; x=1753970203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5mN880WCISqsqqypOE0OCrYzPzbEuiPZ0HVDAJk/kA=;
        b=XCbpcjCgit25jpikx+44NEAFw6tL/yAqlomypkROnbl6kbvWmF+RJMZlXP/XelJVpM
         9RKeo8h3m3QuK8YNEusLgcHq64zMlmt7z99p9pIATtvhGNd8dWCjnfBkEQZD+/7psJcQ
         tZFyXJYfIIovTxgkmBpxBiwb8bN8esaMTYLqADGDDSTAlVm7NJai2+iNNdZ4qMUjobUU
         4aCTOtPQGjHR45ppP4NuSwBI0g5shiCBoPEj/0ZlDuH+9RyREM6qjI4TsVA1DB7MtIno
         jxs4U3O5v4VSRoT6oKaDjss/gXRtsF5dHIu8oqNmUzxxV2XYKwqQbNJo8pLcLAaSlEet
         OAFw==
X-Gm-Message-State: AOJu0Ywjs15665HcFNWBOdAbNAknAmUbnqgOAhZEWyeizklJoGLN6WBV
	AS8lm4OUctg2XAW2DH2If8JEgTiKA0jt6fmPOUEKlMZV3shKeFx4RpH+AMOWINRfaBc=
X-Gm-Gg: ASbGncvRnnN25cBhyEfe76Klo+tOvazbyKRFqAzuM1doCT/kNsIJ//hUemOgjG+zF9Y
	XJhENUBHhQ14vofHiu7lwiAaCnfoTiUzY8YVZkfogz3TXNghthKdCIbz/Sl4LROw/PQBrfZOhaR
	dZNLk+CS236tLMDPv4Ncq+ghElS4SWGYpo7qDfh/6YtISkHTWgVnSwwaB5pXJWoGQ75+WHyq6ib
	Mu8KWGDlBL1JnE1iLjwGfZT7tWo/C2hC6JjvZxDyUJ+qkKtnZmC7as7iWTRC2jYfxCM3i1FbaS1
	3Ams6uBsXv70FtV5l7TN3ksR8X+SslOnK1tWMD7Cbzi3rKjoViJTg+ShXj7a2I6zUr3By9VqyLK
	es86rv2i5nyYRsCvRkrMioCaKbmQ/GNuZv6XcUbnPe8rfpi6We0POrZXfSAwMU+jxzMrZ3OhW4e
	ilEKwlZkf9Mj4zihYxwZNKZtk=
X-Google-Smtp-Source: AGHT+IF4egT06XIAWuc0TJnVdNpe1wQ7sn3xvEGeH8Rc0pzDJnMJjBpN4GYnZW+sz3u5f7Eq0JGLQw==
X-Received: by 2002:a05:6000:3103:b0:3b5:dc05:79b with SMTP id ffacd0b85a97d-3b768cb0f15mr6041122f8f.14.1753365402888;
        Thu, 24 Jul 2025 06:56:42 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:42 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 23/29] mm/sparse: Register information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:06 +0300
Message-ID: <20250724135512.518487-24-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_145644_972604_266104FD 
X-CRM114-Status: GOOD (  12.42  )
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

Annotate vital static information into kmemdump:
 - mem_section

Information on these variables is stored into dedicated kmemdump section.

Register dynamic information into kmemdump:
 - section
 - mem_section_usage

This information is being allocated for each node, so call
kmemdump_alloc_size that will allocate an unique kmemdump uid, and
register the address.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/sparse.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/mm/sparse.c b/mm/sparse.c
index 3c012cf83cc2..04b1b679a2ad 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -15,6 +15,7 @@
 #include <linux/swapops.h>
 #include <linux/bootmem_info.h>
 #include <linux/vmstat.h>
+#include <linux/kmemdump.h>
 #include "internal.h"
 #include <asm/dma.h>
 
@@ -30,6 +31,7 @@ struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT]
 	____cacheline_internodealigned_in_smp;
 #endif
 EXPORT_SYMBOL(mem_section);
+KMEMDUMP_VAR_CORE(mem_section, sizeof(mem_section));
 
 #ifdef NODE_NOT_IN_PAGE_FLAGS
 /*
@@ -67,10 +69,11 @@ static noinline struct mem_section __ref *sparse_index_alloc(int nid)
 				   sizeof(struct mem_section);
 
 	if (slab_is_available()) {
-		section = kzalloc_node(array_size, GFP_KERNEL, nid);
+		section = kmemdump_alloc_size(array_size, kzalloc_node,
+					      array_size, GFP_KERNEL, nid);
 	} else {
-		section = memblock_alloc_node(array_size, SMP_CACHE_BYTES,
-					      nid);
+		section = kmemdump_alloc_size(array_size, memblock_alloc_node,
+					      array_size, SMP_CACHE_BYTES, nid);
 		if (!section)
 			panic("%s: Failed to allocate %lu bytes nid=%d\n",
 			      __func__, array_size, nid);
@@ -252,7 +255,9 @@ static void __init memblocks_present(void)
 
 		size = sizeof(struct mem_section *) * NR_SECTION_ROOTS;
 		align = 1 << (INTERNODE_CACHE_SHIFT);
-		mem_section = memblock_alloc_or_panic(size, align);
+		mem_section = kmemdump_alloc_id_size(KMEMDUMP_ID_COREIMAGE_MEMSECT,
+						     size, memblock_alloc_or_panic,
+						     size, align);
 	}
 #endif
 
@@ -338,7 +343,8 @@ sparse_early_usemaps_alloc_pgdat_section(struct pglist_data *pgdat,
 	limit = goal + (1UL << PA_SECTION_SHIFT);
 	nid = early_pfn_to_nid(goal >> PAGE_SHIFT);
 again:
-	usage = memblock_alloc_try_nid(size, SMP_CACHE_BYTES, goal, limit, nid);
+	usage = kmemdump_alloc_size(size, memblock_alloc_try_nid, size,
+				    SMP_CACHE_BYTES, goal, limit, nid);
 	if (!usage && limit) {
 		limit = MEMBLOCK_ALLOC_ACCESSIBLE;
 		goto again;
-- 
2.43.0


