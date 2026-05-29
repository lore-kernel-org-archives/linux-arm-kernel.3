Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A389CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anDf/gvctOkuN5DgGyLL9jz1QpXwOjJXmrZUSy7fjno=; b=EhB3BQNpe95UNec0bgsqci5DNt
	YvBSP5DrrNVTvsDdykVZNF1SV473yepkUd/Gfii+XqbG9XQs0Kz2Yq9GxHCjmgkM+KrFyjATEFG52
	WFgOrPrQ53abezW8K2lJox62ga1rEWQcGFbyRtYsBG/lXkf+v0+EQWoQCLI345lO+kofj4dhvLnMt
	15jTxP7MD5zlw6zgh6Np46TrDYUc4fHT+gfCz5zfw9R9sK9MnT2HcCKPI/Jn4vrLWmsXfbHRQC1Zx
	qZ0DbqAUKVs0HumMFEhxEH58Mc0AXi+7f5HphiuKZQlHnmIuRymi9fUg7zm+2rueHzfQ5UggeiL+F
	BMQDv86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZy-00000007mrk-46su;
	Fri, 29 May 2026 15:56:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZb-00000007mRe-3bvQ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 May 2026 15:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=anDf/gvctOkuN5DgGyLL9jz1QpXwOjJXmrZUSy7fjno=; b=cpVkWA994k3cRj2TjBZj1Rxz2R
	BEyhTh7w6mpcYqVKSdr4DH10/9zs+gWnp8nbP6raWszWXpBzlcn9uGkjceL78dxGn5rOrsbz/Ff0H
	j3usUoFwV6VBf6fuLJk6G9W4/6YbqyN9mj8xPUZQIAepUIeD7nVeUF4DTGDg37v2TWwCwFjCAPHEd
	+35goQWxGXN1GH3qDb35loK1PSHHuygtHG5eDuW+lKvbyoi3sAzbJknE6SXBoO/ofJrOaEGjFEJPZ
	ROPpEUVjG8ZRYmjxta0K+TwwgYdabagLxr358cs0FkXPjylQnHiBOIdf3I6rtYijqD2lNZyyoegF9
	EKD6eRcg==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZX-00000001nH2-0ljJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:56:34 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TFFto82776289;
	Fri, 29 May 2026 15:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=anDf/gvctOkuN5DgG
	yLL9jz1QpXwOjJXmrZUSy7fjno=; b=Xh/CPvlskTKCAz1CkS2LF+s9SXXJLj899
	/wHz8nW3EGGBed3v2/lgm5rK33SWi4PPlzE3T8CqU+hLnb84ZIl2/n3l+2kmZ+bg
	djCcBYMSWai72mhROGi7Hcs+IrsAegggiW+tqH8b+jI5rhkjXtIEcEwrWrbUpRis
	qYJQcNuIu5dZVprbDBE+mbOROmOl6nUNirXOYzHVEtoL0qX5q4EyiOYICEkfNoMd
	dI7ENqqKS3KZeFQQXN5/SkDnGlyJrvO1xMbOs8TOsYtZWEO5GJUt60wg9EeWpSsg
	IsRoS2NjQlqp78udeadGwEWy7Nh7XA/zMgSV3YDgkBjgqENDeoMZw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ee889m2f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:56:21 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64TFs8EA027824;
	Fri, 29 May 2026 15:56:20 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4edjrc8jq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:56:20 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64TFuCIT49349002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 May 2026 15:56:12 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA1C020040;
	Fri, 29 May 2026 15:56:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93FC620043;
	Fri, 29 May 2026 15:56:11 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 May 2026 15:56:11 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v1 25/26] KVM: s390: arm64: Implement exception injection
Date: Fri, 29 May 2026 17:55:58 +0200
Message-ID: <20260529155601.2927240-26-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529155601.2927240-1-seiden@linux.ibm.com>
References: <20260529155601.2927240-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mkBwToMnPdxn7Agaz6M9EECNczw32dy4
X-Proofpoint-GUID: mkBwToMnPdxn7Agaz6M9EECNczw32dy4
X-Authority-Analysis: v=2.4 cv=XqfK/1F9 c=1 sm=1 tr=0 ts=6a19b725 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=Ga-kB53fOd7CXy6K7RwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE1NiBTYWx0ZWRfX+SnYZ3wGhZDo
 1pMmghK3pGWmPQdM8X7EQJx2k3c9hkkgARPOB21fYK3KXmntr+/HT7iUwAf5kDr6tX6v+vb9SxI
 1rvGF3IGU76oEdSrvcwSUij9YxrELfBY5dKluXMN/LX6uyxPTK4Z9TCuHDWTpIp5hkGQsHB3LDG
 VqbP8He9wXCUbSyMOQuADSHWQC0mBBjrCYeqT0Wa5AXs0Rcu/uH+PtqAmefuqqRPVTBi3Syguqu
 DDeKV+wYWPUoqXiJ7C47G/DRyGubZZY2GZJRDWLJpONYZ8aGxmdZyXo5K6xjNs+eOsEzqd/VWAu
 3+Y224gcnfxKpoNBMkcH6wyU82NfNBGTz4gSW2OfoB6KU7tA87pMfTYiYTkMtsY9mi7u2X9b0nD
 20cbqpqd+bY93FeGOubs6Ma52X1glkr27rh2RREo4wvTJndDeHah7bQve/7RAO9mrH+hnAL7u+f
 45DEORUxoFFY6kAryfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_165631_742630_CF554699 
X-CRM114-Status: GOOD (  25.65  )
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

Add exception injection support for s390 KVM arm64 architecture. This
implements the core exception entry mechanism and fault injection
functions needed for proper guest exception handling.

Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/include/asm/kvm_host_arm64.h |   2 +
 arch/s390/kvm/arm64/Makefile           |   1 +
 arch/s390/kvm/arm64/arm.c              |  15 +---
 arch/s390/kvm/arm64/exception.c        | 105 +++++++++++++++++++++++++
 arch/s390/kvm/arm64/inject_fault.c     |  72 ++++++++++++++++-
 5 files changed, 182 insertions(+), 13 deletions(-)
 create mode 100644 arch/s390/kvm/arm64/exception.c

diff --git a/arch/s390/include/asm/kvm_host_arm64.h b/arch/s390/include/asm/kvm_host_arm64.h
index cc457d69621c..34d131b36e70 100644
--- a/arch/s390/include/asm/kvm_host_arm64.h
+++ b/arch/s390/include/asm/kvm_host_arm64.h
@@ -373,4 +373,6 @@ static inline u64 kvm_sanitised_host_ftr_reg(u32 id)
 	return kvm_arm_host_sys_reg_by_id(id);
 }
 
+void kvm_adjust_pc(struct kvm_vcpu *vcpu);
+
 #endif /* ASM_KVM_HOST_ARM64_H */
diff --git a/arch/s390/kvm/arm64/Makefile b/arch/s390/kvm/arm64/Makefile
index bec24b60a071..9d6b7d5bf588 100644
--- a/arch/s390/kvm/arm64/Makefile
+++ b/arch/s390/kvm/arm64/Makefile
@@ -9,6 +9,7 @@ ccflags-y += -I $(src) -I$(srctree)/arch/s390/kvm/gmap -DKVM_S390_ARM64
 
 kvm-arm64-obj := \
 	arm.o \
+	exception.o \
 	feature.o \
 	guest.o \
 	handle_exit.o \
diff --git a/arch/s390/kvm/arm64/arm.c b/arch/s390/kvm/arm64/arm.c
index 88b66552cff0..c62e50002628 100644
--- a/arch/s390/kvm/arm64/arm.c
+++ b/arch/s390/kvm/arm64/arm.c
@@ -350,19 +350,11 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
 	return 0;
 }
 
-static void adjust_pc(struct kvm_vcpu *vcpu)
-{
-	if (vcpu_get_flag(vcpu, INCREMENT_PC)) {
-		kvm_skip_instr(vcpu);
-		vcpu_clear_flag(vcpu, INCREMENT_PC);
-	}
-}
-
 static void arm_vcpu_run(struct kvm_vcpu *vcpu)
 {
 	struct kvm_sae_block *sae_block = &vcpu->arch.sae_block;
 
-	adjust_pc(vcpu);
+	kvm_adjust_pc(vcpu);
 
 	local_irq_disable();
 	guest_enter_irqoff();
@@ -457,8 +449,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	kvm_sigset_deactivate(vcpu);
 out:
-	if (unlikely(vcpu_get_flag(vcpu, INCREMENT_PC)))
-		adjust_pc(vcpu);
+	if (unlikely(vcpu_get_flag(vcpu, PENDING_EXCEPTION) ||
+		     vcpu_get_flag(vcpu, INCREMENT_PC)))
+		kvm_adjust_pc(vcpu);
 
 	save_vx_regs(vcpu->arch.ctxt.vregs);
 	kernel_fpu_end(&fpu_save, KERNEL_FPC | KERNEL_VXR);
diff --git a/arch/s390/kvm/arm64/exception.c b/arch/s390/kvm/arm64/exception.c
new file mode 100644
index 000000000000..871e4e2c710a
--- /dev/null
+++ b/arch/s390/kvm/arm64/exception.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/kvm_host.h>
+#include <asm/kvm_emulate.h>
+#include <asm/sysreg-defs.h>
+
+#include <asm/pstate.h>
+
+/*
+ * This performs the exception entry at a given EL (@target_mode), stashing PC
+ * and PSTATE into ELR and SPSR respectively, and compute the new PC/PSTATE.
+ * The EL passed to this function *must* be a non-secure, privileged mode with
+ * bit 0 being set (PSTATE.SP == 1).
+ *
+ * When an exception is taken, most PSTATE fields are left unchanged in the
+ * handler. However, some are explicitly overridden (e.g. M[4:0]). Luckily all
+ * of the inherited bits have the same position in the AArch64/AArch32 SPSR_ELx
+ * layouts, so we don't need to shuffle these for exceptions from AArch32 EL0.
+ *
+ * For the SPSR_ELx layout for AArch64, see ARM DDI 0487E.a page C5-429.
+ * For the SPSR_ELx layout for AArch32, see ARM DDI 0487E.a page C5-426.
+ *
+ * Here we manipulate the fields in order of the AArch64 SPSR_ELx layout, from
+ * MSB to LSB.
+ */
+static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
+			      enum exception_type type)
+{
+	unsigned long sctlr, vbar, old_pstate, new, mode;
+	u64 exc_offset;
+
+	old_pstate = *vcpu_cpsr(vcpu);
+	mode = old_pstate & (PSR_MODE_MASK | PSR_MODE32_BIT);
+
+	if      (mode == target_mode)
+		exc_offset = CURRENT_EL_SP_ELx_VECTOR;
+	else if ((mode | PSR_MODE_THREAD_BIT) == target_mode)
+		exc_offset = CURRENT_EL_SP_EL0_VECTOR;
+	else if (!(mode & PSR_MODE32_BIT))
+		exc_offset = LOWER_EL_AArch64_VECTOR;
+	else
+		exc_offset = LOWER_EL_AArch32_VECTOR;
+
+	switch (target_mode) {
+	case PSR_MODE_EL1h:
+		vbar = vcpu_read_sys_reg(vcpu, VBAR_EL1);
+		sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
+		vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL1);
+		vcpu_write_sys_reg(vcpu, old_pstate, SPSR_EL1);
+		break;
+	default:
+		panic("Unknown PSR Mode: 0x%lx.", target_mode);
+	}
+
+	*vcpu_pc(vcpu) = vbar + exc_offset + type;
+
+	new = 0;
+
+	new |= (old_pstate & PSR_N_BIT);
+	new |= (old_pstate & PSR_Z_BIT);
+	new |= (old_pstate & PSR_C_BIT);
+	new |= (old_pstate & PSR_V_BIT);
+	new |= (old_pstate & PSR_DIT_BIT);
+	new |= (old_pstate & PSR_PAN_BIT);
+
+	if (!(sctlr & SCTLR_EL1_SPAN))
+		new |= PSR_PAN_BIT;
+
+	if (sctlr & SCTLR_ELx_DSSBS)
+		new |= PSR_SSBS_BIT;
+
+	new |= PSR_D_BIT;
+	new |= PSR_A_BIT;
+	new |= PSR_I_BIT;
+	new |= PSR_F_BIT;
+
+	new |= target_mode;
+
+	*vcpu_cpsr(vcpu) = new;
+}
+
+static void kvm_inject_exception(struct kvm_vcpu *vcpu)
+{
+	switch (vcpu_get_flag(vcpu, EXCEPT_MASK)) {
+	case unpack_vcpu_flag(EXCEPT_AA64_EL1_SYNC):
+		enter_exception64(vcpu, PSR_MODE_EL1h, except_type_sync);
+		break;
+	}
+}
+
+/*
+ * Adjust the guest PC (and potentially exception state) depending on
+ * flags provided by the emulation code.
+ */
+void kvm_adjust_pc(struct kvm_vcpu *vcpu)
+{
+	if (vcpu_get_flag(vcpu, PENDING_EXCEPTION)) {
+		kvm_inject_exception(vcpu);
+		vcpu_clear_flag(vcpu, PENDING_EXCEPTION);
+		vcpu_clear_flag(vcpu, EXCEPT_MASK);
+	} else if (vcpu_get_flag(vcpu, INCREMENT_PC)) {
+		kvm_skip_instr(vcpu);
+		vcpu_clear_flag(vcpu, INCREMENT_PC);
+	}
+}
diff --git a/arch/s390/kvm/arm64/inject_fault.c b/arch/s390/kvm/arm64/inject_fault.c
index 650c041efde2..0216ffbd62ab 100644
--- a/arch/s390/kvm/arm64/inject_fault.c
+++ b/arch/s390/kvm/arm64/inject_fault.c
@@ -2,6 +2,42 @@
 
 #include <asm/kvm_emulate.h>
 
+#define exception_esr_elx(__vcpu) ESR_EL1
+#define exception_far_elx(__vcpu) FAR_EL1
+
+static void pend_sync_exception(struct kvm_vcpu *vcpu)
+{
+	kvm_pend_exception(vcpu, EXCEPT_AA64_EL1_SYNC);
+}
+
+static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr)
+{
+	unsigned long cpsr = *vcpu_cpsr(vcpu);
+	bool is_aarch32 = vcpu_mode_is_32bit(vcpu);
+	u64 esr = 0;
+
+	if (kvm_vcpu_abt_iss1tw(vcpu))
+		esr |= ESR_ELx_FSC_SEA_TTW(kvm_vcpu_abt_gltl(vcpu));
+	else
+		esr |= ESR_ELx_FSC_EXTABT;
+
+	pend_sync_exception(vcpu);
+
+	if (kvm_vcpu_trap_il_is32bit(vcpu))
+		esr |= ESR_ELx_IL;
+
+	if (is_aarch32 || (cpsr & PSR_MODE_MASK) == PSR_MODE_EL0t)
+		esr |= (ESR_ELx_EC_IABT_LOW << ESR_ELx_EC_SHIFT);
+	else
+		esr |= (ESR_ELx_EC_IABT_CUR << ESR_ELx_EC_SHIFT);
+
+	if (!is_iabt)
+		esr |= ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT;
+
+	vcpu_write_sys_reg(vcpu, addr, ESR_EL1);
+	vcpu_write_sys_reg(vcpu, esr, FAR_EL1);
+}
+
 /**
  * kvm_inject_undefined - inject an undefined instruction into the guest
  * @vcpu: The vCPU in which to inject the exception
@@ -11,11 +47,43 @@
  */
 void kvm_inject_undefined(struct kvm_vcpu *vcpu)
 {
-	/* Stub until s390 supports arm64 sysregs TODO sysregs*/
+	u64 esr = (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT);
+
+	pend_sync_exception(vcpu);
+
+	/*
+	 * Build an unknown exception, depending on the instruction
+	 * set.
+	 */
+	if (kvm_vcpu_trap_il_is32bit(vcpu))
+		esr |= ESR_ELx_IL;
+
+	vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
+}
+
+static void __kvm_inject_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr)
+{
+	inject_abt64(vcpu, iabt, addr);
 }
 
 int kvm_inject_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr)
 {
-	/* Stub until s390 supports arm64 sysregs TODO sysregs*/
+	lockdep_assert_held(&vcpu->mutex);
+
+	__kvm_inject_sea(vcpu, iabt, addr);
 	return 1;
 }
+
+void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
+{
+	unsigned long addr, esr;
+
+	addr  = kvm_vcpu_get_fault_ipa(vcpu);
+	addr |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(vcpu));
+
+	__kvm_inject_sea(vcpu, kvm_vcpu_trap_is_iabt(vcpu), addr);
+
+	esr = vcpu_read_sys_reg(vcpu, exception_esr_elx(vcpu));
+	esr &= ~GENMASK_ULL(5, 0);
+	vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
+}
-- 
2.53.0


