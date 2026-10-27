Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A191606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VhJ8aGdp;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=denzTsfU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kx3une51RST/V2RY3+/klMLxji5UgJfr3Zk+LcFLoTs=; b=VhJ8aGdpY/iUQhwdDg9T2wIKlc
	FwDptgTo731Xo91Z1JUqpiQkA8DwegvwFyuK/KxgfCWfLiNK3vghPKDnC2QIaMS+nRU1rOczpP71Q
	Ncsa7AFj3WZWFj33suRCEeSeuKKPd9f9//xLoC6H2k/+1AK8+hzTuvxQHThlekqHSLRxSssBDniTo
	gwz4G8LC9F64BOgrjYvxAqIbXKaX3ghauaOjabDh0GKpq/7abJDCvadHS3W+QdCjQJsY2sy0moEPo
	raYK+16fk+Jo4vWRIx61x339xqumSHQYMXR618Pmp6nP6FlHFu0oXukWqBu9aDkDsLMCJIkDS6x86
	+0dlY1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLe10-00000004F5l-1bKG;
	Tue, 27 Oct 2026 10:02:46 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLe0x-00000004F4T-3V8V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 10:02:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e942864693so20658095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 03:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793095362; x=1793700162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kx3une51RST/V2RY3+/klMLxji5UgJfr3Zk+LcFLoTs=;
        b=denzTsfU6uygF1AgYUWl8sbXjGr1xbPDPsXLOd8GsrNVA7cgB8WtcjnGBU5E5ajB7u
         CfcrOVJsOjIAQ20QfUj3noH0LKWj5hNvvLSC15VolMu5nLCRpi6WCE7H0bKkreW0o5aT
         qKsdPPr83Wj35e6HdkvpFWWPft4E77YajxE3D5W4QOnPkdflivizytVSCcy/m3ZUs4Ig
         Oqd2Ri+Zdb1z5hLss54mM8lW69HfcLm+63NX5hmuW7HkkEtZrTzaN8foXh6edlYU9jEn
         0GNa/KGQvE86gZs/cjuPP85515WJr94fs1xAnKaGNkzECBjgifeK1UqmMLC0xkDcMKh7
         H3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793095362; x=1793700162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kx3une51RST/V2RY3+/klMLxji5UgJfr3Zk+LcFLoTs=;
        b=uhwQypYqXTwQklH2p28VI4sXn0Ry25adQ/ZMDyrFaXSzUcHsy4AKvUF4DxwY/owg4k
         jdh1L0gkGXRiZFkby6k8pP16BE4/S/n0Fda4/kmYCYbLSNJt2G42aCpD3LgmTSLS2O4Z
         Ao4SOVUal5RBGgvFfaV/1wpGei0ERGJer3QhDSLIyB8XEP6AgEhHtxtZ3aGoG9Hozl6s
         K+D/0HTCjwG7EZVHTwBBJJiOzy9VDtF03s3DlbCiCC4Wcgr5XGP68lAcx8n5db26oz4d
         sPo1GmGXEjNDUWqYQQP2G24O9pWVtXk5nAK+Yzu0FwRYeyGOFbNgjUskVIE0dv3QkmDy
         vShA==
X-Forwarded-Encrypted: i=1; AKwUvBzHfc/FXGN4x6iTRS5j9HKNx1xMwVRZ0LJc73VXzYIhIUSTwXPBxwBlT87T5o/m8bz13YMSzqwQ/8InEer2C81m@lists.infradead.org
X-Gm-Message-State: AFq9FYLdwOKnjCk6F72RlvogFuSNVjpvNe2Yzyxk64RWTmT62Q743g1v
	tDP9RgHW8Bzno6k+YLFU7CT5JwQPHId41tl+BQlelfHGLglljO7htMfe
X-Gm-Gg: AYBFou2nAqzY4v/UmeVjs5lmz5eMEhuFl4yxvyjQrWQtj9LWPb/aIusK87TxneB0plR
	eBZgmMFBps+aTzMRNsVHo5O9NB39VY3tNhUido+B+qSes6ZP3WrIm/aQXtBQzwiUviXnmmj/4O5
	eKwsOpFn1/hQ4fGA7/6Hy90XtExX2GaFupdGFnyyfU3Zzi6C/MZD0FSdXg7XYSMvnaCkOXj6dAU
	5dLWVI9GsmAsRvwOeIFvIo7PzmqW2fp2SQJavIO8wzUIFdFvDXk31nXpr7B/iz5kJxKnPNxNKg/
	CE5c0MtB/vFzKzIhgWGn3fPhRQ7czYkaE1ooyHa9BYbiOdO6+UaJ+W455D1vcjo5skGbDwFYVIH
	wfrpD1EIhSaaJ9Yte+XRTeQYZYKbDrHjKigpl94Bz4l0ggGdEWWv+ig/GOHJrrrVZT4ClxGUSsi
	FhzafNaoI40+AQHHUD2z3yfkKl+gbm36ERmRc96UU/j8rmCJhEwNSJSrRmC2zjpoNbE3BdRhFSZ
	NwkN9Rdx7JvWTevQ4TC95DxmeRp9NwiQw6FOc1I4fPSh8qKJcZlw2oXLyrZHM9TwS286ccJ1csK
	kBreibrtNvjaKQuFd3ECaJyNqYVeDtg=
X-Received: by 2002:a17:902:e5c3:b0:2e5:d33a:88da with SMTP id d9443c01a7336-2ea9c68c6fdmr88394985ad.16.1793095362449;
        Tue, 27 Oct 2026 03:02:42 -0700 (PDT)
Received: from localhost ([47.88.78.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae64564b5sm7074135ad.5.2026.10.27.03.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:02:41 -0700 (PDT)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <jiangshan.ljs@antgroup.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Thomas Huth <thuth@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: mm: Stop using the previous ASID for init_mm
Date: Tue, 27 Oct 2026 18:02:27 +0800
Message-Id: <20261027100231.31184-1-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_030243_890058_D674D991 
X-CRM114-Status: GOOD (  14.17  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Lai Jiangshan <jiangshan.ljs@antgroup.com>

Switching to init_mm should prevent further accesses through the
previous address space's translations.

Commit e53f21bce4d3 ("arm64: Use the reserved TTBR0 if context switching
to the init_mm") avoided installing init_mm.pgd as a user page table.
At the time, the ASID was held in TTBR0, so installing the reserved
TTBR0 also switched to ASID 0.

Since commit 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1"),
installing the reserved TTBR0 no longer changes the active ASID.
Consequently, switching to init_mm leaves the CPU using the previous
address space's ASID. An empty page table does not prevent TLB hits
for that ASID.

This can retain access beyond the lifetime of the backing pages.
During fullmm teardown, user data pages can be freed before their
cached translations are invalidated. If those pages are subsequently
reused for kernel data, an erroneous uaccess that hits a surviving
translation can read or corrupt that data instead of faulting.

Fixes: 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1")
Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>

diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 803b68758152..7e56099c5fbb 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -235,15 +235,6 @@ enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
 
 static inline void __switch_mm(struct mm_struct *next)
 {
-	/*
-	 * init_mm.pgd does not contain any user mappings and it is always
-	 * active for kernel addresses in TTBR1. Just set the reserved TTBR0.
-	 */
-	if (next == &init_mm) {
-		cpu_set_reserved_ttbr0();
-		return;
-	}
-
 	check_and_switch_context(next);
 }
 
diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 0f4a28b87469..a96ebe904dd7 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -218,6 +218,16 @@ void check_and_switch_context(struct mm_struct *mm)
 	unsigned int cpu;
 	u64 asid, old_active_asid;
 
+	/*
+	 * init_mm.pgd contains kernel mappings, so use the reserved page
+	 * tables for TTBR0 and switch TTBR1 to ASID 0. Leave active_asids
+	 * unchanged to preserve the ASID rollover bookkeeping.
+	 */
+	if (mm == &init_mm) {
+		cpu_do_switch_mm(__pa_symbol(reserved_pg_dir), mm);
+		return;
+	}
+
 	if (system_supports_cnp())
 		cpu_set_reserved_ttbr0();
 
-- 
2.39.5 (Apple Git-154)


