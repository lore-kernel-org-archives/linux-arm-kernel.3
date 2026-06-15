Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B356CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M73130SiNKp2+ndBAl5SeIBo8s7L0rXyQ0BMD/dcV4o=; b=Eh2St+UYtLBI4oGx5SuzpGtWI5
	xcpTLe39lsfwKa7mwToWJEBgM061yqt4Pw8GdO2XbHkitbrB1VXJ87UhuLT8NCFzZP0yN6O9rI1m4
	z+Lm3vZZwy28eNqqhcmMt3S8asWxt09tcNnXZ4mIMQKmfOk6xjDE3Q+DsYvcxXZ3YuHX8WfuAOnmG
	UGAo08CZt7h+FnqDdPhM+UgtOn1NquQuTRy3Oc73HHIVc91QaByP1q84Y56DfyirUxBsXtYYvVEmH
	QlqA9ppKT/+tgJICIuMsUmfO3eieV9LxS4zu+WBPEJe742HkpcbdBD0skkOjkbydVdqM7MuT+5wkB
	6LjqfVZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ764-0000000EGWy-13jy;
	Mon, 15 Jun 2026 13:11:24 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ761-0000000EGVZ-1Qpo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 13:11:22 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490dad70f95so34758495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781529078; x=1782133878; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M73130SiNKp2+ndBAl5SeIBo8s7L0rXyQ0BMD/dcV4o=;
        b=duOFoYGej+oLOT9L8UW/GC7pPU09+uAwNcAdjm7INHV+AcDDGBz7kahfWIydeWv9g3
         6nSpyxk5vCCcV+Kqnqs11WEjaP5Df+0qFCWaOZ4rWrki8trkQ39Mygrer5XK92imizH3
         ZXVx1dJrCECTMUAa5TeVxyhvsdiUVCRhkqgjiTYSuyWFFqC2XF3zVs4lMep4gKJ/BMN6
         7a8/dPLkjH9WGRCpT8A/k+xgoKdTJblPPQiA6UgW2wYewBtPoejnAZPkcaGbw1Y3xyAW
         MXlzMzhbUyb9L0V2EbnM4m8Nb8JGkuZx7ZQ3a+aqzLWCGTQX9B7xZNZCm0okkZEdBqw4
         K2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781529078; x=1782133878;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M73130SiNKp2+ndBAl5SeIBo8s7L0rXyQ0BMD/dcV4o=;
        b=iylDYIzrhL/V4ZP23WLuv+wH/q3iF3UaWTQzOT6EEsNEeOeLTzODynOiuiWEwr281S
         5YGO4mcztbe8caqqV7pt0TToDDuOCXW3lthI9IJ2KcuBExnEdZcp/OKuyY+Ex/an674m
         1QDopsiVYErLsuO8nkCoxAM41Z874EoiwIw6DtjR6ya3URc4oEDSJ7rIH44N/lTD5aQc
         KIgQv5c/+lL7Nla0i4QZgYXFiAWNOmiDX75fATQlbougN6MtaMf2jdjuDrw43XpCjLSq
         PBcReHAtbY+31VNG2+zZXcLt8z0t815Je11ZhPRi2sSTY1ZH0gMsH+IKxPCo0KV6fQCu
         aE2w==
X-Forwarded-Encrypted: i=1; AFNElJ9N+vnIDH0g/jg3rTGDE+F+mPC/J4F9xuk3aeWikZUBtYwj+2EoeRpQ/vOx/Er3UqbG5+MhyzBUoGJOTv3YsRCQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwbCDPNy5xF/RqOUUcrW0gEqqSh6NjoUZ/2We9+ADeadefOjqGU
	bcrSXhzoRovgU18qPDwPMp95zjhLTXt3JnMesOqhJDI2OjIxdPZgtNkoMwlShyiZ1pli8j0vSyq
	T6Q==
X-Received: from wmph20.prod.google.com ([2002:a05:600c:4994:b0:490:bd79:13cd])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b5b:b0:492:25a1:e2f9
 with SMTP id 5b1f17b1804b1-49225a1e350mr103728295e9.26.1781529077262; Mon, 15
 Jun 2026 06:11:17 -0700 (PDT)
Date: Mon, 15 Jun 2026 14:11:16 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260615131116.390977-1-tabba@google.com>
Subject: [PATCH] KVM: arm64: nv: Write ESR_EL2 for injected nested SError exceptions
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_061121_386898_963D7EE5 
X-CRM114-Status: UNSURE (   8.76  )
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

kvm_inject_el2_exception() writes ESR_EL2 for synchronous exceptions
but not for SError. enter_exception64() does not write ESR_ELx for any
exception type, so the constructed syndrome is dropped. A guest L2
hypervisor taking a nested SError observes stale ESR_EL2.

This affects both kvm_inject_nested_serror() and the EASE path in
kvm_inject_nested_sea().

Write ESR_EL2 for except_type_serror, matching except_type_sync.

Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Reported-by: sashiko <sashiko@sashiko.dev>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/emulate-nested.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 22d497554c94..c2580d40197e 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2750,6 +2750,7 @@ static void kvm_inject_el2_exception(struct kvm_vcpu *vcpu, u64 esr_el2,
 		break;
 	case except_type_serror:
 		kvm_pend_exception(vcpu, EXCEPT_AA64_EL2_SERR);
+		vcpu_write_sys_reg(vcpu, esr_el2, ESR_EL2);
 		break;
 	default:
 		WARN_ONCE(1, "Unsupported EL2 exception injection %d\n", type);
-- 
2.54.0.1136.gdb2ca164c4-goog


