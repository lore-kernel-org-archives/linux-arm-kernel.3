Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0AE606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PyQENftp;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=D5nJgQSz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6F9SSG+/FeDA6bw52vBp7L6cM7wcJHblW41owDWPkN0=; b=PyQENftpSUTF3B
	vVs/cB3HQio4X0vw1tjFCj+8ENxAHRTe2bnlCdocT+AJhBjqTdgxq8KJBkZxCL722lS/KFHrRqXrm
	hfDDMyUv1PycGACWvMEDwp3NsPcqBrj7aBL++m5QR/ih1e72t8EbDESESX9vGSl+yrO39UcJrRcPV
	8YYBBfFvZZrcOZBJvzl5+sqgXStzojM7MftBS0UDlSEH4FZNWrJr09ksqgMUOck2Ogo8ZS17NWa7n
	34LM96wPo8SyoR6JDX8oMm04G1F23u5Q3aCTJ5nrUZFtZ8TeF6TSIiwzrJpZLkc29lOMOfIWGqSk9
	eAmiAOvrjpR7o9JnVFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8rj-0000000Fa1w-1wrm;
	Fri, 23 Oct 2026 06:34:59 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8rg-0000000FZy6-0Mf7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:34:57 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so448165a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792737295; x=1793342095; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6F9SSG+/FeDA6bw52vBp7L6cM7wcJHblW41owDWPkN0=;
        b=D5nJgQSzmRyuvu9TXb11KNEcjcJs2ofzYzcedCm/0tiV7HsgakO3KAbL3h05VpOxO9
         Qy5VQj6jr0NqBbLOWNJo6a6YEJx2vjGLynp+724tNyWdnacutRYKY6isV7Ud5dMRdo9U
         ebgI4WsJKSW3CcN4mjfq8nycmz80fxqqAt0eFzJjeaaQ/TZXtW/CnpKGAvuXr0pf1E2P
         Xh6ZSdsGLE6NTJ3G438Ae7G6aOvfgZHn1xkfOmma4n87tOY/pnoL4ff55HBBFHd+mvJk
         TrxYcjoj4JFo7ATuWeeJNtlNibqRad5eBJ6HWHVuld57YlCIHv5yYjoELeuIl7+C+Ocm
         sQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737295; x=1793342095;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6F9SSG+/FeDA6bw52vBp7L6cM7wcJHblW41owDWPkN0=;
        b=qDM7DU41uvE6DAADXWFCZ0rEAF5ZeiF7SWQ2h1VfH1Q67ONsvf015l5dhQBh8LDCnG
         tbvZxuIGUZckrLVKlbJOGnoxo0+h3QgeKmdLRUkL1+ZVxVP4nqsSroY3oE6oHGKj0jT8
         UpbpzBFZeV7xuFUXu8a+uz8RjKCTZbpuDUvheij3miHrZay6ZqgzCZTlPk32NXpB4K1I
         x+yidii2e8PO3UDa+ypN/fNrfqDO6R5uMlZEmDN+PCXuJ2t6ZEnpdYnIs2XFuCOyfuR4
         R8qqE8FE36Vdv7Oq08Uq66jrPI2CKXWr+7MjFE31gR+fBgzoog6wS2SonAES/lbq9gVz
         ZG8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxd/NnTtQNbPyxBn0VP6bmaIg+q0pPY2KJSsGGQcaAPLc+UMgh+AdpL384vku1lpVFXdJhA/BLxzsUYWYOtAUXk@lists.infradead.org
X-Gm-Message-State: AFq9FYKN+DX417AfcQZZrsjpOoPRMKaTzsIciNyiKw4jFPE85xpauNk8
	iOyyxQVsenswJA0NvJFRPls7F4mR4BP6FKH+fGVmQsRtiSTieImDm4PjKa5HCEn55Gw=
X-Gm-Gg: AYBFou3PBw9pp7gpl8l1JQSUJkKLgKnkFzQ3BtYEKZo3YzE24lHm2oAqezCpRESGZNx
	U+ZjneP5rDSgace2qpQbsIUlFl2mmz8u4STBbkP5LkS/R2l1Ezb6Zbpj3GU3FBsjYkiUtMQLm3Q
	0Y8eP8gYX7/lgqVDgcHFac1wiaYMI/+aPVenqVPzqQqScxaLcKlyYeopff6by+G5VOfJg0PItY1
	EP5QhGLo9QhkoeHn1fwnrrriKVShXnKKXNCRAL6AfeR3Y1jG6UWi6aKtejfcpZBWVDzs5Mcu06g
	W59rMRPsfTnW4qymcoE4+NzsY0BQn/13MuU0jv6j84/Yi/EuwDcX3Eq+KA24edTRl9zv6f/xbRb
	1SGhYaa9AJNe15KJOdy5y+8VjMKJ8o4b3xq5Q41lkUumGemDEHd9TvMzoyZMKAwjNxuG3MDYL1I
	vTEvKTmIhqnCdawPpOfqqQYyHc9CJIjR2eR1Y4LocUIqa8wtIL+tVh6IJcfVGJbJHGKpX6IG0kD
	WDvvAid/ZSZ6wM/GkR3PvdOj1eqMQsC192fFKN5mj3uPO8Dkl00KxkZjvnUOCIJ6nlTC5I0mOaa
	Kg==
X-Received: by 2002:a17:90b:5487:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3adce1737eamr1157717a91.61.1792737295119;
        Thu, 22 Oct 2026 23:34:55 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add246f308sm575202a91.0.2026.10.22.23.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:34:54 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 3/4] riscv/mm: fix missing destructor for hotplug PUD tables
Date: Fri, 23 Oct 2026 14:34:27 +0800
Message-ID: <20261023063428.3658761-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023063428.3658761-1-songmuchun@bytedance.com>
References: <20261023063428.3658761-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_233456_135624_FC0D5614 
X-CRM114-Status: GOOD (  12.10  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel
pgtable alloc") made alloc_pud_late() run the PUD page-table constructor.
However, free_pud_table() still frees non-reserved PUD tables directly
without decrementing NR_PAGETABLE.

Free PUD tables through the common free_pgtable_page() helper so that
constructor-backed tables run the matching destructor before being
freed.

Fixes: 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel pgtable alloc")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Björn Töpel <bjorn@kernel.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v3:
- Collect Reviewed-by from Björn Töpel and Kevin Brodsky

v2:
- Collect Acked-by from David Hildenbrand
---
 arch/riscv/mm/init.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index e111d25e18e1..f35fe4cda89c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1537,10 +1537,7 @@ static void __meminit free_pud_table(pud_t *pud_start, p4d_t *p4d)
 			return;
 	}
 
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		__free_pages(page, 0);
+	free_pgtable_page(page);
 	p4d_clear(p4d);
 }
 
-- 
2.54.0


