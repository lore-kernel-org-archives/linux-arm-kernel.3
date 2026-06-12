Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED5BCD98DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 06:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ak3jNeAkvp8IytqE3xP3zJXzhYP29jFMd9zBAcRoYc=; b=CIXPhue0eOJEbbaKx3qljNw2xx
	A6P+1BJZr8+EHaPuYm7c+9fvHRewSkmE/fyPHdWr7ZihCyLQ+tUKRSyDmz2u1n4q2ipGHEnE8GZDk
	ScuZFyMRFObh92/dqwg8NAh2i7XOZmkQOhkMO8wQYjf/a47X7sE/TYb55VPMM8Z2Hd9z3rgC+4fGN
	mUQitlqZCWyAPwlpPYoEg47qkKAeKxtkGDvnbAy5V0a8ZCdWCP46r2kC8pLlxBTPCgzCo/8sxEN/A
	z1cjXfml81ScWjI2EC6FrkxguuZ3/XBTz4q/W3Ukl0lvyd9HCeODMn8lx4Th/l/260IHHwdvm3wEa
	k8GGNbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrj-0000000AR5R-49fj;
	Fri, 12 Jun 2026 06:59:43 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrg-0000000AR03-0757
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 06:59:41 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-46010392f89so555513f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 23:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247577; x=1781852377; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ak3jNeAkvp8IytqE3xP3zJXzhYP29jFMd9zBAcRoYc=;
        b=jyqfTBUet+rtjbg4uGQVPWR31kZJNN36JamJ7bLMnxv4vcniOD38C59Ll/GSBVwPzU
         eSP35ya44cdn0yI5uDx3W5kORXxbAgbl2JEl6BkY4P6oOCOzsJFTbTp9ylwi6qmJHZgS
         lfccBrYSK7So66M5q0UEZ5tKFjjVtLTrrbEPxqB/J+/0YsIARXY2fPAkRKf/N0QEMW6n
         tBDvmgjBJy4ysrneY0xOUFxIXS179sZHbp6irZNxU40H6nExHq6wrZ093TUIev0NMiZN
         DUwiaqj0y0bXf13yPaqc6watwKjEqXa3YL/nmQ+9XVec6eztB8KnqfrihZDpVNtBGsv7
         z7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247577; x=1781852377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ak3jNeAkvp8IytqE3xP3zJXzhYP29jFMd9zBAcRoYc=;
        b=ON+c73eMd7AmQwtQRiImsOkZh5j/5mkMtaNcLFk//oRjVJDeIzt60awN/dw/uH43L8
         BpEFzNKzCtMQ20HVIa7PJaMdZiktIwoeymmB4Sb1DkcnKo19NQNPoObTYASRVkgofo+F
         XNdUe+azaDpKDrSrF6dtXKLthbm12ScRWo3+Uotina0/0ylaioIv1/gmy34N6du3aH40
         NGMVw+FDDUStAzaTa5DcbwBN8nrjiomWZhMgtisdIf/vYpzbhp8wDzWK3vSZZudo1vd3
         2wVR5Eg6qEOD2U+2DFtmZWnVYFwgNNqVzEa9AG5A/xEQdV1H5sgUY4/XvTUuGxxUiOMk
         FeGw==
X-Forwarded-Encrypted: i=1; AFNElJ9BXr3hWpLki+pnemEiiJttO6lkhuG5WQIHLglY3n5c8MSGSSbxYRL4QkMjE3QEP2VpYrG2vROc8PjSPCbqj/jp@lists.infradead.org
X-Gm-Message-State: AOJu0YwpEV4aBkZC69fC77Yf3dRk3aDm+oDm1Geop40MrtvpYkNBFPF8
	bmPgYEr/aAMMFwyQT/CWoTDzTjF97HPf6mSx66Zug9LZdrptiXSUsro7aczF5U+3cw+14NdC0ru
	B4Q==
X-Received: from wmgg21.prod.google.com ([2002:a05:600d:15:b0:491:34a2:17f7])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c16f:b0:490:6e11:c303
 with SMTP id 5b1f17b1804b1-490ec4e6f22mr15551875e9.13.1781247577304; Thu, 11
 Jun 2026 23:59:37 -0700 (PDT)
Date: Fri, 12 Jun 2026 07:59:24 +0100
In-Reply-To: <20260612065925.755562-1-tabba@google.com>
Mime-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612065925.755562-11-tabba@google.com>
Subject: [PATCH v1 10/11] KVM: arm64: Add primitives to flush/sync the VGIC
 state at EL2
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Per Larsen <perlarsen@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_235940_290023_4F77743E 
X-CRM114-Status: GOOD (  14.47  )
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

From: Marc Zyngier <maz@kernel.org>

pKVM performs its own world switch for protected VMs but has no
primitives to move the per-vCPU VGIC state between the host and
hypervisor vCPU contexts.

Add flush_hyp_vgic_state() and sync_hyp_vgic_state(). Flush copies
vgic_hcr, the in-use list registers and used_lrs from the host into the
hyp vCPU and pins vgic_sre to a fixed value; sync copies vgic_hcr,
vgic_vmcr and the in-use list registers back. The active priority
registers are handled separately by the save/restore-aprs path.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Co-developed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 50 +++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 2f165b6c7b07..23e644c24a03 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -99,6 +99,46 @@ static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
 	*host_data_ptr(fp_owner) = FP_STATE_HOST_OWNED;
 }
 
+static void flush_hyp_vgic_state(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
+	struct vgic_v3_cpu_if *host_cpu_if, *hyp_cpu_if;
+	unsigned int used_lrs, max_lrs, i;
+
+	host_cpu_if	= &host_vcpu->arch.vgic_cpu.vgic_v3;
+	hyp_cpu_if	= &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
+
+	max_lrs		= (read_gicreg(ICH_VTR_EL2) & ICH_VTR_EL2_ListRegs) + 1;
+	used_lrs	= host_cpu_if->used_lrs;
+	used_lrs	= min(used_lrs, max_lrs);
+
+	hyp_cpu_if->vgic_hcr	= host_cpu_if->vgic_hcr;
+	/* Should be a one-off */
+	hyp_cpu_if->vgic_sre	= (ICC_SRE_EL1_DIB |
+				   ICC_SRE_EL1_DFB |
+				   ICC_SRE_EL1_SRE);
+	hyp_cpu_if->used_lrs	= used_lrs;
+
+	for (i = 0; i < used_lrs; i++)
+		hyp_cpu_if->vgic_lr[i] = host_cpu_if->vgic_lr[i];
+}
+
+static void sync_hyp_vgic_state(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
+	struct vgic_v3_cpu_if *host_cpu_if, *hyp_cpu_if;
+	unsigned int i;
+
+	host_cpu_if	= &host_vcpu->arch.vgic_cpu.vgic_v3;
+	hyp_cpu_if	= &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
+
+	host_cpu_if->vgic_hcr = hyp_cpu_if->vgic_hcr;
+	host_cpu_if->vgic_vmcr = hyp_cpu_if->vgic_vmcr;
+
+	for (i = 0; i < hyp_cpu_if->used_lrs; i++)
+		host_cpu_if->vgic_lr[i] = hyp_cpu_if->vgic_lr[i];
+}
+
 static void flush_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
@@ -139,7 +179,7 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	hyp_vcpu->vcpu.arch.vsesr_el2	= host_vcpu->arch.vsesr_el2;
 
-	hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3 = host_vcpu->arch.vgic_cpu.vgic_v3;
+	flush_hyp_vgic_state(hyp_vcpu);
 
 	hyp_vcpu->vcpu.arch.pid = host_vcpu->arch.pid;
 }
@@ -147,9 +187,6 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
-	struct vgic_v3_cpu_if *hyp_cpu_if = &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
-	struct vgic_v3_cpu_if *host_cpu_if = &host_vcpu->arch.vgic_cpu.vgic_v3;
-	unsigned int i;
 
 	fpsimd_sve_sync(&hyp_vcpu->vcpu);
 	sync_debug_state(hyp_vcpu);
@@ -162,10 +199,7 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	host_vcpu->arch.iflags		= hyp_vcpu->vcpu.arch.iflags;
 
-	host_cpu_if->vgic_hcr		= hyp_cpu_if->vgic_hcr;
-	host_cpu_if->vgic_vmcr		= hyp_cpu_if->vgic_vmcr;
-	for (i = 0; i < hyp_cpu_if->used_lrs; ++i)
-		host_cpu_if->vgic_lr[i] = hyp_cpu_if->vgic_lr[i];
+	sync_hyp_vgic_state(hyp_vcpu);
 }
 
 static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
-- 
2.54.0.1136.gdb2ca164c4-goog


