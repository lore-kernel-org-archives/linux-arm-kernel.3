Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A146CA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYtR1M/6ZfPBDMq0CnJpLKzfzsT/eoXUfhR57UXueyQ=; b=zmZEiRnY61l9xhfY3UlisTPC4d
	qtXon7V4srVw7yFIe61XUo/Ntw874yN4oQogDM2KDXbYFeMHgeniiNiWVbqjBvK1tLVyPjs17kjxM
	sNiLOHBBKtPdDjDFsOofxSTIS6KcVejkhpkoBWP1CW1hbLCyREHv9epBI4AGs2R/kAZIZO3r+HuAQ
	4s2kirM5omwXIvyhs9qpAhKI3f/umUlOXNNL55JBjwduW8jhoL79YJdZ8fYGuiY9oXk61ct8YLC7K
	uesAd50YAWT8veKw9nEyfmuvE+hamMAMwx73LUmUmR6ZdBLG6aJDUslmMqrYYTeAGpBpic6MPoY9q
	c9E/7zQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeh3-0000000FxKy-3bt5;
	Mon, 05 Oct 2026 09:09:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeh2-0000000FxJ9-3gWc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 05 Oct 2026 09:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XYtR1M/6ZfPBDMq0CnJpLKzfzsT/eoXUfhR57UXueyQ=; b=SrjnOtWREcAVJDShGbLPyNxkIa
	Ew1HRfr1teoMHjKZveETy/IUp/hl2s0Mxy6pjb9uYGIIOLx3veR7ESWpkc+wGpv7O3qqfMSjs3NhR
	1KdZT+YNrmiPr5MSPCmXRtUwYCjQbKp0iBJZL452HlIduVJqFLZT7BGu7B4x2mikwg8vFdRwd2M19
	2/xexgIRLNfMm3BzzYHG9qmvdWH13nOuVNXJbaU/ErRd3vHX/PwBIAOONPVWkdziyGn4LjVl9v9l0
	u8677n3TJzUK89Wab21e5cchNg+6Jq951e3m/IRoLeNqeWq3vsO23gC6bdk37KJGbey2gOENy2HAT
	McLplzcQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xDegz-00000007kqH-2U9w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:09:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C7351684;
	Mon,  5 Oct 2026 02:08:59 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EE1EE3F66F;
	Mon,  5 Oct 2026 02:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791191342; bh=H+4kqsPac3dmJA9PfDo6eks6Egeh4gjjwuOEOQNZra0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kB5cmTdC3/QvQPvMHhhzr4ilHk/vLTJ1DRe2iz5TSOF2On9v/1dzIXbH56Gwkbwl+
	 b0krWpkb3oZRm5uF33KjmSbe6YwXjH0/CvoItNnd/E31DdN23kaLqCuBiFjA3SS8p8
	 Rg3oLAyj+i0TZVIrar8E2auShoGvx5Iyyg3ELDTo=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v22 17/23] KVM: arm64: CCA: Add bare minimal S2 operations for Realm
Date: Mon,  5 Oct 2026 10:07:48 +0100
Message-ID: <20261005090754.2140522-18-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005090754.2140522-1-suzuki.poulose@arm.com>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_100906_232328_D46B907A 
X-CRM114-Status: GOOD (  13.87  )
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

Add bare minimal MMU operation hooks for Realms. The mem_abort handling
is chosen as the default KVM variant. However this cannot be reached for
Realms yet and we would need real RMI command support to make it fully
functional. Similarly, unmapping stage2 requires RMI command support.
Until then reuse follow protected pKVM hook and ignore unmapping.
This will be addressed in the later series.

RMM takes care of the TLB flushing as required, when the Stage2 is
modified. So host doesn't need to do anything explicitly. RMM doesn't
support access flags for the stage2, even for the shared IPA.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v21:
 - Reuse no_age_gfn for Realms. Also use no_stage2_unmap_range for
   now, until we get proper RMI backed driver.
---
 arch/arm64/kvm/mmu.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 909ea3f545e83..58bc6a85f48b4 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -180,6 +180,12 @@ static int kvm_vm_flush_remote_tlbs(struct kvm *kvm)
 	return 0;
 }
 
+static int realm_flush_remote_tlbs(struct kvm *kvm)
+{
+	/* Nothing to do here, RMM does the job */
+	return 0;
+}
+
 /**
  * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
  * @kvm:	pointer to kvm structure.
@@ -207,6 +213,13 @@ static int kvm_vm_flush_remote_tlbs_range(struct kvm *kvm,
 	return 0;
 }
 
+static int realm_flush_remote_tlbs_range(struct kvm *kvm,
+					 gfn_t gfn, u64 nr_pages)
+{
+	/* Nothing to do here, RMM does the job */
+	return 0;
+}
+
 int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
 				     gfn_t gfn, u64 nr_pages)
 {
@@ -2896,6 +2909,16 @@ static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
 	.vm_mem_abort			= kvm_vm_mem_abort,
 };
 
+static const struct kvm_vm_s2_ops realm_vm_s2_ops = {
+	.vm_flush_remote_tlbs		= realm_flush_remote_tlbs,
+	.vm_flush_remote_tlbs_range	= realm_flush_remote_tlbs_range,
+	.vm_age_gfn			= no_age_gfn,
+	.vm_test_age_gfn		= no_age_gfn,
+	/* Until we get proper support for unmap */
+	.vm_stage2_unmap_range		= no_stage2_unmap_range,
+	.vm_mem_abort			= kvm_vm_mem_abort,
+};
+
 #define KVM_VM_S2_OPS(flavor, ops)		\
 		[flavor] = &(ops)
 
-- 
2.43.0


