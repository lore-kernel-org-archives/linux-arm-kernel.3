Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8D3606B131
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bWjSa0fe;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DEAX8JQv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LyGJat/C8ooo5bLDM+7UJK/pGeUEXPhrPklQUuKrBbo=; b=bWjSa0feveYFdf
	7q4dIwm5RxsCW7lFQTDqNQuB/JHrVlKoT8fKGb90Zj64bQobjof77IinK/jmVe0RYLgW5eK+pd3bM
	2RJqkO3bK1Plp1USc8Z4BRxxa1+wod5jltMHSUYq2uzSWgFCHrmRGLBzRazq+pf7+cr4kYqb6XNOu
	IFr1MAo5jxpSSm5GPnETVPMPsreZO5jnVuRDiD6Zy4Rq54FCnXwKFgER6bddyUlb1JKE8Oz4X8mkM
	TSPqRjWSTxl1ek67vkndMNmUp22JCV42w1w6Fhw6CIlRUCiM+A0KPMW2HXkjQoTNT0IBmLC+nl7n1
	ieaWrZBAFXCWQdoLjLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBaI-00000001x83-31Bh;
	Tue, 03 Nov 2026 10:17:42 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBaF-00000001x4x-1oPH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:17:41 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-353804b591eso6960316eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 02:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701058; x=1794305858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LyGJat/C8ooo5bLDM+7UJK/pGeUEXPhrPklQUuKrBbo=;
        b=DEAX8JQv+V1WXijndT5HyLQkpx4tGmgJD2zRaDaPT/HyLRqiB28eACOKhdFM5Wb/0T
         cU9RkpWAwINdmXExwXbiTeQfP4FebkMvzZhWJICQTNagzSGLjKJreeqs4biiyhBl+f6b
         t+Z8r5GRfIIS115X7uGkeWAtPeBUHoKnztcWB/5SXNN6HQ/PnoCox5cuRA3It1QJCpTH
         PekghQwVxSDbt3pposdus6dL6mQIMM8oBWstgVLDLcuq68NYUF/4Ne0Ykep6iAovXhC8
         G55ibfuFRLKRRi0Pb2PvLCEPA5tjsjmjpKK4zbldV+HECbSsHH/dkHYjNQz7BXLNyI0j
         +SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701058; x=1794305858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LyGJat/C8ooo5bLDM+7UJK/pGeUEXPhrPklQUuKrBbo=;
        b=SxbIDdIzB2RkRckqX94zLdCKvpMUhgRmyuznBXoVcYLL5CB+pZnfn4zpgYuxwOhFnd
         0rJ4CNfBmu/zzl0OEHkjIeG06rXNcLVvqKxalWHAld9Du6SZ8HMlXZUputDDVtgd1EQl
         7QojimWCehag68Z2VmvizM3U7syaZ7pMLnkjHHAEKZVG9XUWYOoB7AQ8yFndyQEgfbuf
         mSQylP1rYWADrRsgexhSyKS2hgfRZn/btc3ZSu0YFEsN46IS9NYi+aa1+vTZtkKv4iYB
         UCW43A7JhvlQFWfKfj4Kg8QkxzvyxqWuTO3jmCjmfiT8TEvmebkAnlHXpZDkM0sNmazO
         9KMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDu4vkHEWrl7Qtyz4zPLXDmLnXuAE3uDt9X9FAKsbjiYAgDVFyioeNIWdPgZ1XmsnOtQqm7yGx8k1Nt0A6UKxL@lists.infradead.org
X-Gm-Message-State: APuU4Z9fc8ndcQUQ7i1TPGH2Vg823skvkE/RflP7LWZY23lPioC2RlFs
	r1n0hN8iGdKQgum3iey95IoEd8jz1hbcdTLleGFYDciQipNrB0G7Wfow
X-Gm-Gg: AYBFou2tPRjjWShHj7W9JV1xzZwPT4W+wxpJGWWhlXtqJDy3Y+GPMuIhA6vGST92kTh
	grv9BXRk1kMoiHYKhPUF4t8j8WOz5cbDVKFfCGPLdxCNuyQsimd01BImkUzjmQtzxuBOEC8xBan
	ELgT6bjzQblZ6m54YwGG+6hYCKAXwNr0PO7WItIW5LUVkCy6ptadXqTSyCgepogQ/JiBu19EXX9
	laTHBWX9DL1xD9eqdqS1c7H+NmO7emh/xz/hZ5h56EuUUUyP3o5SCieg3vrqVzP4/x5E/HqJieE
	vNQwHOeZTbgnjT43QvTGEDPK3DPcb82SyZ5O4AdBNa8zC7sIgXa/PagJxsQiTwa/EqWTei+8lup
	k8qm2elWUxNC1IQaBVTUSinHe6FpdcD1Nje9G4MdKvm9I9T2I78C/ELv/5Z9/i0SqkbD1iJIova
	kVRYKGyzoON8TPckVadvYSYprDnJpuv6IxwHugSgByHn+s6I/SHuZmGR7EA6WvUysiZGgisoL30
	qtM6dB5fycnMbYwJPzBG7ua48Rtah5YmoJYqn86Ade6JJHtv4mAyDN83fVyX2nCNYAo1lIsVaxd
	iV21n/43+EGBLCcoBgiFXU4FGCmeGg==
X-Received: by 2002:a05:693c:638c:10b0:369:d8e1:7bb6 with SMTP id 5a478bee46e88-36a423c2ef8mr19548958eec.25.1793701058355;
        Tue, 03 Nov 2026 02:17:38 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:17:37 -0800 (PST)
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
	ryan.roberts@arm.com
Subject: [PATCH v11 04/10] arm64/hugetlb: drop the init_mm special case in clear_flush()
Date: Tue,  3 Nov 2026 18:16:52 +0800
Message-Id: <20261103101658.766905-5-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021739_498671_131EF1AB 
X-CRM114-Status: GOOD (  11.14  )
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

clear_flush() calls flush_tlb_kernel_range() when mm is &init_mm. This
was added by commit 06fc959fcff7 ("arm64/mm: Support huge pte-mapped
pages in vmap") because vmap called set_huge_pte_at(&init_mm, ...).

Now that vmap uses vmap_pte_set_huge()/vmap_pte_clear_huge(),
mm/vmalloc.c is no longer a caller of set_huge_pte_at() on arm64. The
only remaining callers passing &init_mm are in arch/powerpc, which uses
its own implementation. Remove the dead branch.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/mm/hugetlbpage.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 8e799c1fe0aa..ce247b06fe03 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -206,10 +206,7 @@ static void clear_flush(struct mm_struct *mm,
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
 
-	if (mm == &init_mm)
-		flush_tlb_kernel_range(saddr, addr);
-	else
-		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
+	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
 }
 
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-- 
2.34.1


