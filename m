Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247A2D7832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUZZOxNVC1lLwStyPm7LTR4giJNaFKBwnVTKDXsGwgs=; b=4tXjHkb96l71WXR81XrB9YYkiC
	D2Y9xRoZfoHlaxhhag4YULMQ32+KohvYFQcCJVz7oP3lSrmTr2dNlzeRrbNqdccqwnZMbk8R6UR7k
	DoRYit6tPIAZ+r16Hu48AMor/rHl3fks305JDkRAh3acroNQHZssSTaZ4qQ0h7Ul7lq18FmspcOOq
	mJqoE9fMMF75HE7z7bKpaH02MoOLahtRglEiiPgr8Q/dAxb1+vQRN8WzT2VHjm6K7rvXyzgGZw9RU
	qJctWI87X7ZCTmPSyN7Lwgn3i1d+cpj1/S3Ho+H8j0pX+vf1m7fimqTAaQE8JuZcnFIhoH1GMzyCr
	OI73EDMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8tx-00000006lsh-20d7;
	Mon, 02 Dec 2024 16:03:57 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8eZ-00000006iWQ-2MXR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:48:04 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4349f32c9a6so36131695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733154482; x=1733759282; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AUZZOxNVC1lLwStyPm7LTR4giJNaFKBwnVTKDXsGwgs=;
        b=jhIqi+8Ui/xn128rjSs/GR8Sk6m6HsDCpnk5azjibpW9QrZhuZjhjFmj3gQLGX0j/J
         ZH9uqDzKS0JEHVYTAttVAs6Va7qdZ3gSblNeHHNMLRe/LJWSWEDXPcBIzLxMFOvX1mbm
         dMyfssHyMA0j08g0ms/d4Y3EVHOWVITqyxTs6feBW+NPM1zjQUijR0fof63QHmo9j4CC
         L/ui8mLF3eecr2Et1g8NjSjl4OLbGRToivpWnyl1SCOoUO9fMDea7XVTiKqOwCzaA98B
         s+yszXu4QuJZd8TlOWCBNGFHZiBUxvvm2Fb4jlByUx3zb2GLWAhdQfadCRdSsZhyycyx
         noMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154482; x=1733759282;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AUZZOxNVC1lLwStyPm7LTR4giJNaFKBwnVTKDXsGwgs=;
        b=Mkhc22dIEsbZ2AC/KuMp807eSl9yQtxuW9ual0wBUIpvGWR6+UaZszbA4KmW7/K5Ar
         sgJEgR05ecqGVKQzy5/YMROFjzgGOGZ+nUez4jV8OH8nmVH4roZiq1oF/GIcCChVqHLL
         QqP5nGdRNMr9VOX7W42Ldj3cw+xslF/GGBFjk4VBop18KP+IlJoifmCfLg7XMIDimf4e
         gQVtMbAWeyHIVAnYCjwa7Ngkytgd//YSpwW4jWYVPltXhjZ5q43+LVuXGfUYg37znmIe
         jpXg6od2tKysITwNR2Q43K6xk+mhTfzSKqfbmFiDHir4QeKKfG2aosdeA2a6rrF9tcqv
         F+vw==
X-Forwarded-Encrypted: i=1; AJvYcCWeaxlvvFComqJB3UqI8jf7Q46WtswE+GWGaX6fhaNiHHkV6X6ueXVc2s5DEig+wBYnlgDmCv3MiPGUE9ZImFyI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7L20VDoXqrPhOPQVTh/a/rdOHK6G2/7rp69tMv0GWtWzKkG2t
	D4yaAkXfly1jkb+0EpF0FBGN+gcONrE5ZKh0pwxb4N9m+cjwwpQ/HXIxQFlgPRdWoztrDW+HGg=
	=
X-Google-Smtp-Source: AGHT+IG8LYyQFRvZAn+1psKDX3FASYdfmcKZwHsSrb04cMVuPz9aKF9pw4V3JWI4Rapc9chI4XydfWhjUA==
X-Received: from wmsl21.prod.google.com ([2002:a05:600c:1d15:b0:434:9ff1:db95])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e24:b0:431:5f55:28ad
 with SMTP id 5b1f17b1804b1-434a9de5657mr193461355e9.22.1733154481889; Mon, 02
 Dec 2024 07:48:01 -0800 (PST)
Date: Mon,  2 Dec 2024 15:47:36 +0000
In-Reply-To: <20241202154742.3611749-1-tabba@google.com>
Mime-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241202154742.3611749-10-tabba@google.com>
Subject: [PATCH v4 09/14] KVM: arm64: Remove redundant setting of HCR_EL2 trap bit
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074803_593308_C7CF9B1B 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

In hVHE mode, HCR_E2H should be set for both protected and
non-protected VMs. Since commit 23c9d58cb458 ("KVM: arm64: Fix
initializing traps in protected mode"), this has been fixed, and
the setting of the flag here is redundant.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index ffa500b500f2..cede527a59d4 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -57,9 +57,6 @@ static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
 	/* No support for AArch32. */
 	val |= HCR_RW;
 
-	if (has_hvhe())
-		val |= HCR_E2H;
-
 	/*
 	 * Always trap:
 	 * - Feature id registers: to control features exposed to guests
-- 
2.47.0.338.g60cca15819-goog


