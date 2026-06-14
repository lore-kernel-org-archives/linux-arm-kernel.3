Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC85CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 16:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1TuWrlseib9lZt4HAdFooYmABBxqslHnBMn4+TnN7o=; b=IQkoOVKGhW2cu3U1isU6tVKLl2
	vzKefAE5SsgXzqP5Wz1NG3ExdRKvVyJHxkqtKVwDe3LE2b3Wd6p5T9INTCOw+JUJOnVzAXKLm54QK
	nc2Sq91w8xcEaWje3c8sUntojEkKIfFQ6guPZC2+VWTCU4xe+fgVTm6FBFOP2j6PBkin8tfxa46Cv
	POMkr4r6Ljg546/i4oexr/Vj1kK+GwnDQ/PAt9Bim5ctDDkNB/amdhn17qJuXh664VpCOCCtLWx0S
	FQwIrhVw8IUpvJwgNA1ZfmVm9ee85eA2033e3aZfk0ZAeIqq1LSBATZ1NadSGXOHR8xJBJekdTudn
	7imr6xuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmN-0000000DAkK-10Ow;
	Sun, 14 Jun 2026 16:33:47 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmI-0000000DAhZ-1nWt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 16:33:43 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-45ef616db45so1913243f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781454820; x=1782059620; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1TuWrlseib9lZt4HAdFooYmABBxqslHnBMn4+TnN7o=;
        b=cqMD9SmcQ+s6HVhAp+WTTNrOheU5wpYk5IVv6Qs+4K5b5EQXqNp0csIFMRnglg9TWH
         zSR3kjgZrIgoVIGuu224R+02C0BFqVI+D9pQuWzdQUkJZMq0nUeWHwTdKhZ2xQSzN1wd
         a/6L5KXqcI6ogO6rf3B315De3yxSNvd4P93GGogIm+tDdjX9g8VDfFxPzhcNOTWSRDMp
         xBUZIaPk2FNvwmjBUWZlyLAkEWUVqVE9IJJ6NCFXKRdLE2Id3unbuAooTxViDGUqO/mx
         2RjHGmLAsipgDSX//u+C+d/husbTkWBDCb9n9bd+3nfg46LGzHmyrcCv5508t+VI/qII
         0btA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781454820; x=1782059620;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1TuWrlseib9lZt4HAdFooYmABBxqslHnBMn4+TnN7o=;
        b=D7dN8Lfx2PxAOwlfc2kN3Eb/dRHzi4s7eXfTTP6yPAfr6TlCoNisd7CKx8YZC/k85K
         dr5UyKfL4Xsh/leKzlnjDdXVjGRa6tUObPHKEAAlYrmjuByBl57MbsiWUEUrHk6EVzFL
         dL+8D+sfjetfHYk0jWBQxiOVP8rEvzqbAHZmx9ppzV1/MwcJX1AfhYH50JTNIiqIrJY4
         02xBFpJuPTLGaTmvzSeXSVsPKCc5QRNzqlfxFEQNHUi1FPgT297jeZy29c2o2RP5vshV
         9N8HFDQ6mexRuTknBOdbU0yDl2/G9UPmQnHWFyyWHq4dhIyW/vqINl4rT+xwOL97vire
         uePw==
X-Forwarded-Encrypted: i=1; AFNElJ/YLrncKGZ3FzSj3c3v4KbEfl8ZL1j+6aktfatBMAqQ/B7Y8Yt1g5Y5+dkEWf075aCjdHOj9Vp0gLX0adp45Jpb@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrai2Ua3C5kAtEiYBEQAwcgws0vIPSisbIQk9N4wnGT83PrnqI
	QhcWcE03WVTj28CPaqfASyZWUjxD23YQ2hvgABTS34jcHyWU9KIzoRBuwNUazrkHIN3uejtZ7X1
	Tiw==
X-Received: from wrmc12.prod.google.com ([2002:adf:e70c:0:b0:460:18fc:1a70])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:288f:b0:460:13db:4a03
 with SMTP id ffacd0b85a97d-46074a5289amr8873252f8f.7.1781454819748; Sun, 14
 Jun 2026 09:33:39 -0700 (PDT)
Date: Sun, 14 Jun 2026 17:33:31 +0100
In-Reply-To: <20260614163336.3490925-1-tabba@google.com>
Mime-Version: 1.0
References: <20260614163336.3490925-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260614163336.3490925-3-tabba@google.com>
Subject: [PATCH 2/7] KVM: arm64: Unconditionally set IL for injected undefined exceptions
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_093342_470057_102363A6 
X-CRM114-Status: GOOD (  10.63  )
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
2.54.0.1136.gdb2ca164c4-goog


