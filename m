Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26845608363C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kDPOi2Hd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MmDFaprP;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A9LkN1M9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2UxkzZOuXMzEW1DRxwfP1Y2akfSOt2A5NGCydHJqRyY=; b=kDPOi2HdEeh6QU
	uIyfGweTIWiIaJp2Vqxx6oaGbrVlBzfXzXby9WU1bFqKxL+O1j3H2452fPxq6cPvICa/xrZOOo+F+
	EbRYd6pH5J4a+Wxx6rCKjCD93NEqVABjRJjBK1ixk5p1ixTvwvkVGFxZlTm4LhredZDqc4ZcuFfqC
	co/1v3F/T0VTmxa4xT/p1jJD+NicgB5e10P0f7hi+ttVM58IVR2dJCz3JZTlVeR2GMNI8yWL9QwfG
	jvA/OFVijbK7hBmVAmU7lZio9CSf+z6d6maSWlEx+hnvBy0zZD52q+R7RsoGy/vr4kecmV4wXt2Gy
	Uv8BksHX5uN92WGNvWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBb1-00000001xfC-2mKO;
	Tue, 03 Nov 2026 10:18:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBb1-00000001xdn-06dx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Nov 2026 10:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2UxkzZOuXMzEW1DRxwfP1Y2akfSOt2A5NGCydHJqRyY=; b=MmDFaprPdRu+gHHZvCUdUQ10qe
	pObbXkwy2hvYDXKdo7l5uhDwK57ad4n6Zwv99oicqdeCjDm/o8vZgNP0eQ9JW4E4Dur0ElAVxORVh
	qUkaqgtdcVVXiPDM45Lit9GAkVbZehBFFPLqRCMTzrxW/1oQ2ZTPnLUiEuGUjPQI1HzVMavPEUdYX
	+K6cSC3JDonGbq+AEjch2oWGtKZGep20R4woIgIvcC56D3HN977q1eKaN5e4qmV9Uoan4rrOTqZWm
	OT/d2OfQzpdo04YewGQ71Y2I7+EH9g8sa3CKXoaAJd2fW5lb92GmNe/QCluOfgBWBPIz6XgPqwVl6
	cW7/ug2A==;
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBay-00000000J1m-19Ip
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:18:25 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-35c76e9614aso5491574eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 02:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701101; x=1794305901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UxkzZOuXMzEW1DRxwfP1Y2akfSOt2A5NGCydHJqRyY=;
        b=A9LkN1M9P6Zv3RmfAzue1XzgmNmhGDrWQGXgrf92Jp/FsJ99kTz/uPIOeuiDCdj3P9
         +u1Tw9L+oVDwYAO8tE1X+wEz/uzXr97Ina5AA4ycd5CpWbcPsa/Kq2q5x9x3qd7wmHTF
         A7O7q2gyfp8k8p7vaLxLSzFf2K2kcEa3GNvuqWqG9eb5RWrTi317rt9HQNPLhL17ColJ
         4AVfX1u3ILhMLp0OXd9caST5pgggn6Pw4BQpdI2Fm2vhTNCfbML/jhKWsFQ9xVaOJmuU
         dqVRrriGif3PfGlbkcela4ltovUjteklCjYf6DXOBS3T5kqre6YZP1o36P90viX4js36
         yE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701101; x=1794305901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2UxkzZOuXMzEW1DRxwfP1Y2akfSOt2A5NGCydHJqRyY=;
        b=MscE4YS0ALGdlOBZKFDeb7nWA15jdG1fRSQGk23LUpDsg3vOSpJe/ZrfM/vJYEYEh9
         5/USWHKjvqLmDE5lXFuGHmFShxecwe9LY2flKVHuWH6PEL3QUyP+trnOFWGBBoUsZnOj
         RUQqd285Sq6lXtCX6Zuib4kOcSrCLJrljeYFopBtFVdbMUjcLXDVgtinIx7XzQDz7+R3
         nlrh405NDQLS8EBUMvyguPJlQFdsR35UVAUPvbHwMfXCzM9cMFkFKolttmU8QNDwDhZp
         moriLMG4O/L7hX5Du3xGaZaJGoEpWFmN4FCkMJWUKrkqicZ+NUoipBUopgBpwGHWJhic
         NB0A==
X-Forwarded-Encrypted: i=1; AKwUvBwg8gvb3ZbYfZFakk88mXy8oMk0pY/eUGz15i0lse7dy2ppS4//PPr1jKl2OELJRLDUYBIrKY+1H+YYiL+1+JBC@lists.infradead.org
X-Gm-Message-State: APuU4Z81mIjxVXZF1KWEX3S0yyphOgHAzcgbXPb4JwtxZ2pXitd6SqBC
	rV7DKp6AfJiApDe/Hmec9tWmAlRUXgnkYE1M/shUZ9LKrgsdOnscUge4
X-Gm-Gg: AYBFou3YBKSipFejGF87V5+59rAfaZobNkj0RaS7lyZA/cnrKWe4tTDlUvHU5AGR+BL
	vrsDsBKUyFVLSrmuxCgf2xxAx9pa6q9MVjPR9YJqTqWMkwu2oor2vn1z8UDNNa6wlzHgIPRWN4J
	YqtsaLjeemeBNfHSk+TV8PCBs0oQMZBZzhzTYVSlk+KqwYlNIr1kP71XjMZTthyodPK0bnCWl1d
	j1miYYxjCx5Me79/iw+ntvquhat/Ip29dRguDzWbCJxUzr1FlQX3cdlJ+sCVBwTvQ6oRjW97IKf
	V3qaUFg7w8jU6zijJI71JQY7iwijeVJ4XcHjiAMURWZtzSxq7qPx6tKnS6cYCR3TES0LyHpfj8h
	oQl18D4kSu2pxHEBa79iVa1sOasXrA8l5NrcqY6O/LcWX7LhLT4EVRXFRUD1q/8RuJ+RcXdKnK0
	skibGXXduN5VtmX1XnR1AZGNk6aIa2MVcPH9L/21/4FJwhVA4jEmLQeS8MgVxiIRme+19TC99tw
	a0Bh6idy3YhDAhQgiwjthHz8CCFXKzI7ZAiKfb9OS0N//Ln6R92IjY9dFwWlx9pQ4QiPAlkcyXo
	B+wkTluUCgDn9GA2ftHY2ZAlrs7r3A==
X-Received: by 2002:a05:7300:c019:20b0:36b:f09f:924a with SMTP id 5a478bee46e88-36bf09fa41emr1926474eec.14.1793701101482;
        Tue, 03 Nov 2026 02:18:21 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:18:20 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v11 10/10] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Tue,  3 Nov 2026 18:16:58 +0800
Message-Id: <20261103101658.766905-11-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_101824_326972_0E79AC1B 
X-CRM114-Status: GOOD (  14.63  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

Try to align the vmap virtual address to PMD_SHIFT or a
larger PTE mapping size hinted by the architecture, so
contiguous pages can be batch-mapped when setting PMD or
PTE entries. We do not expect any significant overhead for
this.

Add __get_vm_area_node_aligned_caller() as a wrapper over
__get_vm_area_node() to simplify repeated calls with fixed
arguments.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---

Sashiko review: raised two concerns:

- Hardcoding GFP_KERNEL in __get_vm_area_node_aligned_caller() strips the
  caller's ability to prevent blocking, reclaim, or warnings.

- The speculative PMD-aligned allocation, on failure, could trigger
  spurious vmalloc purges (reclaim_and_purge_vmap_areas(), synchronous
  TLB flushes, shrinker storms), a possible DoS for vmap() >= PMD_SIZE.

Both follow existing behavior: GFP_KERNEL matches the adjacent
get_vm_area_caller(), which hardcodes it the same way. The purge concern
is not new -- __vmalloc_node_range() already attempts PMD-aligned
allocation in __get_vm_area_node() with the same fallback through
alloc_vmap_area() overflow/purge, so vmap_get_aligned_vm_area() adds no
new purge behavior.

 mm/vmalloc.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 42b3addd20f9..e15bcef804fc 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3361,6 +3361,14 @@ struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
 				  NUMA_NO_NODE, GFP_KERNEL, caller);
 }
 
+static struct vm_struct *__get_vm_area_node_aligned_caller(unsigned long size,
+		unsigned long align, unsigned long flags, const void *caller)
+{
+	return __get_vm_area_node(size, align, PAGE_SHIFT, flags,
+				  VMALLOC_START, VMALLOC_END,
+				  NUMA_NO_NODE, GFP_KERNEL, caller);
+}
+
 /**
  * find_vm_area - find a continuous kernel virtual area
  * @addr:	  base address
@@ -3692,6 +3700,30 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static struct vm_struct *vmap_get_aligned_vm_area(unsigned long size,
+		unsigned long flags, pgprot_t prot, const void *caller)
+{
+	struct vm_struct *vm_area;
+	unsigned int shift;
+
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE) {
+		vm_area = __get_vm_area_node_aligned_caller(size, PMD_SIZE,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	shift = arch_vmap_pte_supported_shift(size);
+	if (shift > PAGE_SHIFT) {
+		vm_area = __get_vm_area_node_aligned_caller(size, 1UL << shift,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	return __get_vm_area_node_aligned_caller(size, PAGE_SIZE, flags, caller);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3730,7 +3762,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = vmap_get_aligned_vm_area(size, flags, prot,
+				__builtin_return_address(0));
 	if (!area)
 		return NULL;
 
-- 
2.34.1


