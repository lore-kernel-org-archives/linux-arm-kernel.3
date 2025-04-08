Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60192C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwDcmgAWmeufY50yDC2CuJevFUEjf7PvRQjexMpprUs=; b=A/nVeWJyf3ORMPAziGb6uNpzmL
	Ql9smSNYWiigkpwAtxpcBVSJE5OzIOWTYTpQ5BEBVOpgQW/EuOM4gmAbw4/6Aiv/6qfc+xMN/7Sal
	LBH7TAYeBfF0j7gcEdt0eVWd9yHZbkDpNTpKMT3pz6c+iyQgsiuMad/90MVjRbAJYsaGLkVLhE5BB
	4fKzczu3FPSW5NBxla1cSjsAaH83aWLQXgUyNh00x0vgCTnD2L80pfgaj5Qu0se4zkdifpCXNVcaT
	0fwGrvg/50cPIJv5RFOhwryGRafrorUTaOU4qD/Gz1WeVQ+JUj2QChw7Ms70i0isZyQI+g+ZdW9BJ
	OMZW35jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28ls-00000004675-2uT4;
	Tue, 08 Apr 2025 13:13:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26ZR-00000003kaU-2tjx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 10:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EwDcmgAWmeufY50yDC2CuJevFUEjf7PvRQjexMpprUs=; b=TYidbP3A+fHqASZX/jwFX4M9zX
	WdzyDbD28tVKCryebtYGgZHZAhttPjEvGZQ+2kMhzO18DzSss98GzvJ/jWLASWiLM62QbYauU7jP9
	IYGNLk9f9akjsKYdQWaRIbr99U7pC6EenJW5vdXGo/+aPIIUYTnA0w3MyLOai3epNcjuzoJ/MDKVj
	4fIx21iHHKJvyA39POJ/aFBgrR6Pm2pJNJT84Ptk3pznfAHJ3X8of/pSCL7EucZGubVKbY4DArNJ/
	woPsS2se6gBBjkHNj4TKEzm1ZRbuNrMk765vVfWuRyRG1xh3uAYwHY9i98mORE2gF7bgjI28qDs9E
	1jf0frVA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26ZO-00000008GRY-3I3K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:52:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6A16FA4914A;
	Tue,  8 Apr 2025 10:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBC5C4CEEC;
	Tue,  8 Apr 2025 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109559;
	bh=IeQC/lrUj5/ZKIjhYrlGNAklBGcZvseS+XBP2CTkcNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IyKeCj3ZxButsIc9aejzQM9G/e+iTrNqeV0aI5Rad0p/n/I0tMCgB+lZ8qAPt7Lal
	 KoKdQtcbU5Y/8NGidzmofQvy+jEvcAZEVOBHdTpeFmN/ZX2oJ3qsuCPpS1TE5Lmp+h
	 DIynf9+nytK8xy3nqOyjSPR05+2IGqWudu9tUqRfd1QzQ4ybpuk3ZZy9lkXy/Iyjci
	 As+gcNOWWf2l9sByx6vSJSCopzdeOUQVR1+yw2zFgFoj0j+iCRRG7Z9I+7Dx2BcQdx
	 6y2R2Rw0EXcS8kUAoGdoKj5AdXOAZaFV1PYnafXSFSbxcoCEPTjbf91yA1MgDwgg2s
	 68pOI5JfyyuvA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u26ZJ-003QX2-RY;
	Tue, 08 Apr 2025 11:52:37 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 04/17] KVM: arm64: nv: Snapshot S1 ASID tagging information during walk
Date: Tue,  8 Apr 2025 11:52:12 +0100
Message-Id: <20250408105225.4002637-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250408105225.4002637-1-maz@kernel.org>
References: <20250408105225.4002637-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_115243_044815_9731B561 
X-CRM114-Status: GOOD (  12.80  )
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

We currently completely ignore any sort of ASID tagging during a S1
walk, as AT doesn't care about it.

However, such information is required if we are going to create
anything that looks like a TLB from this walk.

Let's capture it both the nG and ASID information while walking
the page tables.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h |  2 ++
 arch/arm64/kvm/at.c                 | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index c8a779b393c28..4ba3780cb7806 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -274,6 +274,8 @@ struct s1_walk_result {
 			u64	pa;
 			s8	level;
 			u8	APTable;
+			bool	nG;
+			u16	asid;
 			bool	UXNTable;
 			bool	PXNTable;
 			bool	uwxn;
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 6e6a8fa054e15..ff0651b829d07 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -410,6 +410,33 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	wr->pa = desc & GENMASK(47, va_bottom);
 	wr->pa |= va & GENMASK_ULL(va_bottom - 1, 0);
 
+	wr->nG = (wi->regime != TR_EL2) && (desc & PTE_NG);
+	if (wr->nG) {
+		u64 asid_ttbr, tcr;
+
+		switch (wi->regime) {
+		case TR_EL10:
+			tcr = vcpu_read_sys_reg(vcpu, TCR_EL1);
+			asid_ttbr = ((tcr & TCR_A1) ?
+				     vcpu_read_sys_reg(vcpu, TTBR1_EL1) :
+				     vcpu_read_sys_reg(vcpu, TTBR0_EL1));
+			break;
+		case TR_EL20:
+			tcr = vcpu_read_sys_reg(vcpu, TCR_EL2);
+			asid_ttbr = ((tcr & TCR_A1) ?
+				     vcpu_read_sys_reg(vcpu, TTBR1_EL2) :
+				     vcpu_read_sys_reg(vcpu, TTBR0_EL2));
+			break;
+		default:
+			BUG();
+		}
+
+		wr->asid = FIELD_GET(TTBR_ASID_MASK, asid_ttbr);
+		if (!kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR0_EL1, ASIDBITS, 16) ||
+		    !(tcr & TCR_ASID16))
+			wr->asid &= GENMASK(7, 0);
+	}
+
 	return 0;
 
 addrsz:
-- 
2.39.2


