Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F07D5CC8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPRGspoCFMLa/ML1zQGAdf+RPV3kEKo7CdywG6YAezg=; b=HTD6x8d20fd1ZNbqnsHKgTxcrJ
	4m3VQ4YbbjimteK6wfnlhEAkW8lT6x819MGBIU5SSnI0WCYejSVBYPsgVxRh7/vf/hfv7/l2nwn52
	UhFdtZsAJRZngv5+S+yY9JYizTNMFSWFfvC+nmlnw2ClJUQZx8hI1aPgUsjF1AnXeh1X8Qzognfwh
	ZX31qosDVdgPwfsuZO5zWasytyIvIYwiPipjBr95Jka1xq1jR2pdkfrkUMZ3k3zy7N+Fi/NhZOZ0T
	/OZLcHoEWDFp4ajFi45uCRcB7e+f1DqDd3q/dtfeID/fweM6YX76tos2d2LhagSCmMQFve7NMMpf9
	PBSZdtDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6615-0000000HZ2z-17li;
	Wed, 30 Oct 2024 10:33:31 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65mp-0000000HWb7-2lnw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:18:49 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e36cfed818so104404107b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 03:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730283526; x=1730888326; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PPRGspoCFMLa/ML1zQGAdf+RPV3kEKo7CdywG6YAezg=;
        b=HGIkOT90QgNS/8LTzsDYAmndFy3w5f4bRzUdKmyaOoIoU142npmsJGWjo+g2RMGENf
         9MG5iJEb6ML7FbDKEMFAfUagKP0jsCCepu3AqrxXQ/HHwAcFhznr1PZTWaP0F4iiUu5L
         MbAHeOyXkQaCHbxxnsjjJOqmsu5GmscXekVettLPkcBoWP9Sz+wtnyrO9db1d3Lpky+k
         wnsdZ3uU9z4EaL1Kp79G43vDK2CRCaUMJ4lMETFEVb16GTX5GBYnQQ4l5uHyWFM62E4q
         oW3VWeNBa5cPa1iokCoErR/IKFbNETSbP6c6dWXN1GjPvo+6UllI5j9iwHIBu8zWF2aq
         URDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730283526; x=1730888326;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PPRGspoCFMLa/ML1zQGAdf+RPV3kEKo7CdywG6YAezg=;
        b=jOj1ljZuG1VZxvpt4NWXNPqmR6zofn81lW4Bb8jRRH+bSuggRI9CKUDn6Wubbl3//g
         yYl+fvIvJOv6NdXIKQO9gSNn2EOB5PnCpsXqoxCLbGROWplFXLsW8WhXYhwLVvVavEif
         5XEZYxDGQIMWdnE/Rbvxkde1vbAZxkz6sLtsEGg/OOJSa2Vvu5s/vd/daFOkjKmivwNn
         5yEG578X0Lmyh/SGXMQY3NXqQ54bUnfi65TISX1Vq4YzdOp41tdKmpYDwzyHnpa5RHFY
         BMNUxYAvWV9zCCMiflxnehabrlNfXgcIcDci5zsxb87Ulfx3bih4EkvMSJ7q0Vaaju0s
         AdmQ==
X-Gm-Message-State: AOJu0YwLQoNxyyDYKa0WitpBTnBuY2TAEzYj82OYuUlUH1v8o1GlVQPn
	hLAcXm4yXA/54JwODW2YJE5YagqkLTxVN5eGe1q8eLT0ZFPM+flqHd+kKRcpUJo6yAZnQgg+YEi
	enZW3NWk8X/xEI45T4k/oc+fjt7ONmykiVqa4jztJEq2Y9M58WPB4Ri57QkFlo9N06DY1qL/2SA
	61PUXvpzenwZG5yIV5dl9vPWt+481qovyFj7cEt7Hn
X-Google-Smtp-Source: AGHT+IGuD4l1ccYFqEeRi/42ggdhN+cT+EfjhCRmyQyLIYZ8jOto7EuAD2t5GeGk27eitJwFt3iyIp5y
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:9682:b0:69b:c01:82a5 with SMTP id
 00721157ae682-6e9d8b89f8amr11429747b3.7.1730283525807; Wed, 30 Oct 2024
 03:18:45 -0700 (PDT)
Date: Wed, 30 Oct 2024 11:18:12 +0100
In-Reply-To: <20241030101803.2037606-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20241030101803.2037606-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757; i=ardb@kernel.org;
 h=from:subject; bh=GbwFno5F+PIqgoDy9QYiqnwQa9iDjNg0VPN0fHtr9z0=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV2J/bnIwZZp+slTLQy8f8f5P/x5vHqBnEsh84JFAesdK
 oVPFW7pKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNZ18zwh3uvrHbGsTnTw8Kd
 eL2fT+9I1a/sTPre9WrnoXWnT7ZMvMXI0B+71t/0riuPF8Mui5eb8/8n6fqZlytwe745kmOzbLk rEwA=
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030101803.2037606-18-ardb+git@google.com>
Subject: [RFC PATCH 8/8] arm64/mm: Account for reduced VA sizes in T0SZ and
 skip the levels
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_031847_728971_0B5E7238 
X-CRM114-Status: GOOD (  14.87  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Now that a smaller value for TASK_SIZE is used when running with a
reduced virtual address space for userland, it is guaranteed that only
the first entry of each root level page table is populated. This means
that we can reduce the number of levels of translation performed by the
MMU by programming this entry into TTBR0_EL1 directly, and updating T0SZ
accordingly.

This is a quick and dirty hack, but should reap all the benefits in
terms of MMU performance and reduced TLB pressure, at the cost of one
wasted page per process (or 2 on 52-bit VA capable hardware).

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/mmu_context.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 48b3d9553b67..99777da39228 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -57,7 +57,13 @@ void cpu_do_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm);
 
 static inline void cpu_switch_mm(pgd_t *pgd, struct mm_struct *mm)
 {
+	int advance = (vabits_actual - CONFIG_TASK_SIZE_BITS) / (PAGE_SHIFT - 3);
+
 	BUG_ON(pgd == swapper_pg_dir);
+
+	while (advance-- > 0)
+		pgd = __va(__pgd_to_phys(*pgd));
+
 	cpu_do_switch_mm(virt_to_phys(pgd),mm);
 }
 
@@ -82,7 +88,8 @@ static inline void __cpu_set_tcr_t0sz(unsigned long t0sz)
 	isb();
 }
 
-#define cpu_set_default_tcr_t0sz()	__cpu_set_tcr_t0sz(TCR_T0SZ(vabits_actual))
+#define cpu_set_default_tcr_t0sz()	__cpu_set_tcr_t0sz(TCR_T0SZ(MIN(vabits_actual, \
+									CONFIG_TASK_SIZE_BITS)))
 #define cpu_set_idmap_tcr_t0sz()	__cpu_set_tcr_t0sz(idmap_t0sz)
 
 /*
-- 
2.47.0.163.g1226f6d8fa-goog


