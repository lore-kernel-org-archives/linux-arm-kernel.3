Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010DEF33A77
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KpvhV6Z2Zijz5Hjqf4/fTvOjLDrcBtYutGDN8npgmk=; b=e8rsNrmO7a5O2cMJ9isaxlkMpT
	Y2jJNC13mwtm47xkK6WUWB1bQ98wISftO8BLAVt+HR9swoI5Ucb/SpVue7rjjEgQ8ye6Cd/w6Yrr+
	lVxfWHywBeL8eA0Wpwb9DPWO02t26pse1unWPM19NaHpN7kwoElojW6AjP37RZNIB0AxMWtriRp8m
	88oMLecYVbDTFpXS4DW+aoYTSEpajyoDA/zTSecg1Y+lQSIDRkC5SShWXKBnRXNR7n7hAK26StaTU
	0NBsdvsRZffEXrYrGEjXY7jDLtJozGvNJqJAt2/NxZBRIjqtsQ9ioolCM/2GrfiB/VoltRonKX1g2
	Yq1mgh8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9wU-000000021Kt-1izT;
	Thu, 05 Mar 2026 14:44:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9wT-000000021JN-1YU9
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 14:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+KpvhV6Z2Zijz5Hjqf4/fTvOjLDrcBtYutGDN8npgmk=; b=prB0sQZhys8QpbmfdAZK6wHEoT
	iISUtC8B8YRRi8qqn+9wlP8LyAfqsHXmOH894tATNHkiwZpWVImLsflmEI4n2xFUP/O3xfrfp+Jjl
	NbeLVbgL+GpYhFjhmxl62pCcEpchfwZ7zaCOJjKIPFceBxeMA3JOjqcpGb5opf2sjABDIinjTGcZO
	G9PVhoQUynEjul15xjMqs3a/gp1yNJRgHQjMeYs1/hQW2j4x8OJTZm9Jk+XCb0stnlyFeaAYT9NDR
	AtdBNudUcJnTAxWZnoawfYP9tul/V+Zx28h1yE2qP2ig61wgpQNoioOGwKdiXo5JjnNrjLf04T60M
	UiTZTgPg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9wQ-00000006yBm-2qIc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:44:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CBF9E416CE;
	Thu,  5 Mar 2026 14:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56CEC19423;
	Thu,  5 Mar 2026 14:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721878;
	bh=g/Zjk5jkRbl4Sru6ybglMk9XL7QaR20Q/om4UqiG45E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FC4PWwroYFK09krMxS/0KwvZpeApYiaRGBBSKLDOusrbSEvExxom4WCxG9Cc+p8xm
	 2dgz3hReqd0jxyldbwAmSod/tx7oy47rS2SXfZm5YOp5LH+X9cs7J+fCOmLFfAduWp
	 zrrhRqjDZOvGLwhmIx8lPKdO/aBND+kD8zEvna/N1Gca3CWarRR8lnTRBSkAzXdBcR
	 MdaYacLyet65jC6OsF6SLgVfbzsnN4YxOIjmKH917ntjAUVBeMx0+dhpTYlT2B4O6l
	 fzJQJVn9DGJiq68vSxzvnuHaN6uA7wpfg4jCoxXmHAvHDVNFXeN36aJ9UDknrFA9Vn
	 CvpHdbtKurk5w==
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
Subject: [PATCH v3 08/36] KVM: arm64: Prevent unsupported memslot operations on protected VMs
Date: Thu,  5 Mar 2026 14:43:21 +0000
Message-ID: <20260305144351.17071-9-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_144442_889876_8C6BE86E 
X-CRM114-Status: GOOD (  10.44  )
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

Protected VMs do not support deleting or moving memslots after first
run nor do they support read-only or dirty logging.

Return -EPERM to userspace if such an operation is attempted.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/mmu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 43632c69adaf..9d183df0b0ac 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2410,6 +2410,19 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	hva_t hva, reg_end;
 	int ret = 0;
 
+	if (kvm_vm_is_protected(kvm)) {
+		/* Cannot modify memslots once a pVM has run. */
+		if (pkvm_hyp_vm_is_created(kvm) &&
+		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE)) {
+			return -EPERM;
+		}
+
+		if (new &&
+		    new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)) {
+			return -EPERM;
+		}
+	}
+
 	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
 			change != KVM_MR_FLAGS_ONLY)
 		return 0;
-- 
2.53.0.473.g4a7958ca14-goog


