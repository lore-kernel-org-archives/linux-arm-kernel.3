Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21535D35662
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 07:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tGVVzEzdKIqtw2jMSkAdxRRepqF4t65vIU1oF5Z4Mr8=; b=UGgCwlTtova23/feZj/pdmKJYR
	7Yq7CX5J0t25cpPDVgRcuvtTGoP0KY0ZIiVyPi6UcMgCNqO6N/a63lDOZ40lh13/ZX7xwajFmDGBc
	ghIwDc00A9Ob8r8ZivJgiM/k2f9EKS4nQwUp5fl0Vm1ywoJws+7kPp/QqtrWgvNHwlxDOXpSCTs9H
	YjmWa+W+ZyUokEv3cSO3VsV1xKE1X5HR+9UGOhhnR20+uqEdFU3VQZvcbEjRu/24kYMDYwAh5dCpu
	FPbTfvQElqjU5hGwvH0MpNgOcMXS7P9ODlYB1iu9Pr88cAzbvxDRLOuc2QJ7Kv4NU8Z26Onps+InA
	s89KrXEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0M6-0000000FcOW-3deQ;
	Wed, 28 Jan 2026 07:52:50 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0M2-0000000FcO3-45TX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 07:52:49 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769586760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tGVVzEzdKIqtw2jMSkAdxRRepqF4t65vIU1oF5Z4Mr8=;
	b=w+hX2TNQ9d3Jy4XIxg6K+yDvyUk7XbvOH2Y7fm8GzXL4ak06jW0Gte0uu0XbElU5edGYfo
	/EJ8L2HTDspGdrITfl8fkjKB3B16XpWA0PeZ/E/rvY3D9+bYOsIE5yrnesp8joo/KJN+cU
	2IqSx7uSxXdNAj0/M/lGjR1t/6m5zF8=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	zenghui.yu@linux.dev,
	wanghaibin.wang@huawei.com
Subject: [PATCH] KVM: arm64: Fix various comments
Date: Wed, 28 Jan 2026 15:52:08 +0800
Message-Id: <20260128075208.23024-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_235247_981330_5F924BAB 
X-CRM114-Status: UNSURE (   9.17  )
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

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

Use tab instead of whitespaces, as well as 2 minor typo fixes.

Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h    | 2 +-
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c   | 2 +-
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ac7f970c7883..96f254f616a0 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -201,7 +201,7 @@ struct kvm_s2_mmu {
 	 * host to parse the guest S2.
 	 * This either contains:
 	 * - the virtual VTTBR programmed by the guest hypervisor with
-         *   CnP cleared
+	 *   CnP cleared
 	 * - The value 1 (VMID=0, BADDR=0, CnP=1) if invalid
 	 *
 	 * We also cache the full VTCR which gets used for TLB invalidation,
diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index f28c6cf4fe1b..b254d442e54e 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -205,7 +205,7 @@ void __vcpu_load_switch_sysregs(struct kvm_vcpu *vcpu)
 
 	/*
 	 * When running a normal EL1 guest, we only load a new vcpu
-	 * after a context switch, which imvolves a DSB, so all
+	 * after a context switch, which involves a DSB, so all
 	 * speculative EL1&0 walks will have already completed.
 	 * If running NV, the vcpu may transition between vEL1 and
 	 * vEL2 without a context switch, so make sure we complete
diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index 61b44f3f2bf1..a2ccef116483 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -57,7 +57,7 @@ static int lr_map_idx_to_shadow_idx(struct shadow_if *shadow_if, int idx)
  * as the L1 guest is in charge of provisioning the interrupts via its own
  * view of the ICH_LR*_EL2 registers, which conveniently live in the VNCR
  * page.  This means that the flow described above does work (there is no
- * state to rebuild in the L0 hypervisor), and that most things happed on L2
+ * state to rebuild in the L0 hypervisor), and that most things happen on L2
  * load/put:
  *
  * - on L2 load: move the in-memory L1 vGIC configuration into a shadow,
-- 
2.34.1


