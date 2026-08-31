Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A113FC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XASNgmZLqsPyycYQ/bYdMy9OFUeM2/DQAIAxLs3XEpc=; b=3SsaGhxmFIKLceE5WL3BNnHQgb
	txORDylA8TityQz8Atc6zbkQVl+1UTd82ZO/xT8RqKiYhmSuK7vEHUUUlnLGUoGSt9INgz5yTz+lz
	1sREuot63PHb4WA7doOCx+k2dozvS/mSem/2FkdA383dtikQI5uONy/thA+Ab/OJechjVEzePA2zK
	mXJ/v4Y7iiXBRUPEdF6KLcejcyVNX6tsH8AxRRqV4HcwTxMrc6LQn+GcvK7p0QTULIrz+2oKvNn7z
	rWhn04YXdt7yEwUjrVGCMmVGhI9OuORHWfkphdUw7FcrPkvNhocB6KMlM1tQZS/NN2k+N+EU4ntCR
	njh6xhvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14y5-0000000A3fX-2HNu;
	Mon, 31 Aug 2026 16:34:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14xs-0000000A3Wm-2b8v
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 31 Aug 2026 16:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XASNgmZLqsPyycYQ/bYdMy9OFUeM2/DQAIAxLs3XEpc=; b=Zp/HPysRfp52MlvQIeu1Hkoy6O
	yycbioO0/DqjwmuughiUS43J3+IZtIgwJOdDynJ9LLDk+Yq0PU9JsZyauz92tnxyYiJb4tkNJdh0g
	/rbT7R0Dt5JHmnuDFN8O8C0Hoiz3NifsG/nniM1+6tAzgolyHCYlyDX9MxETO0Fi7JpV8cL59kH5Y
	7HqKgbJNF0h9YHaw0pDuJiROpnr7NXL1v7b9n4G4e9FHXL+ygxOSw1WSW1J8y7UpPxVQQKy0/cJn7
	cyzS1ejIWSqb2tIt7T625qMzNA3X8Kre8kUljwo+eIXodF2+R0lWsuNNugl9MQWBCDjFeP8nDod8l
	jLPt/dIA==;
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x14xp-0000000A3cm-1ogb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:34:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PJujOV+1Z+2Pic9F+Xx2wknBh2QM3e+/EoajCgxNjqc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788194063; v=1; x=1788798863;
 b=X6pQZJbZ69yGH+cU7Rqp0jtm1AXp2YM3wzkKGq6CP4rVARiVzT0NEBFeJ+BQ87St12hoham1
 ILpv/LHz+oKKsD6MrxhiSKtgAQLYZSvoAfYhjOgggYLhLmGjW6scxyWlXYr38tev1W5bfSdi8wz
 ZyjSa7KWmokn07PcEvLRWuWY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 914f3f102f58101c;
	Mon, 31 Aug 2026 16:34:23 +0000
X-Mizu-Trace-ID: 914f3f102f58101c
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
Subject: [PATCH 01/17] KVM: arm64: Sync HCR_EL2.VSE back to the host vCPU under pKVM
Date: Mon, 31 Aug 2026 17:34:05 +0100
Message-Id: <20260831163421.272420-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260831163421.272420-1-fuad.tabba@linux.dev>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_173429_577344_1CBF5BEC 
X-CRM114-Status: GOOD (  10.45  )
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

flush_hyp_vcpu() copies HCR_EL2.VSE from the host vCPU into the hyp
vCPU on every entry, and nothing copies it back. Once the guest takes
the vSError the hyp vCPU's copy clears with the hardware bit while the
host's stays set, so the next entry pends the same SError again,
KVM_GET_VCPU_EVENTS keeps reporting it, and kvm_arch_vcpu_runnable()
never lets the vCPU block in WFI.

Reflect VSE back on every exit, which the flush-side comment already
states.

Fixes: 734dc8c01c838 ("KVM: arm64: Implement lazy vCPU state sync for non-protected guests")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9a3b92e626adb..b6bfe502bcd04 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -276,6 +276,10 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	host_vcpu->arch.iflags		= hyp_vcpu->vcpu.arch.iflags;
 
+	/* Cleared by hardware once the guest takes the vSError. */
+	host_vcpu->arch.hcr_el2 &= ~HCR_VSE;
+	host_vcpu->arch.hcr_el2 |= hyp_vcpu->vcpu.arch.hcr_el2 & HCR_VSE;
+
 	sync_hyp_vgic_state(hyp_vcpu);
 }
 
-- 
2.39.5


