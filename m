Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32BC606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oP5kAXhM;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q5wd0F45
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W8pU5bTLgvDP6PnnKl35Nqm4I8JchvKzNMP0M/KHP68=; b=oP5kAXhML9L8XIbhAKaS0Yixha
	OvDKcUyCcX5VqZoHpg9ikiXZLq1nvnBPj1Z4mCUdfCSAP0iol0WhvZFLzTt+PZNVWJ6xqZxrD/wvv
	FD3O+IbualOrQiS3Xh/EKg/wehHCYiUd3rJtFIpfrpV4ww8fWob12WbRltYgJo+gkuXCbZCJrGcX5
	hVmlKt5nZXlcPnKL5M2e0GCmWSAu24rFNKh0FuYT2UvmpjhwvKsO7I859dGgT62zK6O/h6yyU6c1C
	FbVb52bIBvh585tqIAwfyKxzTEI4Fxs3QahhObix6joTJY4d58ntwiUCFFidheg48hnQ239Q6175h
	RF2ZYg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyw9-00000000Nvf-04Hn;
	Mon, 02 Nov 2026 20:47:27 +0000
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyw3-00000000NiT-1Sqz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:20 +0000
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e1291432aso2681973f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652437; x=1794257237; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8pU5bTLgvDP6PnnKl35Nqm4I8JchvKzNMP0M/KHP68=;
        b=Q5wd0F45VvMj8udzWaa6+PYI4MABqekfEswt6aSslQrijL3gWoT3AGYuJ8z6iJ7SNv
         FtwyjmA8/nX17xZ6k3InDCV88ptDtS0MHgip4flCB2F9vb1MHyZ/0YuegWOWhFSJ1KXK
         Co5abJmChlcULf638hOHneEySCVF5nNtuS7EE8MWwmwfuKxuUkxb7KIrt3BmzNBsahRD
         O4M1WCS3KewoYsIk5p2oPSPL3y+KTzYSgOHcPbwEYI4pCU9H3l2JBkn6L6xp+LWM2ULl
         +bevl723ESXm9lg1unKq83SWWmKq2NCqaKND8GJezC3m0X2qm7JGCtPn0Un+qRBsI1pd
         Hv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652437; x=1794257237;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8pU5bTLgvDP6PnnKl35Nqm4I8JchvKzNMP0M/KHP68=;
        b=UaX+P0oi/Cl7jYUOX33rMKSowE3LhNxhso76GsRAL0nLxf00zsVsoN/a40vpHoJygT
         HaYO4n0Zhi3CYipe0CRC6EtU9SCfLYRJDSUKyG6Jeecnue2kwZ6pmz+Hw7l9/u1ZKi8/
         m2mSqDtJPBlayafcfFAIFilXMhbyyIwctuj9UW4+VWOz8aGl29dbE51ojJ0KdCGaGnh+
         fjKLnc4JQyyJjCk5VqBwYHRRP16t9A6rUvlDXp4J7Ds9t1Fukfn1Fx0Ry7xR70l7ps1n
         ZE0OmotlYX0HTQpoaTnioapH0oo0gyjaFlSLzWhcUiQIn9MGsu2aVEk0J4HWMLmt6xrV
         hlHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUnXLI61eLsVWUMWFGRqXQ4hAhInBoi4R81DRbfq0DyNvK5aY0tbGUbYcE1qES2AIrZrUHI4xQzsJHhyEsvGKC@lists.infradead.org
X-Gm-Message-State: APuU4Z8z+rImPnBjRFHhXDy5XTG1elyOhDbV3Kw2j2qzbWzPtFWYowLi
	8EPlGZrV39GAsg85HNe+jMrxaFseUPtbdTx3oUnCBNG++5GloGgm11Ht2tMu/R6QSBKQNE3hmcI
	Gj8Ul4QkA1egD1gD9U/ZNHQ==
X-Received: from wrwh9.prod.google.com ([2002:a5d:4fc9:0:b0:48d:eacb:c491])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4810:b0:487:106f:ee31 with SMTP id ffacd0b85a97d-48e6e304036mr28089625f8f.27.1793652436386;
 Mon, 02 Nov 2026 12:47:16 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:19 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-15-vdonnefort@google.com>
Subject: [PATCH v3 14/23] KVM: arm64: Handle huge mappings in __pkvm_vcpu_in_poison_fault()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124719_402705_5B4D3643 
X-CRM114-Status: GOOD (  12.16  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In preparation for supporting stage-2 huge mappings for protected VMs,
allow __pkvm_vcpu_in_poison_fault() to work with PMD_SIZE mappings.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 68ed886e294e..b9b591533b30 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -994,7 +994,7 @@ int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
 	if (ret)
 		goto unlock;
 
-	if (level != KVM_PGTABLE_LAST_LEVEL) {
+	if (level < KVM_PGTABLE_LAST_LEVEL - 1) {
 		ret = -EINVAL;
 		goto unlock;
 	}
-- 
2.56.0.385.gac671c819a-goog


