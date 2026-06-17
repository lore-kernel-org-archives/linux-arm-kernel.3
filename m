Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C64CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 14:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pMZzZ6fqN5YBPOf12bGJv42Jck9RA2bQObyqdO6aFM4=; b=Gu7Ws3wTrtc0A+HjUV8d1KO595
	Bt0Gy2FA5OoE/ZvDoeH0jC4ErMVytrQIJiX1BuOKQBA+Eex616yZz8A+C2YhWmUgSTbcByiaHM9Di
	wedAelv51r+Q1h4sisJ8QziyGWidO3vbWiDZDX/LbzMi8gL71bifOlN4pcdFiG90dJCbfGqavkYnT
	5z6tKxq0kg22gxdSI3ksDwLRFNtSXKlD5Hugq2ywuuElIStqKghfiLaNvMQFOyqb1W6Rg2BD8Src2
	EogLuB+FYM1f4GGPB33dST2HxX+wx8CNb/pjCTkBZ5Q1GNfxGw7wjICszpfuWBaAWott4IkQHUX4T
	zGD7y0/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrZq-0000000HUsO-0d47;
	Wed, 17 Jun 2026 14:49:14 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrZn-0000000HUrW-3sgp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 14:49:13 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-69596925f4cso413444a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781707749; x=1782312549; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pMZzZ6fqN5YBPOf12bGJv42Jck9RA2bQObyqdO6aFM4=;
        b=ccDFajbC1F54mEjdzEHs9OJFDQBmDvTRIycXRZAiCMutA/00m/PSyNTdy3yePl+4HR
         GFSkcYHbR9KoIg5Gd5spOBtg5qzLbJykGlKKkaB7uiYR8SVk32nUGNC7bT+Z68ZjW9gl
         iqBYWgRrppviPAQX1NvSFof19zntvTye7lQVsFnc5Jh7Dqqh66PKxP/BtASaO5oRCZy1
         l1WLlNj4DDHxXa31Q187ncJPYWNmzd44shGiyhgzaID82e9DLYvnIM38yu/8Xvw1iRvZ
         hS9/raPRZGHiauvlHzPGsXD3Gl4dUvTPfyTx/U75gPi5yuHo645Bra6yLE6L7u7xFI38
         LQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707749; x=1782312549;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pMZzZ6fqN5YBPOf12bGJv42Jck9RA2bQObyqdO6aFM4=;
        b=OefJKAy445HRO2N+ROc1NBoxuNL2MQ+TZna6WDdsBXHCb3jZWlX/dvjlR9zFSqetwy
         tbqTvSoXx1tej6c+hy5qJIh14Bm1FlHcP4vknVjOwjwZjDTGpyWgaRsBnc9C8lE9kXsD
         Mv7w2ePnmlfj2pgaTO82r670USeXxMQSD77vCuOufoR2ak8lLLo4c+x76e2aG3fnc44x
         tr6QefhobdSYWiWx35JG0TGRazPgtIXN8a3qa7AricwTpmwD6KQ7WG6qxoEM4Q+mOxUH
         rtYPN2ZVSMowlbHRfeM2pvuVsLOZ82LSIpxw99WWAUheBjDBZEa3Lhuoeh5TG1cMzkg+
         yEZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MlbMZ33Qc/2k+QwpoCX2L7ZAdkHANAvaRut65eskODWfEnLeKmELUYWIaTJc9zY3EMqv7NjAyOP996H1UGS5n@lists.infradead.org
X-Gm-Message-State: AOJu0YwsDhwW0tUq6JRL54yMqlsnGdz/mDhIInz9ZZ62Lt5tgNRY1oIv
	mSzJx3NGCOmr/LYBOm5WkJvjDhwKi6tQnB4nZw2MLlGDuCgqenPl9zod8vEH0nDfCp1pUKs18ST
	FhQ==
X-Received: from edr13.prod.google.com ([2002:a05:6402:44cd:b0:68c:16ac:54aa])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:11ca:b0:68d:235a:cdaf
 with SMTP id 4fb4d7f45d1cf-695471ea956mr2493921a12.5.1781707748559; Wed, 17
 Jun 2026 07:49:08 -0700 (PDT)
Date: Wed, 17 Jun 2026 15:49:07 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260617144907.2972095-1-tabba@google.com>
Subject: [PATCH] KVM: arm64: nv: Fix PSTATE construction on illegal exception return
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jintack Lim <jintack.lim@linaro.org>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-kernel@vger.kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_074911_980791_5B771F78 
X-CRM114-Status: GOOD (  14.35  )
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

kvm_check_illegal_exception_return() sourced the flags {N,Z,C,V} and
masks {D,A,I,F} of the resulting PSTATE from the current PSTATE, but
R_VWJHB takes them from the SPSR being returned to and leaves
PSTATE.{EL,SP,nRW} (and EXLOCK when FEAT_GCS) unchanged. PAN, ALLINT
and PM were not applied at all.

Build the PSTATE by taking those fields from the SPSR while preserving
EL, SP, nRW and EXLOCK from the current PSTATE, then set IL.

Fixes: 47f3a2fc765a ("KVM: arm64: nv: Support virtual EL2 exceptions")
Suggested-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/all/86wlvxs5r0.wl-maz@kernel.org/
Signed-off-by: Fuad Tabba <tabba@google.com>
---
This is a modified version of Marc's suggested diff [1]. That diff applied
a single mask to the incoming SPSR, which also takes PSTATE.{EL,SP,nRW}
(and EXLOCK) from the SPSR. The ARM ARM leaves those fields unchanged on an
illegal exception return. This path is reached precisely because SPSR.M is
illegal (EL3, M[1]=1, AArch32, EL1 under TGE), so this version preserves
EL/SP/nRW/EXLOCK from the current PSTATE and takes only the flags, masks
and PAN/ALLINT/PM from the SPSR.

[1] https://lore.kernel.org/all/86wlvxs5r0.wl-maz@kernel.org/
---
 arch/arm64/kvm/emulate-nested.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index dba7ced74ca5..ace2b40cf875 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2738,17 +2738,30 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
 	    (spsr & PSR_MODE32_BIT) ||
 	    (vcpu_el2_tge_is_set(vcpu) && (mode == PSR_MODE_EL1t ||
 					   mode == PSR_MODE_EL1h))) {
-		/*
-		 * The guest is playing with our nerves. Preserve EL, SP,
-		 * masks, flags from the existing PSTATE, and set IL.
-		 * The HW will then generate an Illegal State Exception
-		 * immediately after ERET.
-		 */
-		spsr = *vcpu_cpsr(vcpu);
+		u64 cpsr = *vcpu_cpsr(vcpu);
+		u64 mask;
 
-		spsr &= (PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT |
-			 PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT | PSR_V_BIT |
-			 PSR_MODE_MASK | PSR_MODE32_BIT);
+		/*
+		 * On an illegal exception return, PSTATE.{EL,SP,nRW} and,
+		 * if FEAT_GCS, PSTATE.EXLOCK are unchanged, while the flags
+		 * and masks are taken from the SPSR (R_VWJHB). Set IL so the
+		 * HW generates an Illegal State Exception right after ERET.
+		 */
+		mask = PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT |
+		       PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT | PSR_V_BIT;
+
+		if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR1_EL1, PAN, IMP))
+			mask |= PSR_PAN_BIT;
+		if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, NMI, IMP))
+			mask |= ALLINT_ALLINT;
+		/* FEAT_SPE_EXC and FEAT_TRBE_EXC also gate PSTATE.PM one day... */
+		if (kvm_has_feat(vcpu->kvm, ID_AA64DFR1_EL1, EBEP, IMP))
+			mask |= BIT_ULL(32);	/* PSTATE.PM */
+
+		spsr &= mask;
+		spsr |= cpsr & (PSR_MODE_MASK | PSR_MODE32_BIT);
+		if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
+			spsr |= cpsr & BIT_ULL(34);	/* PSTATE.EXLOCK */
 		spsr |= PSR_IL_BIT;
 	}
 
-- 
2.54.0.1136.gdb2ca164c4-goog


