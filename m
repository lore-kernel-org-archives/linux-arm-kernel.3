Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0727EF41998
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPwxni+eXjIKRLJKiAFmJiy8evJEjDScu9f+RV9YxlM=; b=i4UFAYxpdhY0l/2r+57DRcG1E9
	YJATX+8IWR0JTjZ89eEzFiApJ0xA+gCMc7hb0SdvSFf+2Z0Ca9n7c3egccicJgRnNP4le9vnEPI9h
	cOJn+g0k6zY+JoDTiNtSLVU1LuvXDYK1zsiOB/ZP/XWx+inJgI4hRQwcCesUpiGLhTd+HqBQWLxFe
	h1xn3UEGC2Jwaao4oQESAXInwJuvtVnBDqY/3MKdyWgjnIRyshoBise625fypEc8pk8K04d8tJfzI
	+2tv23h1CmMnoP08hUB7Noo0dufDOSQGEQ/XGkbT2ihoMgzRtHL6HA17gnlDX82uxbPnKsOOVU6mU
	AMoPkWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyrK-000000014Ns-1MGp;
	Wed, 15 Apr 2026 11:56:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyrA-000000014Dl-1rKE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Apr 2026 11:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fPwxni+eXjIKRLJKiAFmJiy8evJEjDScu9f+RV9YxlM=; b=iTQWlVCEQ9AIFcTM1PwA3kabmJ
	IwgTJ7Kl4252aQnymwAVN+CAhEX2YYMoksq2KZ0ga+uFO+CW9Mipv6VLsIcpy4FU5jMIM6Bva6Fh4
	xFbwwJHJgT5gMd2o/4qFiTFSJRfeaJzZ4Cm+QsxTk8oQcs3H5y/K6oUAu3Fq6fuLRkDiHupuPkXxP
	PNJuZgxJngeVKyZ2ZcwZT94puZMMW3As+dk/LuWOtVebxFc2mZ66i8GH7Y/NVjN64JAUM4UffCUfi
	4tJKP2TYoqMjzv3h9mvKZLpE98+luggBqoF06Y8RJCF/dKcZ8ZRMJY9LqCcmeCgxmh1ZSk9fBPpqC
	r5om2CVg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr5-00000002NL3-1fOt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2A0B4408C;
	Wed, 15 Apr 2026 11:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D411C2BCB3;
	Wed, 15 Apr 2026 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254182;
	bh=9Dv/wj4BXR+93xnM/55FQRZfJhUM3XB6ykASoHyxW48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YOEQOpwrKpeAVAtutdhPnSNmmuaWL2dFm5B5BwMNFmLx2L4rz4DBQAaD4eY1eAZRl
	 TMSeOaIuMfPawL/I8MU0pTf5ROEKYs/XVXFqBFKjXbAl6dlIqLDpOHQvLJ+YBqiba5
	 P7Rtsfc3ffCVJDo4SYJPJ6brhusNWXaOgze3GiQIPmBrGVDj9/wwv6zkpYo/Cqysdc
	 G947tfPNy5HbP7ds7klnUCk2fxUNNmMhe5aSyH4XW5nzQb9eSRqYmeX1EZn9CIq2pO
	 nVtggc1Bb6zvkAKCE7/ZIOaMH8o8CQbdoQIYpco+uvWehgIfyFKE0SQ6M3SsGUXGCm
	 wsd69eVZl0f4Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyqy-0000000Bqsi-32Yq;
	Wed, 15 Apr 2026 11:56:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 08/18] KVM: arm64: vgic: Rationalise per-CPU irq accessor
Date: Wed, 15 Apr 2026 12:55:49 +0100
Message-ID: <20260415115559.2227718-9-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415115559.2227718-1-maz@kernel.org>
References: <20260415115559.2227718-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_125628_194498_46362B3E 
X-CRM114-Status: GOOD (  11.62  )
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

Despite adding the necessary infrastructure to identify irq types,
vgic_get_vcpu_irq() treats GICv5 PPIs in a special way, which
impairs the readability of the code.

Use the existing irq classifiers to handle per-CPU irqs for all
vgic types, and let the normal control flow reach global interrupt
handling without any v5-specific path.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 3ac6d49bc4876..b697678d68b01 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -106,24 +106,23 @@ struct vgic_irq *vgic_get_irq(struct kvm *kvm, u32 intid)
 
 struct vgic_irq *vgic_get_vcpu_irq(struct kvm_vcpu *vcpu, u32 intid)
 {
+	enum kvm_device_type type;
+
 	if (WARN_ON(!vcpu))
 		return NULL;
 
-	if (vgic_is_v5(vcpu->kvm)) {
-		u32 int_num, hwirq_id;
-
-		if (!__irq_is_ppi(KVM_DEV_TYPE_ARM_VGIC_V5, intid))
-			return NULL;
-
-		hwirq_id = FIELD_GET(GICV5_HWIRQ_ID, intid);
-		int_num = array_index_nospec(hwirq_id, VGIC_V5_NR_PRIVATE_IRQS);
+	type = vcpu->kvm->arch.vgic.vgic_model;
 
-		return &vcpu->arch.vgic_cpu.private_irqs[int_num];
-	}
+	if (__irq_is_sgi(type, intid) || __irq_is_ppi(type, intid)) {
+		switch (type) {
+		case KVM_DEV_TYPE_ARM_VGIC_V5:
+			intid = vgic_v5_get_hwirq_id(intid);
+			intid = array_index_nospec(intid, VGIC_V5_NR_PRIVATE_IRQS);
+			break;
+		default:
+			intid = array_index_nospec(intid, VGIC_NR_PRIVATE_IRQS);
+		}
 
-	/* SGIs and PPIs */
-	if (intid < VGIC_NR_PRIVATE_IRQS) {
-		intid = array_index_nospec(intid, VGIC_NR_PRIVATE_IRQS);
 		return &vcpu->arch.vgic_cpu.private_irqs[intid];
 	}
 
-- 
2.47.3


