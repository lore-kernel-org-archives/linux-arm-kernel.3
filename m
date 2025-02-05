Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81F7C02199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 16:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SkFMuq0Fr6PdMrmkcZFlVP8qanxuPq/Z9cTQ0NPTc80=; b=bSFr7hRyLwCRZn28NJpo4ZODlB
	4B90QXz3HXwIyKMuZyHhA5s47vh9H3PF0neFH+F2WLLamu9qHmSkAinokGwOM16z6qR+rBo579Ezw
	bG/JZU1sQqXcmISsyGNaK1zK8kBOB5BwZ3kDJSk8QCPjrUfLzEDMxEnwBwCoEtznO3N1FrvMwHsPF
	1JybjYt7n2YHXMCLuvzN3oxLbWC3+aVjHF61a0wgU41zcEH3wX5ZBNNJF6pZjJTp7PDuSr30iIMmf
	PsppLJhyCnm7HXxEk1dCSeThe93r8WiTN4vcyqcKer9o9U11z3qY8UhDujuwgLptHvmrc6hqSjuUX
	EaNBXnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiZF-000000040kc-0Zd7;
	Wed, 05 Feb 2025 16:48:01 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiXq-000000040Zy-3UaF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 16:46:35 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-38bf4913669so3315598f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 08:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738773992; x=1739378792; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SkFMuq0Fr6PdMrmkcZFlVP8qanxuPq/Z9cTQ0NPTc80=;
        b=A+IFbGxUjkEGypoPvrLiOeUz7YvvOAt6p4kZkl7dSSOz6s+IGMh2tXDgUt7x+qjvhP
         2RfjmZ2APORj4uFllsatWEDjmSyn86em7Yw3I9l671+q/CZLbP7e1RK1XH2JSC0d/X8k
         CkT2cny5i+Qms5/j59ItqGqYy6ff4Ij187Km44en1tyrdPxto1/kLNs6R+jXdLvn+tyj
         SMmX5Qb0nUvIarrlAwZxf7NjoVpOwaSH7M6PcB7Wr8a2ukIFnNhYkPmepYQ03PiFFo33
         6D/t/H0chYUZ3uC+01O2/n7VgulTjmxBgUVxjUTYZHwCCIY8GuBe0W4XumfxIncw00tp
         hjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738773992; x=1739378792;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SkFMuq0Fr6PdMrmkcZFlVP8qanxuPq/Z9cTQ0NPTc80=;
        b=P1fPGSw4YuarzYII7xw/93wXYXplhrMYM4bdUqiaubkKUJjjnCnWv8+V31eS8hbrVv
         +Zp5198z67rLkdrXnD+nMnSGytsNMXZ4k/Ar26Hgv2UJm8ullKm8SSe6hpxVAxhLqiLz
         pMe2dV29wwEpONyZKq/2TE95V/EvFJGDRL70NZm+R9t3kRJiMhwmgVI3hZeeM1yH3MQB
         Xf6heFo7cGH7hOmzM/k/5XzFEAReta4OWRe5GALVP/XOfIQIhxrGl0kSiTC+zggp03yz
         Y1lJE030NyP83FnjcVJQ7km3p9XKCWJDbeelu28mX37GEg2zoRoygspRi3NgwTwBcgYD
         vn2g==
X-Forwarded-Encrypted: i=1; AJvYcCU1RVeAPXzs9h0g8f5MrTGuxSWvsVNypRV2cwbHsSeWMOhxNZvmn/vekmt0UHu6UQpJ7uxsd7lokQcQVsB7HirQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/BT3073OEoCe6MAxx56SYdhy1tdcaISIB+3sEFX5PdmxXeduX
	sMdDoFOpnAKi0PiKLaHjh6y7Y+guxBKeDLB1pP79CBup9ouYC9SQcpxi237la9zi4crxui3VJA=
	=
X-Google-Smtp-Source: AGHT+IHEm2DfODCzmjlMO/PunGzGeoD6QqXGJK0Y0QV6MCGhx0LewDD3vAI9/iXhxv3Xm7vgzyjrFKmltA==
X-Received: from wroz3.prod.google.com ([2002:adf:f1c3:0:b0:386:2cd7:597c])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:156b:b0:385:d7a7:ad60
 with SMTP id ffacd0b85a97d-38db48a9b3amr2844611f8f.3.1738773992773; Wed, 05
 Feb 2025 08:46:32 -0800 (PST)
Date: Wed,  5 Feb 2025 16:46:27 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250205164630.1706058-1-tabba@google.com>
Subject: [PATCH v1] arm64: head.S: Do not trap access to MPAMSM_EL1
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, james.morse@arm.com, jingzhangos@google.com, 
	anshuman.khandual@arm.com, shameerali.kolothum.thodi@huawei.com, 
	gshan@redhat.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_084634_872411_A6F2FBED 
X-CRM114-Status: GOOD (  14.74  )
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

Bit 50 of MPAM2_EL2, EnMPAMSM, traps access to MPAMSM_EL1 when 0,
as per ARM ARM DDI DDI0487L.a, section D24.12.3. Therefore,
ensure it is set to 1 for the host to disable the traps.

Fixes: 31ff96c38ea3 ("KVM: arm64: Fix missing traps of guest accesses to the MPAM registers")
Fixes: 23b33d1e168c ("arm64: head.S: Initialise MPAM EL2 registers and disable traps")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/el2_setup.h      | 4 +++-
 arch/arm64/include/asm/kvm_arm.h        | 3 +++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 25e162651750..fb4da155d994 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -254,8 +254,10 @@
 	mrs	x1, id_aa64pfr0_el1
 	ubfx	x0, x1, #ID_AA64PFR0_EL1_MPAM_SHIFT, #4
 	cbz	x0, .Lskip_mpam_\@		// skip if no MPAM
-	msr_s	SYS_MPAM2_EL2, xzr		// use the default partition
+	mov_q	x0, MPAM2_HOST_FLAGS
+	msr_s	SYS_MPAM2_EL2, x0		// use the default partition
 						// and disable lower traps
+						// don't trap access to MPAMSM_EL1
 	mrs_s	x0, SYS_MPAMIDR_EL1
 	tbz	x0, #MPAMIDR_EL1_HAS_HCR_SHIFT, .Lskip_mpam_\@	// skip if no MPAMHCR reg
 	msr_s	SYS_MPAMHCR_EL2, xzr		// clear TRAP_MPAMIDR_EL1 -> EL2
diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 8d94a6c0ed5c..78d46d52b3da 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -147,6 +147,9 @@
 
 #define VTCR_EL2_T0SZ(x)	TCR_T0SZ(x)
 
+/* MPAM2_EL2 for the host to ensure not to trap access to MPAMSM_EL1. */
+#define MPAM2_HOST_FLAGS	MPAM2_EL2_EnMPAMSM
+
 /*
  * We configure the Stage-2 page tables to always restrict the IPA space to be
  * 40 bits wide (T0SZ = 24).  Systems with a PARange smaller than 40 bits are
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index f838a45665f2..44b4995258e8 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -227,7 +227,7 @@ static inline void __deactivate_traps_mpam(void)
 	if (!system_supports_mpam())
 		return;
 
-	write_sysreg_s(0, SYS_MPAM2_EL2);
+	write_sysreg_s(MPAM2_HOST_FLAGS, SYS_MPAM2_EL2);
 
 	if (system_supports_mpam_hcr())
 		write_sysreg_s(MPAMHCR_HOST_FLAGS, SYS_MPAMHCR_EL2);

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1.362.g079036d154-goog


