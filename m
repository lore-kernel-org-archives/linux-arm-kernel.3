Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3831FF33A78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHxMn6St+I4mjIlbh+xyEyPgDa5zObo4ez224FGbQQw=; b=RrTzcRT/jFWA7fYQ3pF0BPezME
	yT/wLF7dPnhD9dfv4hFSF6MexUEOiC11sxMADGhnRvhOmyiOK3u1hiy1snX4EPZqr3OTbVj4FIVS+
	qXhTtC7NvcjAnJAYu7YJN2vhi9EgoFa5ybv9QlQ40ahoZnjJZSwu52VFRjqXHh04lleyerGq7YCPv
	r1WBr+bVTXXm2j1hiapwr5i9L63cB5eUWOY+VEjrZLsgoxhZJavBDdRDHeUA/d4/mg4QZ3eX0F5eB
	FvQPBKer37u49HpBmsR6DFKzM1pSsG497zD2720hqwZTf1exo2P4xUp1qJN45O95crI12a5JTCSzU
	D76HoX1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xZ-000000022iE-22Pm;
	Thu, 05 Mar 2026 14:45:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xX-000000022ez-1G0f
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 14:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mHxMn6St+I4mjIlbh+xyEyPgDa5zObo4ez224FGbQQw=; b=m1NuNs3ktA6mkeg3DvQxzrxQHP
	nGA0K1j5uxmVSaq8Gsd+MA1oivYiyqfLtbRFjDelGMOjRJHGWrcdsL8hDZU8ZRWX1FFqC+3qWAPcV
	8eBl444GzAmYQva0G+U06aNNm9+Al1FOZYNNc5jyKzyHAwuGxkdErSn2Q/PyNZxRDBRKrRTCXKTid
	55q95nVoUnUxHtq2ENvhLaSOgaX5d2n7bwozbyYVJ6z9Wxn9OR09g39AybNtoJT2lKWc0AypuKntw
	1UpS+xlswvbI0O2bsO7hu5BDC2bu5RzEE3+rMkTY+Es6SMMynUF8SF5U9tZJojU55SqiMOLXi6hAv
	zD2o3AwQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xS-00000006yVy-0Y1k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:45:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91FCA43A4B;
	Thu,  5 Mar 2026 14:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E58C19423;
	Thu,  5 Mar 2026 14:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721944;
	bh=A0gsw+S7d26oFSbb4t0/obkO9fbZRmAPdY9H7qyJ5Ks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hoX6ABhzuxWAqaWusGAhOeqENN/xpQ13hMEqqSVpmns03veeWshSJUrTgIK4p83rG
	 MzIx4bcd+CVDSTsg/KN91X95GOzoxKeo4M2Qhbjq1poelmC8g8NMKzwjTYVO2ynKSK
	 nO+XmU9tFm3rnVljrWZhxzjVRewKTYGNKYLdQg18F3Q7xSzfP57pp5mXvSsJmWw4ty
	 YvthnExa6UsI3ZI3CjwvtXp0ydFknpzmM4pcG64MSPeHvNprZfZQ0PmVxsWZdt8cX3
	 sQfC0y5NKxnTa++4Qcll3hju62GXtUi4/BgUTceTYreRKHvwaOUobs39Z3v3x1w7VU
	 lIaArBKe44iQg==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v3 27/36] KVM: arm64: Add hvc handler at EL2 for hypercalls from protected VMs
Date: Thu,  5 Mar 2026 14:43:40 +0000
Message-ID: <20260305144351.17071-28-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_144546_694314_5257D89F 
X-CRM114-Status: GOOD (  13.30  )
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

Add a hypercall handler at EL2 for hypercalls originating from protected
VMs. For now, this implements only the FEATURES and MEMINFO calls, but
subsequent patches will implement the SHARE and UNSHARE functions
necessary for virtio.

Unhandled hypercalls (including PSCI) are passed back to the host.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  1 +
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 37 ++++++++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/switch.c       |  1 +
 3 files changed, 39 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index a5a7bb453f3e..c904647d2f76 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -88,6 +88,7 @@ struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle);
 struct pkvm_hyp_vm *get_np_pkvm_hyp_vm(pkvm_handle_t handle);
 void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm);
 
+bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code);
 bool kvm_handle_pvm_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code);
 bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
 void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 5269ac20d2fb..8b32bf37acc3 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -4,6 +4,8 @@
  * Author: Fuad Tabba <tabba@google.com>
  */
 
+#include <kvm/arm_hypercalls.h>
+
 #include <linux/kvm_host.h>
 #include <linux/mm.h>
 
@@ -965,3 +967,38 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
 	hyp_spin_unlock(&vm_table_lock);
 	return err;
 }
+/*
+ * Handler for protected VM HVC calls.
+ *
+ * Returns true if the hypervisor has handled the exit (and control
+ * should return to the guest) or false if it hasn't (and the handling
+ * should be performed by the host).
+ */
+bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
+{
+	u64 val[4] = { SMCCC_RET_INVALID_PARAMETER };
+	bool handled = true;
+
+	switch (smccc_get_function(vcpu)) {
+	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
+		val[0] = BIT(ARM_SMCCC_KVM_FUNC_FEATURES);
+		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_HYP_MEMINFO);
+		break;
+	case ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID:
+		if (smccc_get_arg1(vcpu) ||
+		    smccc_get_arg2(vcpu) ||
+		    smccc_get_arg3(vcpu)) {
+			break;
+		}
+
+		val[0] = PAGE_SIZE;
+		break;
+	default:
+		/* Punt everything else back to the host, for now. */
+		handled = false;
+	}
+
+	if (handled)
+		smccc_set_retval(vcpu, val[0], val[1], val[2], val[3]);
+	return handled;
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 779089e42681..51bd88dc6012 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -190,6 +190,7 @@ static const exit_handler_fn hyp_exit_handlers[] = {
 
 static const exit_handler_fn pvm_exit_handlers[] = {
 	[0 ... ESR_ELx_EC_MAX]		= NULL,
+	[ESR_ELx_EC_HVC64]		= kvm_handle_pvm_hvc64,
 	[ESR_ELx_EC_SYS64]		= kvm_handle_pvm_sys64,
 	[ESR_ELx_EC_SVE]		= kvm_handle_pvm_restricted,
 	[ESR_ELx_EC_FP_ASIMD]		= kvm_hyp_handle_fpsimd,
-- 
2.53.0.473.g4a7958ca14-goog


