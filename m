Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA31C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y36AHrAP85QtDpw9m/Yu4Q1g0HqAqicneVH+G4tllDk=; b=kD1cq5llm/IJff7pfNBdyrGpB3
	uRR4wOQZnaKD020AcUm+y0RDf3WKKSUL9x9PLTyE/s+WyempRk1ChY0XJ1f1Va6xS5dWMrIEVJ1JW
	2qxDNb6uws3D4XR8sDMcTzo4IB0ckeKClq9+GPjeBqYzCJavceM9OHOseODsLrc6pQMgXyx3m/PsR
	2+kLMnFrcsmtvt/sGv73wcE5Jv2OXXc6CQ0NHD1mzbce1UtlU28Q9PUaXK5yovqP+2WnS0PwMAmSk
	S+bVftUTlVRDZ/7EqoCjQsUrJqjMvN4dYz5wELQt188L7vF9lhQvKC/5hA31+w0aSQH22c7niZL/r
	E2EO5s/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14zE-0000000A4eP-3Zwy;
	Mon, 31 Aug 2026 16:35:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14yg-0000000A4EY-2mjH
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 31 Aug 2026 16:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Y36AHrAP85QtDpw9m/Yu4Q1g0HqAqicneVH+G4tllDk=; b=ioNLNd9HHcPhkDpihCUbmS6xag
	XuXiXvMFv5jpSbZWV4qCvUgPxVhw5bJkdLYURjbmgj6wqhOic0VVwWhwK4Sw2UvdI5qfc0c0wKbpL
	N8TarS1g1evL8jQzqlnitfotyQDFmnuS8Zkc5IMccoFJ/8zXgEAMowJvMb+XwEUpBTZVXqrpC311o
	iaeARZxRofs9LoBMN4ZNt9dFPYwQ3X+wfuxWCkbPt13pMbm2Mb2nI0oA1s1D4wo47276+4lJ7TR0k
	XC2872Aq6F45tf3J3zROAJjP+FrU+ojsTyaVklBiyKRT+21iR6TTd+QVv+KzHuXMQwYbdoslChWo9
	YZVtcfPA==;
Received: from out-250.mta1.migadu.com ([2001:41d0:203:375::fa] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x14yd-0000000A3hz-3BGn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:35:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=aEC3gGbsmRPY1vFm8z4e4gHuRufq9N0KewFxzyMR6c0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788194117; v=1; x=1788798917;
 b=H6Fng3Qd2ZEZaaZhTe316KqCKih86dtXejyfBsnrTZVJV/Oj++5xUGKtmP6ZGJ9kbT6VAb29
 /26eeZqD1Dy13cYaoRPOwmC3Dp3PH633zSQOU+FuWeKoTGL+c/M2hwrYYaoIGZSdCD9TL0I7bcM
 Nw5LdGY/nfg6ZjmVz8KoyBbU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d64d18f3558bf44a;
	Mon, 31 Aug 2026 16:35:17 +0000
X-Mizu-Trace-ID: d64d18f3558bf44a
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
Subject: [PATCH 16/17] KVM: arm64: Reject host power-on of a vCPU that EL2 holds powered off
Date: Mon, 31 Aug 2026 17:34:20 +0100
Message-Id: <20260831163421.272420-17-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260831163421.272420-1-fuad.tabba@linux.dev>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_173519_977106_4EA17196 
X-CRM114-Status: GOOD (  15.31  )
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

A protected vCPU's power state belongs to EL2, which changes it only
on the guest's own PSCI calls. KVM_SET_MP_STATE(RUNNABLE) on a vCPU
EL2 holds powered off changes the host's copy alone, and the guest's
next CPU_ON of that vCPU then fails: mp_state is no longer STOPPED, so
the host returns ALREADY_ON, which EL2 turns into INTERNAL_FAILURE.
SUSPENDED has the same effect.

Track at the host whether EL2 holds a protected vCPU powered off and
return -EPERM for both writes in that state. STOPPED stays permitted,
so a VMM can pause a vCPU, and RUNNABLE on a vCPU EL2 has powered on,
so it can resume one.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/arm.c              | 20 ++++++++++++++++++++
 arch/arm64/kvm/pkvm.c             | 21 +++++++++++++++++----
 arch/arm64/kvm/psci.c             |  3 +++
 4 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 78a4d387f9fd4..39788c4331260 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -922,6 +922,8 @@ struct kvm_vcpu_arch {
 	/* vcpu power state */
 	struct kvm_mp_state mp_state;
 	spinlock_t mp_state_lock;
+	/* EL2 holds the protected vCPU powered off. Under mp_state_lock. */
+	bool pkvm_powered_off;
 
 	/* Cache some mmu pages needed inside spinlock regions */
 	struct kvm_mmu_memory_cache mmu_page_cache;
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8caacdd4de020..a96d01b2c5e86 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -777,9 +777,12 @@ static void __kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
 	kvm_vcpu_kick(vcpu);
 }
 
+/* The guest's own CPU_OFF: EL2 has already powered the vCPU off. */
 void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
 {
 	spin_lock(&vcpu->arch.mp_state_lock);
+	if (kvm_vm_is_protected(vcpu->kvm))
+		vcpu->arch.pkvm_powered_off = true;
 	__kvm_arm_vcpu_power_off(vcpu);
 	spin_unlock(&vcpu->arch.mp_state_lock);
 }
@@ -801,6 +804,13 @@ static bool kvm_arm_vcpu_suspended(struct kvm_vcpu *vcpu)
 	return READ_ONCE(vcpu->arch.mp_state.mp_state) == KVM_MP_STATE_SUSPENDED;
 }
 
+/* Only the guest's CPU_ON may start a vCPU EL2 holds powered off. */
+static bool kvm_pkvm_vcpu_is_powered_off(struct kvm_vcpu *vcpu)
+{
+	return kvm_vm_is_protected(vcpu->kvm) &&
+	       vcpu->arch.pkvm_powered_off;
+}
+
 int kvm_arch_vcpu_ioctl_get_mpstate(struct kvm_vcpu *vcpu,
 				    struct kvm_mp_state *mp_state)
 {
@@ -818,12 +828,22 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
 
 	switch (mp_state->mp_state) {
 	case KVM_MP_STATE_RUNNABLE:
+		if (kvm_pkvm_vcpu_is_powered_off(vcpu)) {
+			ret = -EPERM;
+			break;
+		}
+
 		WRITE_ONCE(vcpu->arch.mp_state, *mp_state);
 		break;
 	case KVM_MP_STATE_STOPPED:
 		__kvm_arm_vcpu_power_off(vcpu);
 		break;
 	case KVM_MP_STATE_SUSPENDED:
+		if (kvm_pkvm_vcpu_is_powered_off(vcpu)) {
+			ret = -EPERM;
+			break;
+		}
+
 		kvm_arm_vcpu_suspend(vcpu);
 		break;
 	default:
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8e4c6e4bec123..8ae974fec42ba 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -118,12 +118,25 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
 		return -ENOMEM;
 
 	ret = kvm_call_hyp_nvhe(__pkvm_init_vcpu, handle, vcpu, hyp_vcpu);
-	if (!ret)
-		vcpu_set_flag(vcpu, VCPU_PKVM_FINALIZED);
-	else
+	if (ret) {
 		free_pages_exact(hyp_vcpu, hyp_vcpu_sz);
+		return ret;
+	}
 
-	return ret;
+	/*
+	 * Mirror EL2's seeding of power_state from mp_state. The hyp vCPU is
+	 * published, so take mp_state_lock against kvm_psci_vcpu_on().
+	 */
+	if (kvm_vm_is_protected(vcpu->kvm)) {
+		spin_lock(&vcpu->arch.mp_state_lock);
+		if (kvm_arm_vcpu_stopped(vcpu))
+			vcpu->arch.pkvm_powered_off = true;
+		spin_unlock(&vcpu->arch.mp_state_lock);
+	}
+
+	vcpu_set_flag(vcpu, VCPU_PKVM_FINALIZED);
+
+	return 0;
 }
 
 /*
diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
index e3db84400d1f8..208289a08099f 100644
--- a/arch/arm64/kvm/psci.c
+++ b/arch/arm64/kvm/psci.c
@@ -94,6 +94,9 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
 	 */
 	smp_wmb();
 
+	/* EL2 has committed the protected vCPU to ON_PENDING to get here. */
+	vcpu->arch.pkvm_powered_off = false;
+
 	WRITE_ONCE(vcpu->arch.mp_state.mp_state, KVM_MP_STATE_RUNNABLE);
 	kvm_vcpu_wake_up(vcpu);
 
-- 
2.39.5


