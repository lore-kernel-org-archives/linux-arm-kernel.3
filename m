Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60173C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfqhILMIKm3bNHEgLWirosvUF05zxkYXsCMy9T3dBLE=; b=lEpulW76W43CcaS3ZBdZV3ZlbX
	5sQ3qy0+5nHJ/ZvQAwAK031jFF7RIOFBogUi6UHQ17dqP2OAjf5CP0M6YU7kYmRl/iHGs0MDZv4R8
	KpWuNKlBfoUY6G/V+3azlb9smH+SacS7/xHdZPOZcwJrn01bDY556fepCzI6q2TLrpVm5KuDlEMqc
	pI4BUlwDsy+3bEREdzyj4R/GSLoCtOO8cO3gkD9SFLGWQLdm4HIlHCVaFbV5+Z0TGt8PySgpnKsjl
	cjI/qhIozKUd+5Ou/8uSfl/ec4yswcFT6SRgP+y8st9NybPYbkXs4LxICz7o//RiV7E7vK3D4waen
	xAwIymFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14yS-0000000A3wJ-1ZjR;
	Mon, 31 Aug 2026 16:35:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14y6-0000000A3g1-27up
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 31 Aug 2026 16:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BfqhILMIKm3bNHEgLWirosvUF05zxkYXsCMy9T3dBLE=; b=AvuAAugBjtA4SKJEJeU7NS29o/
	AdG/a8E3yVqhMtxwGJSjuP15I53wJMslCed/xBrw/tH0GzK+1kx+T988CsxsQFI//gxRLdtQ08iVd
	/c8gqvg+OYNAFpb0YRVZZKOAHBH8VGahF7FMhkqy/UTzWth1vdZSEKR50Yp78MVL8bDGrOi3+B1bj
	k3XsMLcl/p/suoULjzbbALoYWbxsP/t8XJwgoeyHh0Hw1iK0g70vKtyNmN6UUdZuDZ2qzj2kCJB9S
	FcNWQwC5f4NJRPNTZXSjRFdYNaaNepNM286mzaHDm1b/+WGnWBDmmO71XfKgpTBOAruIy0suQE3+B
	Ob0kP50A==;
Received: from out-79.mta0.migadu.com ([2001:41d0:1004:224b::4f] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x14y3-0000000A3e9-2WuM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:34:45 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=llHVSBDbIpHVrNbVZKpBn9aInJeZ47+2NBcLRjFcajA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788194081; v=1; x=1788798881;
 b=Kq179Bi5hJyn88Sg2Yfsx2XrXNfIJQS1kZNKKOuoQjqiXr77clvA0GoliK/heBXFvNNvb9Ie
 m/Rmt2tefSTltkhWH3z8pM2qwCXhfg3/hUABvCWuP9yuVz6G2W2xi3zEzrkSI9TYOsxR/1JBs/G
 YdQagc00xmFEiwE6fZUPAtsc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f7553cf9231fffe6;
	Mon, 31 Aug 2026 16:34:41 +0000
X-Mizu-Trace-ID: f7553cf9231fffe6
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 08/17] KVM: arm64: Implement HVC handling for protected guests at EL2
Date: Mon, 31 Aug 2026 17:34:12 +0100
Message-Id: <20260831163421.272420-9-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260831163421.272420-1-fuad.tabba@linux.dev>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_173443_743348_BEB566CF 
X-CRM114-Status: GOOD (  13.85  )
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

Extend kvm_handle_pvm_hvc64() to handle SMCCC_VERSION,
SMCCC_ARCH_FEATURES and the vendor hypervisor call UID at EL2, so
these queries do not reach the host. ARCH_FEATURES is mandatory from
SMCCC 1.1, the version EL2 reports: it returns SUCCESS for itself and
for SMCCC_VERSION, and NOT_SUPPORTED for anything else.

Add handle_pvm_entry_hvc64() and handle_pvm_exit_hvc64(), which
forward a protected guest's HVCs to the host and return the reply; a
later patch wires them into the per-EC dispatch tables.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 28 ++++++++++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c     | 29 +++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index d4b0f69ff130c..62864db1e099a 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -4,6 +4,8 @@
  * Author: Andrew Scull <ascull@google.com>
  */
 
+#include <kvm/arm_hypercalls.h>
+
 #include <hyp/adjust_pc.h>
 #include <hyp/switch.h>
 
@@ -33,6 +35,32 @@ void __kvm_hyp_host_forward_smc(struct kvm_cpu_context *host_ctxt);
 
 typedef void (*hyp_entry_exit_handler_fn)(struct pkvm_hyp_vcpu *);
 
+static void __maybe_unused handle_pvm_entry_hvc64(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	int i;
+
+	for (i = 0; i < 4; i++) {
+		u64 ret =
+			READ_ONCE(hyp_vcpu->host_vcpu->arch.ctxt.regs.regs[i]);
+		vcpu_set_reg(&hyp_vcpu->vcpu, i, ret);
+	}
+}
+
+static void __maybe_unused handle_pvm_exit_hvc64(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
+	int i;
+
+	WRITE_ONCE(host_vcpu->arch.fault.esr_el2,
+		   hyp_vcpu->vcpu.arch.fault.esr_el2);
+
+	/* Pass the HVC function id (r0) and its arguments. */
+	for (i = 0; i < 8; i++) {
+		WRITE_ONCE(host_vcpu->arch.ctxt.regs.regs[i],
+			   vcpu_get_reg(&hyp_vcpu->vcpu, i));
+	}
+}
+
 static void handle_vm_entry_generic(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	vcpu_copy_flag(&hyp_vcpu->vcpu, hyp_vcpu->host_vcpu, PC_UPDATE_REQ);
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index af334318d0a03..0fe11f95e2e26 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1144,8 +1144,37 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	u64 val[4] = { SMCCC_RET_INVALID_PARAMETER };
 	bool handled = true;
+	u32 feature;
+	uuid_t uuid;
 
 	switch (smccc_get_function(vcpu)) {
+	case ARM_SMCCC_VERSION_FUNC_ID:
+		/* Nothing to be handled by the host. Go back to the guest. */
+		val[0] = ARM_SMCCC_VERSION_1_1;
+		val[1] = 0;
+		val[2] = 0;
+		val[3] = 0;
+		break;
+	case ARM_SMCCC_ARCH_FEATURES_FUNC_ID:
+		/* SUCCESS only for the architecture calls EL2 implements. */
+		feature = smccc_get_arg1(vcpu);
+		switch (feature) {
+		case ARM_SMCCC_VERSION_FUNC_ID:
+		case ARM_SMCCC_ARCH_FEATURES_FUNC_ID:
+			val[0] = SMCCC_RET_SUCCESS;
+			break;
+		default:
+			val[0] = SMCCC_RET_NOT_SUPPORTED;
+			break;
+		}
+		break;
+	case ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID:
+		uuid = ARM_SMCCC_VENDOR_HYP_UID_KVM;
+		val[0] = smccc_uuid_to_reg(&uuid, 0);
+		val[1] = smccc_uuid_to_reg(&uuid, 1);
+		val[2] = smccc_uuid_to_reg(&uuid, 2);
+		val[3] = smccc_uuid_to_reg(&uuid, 3);
+		break;
 	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
 		val[0] = BIT(ARM_SMCCC_KVM_FUNC_FEATURES);
 		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_HYP_MEMINFO);
-- 
2.39.5


