Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340FFFF8873
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmmNYOk+NsHl9ECni3ZP17QcbrO127/DqtR017v434Y=; b=HmTHT5DHexSzn4B84tamtoZhv8
	FvLCUbJFWvskar5MH506/61sxWZSwuCsa/EuAvZZ9WdQq9QX+OTtIm5E5YhDemMAqnl+CwzdGRRyj
	Raj5WfGWhdHez8UqM5+LKFTFyx5wmYlGAyPAk0Cs2AId+kXrpobo7Sq2aNx0ONG55GhpkCsnbzYlv
	89SKvuUShp5834PC2/3eJU6d1rSDknGXC4y0dSifAMrJJD26H29mpK218/A3aYjl/4MRC5Dg8UZ+b
	yhCX/MpcCo1Uy0l7lIfvPFIr/k4AMzx3ENoDqD2pnYn+ba8uLer7o7jxTWXOtNHU6y1abYW8OeTDl
	oSYKZFHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfhr-00000001AlD-3wXu;
	Tue, 28 Apr 2026 10:30:19 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfho-00000001Agi-25Er
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:30:17 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-4411a36715dso6672885f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 03:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777372214; x=1777977014; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GmmNYOk+NsHl9ECni3ZP17QcbrO127/DqtR017v434Y=;
        b=osrziJNraSiBITho+2X4oZ4euf93vKEbiKHrCdvvLJyekrBGL+mISfAj94Tlk62UjW
         0kLZvHH2lxVHo+Ux5lqv6kanVmTXDwTM0kqco42HsSQY7bMSCrLA2i2NRTiT+9yY/q2j
         jFIxeesd4bg3XseEBXtztNlZVRctN9rTe9/GS8gyIAfh2kmMirOt9XEGABFqrDs8w/xu
         TbxTtwuNxHREgkbG+fuWH7CBZmXvm327o4212PhGKc4Yc0I/24YjifVrE6d02zM9teQ3
         6zytzGKgOeyutLyYV322S39NN1kz/VsWFGvWDA28mH2b6ye6mOM34IF8zqKvLnQg/e/n
         aJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777372214; x=1777977014;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GmmNYOk+NsHl9ECni3ZP17QcbrO127/DqtR017v434Y=;
        b=RQNKpznND6rLHDO+XIk7TegTQkC/a9ARhk3+N37TTMb6xEAMJilFvjjcug9cmhO5Yz
         zV5zKJLtUlKilPR3Mp5rz/eECHTAj/qQE+7x9QUKyaxtw7ieV5ErngafKvIax+q26PGC
         5Q2zU4ZsGz2faF6fBjxGWJCZemXyfjv7LuiYQZdI6WT6slBngjQ10VegQ2Zgrn+BcWJt
         t050gnWcN2QF5D25GdjdMG6niovle0omMY8+36g+Nqizd4I0zT4SzkVGEU1Cqqb726y0
         KG7abaMbcnL5uPwfpJoeU5bawfDBVTHf8O6x3CwTTmYFmAWTjlYJt5rW3TV4BLymQYgX
         wgsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8PshF8+V0m1X432pwGGQ0Bkqy/1zeZFw8u9OZgsqejgJVSmfQEeDOivc1RFLCOVT/3xxqiMp6pb+yk4X8C8bgJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwIkGf7mnbXQ7+pKcfhMPGdjZPTWgaJU+DTyvHOWDNIYqXk7E6b
	uJhhN7rHC/X49SVUeSFc2LwfhJS0FTLWh0aqGeKPBY/khuRY+MfE0SPNu+q4Tm+C4kAvTwEPxip
	oow==
X-Received: from wrrn5.prod.google.com ([2002:adf:fe05:0:b0:439:d2b7:2393])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:26c6:b0:43f:e7c9:2402
 with SMTP id ffacd0b85a97d-4464761c29fmr4504996f8f.3.1777372213972; Tue, 28
 Apr 2026 03:30:13 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:30:04 +0100
In-Reply-To: <20260428103008.696141-1-tabba@google.com>
Mime-Version: 1.0
References: <20260428103008.696141-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428103008.696141-5-tabba@google.com>
Subject: [PATCH 4/8] KVM: arm64: Fix __deactivate_fgt macro parameter typo
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com, 
	catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_033016_542032_76DC2926 
X-CRM114-Status: GOOD (  12.55  )
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

__deactivate_fgt() declares its first parameter as "htcxt" but the body
references "hctxt". The parameter is unused; the macro silently captures
"hctxt" from the enclosing scope. Both existing callers
(__deactivate_traps_hfgxtr() and __deactivate_traps_ich_hfgxtr()) happen
to define a local "struct kvm_cpu_context *hctxt", so the macro works
by coincidence.

A future caller without an "hctxt" local in scope, or naming it
differently, would compile but bind to the wrong context. Align the
parameter name with the sibling __activate_fgt() macro.

The "vcpu" parameter remains unused in the body, kept for API symmetry
with __activate_fgt() (which uses it).

Fixes: f5a5a406b4b8 ("KVM: arm64: Propagate and handle Fine-Grained UNDEF bits")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 98b2976837b1..bf0eb5e43427 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -245,7 +245,7 @@ static inline void __activate_traps_ich_hfgxtr(struct kvm_vcpu *vcpu)
 	__activate_fgt(hctxt, vcpu, ICH_HFGITR_EL2);
 }
 
-#define __deactivate_fgt(htcxt, vcpu, reg)				\
+#define __deactivate_fgt(hctxt, vcpu, reg)				\
 	do {								\
 		write_sysreg_s(ctxt_sys_reg(hctxt, reg),		\
 			       SYS_ ## reg);				\
-- 
2.54.0.545.g6539524ca2-goog


