Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C515CC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzP6SDztjDOnvRYg9UZXm7XpZhK1Ey/RVwG8s/v52TI=; b=rEUom6tHUWrvbLDJnP4PYCqqdC
	IQs88viCVD+wfzDbAjgkFllhafDu7sKpMDEJzNPzg/llkHX+/mqiVvELWX1FR4dSsqD2aDD3a1L9G
	i/64cOy+nGGdO2+uoGtZ8n6FNj0FzQV9FHx2dJzUL1CDkq1MTPKEMLk0qaaciMrFPrEM616rqncFN
	bOkMa07dfAUsw5B9XiDWhX7fOWCcCeP7BVU0qGfWpc3n43OGlmENtgUIntGiJ4wUXfpJR4K8flPyU
	D8Y9apUVs35uKdjJ2prPMkl/9nEPF8zYt1Hurs+BQ6g8RnVjbGEf9eLvBRhfLBMSj+wwaYG5mKbpV
	76bYE6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Omg-00000005g0j-25LH;
	Tue, 15 Sep 2026 08:44:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Omb-00000005fy7-114s
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 08:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XzP6SDztjDOnvRYg9UZXm7XpZhK1Ey/RVwG8s/v52TI=; b=crPil6fMJiUS3eSVufbANmbmn5
	n5K8KnHYhMCYWfAR1qdbDrJ5WO7iQ4DL5OfsHSs4z1lVIkeHJFoR9tzwg4uETU17wvbFmdL9KXJea
	LdX0fSOutxpKl1u/5+iFq/MRAuRnOHuCSCn07eFwhCWejaLFYWfVOHRHAAq1kziccEEzOI2CX9UDd
	qJjsUlefbSyvcOjs5G5XuiOhh2AI6s0xpJKVwhNU+7xV+7ZZVMmOOBBEIw/6mhr/s4gDJvq/J0rcl
	Lt5ulyNs7FuB3HpyaeDGuhoZNMrgyItFaNUgVDVNdG2ntcB51ZvuOidUaZYA1LaPrTfH1yMA72XDU
	K713Ogaw==;
Received: from out-84.mta0.migadu.com ([2001:41d0:1004:224b::54] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6OmY-00000006Rz9-0ycs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:44:52 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=cfJHLD9q9zHmMljo9vPmqqbTUt1+su2cEdMIw8eDGo0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789461887; v=1; x=1790066687;
 b=wWIoWV5cpeF748EZKF4qUjmySh+AeOazXhk3ZpzY9g4wi78jsEF6B7/+HQb3FJKrpDn30guD
 Jbh65kcGcmxMcaRUxAxNVQUNgX09uNekzmWpiofDl1xfyETXnYybGmTVNM500yHhsrX6RnhjhcD
 9J2Bcb3uhcqMz7YIJAgT33SI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 53447c2444ce877a;
	Tue, 15 Sep 2026 08:44:46 +0000
X-Mizu-Trace-ID: 53447c2444ce877a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] KVM: Fix comments that refer to the non-existent VCPU_RUN ioctl
Date: Tue, 15 Sep 2026 09:44:39 +0100
Message-Id: <20260915084441.3846947-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260915084441.3846947-1-fuad.tabba@linux.dev>
References: <20260915084441.3846947-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_094450_595130_2EB7D78C 
X-CRM114-Status: GOOD (  11.96  )
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

Neither the VCPU_RUN in kvm_main.c nor the VCPU RUN in kvm_host.h names
an ioctl that exists. The one that enters the guest is KVM_RUN, so refer
to it by that name.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 include/linux/kvm_host.h | 2 +-
 virt/kvm/kvm_main.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 03bfc92864b6e..acae5a61e7f8f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -562,7 +562,7 @@ static inline int kvm_vcpu_exiting_guest_mode(struct kvm_vcpu *vcpu)
 	/*
 	 * The memory barrier ensures a previous write to vcpu->requests cannot
 	 * be reordered with the read of vcpu->mode.  It pairs with the general
-	 * memory barrier following the write of vcpu->mode in VCPU RUN.
+	 * memory barrier following the write of vcpu->mode in KVM_RUN.
 	 */
 	smp_mb__before_atomic();
 	return cmpxchg(&vcpu->mode, IN_GUEST_MODE, EXITING_GUEST_MODE);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 65eb26a0520d8..cc391b0666a6d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -470,7 +470,7 @@ static void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
 	kvm_dirty_ring_free(&vcpu->dirty_ring);
 
 	/*
-	 * No need for rcu_read_lock as VCPU_RUN is the only place that changes
+	 * No need for rcu_read_lock as KVM_RUN is the only place that changes
 	 * the vcpu->pid pointer, and at destruction time all file descriptors
 	 * are already gone.
 	 */
-- 
2.39.5


