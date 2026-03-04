Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC029EF8FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIPQsaRMySh/GQ9beSIags017EfvQfEs6fVmzxgycwo=; b=LN6f9xAG/sl0ZtlXBXy2og6FnI
	mXuM4NiKxabPrM3XCxYbKy1KqefAMHlsoDiK8RyLZkZeBD4UmNAXT8ZpCIA/9Wh8C4PAS90VE62ef
	1FUCIL0fvZtZbXgU4slA4n8UqRIEyJsbkkNMzWZXHF62qu/gEu7OrvV4twBbtf+RyUznUxggOPpZk
	kbWpMeSF3YDSiG97EtjAeOcODCtg4vTs0z2uK5R0iZt238+t40vIPFehTNB8N5whdv6+pDMCSPc6A
	9Pn/mK5xdQ13N17+vcFTJyoGl6Pvsqe/2lSS4ETth5RtweK+4FqBYiXLuNafZKn2wCm/ItL2MGAf4
	KLHnQq5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxozW-00000000416-3jnp;
	Wed, 04 Mar 2026 16:22:30 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxozT-000000003zh-47Ex
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 16:22:29 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4832c4621c2so75967145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 08:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772641346; x=1773246146; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hIPQsaRMySh/GQ9beSIags017EfvQfEs6fVmzxgycwo=;
        b=pvhIJLx1yp5pCjeij3lLpEQtW5R1t2dSqOxXdd08AjeXgyqN0Xt5kFUQ8G8wQYtnFe
         UzoQLG0LlNgkq+GCorJo89vMblCUtZtv6DmO2hMyVClLM1QwYjuv4QWcBszHLHQZEUE9
         53EbenKwXDyxdByJhX7JnqZVQ+TCMxsQ81zrosFqNGSECvqSMcT6C5M2HYET/nrZV0sm
         /cRhZBA3ySUB02N187B2JjuKuTM2wypQ5zhJ5btNuheIE8pUd6pDcYY651zeD8V4P4OJ
         aBMPgrb3prfw1okjOU0pjYtOf7b5ZMXD3Ii9WW/5N2FP1Rcsq/+F/a/+U9hbjG/Aw7nh
         Ls1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772641346; x=1773246146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hIPQsaRMySh/GQ9beSIags017EfvQfEs6fVmzxgycwo=;
        b=CLHXk3kodxYv/F0gfq17HQY6OAO/MrbEYHy63gB/AESPT9BUqbeZt+cVa3OHtr4zY0
         iUW/I3DF18Du4/knefI6ymMe7y4GbzyXJddjeqhuUfvNWEj0JIF24aa5yVbeNMkPmKCL
         BMeJ/TchpO5j2cszP+d+ZhMk9Gr8UoIYFXaeYspOfga4n963bsF/jUhGYovQLm0pXNqP
         npHfAIaIIGaqu/EXOkhjO/QYNUdeC1WHzGRomhj/SmwhdyW+9CoAHIVo9LYwE+U5t5G8
         istzfm0joYSq7Xo7y1XKh1R/LUAQtxFFgWqsmtuPflHIHvRiK89XBIY15DXbsSHfgagN
         Epfw==
X-Forwarded-Encrypted: i=1; AJvYcCVuIT/D3ENS4pbHa4212XkJJNSK4mSia+20K7PtJFxCr8h/++kVe++Nh1XU340rUJ2Wftc6B58JtHDK3fu8v8ZX@lists.infradead.org
X-Gm-Message-State: AOJu0YwyIMdnuJNdxctkzBtu5IUfKvUN0y//1w5KPJXWB1Wme2yBrHdE
	OLCywJRqgO8+HlsUKkqZkbRgXISJUMtFvTZQqTFfyIoK3OwNJiQflGOoFG4HUKmk/eMgbU4t501
	adA==
X-Received: from wrov11.prod.google.com ([2002:adf:edcb:0:b0:439:b0ed:2aee])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b8b:b0:46f:c55a:5a8d
 with SMTP id 5b1f17b1804b1-485198312a0mr43881475e9.4.1772641345799; Wed, 04
 Mar 2026 08:22:25 -0800 (PST)
Date: Wed,  4 Mar 2026 16:22:22 +0000
In-Reply-To: <20260304162222.836152-1-tabba@google.com>
Mime-Version: 1.0
References: <20260304162222.836152-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260304162222.836152-3-tabba@google.com>
Subject: [PATCH v1 2/2] KVM: arm64: Fix vma_shift staleness on nested hwpoison path
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, yangyicong@hisilicon.com, wangzhou1@hisilicon.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_082228_023760_334428D6 
X-CRM114-Status: GOOD (  12.14  )
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

When user_mem_abort() handles a nested stage-2 fault, it truncates
vma_pagesize to respect the guest's mapping size. However, the local
variable vma_shift is never updated to match this new size.

If the underlying host page turns out to be hardware poisoned,
kvm_send_hwpoison_signal() is called with the original, larger
vma_shift instead of the actual mapping size. This signals incorrect
poison boundaries to userspace and breaks hugepage memory poison
containment for nested VMs.

Update vma_shift to match the truncated vma_pagesize when operating
on behalf of a nested hypervisor.

Fixes: fd276e71d1e7 ("KVM: arm64: nv: Handle shadow stage 2 page faults")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index e1d6a4f591a9..b08240e0cab1 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1751,6 +1751,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 
 		force_pte = (max_map_size == PAGE_SIZE);
 		vma_pagesize = min_t(long, vma_pagesize, max_map_size);
+		vma_shift = force_pte ? PAGE_SHIFT : __ffs(vma_pagesize);
 	}
 
 	/*
-- 
2.53.0.473.g4a7958ca14-goog


