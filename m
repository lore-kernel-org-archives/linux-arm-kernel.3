Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA1A6082BE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CsK9KlQ+;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mcTCcTC0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H9wZERoTK73TzMKQ9KwUyuGxqQabGqZnw2K4sCikbaQ=; b=CsK9KlQ+UFSZAN
	WmKUDx54+BC2iPf5VD4gGDHgCUBNN56V6IKhi2XDPzVQ8UmUM+lSjy6pjnYlpT3E16Vv3yVLjj51J
	MyC/xrpUzXMcT7swWvwtP7dwMiFUIX136Yp/Mjz2ysBm4jYvXDMnbeiBr/aREizRJdebhJQ2d16Pg
	jKflMj6AijmJaFf1ebwyqGk49hDgXOUlB6wbxJAQAwRpplL2hpUcMydWV0MKBQM7iofOkTShfERpm
	8IrzNWCmLgb8Y/uYj6LEjKdriTULfZbKU66383kMuJGaeZWoz4jJPWdgLZHJScdC0FZMt/ZSyrpSj
	kOYfjDjIPVB+QqeeNNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBas-00000001xaB-3uRu;
	Tue, 03 Nov 2026 10:18:22 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBah-00000001xQc-28KO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:18:17 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-36661f953e4so6081945eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 02:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701086; x=1794305886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9wZERoTK73TzMKQ9KwUyuGxqQabGqZnw2K4sCikbaQ=;
        b=mcTCcTC0cdZizefq49XH5ImhxcHvkSsaJ60C6nUkunKFZCG9nNzYEl4okm1Qt0h/F1
         wxbIqMoc6f5w3XCT7oomxjsvWQUNh3G56a81gmaPSavlPTNO+IPF/dVAl84AD5W2nnuY
         whMKnXb/7qcdpZ+dqi3EZyGnbtbh7nYikgwgpQNNWaAADGEp5gD7cEIB+8DhmuoBnrXQ
         UDev0XaN5zCXkvfBvfpxksrScLyrIPxj+mSVL0/r5u1YiSGTuCiYnhX8E9e/Jmx0Zxmx
         0w6zQxTw4kOCk0jbnve2eGyJdLzQOYjn2kHWfew0GF5onCRfc3/Ro7IW8TTwZAXjyuPC
         +cZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701086; x=1794305886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H9wZERoTK73TzMKQ9KwUyuGxqQabGqZnw2K4sCikbaQ=;
        b=nFjvHW+jh5p7iULPNuntxsm44oN2r0BVXLfL5MfqsIh408kQFYuYTLki6/SwmXFXDi
         XErE+PctvNainjkfX+xusj4cYFtel8wV80msKarH4lfXPfv/7BJgNYtxKyTWNbCoon2M
         by/7rLjpniWkK+21/r6F1dSVHju/aG6C2CwqQYALzrookqWnWW0WzJt4UNIBIgWEJqT9
         FOI1VSWzFsHaVKiVhlrg9TXLpeJgmO+gFGfw3TEq46Kwgnv97wXjqD/SkdHto9opZW/3
         J09qXvsQAWWplXTuyJBuIBUP1J2XGOin2BA9ZmtYR6SvgTmpY3fesGf0F6xpUqwEi/WK
         ZPug==
X-Forwarded-Encrypted: i=1; AKwUvBxmvoBB5vjwHNodO6ZpCxZjRZNGJPo/rWAot71hCeMoWd717jtTZAnMA8giTTMKXtqpGcFPmnIHwOmwxUivJSOj@lists.infradead.org
X-Gm-Message-State: APuU4Z+NTLTfbyHeR55TQxa8JsabSUE46HeHkrXNJC9L2fC/KhCSB4w3
	auB2D3S2B4q9Imu71iMXh4MJFGNLJTCrNd2XV9lx3tgOHWkqO3bE0bOZ
X-Gm-Gg: AYBFou2m2G/SMnumn74oEMFtlk2xXl8dE8rRBGaLwSLaX64aOAYOpS9lEg145Qm7Es3
	A389/zXPSL957T1S0GhueRdslOZ0UfjIf8FW6sN/w+Cbn5dosqkJEjrGgi+paXTbPdkEnhNcVGZ
	+06c9uf66xEgzAYTSRY4RzXN9CSMUv63olutl3t+wSXUc9gCGp8eicnychNJdioDsaBQHt5SB16
	IIl0Vq22rntfK/qPJPWTQSwnb9zvlPFJxbup6ea6SP/v19vCEh88OMeuB4c3Lzp98gf2CBrRSQ3
	2PTdnZUmyq2Gpwqhh/bG2p016iI6X/w8BVKK/GBJzWiw2XAhPiyMSZ0CjngYRh3u3IREfeOYxol
	6n8CUQDlAsW4NfYYmzBj0O+P6ETAF9NWAwtYJTycFclJcPjStSf1B+M80KXPhHyKyW6hE7drRUV
	BY+yUJKJXPdvYdcE1Bkb70Dnk4KrGbsEwiAOOkGlLFQPqOpFw5PbQ/jJidVRQuXCeQPnzafMeET
	k9N7pxm/ptj2Vo887rhT1rE2dthgGhFF/mEpFFQ36hUD4CAZLAHlQJZWXEW9Z5SI0P2R1ngI2VI
	/CJzdlOYfJvz42TZt6vxQT7ReQSF1akHb3R0SvOtMPzWEJQHRE4=
X-Received: by 2002:a05:7300:c019:20b0:36b:f09f:924a with SMTP id 5a478bee46e88-36bf09fa41emr1925693eec.14.1793701086055;
        Tue, 03 Nov 2026 02:18:06 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:18:05 -0800 (PST)
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
Subject: [PATCH v11 08/10] mm/vmalloc: extract vm_shift() to consolidate mapping shift selection
Date: Tue,  3 Nov 2026 18:16:56 +0800
Message-Id: <20261103101658.766905-9-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021808_281787_FC302D3B 
X-CRM114-Status: GOOD (  10.41  )
X-Spam-Score: -2.1 (--)
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

From: Wen Jiang <jiangwen6@xiaomi.com>

Extract the vmalloc mapping shift selection from
__vmalloc_node_range_noprof() into vm_shift(), preparing for reuse by the
vmap batching path.

No functional change.

Suggested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 mm/vmalloc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 61f2b6fbbcd9..ee2c1ec4ff1f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3605,6 +3605,14 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);
 
+static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
+{
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
+		return PMD_SHIFT;
+
+	return arch_vmap_pte_supported_shift(size);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -4124,11 +4132,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
 		 * supporting them.
 		 */
 
-		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
-			shift = PMD_SHIFT;
-		else
-			shift = arch_vmap_pte_supported_shift(size);
-
+		shift = vm_shift(prot, size);
 		align = max(original_align, 1UL << shift);
 	}
 
-- 
2.34.1


