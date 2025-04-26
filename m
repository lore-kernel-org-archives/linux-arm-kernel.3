Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5377C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeuyAMvXRO423hFf0Nx7OAeReSWDgeQx3J3C4Z4BnAA=; b=btzGVrqKHZr3wIfDmQSxM6vg+I
	4SkwxmezDTnUPEv8Wf32YGSKodaPHZEweo0XuJMz8FW9kwuQFo5VkOMkoPLSMjv2z3C53JBgH32TK
	tjvSASo0nhhNid1eP9miHA5ieY5no5SLOS4tZBe3YD+NOU1ZEhWaWRq54tEL3v4N6RqloCk2zkMX2
	RyZIHYxCJ5HJGPSWlIlW5qbdgbvKrao0WpdW4Mac9hZaBgqIfnPMfiWQMmIzluHLpjOsTkx16ijx4
	tUNXWn/6kzbaHiMR+waEm+1Gqlz+CPjuvU5X86JW9X6J+Sp+Yn+O0o78gtXQ6Iv3RvMBlBRyjb8rK
	ifiqqd6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8fvZ-000000027Kj-0I1a;
	Sat, 26 Apr 2025 13:50:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeb-00000001zAz-1nrk
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 26 Apr 2025 12:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KeuyAMvXRO423hFf0Nx7OAeReSWDgeQx3J3C4Z4BnAA=; b=poUxS1XpKCaZdNoY7t7iiSxcnJ
	uQucHrcpEJHmAA+YFn4zOmZUrXSQUJWk0QT2+9BoxoD8E5x0zftyUdBDpEd4eKJJEHGCTzV9kjxIh
	Nu7HJNw6eF3cj6Ptm3nrsF/Nlbow3oxlnSXfYvEPDEIBGMJ6fXBNlLe9qxylQLLr+pklMkdAvPelw
	Ri3qQNf6YjTZ+1BPH2HGm6OIO7lkUBaTNSOLc7ORXWlVSxz66Z+8Tg7bq6UZzctzvELsuXBuK9MnN
	VgWg1zd147FJlPScw1mV2wT3DMmHYNL+1mAjG23dTpOnNHW6p7NlKRE1mOsYytn4pD9w64aKDu4Xa
	Lkxs0qWQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8eeX-0000000CGHD-11zq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:29:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A93F49F8B;
	Sat, 26 Apr 2025 12:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62E4C4CEEA;
	Sat, 26 Apr 2025 12:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670543;
	bh=Yrxu6Y/ydSdeAPeOQ4wrXyN9jB2rXGVnhnFijtlMtPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qDHT28vTY0ubOCacxxGB7pKrfllP5f5mM6KNLp0IE6K8mhWlObN3ZI97A/Og0dtMh
	 RRFPxpu6ApRpiUe+8o2BTeWcFIquLk2JEU9wE2RB95M/6B5GwoHJ6asjPjEukPHhvd
	 qIRVZzo/SoB2NyMjhfgM7Z4ZetT0HGktEe3eb7e49Mm/Emhbe92JTU6bVPGmK4Zqh8
	 cmw50fcI8qql+iDNVOkJgDNOXJsfT4mcf+ejpsiWGM7+qZKvhaQxCroeyTU4pDAYTV
	 dIybMoeSerhZdoT7kgaySYtPQ/YXgkTNF19YKhYk1GVoYJeOmZmt4dUjp4pvUZxL7d
	 eTIEBzcapKdyA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeT-0092VH-VL;
	Sat, 26 Apr 2025 13:29:02 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 42/42] KVM: arm64: Handle TSB CSYNC traps
Date: Sat, 26 Apr 2025 13:28:36 +0100
Message-Id: <20250426122836.3341523-43-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_132905_653671_E7F92522 
X-CRM114-Status: GOOD (  12.90  )
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

The architecture introduces a trap for TSB CSYNC that fits in
the same EC as LS64 and PSB CSYNC. Let's deal with it in a similar
way.

It's not that we expect this to be useful any time soon anyway.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/esr.h    | 3 ++-
 arch/arm64/kvm/emulate-nested.c | 1 +
 arch/arm64/kvm/handle_exit.c    | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index ef5a14276ce15..6079e23608a23 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -182,10 +182,11 @@
 #define ESR_ELx_WFx_ISS_WFE	(UL(1) << 0)
 #define ESR_ELx_xVC_IMM_MASK	((UL(1) << 16) - 1)
 
-/* ISS definitions for LD64B/ST64B/PSBCSYNC instructions */
+/* ISS definitions for LD64B/ST64B/{T,P}SBCSYNC instructions */
 #define ESR_ELx_ISS_OTHER_ST64BV	(0)
 #define ESR_ELx_ISS_OTHER_ST64BV0	(1)
 #define ESR_ELx_ISS_OTHER_LDST64B	(2)
+#define ESR_ELx_ISS_OTHER_TSBCSYNC	(3)
 #define ESR_ELx_ISS_OTHER_PSBCSYNC	(4)
 
 #define DISR_EL1_IDS		(UL(1) << 24)
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index f7678af272bbb..96fcf78df7a79 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2041,6 +2041,7 @@ static const union trap_config non_0x18_fgt[] __initconst = {
 	FGT(HFGITR, SVC_EL1, 1),
 	FGT(HFGITR, SVC_EL0, 1),
 	FGT(HFGITR, ERET, 1),
+	FGT(HFGITR2, TSBCSYNC, 1),
 };
 
 static union trap_config get_trap_config(u32 sysreg)
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 2c07754c11a45..fc21665bc380d 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -347,6 +347,11 @@ static int handle_other(struct kvm_vcpu *vcpu)
 		if (is_l2)
 			fwd = !(hcrx & HCRX_EL2_EnALS);
 		break;
+	case ESR_ELx_ISS_OTHER_TSBCSYNC:
+		allowed = kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, TRBE_V1P1);
+		if (is_l2)
+			fwd = (__vcpu_sys_reg(vcpu, HFGITR2_EL2) & HFGITR2_EL2_TSBCSYNC);
+		break;
 	case ESR_ELx_ISS_OTHER_PSBCSYNC:
 		allowed = kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P5);
 		if (is_l2)
-- 
2.39.2


