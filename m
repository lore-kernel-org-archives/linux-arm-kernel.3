Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FAFCDDE7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJfLoc45A98djwsjuLE0rm4z6rK/WUSZVJHEYU2rAFs=; b=W6/IELdxyHCCBXCvILdxU1TUSZ
	76COInbGT2wdXh+jW2hWgpdD6qInKunqIirZvg81hzaZR4BvANgcekDp1VeLQLBvmcP3RKGo/KVt4
	6xuQkElVPLmo00lxf3J4jGyGSgxF33LddWdrjXymNXKV1MmRGD98erqqR3TeB0dgGLLP2Eg7tf4LH
	r/YuTUAleeAfkLHg+fRIku3hOnaXXcjpVveRw1znt9VvUfHfjVZ0bBbxa8hyCLB8fDuEoGRYQ/c8n
	qMjtVdnvlPGTWP0DBJefAC4cmN+AJ+eYA7Io/urXy2c6b0ohQfU+/rFGCtfqRpqK+CDC2lSU/9+Al
	Vni/x/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dBO-0000000Ew34-2hcq;
	Wed, 23 Oct 2024 15:21:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckN-0000000EpPa-1JnL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 14:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iJfLoc45A98djwsjuLE0rm4z6rK/WUSZVJHEYU2rAFs=; b=FHHGBOff2e0iLcoDFjnabM0E71
	FNzHnW7kmL/Syqivq4Gt/bWBl4n2MDzQKfUnF5gP525oEqcy6tK6AxmVPUsJLJEIME/bNlmOmNhH3
	E5U96HxEx3n5EhCI5EIYm7gU/2s4IBgScuBZvBCCzXPy0A+2RRb0e4Vs2zO3ivk4d00gDMwtktFzf
	6tes6IaWHRlSRle0Y3xqtpnpHmF1pow26fw8/8q4LPAl5VWprYpLoNacOGcCpy0sbJQyKdCz4z6kP
	cqvH2FUlSG+mttj4sTNzCHDUd5JppytH97LP1Yw/Wpq1Hzw+5DsoYWx6+3EZzW0xMhr6K6aBCC+/J
	iRFQg+tQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckI-00000008Qbi-3IO9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9EF6BA4501C;
	Wed, 23 Oct 2024 14:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833E6C4CEE6;
	Wed, 23 Oct 2024 14:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695233;
	bh=6QiF6EDTZ0Po266q9azwPZ96ZF0ANBT4BNVnzQoHvog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aduuJdqrucK4wWD5Wc0hCDY/vfUMkrtuCRLzRll5VPjfYdt+cCm4xBw+V8CIqpEv2
	 afcaKvsOUw5EMTJnyQh+RN+OSpvcG5XKad/IsNkbmppHWvBOWM+veRaQQdhTAX08sH
	 j4Kw5VJzWVLxAhk6c49SxcYreyQtPmaswr2YRPgL+rearOPqBKkrZrErrzA0vvMNOk
	 gHyFyyUpID0oq1x9flhG06/dtrDyP02sAMdIY8y3z9JINFiZdNXJZe9Y7u6gvaRdSf
	 DrLMdw0Da9ddYirGFVZ3hcSB5YRxrKrdB9ET1prHnAIjzfvmyUODfD0iSIeaQDABs/
	 XYjqCv3H8fgng==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckB-0068vz-PB;
	Wed, 23 Oct 2024 15:53:51 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 11/37] KVM: arm64: Add TCR2_EL2 to the sysreg arrays
Date: Wed, 23 Oct 2024 15:53:19 +0100
Message-Id: <20241023145345.1613824-12-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_155359_118093_830138C4 
X-CRM114-Status: GOOD (  12.33  )
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

Add the TCR2_EL2 register to the per-vcpu sysreg register array,
the sysreg descriptor array, and advertise it as mapped to TCR2_EL1
for NV purposes.

Access to this register is conditional based on ID_AA64MMFR3_EL1.TCRX
being advertised.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/kvm/sys_regs.c         | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7f409dfc5cd4a..ca064af6cac21 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -492,6 +492,7 @@ enum vcpu_sysreg {
 
 	/* Anything from this can be RES0/RES1 sanitised */
 	MARKER(__SANITISED_REG_START__),
+	TCR2_EL2,	/* Extended Translation Control Register (EL2) */
 
 	/* Any VNCR-capable reg goes after this point */
 	MARKER(__VNCR_START__),
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index d9c20563cae93..514b016d09764 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -134,6 +134,7 @@ static bool get_el2_to_el1_mapping(unsigned int reg,
 		MAPPED_EL2_SYSREG(ESR_EL2,     ESR_EL1,     NULL	     );
 		MAPPED_EL2_SYSREG(FAR_EL2,     FAR_EL1,     NULL	     );
 		MAPPED_EL2_SYSREG(MAIR_EL2,    MAIR_EL1,    NULL	     );
+		MAPPED_EL2_SYSREG(TCR2_EL2,    TCR2_EL1,    NULL	     );
 		MAPPED_EL2_SYSREG(AMAIR_EL2,   AMAIR_EL1,   NULL	     );
 		MAPPED_EL2_SYSREG(ELR_EL2,     ELR_EL1,	    NULL	     );
 		MAPPED_EL2_SYSREG(SPSR_EL2,    SPSR_EL1,    NULL	     );
@@ -452,6 +453,18 @@ static bool access_vm_reg(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static bool access_tcr2_el2(struct kvm_vcpu *vcpu,
+			    struct sys_reg_params *p,
+			    const struct sys_reg_desc *r)
+{
+	if (!kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, TCRX, IMP)) {
+		kvm_inject_undefined(vcpu);
+		return false;
+	}
+
+	return access_rw(vcpu, p, r);
+}
+
 static bool access_actlr(struct kvm_vcpu *vcpu,
 			 struct sys_reg_params *p,
 			 const struct sys_reg_desc *r)
@@ -2830,6 +2843,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG(TTBR0_EL2, access_rw, reset_val, 0),
 	EL2_REG(TTBR1_EL2, access_rw, reset_val, 0),
 	EL2_REG(TCR_EL2, access_rw, reset_val, TCR_EL2_RES1),
+	EL2_REG(TCR2_EL2, access_tcr2_el2, reset_val, TCR2_EL2_RES1),
 	EL2_REG_VNCR(VTTBR_EL2, reset_val, 0),
 	EL2_REG_VNCR(VTCR_EL2, reset_val, 0),
 
-- 
2.39.2


