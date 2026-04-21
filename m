Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25772F8FA90
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mGHowqlkhnvPIJdGbn1Su1BmTTCjZzOEKR7Ulucq9pI=; b=XzNya5vU+e8Q8+76oi6harfy7A
	KRFiMCyRR+XSdLmguDl5vZwndxDfh1mFwDzT1U64FKlJfhnI4EKXGqP1xW8B1gbm/OtVoCjTm+w24
	R3Hh07LzCpexGVZ3Hv9ne7Er77eG06T67loqw939ZKvtIxyOtP/WrayvqdGYNpakt3E/yGvtea61Q
	H/Bzoyh+2gwtaUZuE75qnlLnBZNeKzFP70PJr3R43a7uriIZGPB855JY8y27xrqtGmkaN3FVpdfbv
	t5F2ylssLLA2ekIJBcjQ/9FU4DvX7Cevy4HrA8Ak9T/rPimvAAw5QTf2BknD5CPJw4vCU4NlaxM0p
	QDn7iTCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEA6-00000008vT7-04Pu;
	Tue, 21 Apr 2026 16:41:22 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEA3-00000008vSh-0hiI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 16:41:20 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso41381695ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 09:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776789677; x=1777394477; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mGHowqlkhnvPIJdGbn1Su1BmTTCjZzOEKR7Ulucq9pI=;
        b=AjzK9wE0Gx4oNb7aBJMNjMJb6wBVIGWgxYvuwWpy3uijWa9p8WvxEqKN0DjBa+lnI1
         /Y1CmxYv8PLaa6QOpfNw9J3ISiiquVHMl18L39aFa7WawlA02HM5M3F13qvxYjdmPWx9
         GPf9rmUvs6SuyUdMnii6U8UmsvcMqnydT97DJIIZXxV/7g6oY7B1V77abLj0x2Q2Dpb4
         szDTXcOWhvuJdc50B5XI5g72f2ZynwjGUh3/0pgJb66dvsC0btz8nzj7K9sf63zhuLbH
         J88PNN/a+435e2+3iMEN2Q+2yLjunkNqhWz28Y5kvbBgnCMqOIi0wDNhN9PSmuRoeExe
         7WIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776789677; x=1777394477;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mGHowqlkhnvPIJdGbn1Su1BmTTCjZzOEKR7Ulucq9pI=;
        b=fSIzkiB/gtujqAtBqLOdDEqqvxcAns/U4ceHyQX6XSpgYHCUwCFo9Hw5yD/uB9JGk7
         rlGtm7EdZqVBd+SagB8B27foLgh2M/FYrGcWixuV9+IrVKKqMJ9mFqcLCoFwN1xUq53+
         JRwicApKwCevWFWh0EHshbyaQN2JUFcLK4NZLrX1ft5EWXIMb7KEgafWC2TGr1x4SwIH
         nVleyw1UCcxmq345YG354tcgNYCKT/HvGeI7m3QToXhAk66imlYP8TMOY4tfR6VFYndG
         xQIjG5X/ddZ+jnLOZSWuuP3OKnGk5X3KQdsHYF+ZL0CKGw6pCxvf+v8WU70nLiqmXpu6
         CWRw==
X-Forwarded-Encrypted: i=1; AFNElJ9mcNndiMSUB8YVKQ0J/2rQRW5oxqfDblI1nAIDCOI9c4BSvFygfc6NwhZJCjlpzJiZEVdOSs7M4jsWrrnYPhWv@lists.infradead.org
X-Gm-Message-State: AOJu0YyVTMm/kmIDS/Z+3HCzS//kcNVXzKjRZU1TRtD4KVASWFX5YI0R
	MRls4fpGOyMi9zbhtPZ+NxQHeuaX6A5hmoKiJ0Z0LRzZoVWosQh298Y5WEOow0sDlI5r04b8OTc
	c+JPJlsScKrk3hmhgM/xPlJdQzA==
X-Received: from plik3.prod.google.com ([2002:a17:903:3843:b0:2ae:bb1f:5234])
 (user=jingzhangos job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1ac6:b0:2b2:5840:808e with SMTP id d9443c01a7336-2b5f9ee9487mr187401765ad.10.1776789676962;
 Tue, 21 Apr 2026 09:41:16 -0700 (PDT)
Date: Tue, 21 Apr 2026 09:41:12 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260421164112.2448553-1-jingzhangos@google.com>
Subject: [PATCH] KVM: arm64: Treat ID_AA64DFR0_EL1.PMUVer as an unsigned field
From: Jing Zhang <jingzhangos@google.com>
To: KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.linux.dev>, 
	ARMLinux <linux-arm-kernel@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_094119_210558_5A7DF85A 
X-CRM114-Status: GOOD (  13.99  )
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

ID_AA64DFR0_EL1.PMUVer is an unsigned 4-bit field, but was historically
marked as signed in the cpufeature table. This led
kvm_init_host_debug_data() to fail detection of PMUv3 implementation on
systems with PMUv3p8 or newer, as the signed extraction of the field
(e.g., 0b1000 for PMUv3p8) would result in a negative value.

Fix this by marking the field as unsigned in the ftr_id_aa64dfr0 table
and updating the KVM initialization code to use unsigned extraction.
While at it, ensure that both the 'Not Implemented' (0b0000) and
'Implementation Defined' (0b1111) values are correctly handled as
indicating the absence of a standard PMUv3.

Signed-off-by: Jing Zhang <jingzhangos@google.com>
---
 arch/arm64/kernel/cpufeature.c | 2 +-
 arch/arm64/kvm/debug.c         | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 32c2dbcc0c641..1b5e37a1a41b4 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -565,7 +565,7 @@ static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
 	 * We can instantiate multiple PMU instances with different levels
 	 * of support.
 	 */
-	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_AA64DFR0_EL1_PMUVer_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_AA64DFR0_EL1_PMUVer_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_EXACT, ID_AA64DFR0_EL1_DebugVer_SHIFT, 4, 0x6),
 	ARM64_FTR_END,
 };
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 3ad6b7c6e4ba7..2834d7ef9dedb 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -75,8 +75,10 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 void kvm_init_host_debug_data(void)
 {
 	u64 dfr0 = read_sysreg(id_aa64dfr0_el1);
+	u64 pmuver;
 
-	if (cpuid_feature_extract_signed_field(dfr0, ID_AA64DFR0_EL1_PMUVer_SHIFT) > 0)
+	pmuver = cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_PMUVer_SHIFT);
+	if (pmuv3_implemented(pmuver))
 		*host_data_ptr(nr_event_counters) = FIELD_GET(ARMV8_PMU_PMCR_N,
 							      read_sysreg(pmcr_el0));
 
-- 
2.54.0.rc1.555.g9c883467ad-goog


