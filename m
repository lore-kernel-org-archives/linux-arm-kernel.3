Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8F7CD98D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUEfSSWjUxPUEBOeVgJgGyeprvmKo0fkBhbWmKqUI0k=; b=g5W7o95zHxgKre2ZiNCH301MLC
	wGhWq3p5VGUXW9H+7xRpEM9CmS+J50MPBzAbvtZXCdJdDko/krT4NhtDjuC68Gaq8N75zSCpRUvli
	t3V+mEWIuMOB4rMnGmPLPmlQVoCFQNSxJS+BJ3AJgD6Hh7pCFmFvGvfWaqEwWoeRuLIBO6CeZuxm1
	NnkdH7Xv5GUNtFTEBuv6xve+dNYJSdO78p8CMDpbvDnL36D/azbDxpAsvc6G/uoM996K2uldyLFo0
	4FwGNMkKRyyFub6di8//iV3E8/WvA8RGWaZIZt4WeiON3GvXGezwnAgJ7Fm00TIyhW0Am1yRvvqBU
	2gtjnGzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmN-0000000DAka-1VPU;
	Sun, 14 Jun 2026 16:33:47 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmJ-0000000DAho-3BYx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 16:33:44 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-bebbba3c343so154656466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 09:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781454821; x=1782059621; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pUEfSSWjUxPUEBOeVgJgGyeprvmKo0fkBhbWmKqUI0k=;
        b=pGGPAJO4FXpDY2qDIgapWC1bWLFgLTMj7YDUEh9KcrYTgiR7hovfql2ibTMTVIa3J5
         WTgNaN4Mxul/DwafTkTECQqOefYlKv0hsx1ou5cCycuoZ4DJ+On4hPRWCZYWK00O39Su
         GErLaiX1SiN4jWF+Azeewvsff1k9mWSqPQ3JxtwXGGke6AmizYjn9q5Z7VN7iB22p2ZZ
         tCtUyi06/tpqCWF0dDrobXX3rbCAT64t14kQwyCRQjpYWilc6cZncz5vvJQeLk/CCWI9
         nrneuD/P6szdrJIQIQnUTowNo9PV11+SJ+orzTRGj9KH4rVjlTm9CzYeoP8OfXqD28cQ
         NT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781454821; x=1782059621;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pUEfSSWjUxPUEBOeVgJgGyeprvmKo0fkBhbWmKqUI0k=;
        b=BGEdzti2YxHSkwKFRp2OCW54xZuIX64fGXe5oEGDp8O89t4fOSwQGdCyDdGJFx5CYW
         BMV/G56SIYydfcsiavrtSde33zmTC7aWBEjBqNksoDlhYdjfSOaEp//mEP9pD8HgRTya
         44J/D8qydfOXclM24lk1Feu6BhFfbU+hBS34RGuC9jaS3X+g5ewVbqCPLhX9v8cN5MaA
         jeFU6vz2/RqsPCxzEY8HSHexJLtCmAjzsDu1ur8UxNM0LUrLJO+J0YJSPhLXfmVX0rCi
         wiqROHs6xoHXRSUgFcISpby0qkEiii7ykJ9quq1vv5i/RHTclBefZWGe78LxDjmSuGoI
         SOyg==
X-Forwarded-Encrypted: i=1; AFNElJ8PK4qYR0JJByqZ/naBmWTgIKqR4Foe7s/tnfqVqI6/3wKbqPhQVMfgyifBvyofZplpBFfVE4wI/kAH3eD7EXRI@lists.infradead.org
X-Gm-Message-State: AOJu0YwwPsqccnNIj2M5C2xCH72ZZYvo4k1H3UPkqypY/+Kvey26+SaB
	+Q0A1pTq0hfkHqeqWp4a1pRrIlmkwjgADCqjUy0hUurr2fA86rgUpQgNpGG/HRkwky8c00/9v3r
	HVA==
X-Received: from edl15-n1.prod.google.com ([2002:a05:6402:424f:10b0:67b:f7e5:4f5f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7ba2:b0:bee:9809:3ccd
 with SMTP id a640c23a62f3a-bff499220e7mr377106666b.4.1781454820693; Sun, 14
 Jun 2026 09:33:40 -0700 (PDT)
Date: Sun, 14 Jun 2026 17:33:32 +0100
In-Reply-To: <20260614163336.3490925-1-tabba@google.com>
Mime-Version: 1.0
References: <20260614163336.3490925-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260614163336.3490925-4-tabba@google.com>
Subject: [PATCH 3/7] KVM: arm64: Unconditionally set IL for injected abort exceptions
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
X-CRM114-CacheID: sfid-20260614_093343_803016_66605300 
X-CRM114-Status: GOOD (  11.44  )
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

inject_abt64() derives IL from the triggering trap's instruction length
(kvm_vcpu_trap_il_is32bit()), but the IL of the injected abort is fixed
by its EC, not by the triggering instruction. The architecture mandates
IL=1 for Instruction Aborts unconditionally and for Data Aborts with
ISV=0, and this function never sets ISV (the FSC is always EXTABT or
SEA_TTW). For a 16-bit T32 trap (a 32-bit EL0 task under an AArch64 EL1
guest) the trap has IL=0, so the abort is injected with the wrong IL.

Set ESR_ELx_IL unconditionally.

Fixes: aa8eff9bfbd5 ("arm64: KVM: fault injection into a guest")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/inject_fault.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index 9dfae1bcdf99..444d219b0217 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -138,11 +138,10 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 		pend_sync_exception(vcpu);
 
 	/*
-	 * Build an {i,d}abort, depending on the level and the
-	 * instruction set. Report an external synchronous abort.
+	 * Build an {i,d}abort, depending on the level.
+	 * Report an external synchronous abort.
 	 */
-	if (kvm_vcpu_trap_il_is32bit(vcpu))
-		esr |= ESR_ELx_IL;
+	esr |= ESR_ELx_IL;
 
 	/*
 	 * Here, the guest runs in AArch64 mode when in EL1. If we get
-- 
2.54.0.1136.gdb2ca164c4-goog


