Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE806082BC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yl5SMk0h;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QvSa5pF1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SEyHpuH65RtgAfPnavKG94t3MsEPEX7xZ6UjOz6FFS4=; b=yl5SMk0hntV7Wy
	I16Ka7MaLD8w8dx0kE57Ay3rxeP9y6qO6PtUSsD6eFx7RF/64c1MKCeqFVWZatyGu3ColE+/dUrNN
	PAWbcUu5zioh7xW7axQH/ZzhOVa88DaT8kOgLiVTWBH5P9zLcXy8H1dzy5qIeCeY4NYfhcsfJ7qJt
	NmNXlrPDmA6Cw+SLdlgIhRDY81e8Z6aFUTFTc1po3lbVPy6kieifgBWioAmZx08mhOmxyFB2OY5Rw
	oHxKQYbaA2sE4FadQF0kHIVlZ5y8ShiCYyjurO/0Ub4llusajmoP0h/buenNCDDHYxpKaxLMX4jxC
	f/Jv6qKQymfYvNwe6Ldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBaT-00000001xGS-29G3;
	Tue, 03 Nov 2026 10:17:53 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBaM-00000001xAQ-19CG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:17:49 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1adbf62dd31so4336810c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 02:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701065; x=1794305865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEyHpuH65RtgAfPnavKG94t3MsEPEX7xZ6UjOz6FFS4=;
        b=QvSa5pF1CQQHIbRrFnXNf1WLpHNhUqMK3kY3mo9HlWSLHu4fZbKmn0PtnVw/G4ARjX
         E5Q9nvz4cdw+1AvuPXJdZHl+zCHse9qaetBHJlofSsw6etDj57yd9+sZ48PEgb420/a/
         MGphiB4P2UyjoX3rV4fVzQ5mtXOuf7tPNMDYMMF/6weO8WKRl1HqhpbnoqK+a2aFRD8c
         qHOPIjonLdBly0bgca0TCQjqT+J0obL06+NvU1W5TUTeDkH5RT2OwTLB7bIALX7vaAal
         5zlYh6/jahuRZqq41r+X8l//wt3n/Cs7uyWRv7AGl9zHxIP6kjIvOJv/8UFWQi882jDP
         NzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701065; x=1794305865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SEyHpuH65RtgAfPnavKG94t3MsEPEX7xZ6UjOz6FFS4=;
        b=MSFWNN6POAPbXDzULzlSHat7avFVxu28Mc7M8cQGe/OZ1Px6OuudJA/A9OHb2gf+Ii
         tM/F3ByZmtOVc5BKGm1qoWCZmc/vBPf9d3S/XftrX2N/3RKVPbmuoEJqJLq7fEsR3xL+
         aEuPSSpb0Iv9cpgTWC3CRfM4UT9TLGOo7uChekuFjIAyC3q55WSL7DiXJ00B8s6yTLje
         a51sxA6mwYBrQzgUElb0JzD0QhlcCMM0aTzzrv1dnKE6OR6lc1qC9yHWmksqlypi7hdh
         sF16M9dqFdVTZYinlR/BFrSunmzIF3DgeF01Tuu8d+wnkrXtdoi214/fbqv4w8trN8oe
         rokg==
X-Forwarded-Encrypted: i=1; AKwUvBxAr9cpWpG3XsApePMX3RxcS9FLxVEA+GfYEE9jQcKEK7KJAqZph71G94ziUjSgB8vcM/dFHUMAq4UfT23FpwHP@lists.infradead.org
X-Gm-Message-State: APuU4Z/b2DYasJ6KBCSVESOIP9+DV41O5PyAZZs2PzX9PWqmEUP6nNzP
	j+RwQ1z8ciboF/0Qfa/awWfmQnQA9l4U/zOg4y56LQ5kFuQhC3zHsDdL
X-Gm-Gg: AYBFou0ECjgCLUgZjG4y32ucWuJRf2UL2Yh29UvC+Fi/hH1CYyI7nhmxXp4zjUq/s8c
	Yy3cP6DN/itAq/J8xXplKC2qDW1MZTOvFA+3DCqG+/Wrdb0LnsuN86xcSEW9Gputvokbabmg2Fy
	xNl45tduhncgr9EIC2LxPdPgcnDf/DakXpIseN8eto41PZbXyFSwBtQo1AzmnSYGkFaFEdRoM8V
	q0vNoxJoxF1oAr9aylGJk+0WHap4vV52X9xtYxMTzI19o+VTfPXISPrbvL/CoLjwRKkc/FRm0xM
	2bpk61iNPUWsrceTJL/+1FkMmauEwDNvEAHCgc2Nl3NvUx4bwTLZLsQVCHfSpC58L82dqqNUWEk
	7GobpVO21Gscr1LEVLSn+IpKuNY4HFSMavq/rYqIv5XQJVVrAWGgnTnJnJaiq6JZ/zmTS7gqI3l
	F/2oo74wG9YYHvn2g0hipuD8gByZlGTxOBe3K4kw7qYpqXV0RMrxdmNOmoiDlUz/bFJlmBTZ+Vd
	1B8JI6FbsbkCOuBohR8O12alSIq2fVqVLFdjwg2WKtSvENRRyF/MrHzXqgmP4ZTgFIMZFCHAW7c
	Zvx0Z6AZep1R2y7Yic89Yxh77wjClA==
X-Received: by 2002:a05:7022:7f13:b0:18d:5988:8d3 with SMTP id a92af1059eb24-1ad106817d8mr18115510c88.3.1793701065267;
        Tue, 03 Nov 2026 02:17:45 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:17:44 -0800 (PST)
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
Subject: [PATCH v11 05/10] arm64/vmalloc: allow arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Date: Tue,  3 Nov 2026 18:16:53 +0800
Message-Id: <20261103101658.766905-6-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021748_021672_AEEFDCBE 
X-CRM114-Status: GOOD (  14.45  )
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
blocks, reducing both PTE setup and TLB flush iterations.

Previously the function returned a single CONT_PTE_SIZE for an aligned
range, so the caller mapped one CONT_PTE block per iteration. Now, for a
CONT_PTE_SIZE-aligned range, it returns the largest CONT_PTE-aligned size
that fits within both the remaining range and the caller's max_page_shift,
so a single vmap_pte_set_huge() call installs several CONT_PTE blocks at
once.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/vmalloc.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c1b3..c29704a19e27 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,10 +23,12 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 						unsigned long end, u64 pfn,
 						unsigned int max_page_shift)
 {
+	unsigned long size;
+
 	/*
-	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
-	 * aligned in both virtual and physical space, then we can pte-map the
-	 * block using the PTE_CONT bit for more efficient use of the TLB.
+	 * If the range is at least CONT_PTE_SIZE and naturally aligned in both
+	 * virtual and physical space, return the largest CONT_PTE-aligned size
+	 * that fits, for more efficient use of the TLB.
 	 */
 	if (max_page_shift < CONT_PTE_SHIFT)
 		return PAGE_SIZE;
@@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
 		return PAGE_SIZE;
 
-	return CONT_PTE_SIZE;
+	size = min(end - addr, 1UL << max_page_shift);
+	size = round_down(size, CONT_PTE_SIZE);
+	return size;
 }
 
 #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
-- 
2.34.1


