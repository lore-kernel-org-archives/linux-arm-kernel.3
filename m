Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1EEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zm077LWUklom1qgghNmApFcV7NaUdG/wSJAtTBhffFY=; b=ph2xlX7OpZlXeF6qs8uPa7aPHn
	jaQ9SeCiGg06Hypl0CGJyGn8XAPOZFeZDP8zY2yWQPLstLkrEHu3iU0jzQMIU1xJenfU7ZJa6PT3V
	N2wrDrxFwK3l2LxNZ6Ro6jorIx/U97vki/4UYHI4oVTa2GnT9nsyEtWDuKjHneZpbOETmVlzrAo0n
	ptRWJrxOXKscdKrVJb0j2JHS0zSb3SGkBXnhfQuE0ZOaYKVvgMFZjWl+OWlDADTgblYPYMX0tETBt
	8H1ifUCDGAnXBxJAdZRJNubsB0f7FionhpJJd8foP6sgmhkFnuOQNzcviwBco8PEu8xKwBgTSMH9O
	0lwOc0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFPY-0000000As93-2QkJ;
	Mon, 16 Dec 2024 18:01:40 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFM9-0000000AqsU-3Fuz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:58:10 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-aab954d1116so273117966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734371887; x=1734976687; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zm077LWUklom1qgghNmApFcV7NaUdG/wSJAtTBhffFY=;
        b=Wl5SyB6gd+LStevkpkr5EVhcy+OKsLfPg+hf2fbkvkCASl+opWPPu0gGqcm3QsT6lg
         pjyKy705VHlc4oNI/HXsmYHa1Ns6A8MAJOZTKZuG6RzDyrJdY1p6CJl9WwtQV6yoCYp2
         lGC28iExbl7br44783xviVvqfJMH3gFpNSzn2K9B+YN6zBW+qY75jYUeGumTOdCExooo
         rL+AIDSQ2SpmldzWTsq0yBtzJaUr8z6tdnisfsSrU0JsrUOFPTafXmDfVYEWYi5p2EEE
         RU2fIEFLE84f339N4byMyretjAE3ErRjYfwP5IXSIYZZuGNAb/W3bpJXTStnDNCNEea2
         +O8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371887; x=1734976687;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zm077LWUklom1qgghNmApFcV7NaUdG/wSJAtTBhffFY=;
        b=f9qKG+XkhquiRtRctrdXqvXxAdI0ly/wxOPs90pBHcjp1eH3yOj1JHXz6efi1UKTu+
         5eJ0YV3Z5z59Httmsbmc280udDn1syz2AViNEymZjTCyFzgMvQ4I2nBztlk1C++6W9iR
         MtmkhYMG9842mCR55QyNHCIBNNA+aXGNsySk2yQO5aLEIerdN59Ak+h+pJ8WE1UUzYdp
         nmAu3D6QWHZ+tkTn7W4RH1S4UxVVsZ3E5GHKrlRg81mDri86uKddlW8JNf7zdBDIK05y
         pYDgtcEn2q9ukcIO7PCrN/5WqwJ2o5saJxSBRcuXex27jWxihnuAdNTguvakgJNL97zk
         47ww==
X-Forwarded-Encrypted: i=1; AJvYcCUCOqMaRZzOu8fI9nKVd66zAp50NdLmfdjSAX6jV56dpwZGbIDSuBStBc/I0nveE56oYBMlYpRPOSl2iCK5tOrm@lists.infradead.org
X-Gm-Message-State: AOJu0YwVrNCIUkqaQDgsXdKjzeNjO3W2uWVxfyYKYXlqHiyIWsBxlCHp
	WkG2+whw20I22NqCOjCIP4a3GTfS00sTUy2dqay7kq9UIPUmD2bWqZLvP+1R9nOhymSHDGJjb+b
	QuCK0/Q==
X-Google-Smtp-Source: AGHT+IHQ5oA98sWMNkT9FIe7HUKG7DjxRL6Q1mhzqfn466rudnNmwiDaQ8QrHj3NSSmISVUj3n4MBHY2yXmJ
X-Received: from ejctj6.prod.google.com ([2002:a17:907:c246:b0:aab:70bc:648c])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7ba1:b0:aa6:894c:84b9
 with SMTP id a640c23a62f3a-aab7795ff77mr1374185366b.23.1734371887552; Mon, 16
 Dec 2024 09:58:07 -0800 (PST)
Date: Mon, 16 Dec 2024 17:57:46 +0000
In-Reply-To: <20241216175803.2716565-1-qperret@google.com>
Mime-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216175803.2716565-2-qperret@google.com>
Subject: [PATCH v3 01/18] KVM: arm64: Change the layout of enum pkvm_page_state
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_095809_813756_91BB1280 
X-CRM114-Status: GOOD (  11.27  )
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

The 'concrete' (a.k.a non-meta) page states are currently encoded using
software bits in PTEs. For performance reasons, the abstract
pkvm_page_state enum uses the same bits to encode these states as that
makes conversions from and to PTEs easy.

In order to prepare the ground for moving the 'concrete' state storage
to the hyp vmemmap, re-arrange the enum to use bits 0 and 1 for this
purpose.

No functional changes intended.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 0972faccc2af..8c30362af2b9 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -24,25 +24,27 @@
  */
 enum pkvm_page_state {
 	PKVM_PAGE_OWNED			= 0ULL,
-	PKVM_PAGE_SHARED_OWNED		= KVM_PGTABLE_PROT_SW0,
-	PKVM_PAGE_SHARED_BORROWED	= KVM_PGTABLE_PROT_SW1,
-	__PKVM_PAGE_RESERVED		= KVM_PGTABLE_PROT_SW0 |
-					  KVM_PGTABLE_PROT_SW1,
+	PKVM_PAGE_SHARED_OWNED		= BIT(0),
+	PKVM_PAGE_SHARED_BORROWED	= BIT(1),
+	__PKVM_PAGE_RESERVED		= BIT(0) | BIT(1),
 
 	/* Meta-states which aren't encoded directly in the PTE's SW bits */
-	PKVM_NOPAGE,
+	PKVM_NOPAGE			= BIT(2),
 };
+#define PKVM_PAGE_META_STATES_MASK	(~(BIT(0) | BIT(1)))
 
 #define PKVM_PAGE_STATE_PROT_MASK	(KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
 static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
 						 enum pkvm_page_state state)
 {
-	return (prot & ~PKVM_PAGE_STATE_PROT_MASK) | state;
+	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
+	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
+	return prot;
 }
 
 static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
 {
-	return prot & PKVM_PAGE_STATE_PROT_MASK;
+	return FIELD_GET(PKVM_PAGE_STATE_PROT_MASK, prot);
 }
 
 struct host_mmu {
-- 
2.47.1.613.gc27f4b7a9f-goog


