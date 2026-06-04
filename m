Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B0CCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 11:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E754gsHGdqu9cYnGBXFWaqxUdZJy8hipJqDVrahb1e4=; b=NIJk2Yg9TyATMGJP6FRv+r48cQ
	i4HLQpbmNJZV04MTuJv4+2LvUvVzvwHxzgTXHo0DrNnSYJ9pvsDK8Nq+UovqfnQF9E7tqIsJOc/jU
	L50UFMIuWqdX1C6PZ+xkUnTuztzUtWl1Vrek0vA7BV33dtjFb2xZKpWqM9wUXK5iMBKZjKBSsq3/8
	xhDrW/FVqi5rkQmlRhTdQXMVkQOmkITBV/+Ad6OyX7QpmyeHdaDtidbSFuD3hnbvCWKnSFFW1Ro/P
	zu1jxE2UtGRikyWzhhhPyQIMQbOk61dID0G+TE+karrX04kp1EHm805HKgPvQyGcmIuunqdldh0aA
	OLblTVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV65h-0000000Gcz7-1IQr;
	Thu, 04 Jun 2026 11:18:25 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV65e-0000000GcyP-0WPh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 11:18:23 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c8589498839so255143a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 04:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780571901; x=1781176701; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E754gsHGdqu9cYnGBXFWaqxUdZJy8hipJqDVrahb1e4=;
        b=RkRR9VFgOsDb5YavSiKGIRihxOI9vS0KIjuZtxzA8uwRn0tv313/cc4Pyi/cM3hJyD
         BULm6ZCaWWP9XZukMeskRBB3ckyvDBklvnsNghzfVuRQYNh3+L6gwsv6rCbulDUXOTcq
         Mci3HaM0Mc43TYymNBDTcsRLxombkECyFm7QuBCZg2fB21hOG7IfB3DVqdHFwNuiVYP7
         KSlXqF/vOWDdVNsGyXh2798z8Nr0A+xQvY+higEsl8Jp/f5AAw6CgsVSDbpcTKrecECN
         oZp3QdOlh3Rn38P2Q5xKuLpiWfzdUrqSyNf0xXebGd55Lt7h6l0tc6h91MTD1z/pPMq9
         vWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780571901; x=1781176701;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E754gsHGdqu9cYnGBXFWaqxUdZJy8hipJqDVrahb1e4=;
        b=S8JEvNEExdIGsP1H+EI/TPwWM9tE20Q7ROtaEN9Q+hKXQ+Q7vxsqoQ5gcJssd1BpvP
         raC1CZE5YXoaXzjqroimyeg+DBEyQf7FCV066UxZKOvB1qKIGHWh5K3WkwR4XgntncVr
         rU6ntFkfaQVL9f5yGcIojdGMG828e9e+w3v87BJhaIeufTVF69/4eI2WZwolhRR2gb3S
         5ynObB81Sv5PIcXrBkmazO7owfrEL6jemKmGRWZqW6rgAF7KwiaTlaPodhehbHrw7yIB
         194rPciowDCj8nqV8p6ltwwbJ+hUixqiPYm59NIJRP4W/cg7Hn7g6SzUC6gUGRPigxk1
         IwaA==
X-Gm-Message-State: AOJu0YyaZXp6QBcPSwNA9d1x6Ojtb2PPATpcfX7YoEAq8kdbNOrosUOr
	2dodQDqpt4/sFgukmL949Zaemeb07lDJ6OF7kchrHdP3AyhydMlrrako3lQzdg==
X-Gm-Gg: Acq92OGq4JZKV5AXtJ7Zi2xz2L3lLDTSWxcFapzGOPXIz1H3SY22E9NthHn1VBsBi0j
	l+svZ8chPbJ+YKAKpp/R/9j1mnHcLVHRtQctafW1wO55oBTOmGa93794/2WWYdZCauKRHNZ5nmE
	zdxbxTNze/E6JwAK0FPbw/GN447yh0wXrH7kUt9rbtosA/4WVRR+jVHd52DqXauZBExi+qLRRSh
	CCShVpSF3zRwRekj2SmgZcYfT+uMd01cSkrVb138rtMuV6WZyFijx0XPOkr2AxawGC5LGLEzjyp
	YQMJ/XrKMlccZU7oGXc6pokBbfJ3lnFagHuC1marZH5zbduvuyUNzDekCvc81Zr1XHdHiQzD2P1
	8JdyoFxQ4zDKV5UUmYJy6k1HNhGmyETdDQwx0+tchZeJhYgrtWOXjKyOWBR1VZdImn0tmepqrjt
	Z5h7iuJYvJVxn2XCOh/MqAe1SlCzRK0VDCG02iHTbwmFDNOAlBAQd/yQ==
X-Received: by 2002:a05:6a00:3e12:b0:842:672e:7b5d with SMTP id d2e1a72fcca58-84284e32751mr7351126b3a.17.1780571900576;
        Thu, 04 Jun 2026 04:18:20 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fa877sm5963698b3a.51.2026.06.04.04.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 04:18:20 -0700 (PDT)
Date: Thu, 4 Jun 2026 20:18:16 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: [PATCH] KVM: arm64: Sanitise host vCPU fields in flush_hyp_vcpu()
Message-ID: <aiFe-CXo-XVTFz1g@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_041822_192691_39798B6E 
X-CRM114-Status: GOOD (  13.67  )
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

flush_hyp_vcpu() copies the host vCPU context and vGIC state into the
hyp's private vCPU on every run. ctxt_to_vcpu() expects a guest context
to have a NULL __hyp_running_vcpu, which is only ever set on the host
context, so that it resolves the vCPU via container_of(). The vGIC list
register save and restore expect used_lrs to stay within the number of
implemented list registers. While this is generally the case,
flush_hyp_vcpu() copies both fields verbatim from the host vCPU and
enforces neither expectation.

Fix by clearing __hyp_running_vcpu and clamping used_lrs after the copy.

Fixes: be66e67f1750 ("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()")
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 06db299c37a89..ef9318ff0c25e 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -7,6 +7,7 @@
 #include <hyp/adjust_pc.h>
 #include <hyp/switch.h>
 
+#include <asm/arch_gicv3.h>
 #include <asm/pgtable-types.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_emulate.h>
@@ -128,6 +129,9 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	hyp_vcpu->vcpu.arch.ctxt	= host_vcpu->arch.ctxt;
 
+	/* A guest context must keep a NULL __hyp_running_vcpu. */
+	hyp_vcpu->vcpu.arch.ctxt.__hyp_running_vcpu = NULL;
+
 	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
 	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
 	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
@@ -139,6 +143,13 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3 = host_vcpu->arch.vgic_cpu.vgic_v3;
 
+	/* Bound the host-provided used_lrs by the implemented list registers. */
+	if (static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))
+		hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs =
+			min_t(unsigned int,
+			      hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs,
+			      (read_gicreg(ICH_VTR_EL2) & 0xf) + 1);
+
 	hyp_vcpu->vcpu.arch.pid = host_vcpu->arch.pid;
 }
 
-- 
2.43.0


