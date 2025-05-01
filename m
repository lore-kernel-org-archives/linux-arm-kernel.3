Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75DCC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 16:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AI2nSAsFsWzNJdU64PivkZrYjUoeKEX3B/t2Pe5a8FI=; b=wOB6IctCXuaXr5NqnnQYMnO//x
	DUzAKMzgJTWM+jnBy2B9ZArWV8gDNY4S6Csv/aI+ox+feipu/PwklLQSTUqZu2aESvw8byAqfzzEO
	pGlReh1j7oKppiI2QvKOVecDKaEyPsrU3AojMJrRRXnvh6CeDIJBKjzlYE7V3IJ0f+lsFEPBUROWv
	CTPhG9RLCJz+aLxq9m6AWV33Ezek+zQr+DKATUShff48/Mng6m40sH4urVcAto2KmH6umzndL96pL
	ev45iZ9ZVe8ARG7O9n+a1ldmErVZlij372NPwra5Xh4qiU/AwcCpUvyqUUOI4bzPoAupXRYnQ9usZ
	VbL9AIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWkd-0000000GBEs-0fRh;
	Thu, 01 May 2025 16:27:07 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWii-0000000GB3K-36lf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 16:25:09 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43eed325461so4853875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 09:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746116706; x=1746721506; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AI2nSAsFsWzNJdU64PivkZrYjUoeKEX3B/t2Pe5a8FI=;
        b=23xmJ4foO26ELp65joWucTkDhnpC3eg8UcoBYtRVZiaeVWAU/k1evDXfK82DwwaBXY
         25enSVbiPSi/Oea4XOUIuaQvtkR7OtcdFwiMRa4KasiAwXUFbcRFlSgGK0UVaSBIMqyj
         e/owh8EX4gVmgPAqZ7TcbbwbaxK9OkI8Jzsu9JEGyAMXr9tzqvjMGb3guOn5uyePEwpT
         EeJGQ0TyYCVVCJlKp46/NiwWk1C6PaPT8i6oGxtqPugRNnbSbzG8vMBlsCgLH0mT3yLV
         OzPs2r3zOCpgIy7WI5CE1erGpHfREigCOG6FGBUtFobg/ivQELFe2OKJXEWJ6FvZO5uL
         hitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746116706; x=1746721506;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AI2nSAsFsWzNJdU64PivkZrYjUoeKEX3B/t2Pe5a8FI=;
        b=UwV0cCMJec7hRxC0vikL+DMsCTnZQpfPoK/mxnF1a0PaTcq/gaMzgHoyLIQJ3bcoDU
         oH/ty1U5csLg1Jxcsy2ffm9pMl/a8zhky/FmtSeZjfHhRQusRmY/hKz7micVumKGiQeH
         3INEKJJ/rFodknwpYIAQSZuC/6wQ31cMcAJhOGkvC7FtbM/JEW09hELCynERPZXE1qRJ
         6zHOA97YjaupmVTZDCQLE9L0Ut+9ojO/ztWZTvjHUQzmkCHhl5cJyWswGyqn+Zhu028S
         JOo8iFoFzZmh9pFbC8iW8WwqHW+BcMRC5HemO7NfWG0CFTj+Z/5HEkojtl/0erQASY8H
         zs/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzDE7qIZlpEAiCiT8vy6Z16l79u5dVCLK5noRpPTS6arrqJQAYAoKwF6kad41sZqb9BRS/xg/JF/ghBV3jcpQk@lists.infradead.org
X-Gm-Message-State: AOJu0YxtfQAGWcVw3kZj8iYFTjCU7gGgbOokOINnMD6Q01G5Lk4OBMag
	1df3PvUz20MlAfNeinpEci4Y+/cfHpUlvtXKZ+36wTvkzfoM5iNUalvlDZZNaq0OsoY3QoUQPKc
	w9u5Bntb+mQ==
X-Google-Smtp-Source: AGHT+IHsbGCA8+vwhzRHIxkKrjDFt5m58pGdLfYxuW4Tr9qxaJAYAoo9b65Uo8DyDirAhoDJRbJuBViIBI68MA==
X-Received: from wmbjg12.prod.google.com ([2002:a05:600c:a00c:b0:43c:eaf6:525e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b03:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-441b2696c9fmr76954205e9.31.1746116705959;
 Thu, 01 May 2025 09:25:05 -0700 (PDT)
Date: Thu,  1 May 2025 16:24:50 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501162450.2784043-1-smostafa@google.com>
Subject: [PATCH] KVM: arm64: Fix memory check in host_stage2_set_owner_locked()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_092508_805351_A0EAE52F 
X-CRM114-Status: GOOD (  13.12  )
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

I found this simple bug while preparing some patches for pKVM.
AFAICT, it should be harmless (besides crashing the kernel if it
was misbehaving)

Fixes: e94a7dea2972 ("KVM: arm64: Move host page ownership tracking to the hyp vmemmap")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 2a5284f749b4..e80f3ebd3e2a 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -503,7 +503,7 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
 {
 	int ret;
 
-	if (!addr_is_memory(addr))
+	if (!range_is_memory(addr, addr + size))
 		return -EPERM;
 
 	ret = host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt,
-- 
2.49.0.906.g1f30a19c02-goog


