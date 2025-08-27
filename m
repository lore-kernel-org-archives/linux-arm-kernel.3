Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4C5CA0FFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juVlkaqc60SCZZV4qb/RKOdcFDaO35Z2ogMnii6jLCo=; b=iHHupEa5NcaQO+/NlsF3VnqQaY
	tfv5kRw/2uhguUR+Lbmjh24HLRoVBzHS91o3RH+IWB8npfPqjjqmt35eA6oJ8/aXDiK3qKkHQh17j
	YdU3RJgz7eDhKDd60hwBlwZi1nzByE7w4N3Hn0iUVul7gFd1lTUPbgKsrkvCM/ePz+dmSwGrZxoWl
	AAp4CSooVyC5iIkuyIy8WMGcaZzIh4/xORd52352dB2RKLvlbgxEZoDQGo52XceNE4l78dEhGwy3E
	8ztoUQk6/6kPFT4av+DU7+cT6fLFFg5DJgStF75kEQX2waE3nsMG0wKpQ5w64E9+3KhnbHyAGqqbJ
	Phdv7EwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbu-0000000GZEd-1K3B;
	Wed, 27 Aug 2025 19:15:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIji-0000000G8rV-0iUA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 Aug 2025 16:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=juVlkaqc60SCZZV4qb/RKOdcFDaO35Z2ogMnii6jLCo=; b=EIa1xuHt0oAnpSpP3JHUjnHxpo
	bmYU0+x1TAScD8EVBurp/sx/BstG76y87OaTk5rnu0PU+R3nxSfrz6HxkIYY4k1vV8Rjie+3C7E2Q
	d7pW/LUaflXpEx7PcsjkdQ/9vNNrG73c64Dw4Ai0j31ev6wpRpu0dU2NXdRUlYOtUkNhPdxsobRC2
	gvexavPLHqezIR6FYE5YH4hCi0Xu67LP4s3t+a/gzenrX2/oM9Q3cOmZlN1iPVNuNJ4Mhaw5bZi2e
	uHjYwJIK9J07S9DkXJtLxlGSLWG+iGPJPqH3VRBECbdQ+AD4V/rkyw6J+nZJB2XXVo1DJxhI6ADBn
	r9JabHGw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIje-00000002TAr-3AEU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:10:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5722644B91;
	Wed, 27 Aug 2025 16:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E73C4CEEB;
	Wed, 27 Aug 2025 16:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311051;
	bh=z2QNt9RWN4zT8Ci51cyrFFeAAtDEFGBEVB1qDDNY7qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VuTmxL6w/vaN7bCsdjsNiSafrHPqIO7Y1cxq7I1OTmwTYPOSyY77n/9UsP8T9IAwI
	 A2QLBFKn+1ZlchfSobF5WS2whfV5h2jJ+xt1+a7+AYcmSs6CuYCxfAbOBQaT4xiUP+
	 3eK9FGIMcetdAFbn86woZFNGjN9C/ZNw3Y6j5X9ylgiWfO1zU43iFMalXCD0qglvGy
	 T7/h0hT62usau7HIcwizJzqHQWjcC5RtbDnxK5r3RxIyY7yar2GYKHqYl9powgw+CQ
	 bbNK1Wc8BFKBnjwfNjHsg57FxkmYeXTQMQebxsjYnfzud0wL1//0cCwMmTCf0o+1IZ
	 XCdK6970s03Fw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1urIjZ-00000000yGc-20oF;
	Wed, 27 Aug 2025 16:10:49 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 15/16] KVM: arm64: Populate level on S1PTW SEA injection
Date: Wed, 27 Aug 2025 17:10:37 +0100
Message-Id: <20250827161039.938958-16-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250827161039.938958-1-maz@kernel.org>
References: <20250827161039.938958-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_171055_240069_7B4357AE 
X-CRM114-Status: GOOD (  16.48  )
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

Our fault injection mechanism is mildly primitive, and doesn't
really implement the architecture when it comes to reporting
the level of a failing S1 PTW (we blindly report a SEA outside
of a PTW).

Now that we can walk the S1 page tables and look for a particular
IPA in the descriptors, it is pretty easy to improve the SEA
injection code.

Note that we only do it for AArch64 guests, and that 32bit guests
are left to their own device (oddly enough, I don't fancy writing
a 32bit PTW...).

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/inject_fault.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index 6745f38b64f9c..dfcd66c655179 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -106,7 +106,30 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 {
 	unsigned long cpsr = *vcpu_cpsr(vcpu);
 	bool is_aarch32 = vcpu_mode_is_32bit(vcpu);
-	u64 esr = 0;
+	u64 esr = 0, fsc;
+	int level;
+
+	/*
+	 * If injecting an abort from a failed S1PTW, rewalk the S1 PTs to
+	 * find the failing level. If we can't find it, assume the error was
+	 * transient and restart without changing the state.
+	 */
+	if (kvm_vcpu_abt_iss1tw(vcpu)) {
+		u64 hpfar = kvm_vcpu_get_fault_ipa(vcpu);
+		int ret;
+
+		if (hpfar == INVALID_GPA)
+			return;
+
+		ret = __kvm_find_s1_desc_level(vcpu, addr, hpfar, &level);
+		if (ret)
+			return;
+
+		WARN_ON_ONCE(level < -1 || level > 3);
+		fsc = ESR_ELx_FSC_SEA_TTW(level);
+	} else {
+		fsc = ESR_ELx_FSC_EXTABT;
+	}
 
 	/* This delight is brought to you by FEAT_DoubleFault2. */
 	if (effective_sctlr2_ease(vcpu))
@@ -133,7 +156,7 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 	if (!is_iabt)
 		esr |= ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT;
 
-	esr |= ESR_ELx_FSC_EXTABT;
+	esr |= fsc;
 
 	vcpu_write_sys_reg(vcpu, addr, exception_far_elx(vcpu));
 	vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
-- 
2.39.2


