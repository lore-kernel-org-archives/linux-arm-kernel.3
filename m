Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F2ECD98F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqX7MefVbPP0W7Hi9ByJyRvIz6FhPEE0my94/je5OUw=; b=Um0OeDp+wrhRjZqcsazzL6jyq8
	LUNa8XL4Rz/vasvbTMHaRwtc0tbWRapdqlFghBTMKKziUhbOlPFHqqfrTo5ggZCqtKM0wU9Ni618r
	lWXewtylk8yGjE6avunQO4sY0Di+RQjhhek43MErmAEI2h2iTWN3Xk/gQhHPAuaqpRppknWBWr/Io
	kWuKM7y6j/qpoQGf1efUQWBCK7n4aYt5vAmzzMoYCs2k6qG5jeOlfdiwAwl24uG8fES2jICUlnV6c
	pEXsK1nae2EOyzfWPcoceFHiNQOaHIt+z2pb4wQgSIWMyGrOaN009mLcGBrcQlzQT9YgDC/3DBsWy
	vlCTK7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBfy-00000001F1b-169n;
	Thu, 18 Jun 2026 12:16:54 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBfu-00000001Eya-0svJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 12:16:51 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-45efb6e60e4so961352f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 05:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781785007; x=1782389807; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rqX7MefVbPP0W7Hi9ByJyRvIz6FhPEE0my94/je5OUw=;
        b=kc4dYCeK6xpjH1rxx/Zej6M6st3otEU9fpvI/iBao6RGNXq5F9HiY1QmwbanT563X4
         lGdkUzHHYNTGKZSGdc3ow5LvnUw7wzs7Rq1b9ETtmYIbpDBmU/pNINwQcOR+vXkP7fWf
         C9Kr856iq3hCL/9kTZ4ZD1EPjZJsYsH+yNv6hD54Ue3ceEaQ7o+PmPmjNz64dUVvhdLZ
         ce5ow5fltBPGhTs5LRZlb33jvzcFIgjWouihmnT225qw8N2F2runkGkhibBGSYaV198c
         yNSdKWwwSnbxXKz3847GB9vxoCC26xLhZE3AakFI1OqMjXuOTJhbeAROB9I41wgZ402E
         5J4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785007; x=1782389807;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqX7MefVbPP0W7Hi9ByJyRvIz6FhPEE0my94/je5OUw=;
        b=HaW+oYZqulEULzDeZUPxcndGRiLajiFicrFdNDecTgXaAxmNmvc5ePZuMu7Wz92rHV
         5QvUIgr1yyfRBu+2oSU0opVOeqMAvrfGqDnBn7aZzb+VU9GbJQVgdbETWnluY2priA5U
         6lr/j73VdbnUxwEUe1BS+LiuML7FrvoCaSWmsUYBkNPFFxyonQ2f7xs3/dQkwOsdA92E
         xgzDTIyjRWZwz83j0LQaygzUIbpYFDFIGmhggB1axh38RJ4Kgm2Pvpoi7xr5Hsn9bkew
         n+eq9HL/SFb/r4gOPUg4aXRyzkM2TkP9Zgs6EZkv6R0ACLr4lgXjBS6A1tJ/L3XqMYdM
         k5gw==
X-Forwarded-Encrypted: i=1; AFNElJ/YmnU7QjqucyTLea1IFAFWCfs6UWt58lp2jPS5v6M5TIwRFo00qDi5+eFY7uY7Pmd45Ng+zW6YHfeqw/ZIj2Wl@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrlz6AZFDz1P5FW4GtKbZF4paiSixavVxH6GjGR6soC2ySLn/J
	YPZ3DZ40SZ95JqPUMirAYb/+3s5AnnUN4w2MfQTFVWmM+MA/dhLWHN7sHpFD6LLZ0uzaYNErbso
	Ibw==
X-Received: from wrvz3.prod.google.com ([2002:a5d:6543:0:b0:463:7bed:40ab])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5390:0:b0:45e:eec6:5020
 with SMTP id ffacd0b85a97d-463ae25709dmr3971523f8f.38.1781785006903; Thu, 18
 Jun 2026 05:16:46 -0700 (PDT)
Date: Thu, 18 Jun 2026 13:16:38 +0100
In-Reply-To: <20260618121643.4105064-1-tabba@google.com>
Mime-Version: 1.0
References: <20260618121643.4105064-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
Message-ID: <20260618121643.4105064-3-tabba@google.com>
Subject: [PATCH v2 2/7] KVM: arm64: Unconditionally set IL for injected
 undefined exceptions
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_051650_258015_C5C97685 
X-CRM114-Status: GOOD (  11.89  )
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

inject_undef64() derives IL from the triggering trap's instruction
length (kvm_vcpu_trap_il_is32bit()), but the IL of the injected
exception is fixed by its EC, not by the triggering instruction. The
architecture mandates IL=1 for EC=0 (Unknown) unconditionally, so the
conditional is wrong. The undef-injection paths are not reached from
16-bit instructions, so there is no functional change today, but the
logic should not rely on that.

Set ESR_ELx_IL unconditionally.

Fixes: aa8eff9bfbd5 ("arm64: KVM: fault injection into a guest")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/inject_fault.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index 89982bd3345f..9dfae1bcdf99 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -170,14 +170,7 @@ void kvm_inject_sync(struct kvm_vcpu *vcpu, u64 esr)
 
 static void inject_undef64(struct kvm_vcpu *vcpu)
 {
-	u64 esr = (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT);
-
-	/*
-	 * Build an unknown exception, depending on the instruction
-	 * set.
-	 */
-	if (kvm_vcpu_trap_il_is32bit(vcpu))
-		esr |= ESR_ELx_IL;
+	u64 esr = (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT) | ESR_ELx_IL;
 
 	kvm_inject_sync(vcpu, esr);
 }
-- 
2.54.0.1189.g8c84645362-goog


