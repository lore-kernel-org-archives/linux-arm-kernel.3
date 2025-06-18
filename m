Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B13C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 04:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=He9GMZwZGhbuABKsoN3wz9xUeb4JLf+qOIjtO6Uhl9c=; b=smr2O84sOyvGmAP80TzqiMVXL8
	ux0PODLK1cRCc4cuvlwFu/dcJKZFjsKduxFhiHZ4RQGU+eTyIZL0g7+jd96EbDpqW7foS20NumUrb
	sWnKlouPOSs8rNf3I3lV+flf00DVrbY22A4zJUtcbaPuIqsbnbWWdoloi37mkx7nXRbUwP8z2hhHx
	phaHb9UyMBWvvkRK6FjaZgqsB31dvePXLvmYSP2E/4LFcfl2RYFAbFOuntnl+J9ipAya1q4k63y7O
	lBWAQzeHQ8SDkvG7eyau7CLJu/pqzs/44/5dx0kiZ5zPxe3uD66y/H6HW6s5pKm/CwbFHiyt558Kf
	Jf7a0/aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkYa-000000091pX-1KPU;
	Wed, 18 Jun 2025 04:37:52 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLk-00000008zpN-1f41
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:24:38 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-235f6b829cfso51739735ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 21:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220675; x=1750825475; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=He9GMZwZGhbuABKsoN3wz9xUeb4JLf+qOIjtO6Uhl9c=;
        b=iv8B5FprEV8tE9Sr8SbTeEgDFb1pQGTuz7y/SH/ovpiMZvzaKylkqynrxG/js0awgL
         z7H/FADJP6VSKbTTz0WzhjLKrkDa8W6TOdqUz+WHjr5oO0BgWvQOi5aXOLwbO38nmx3U
         BOBU3tJetCiE/Zq4Z0++YIqSFJHKCl/BYeHfDJBDUjkdqDBGDuCoJ5Myv9FnTdVmrXNU
         SjFnXBhoqTm+P9HsQiAy53JQQ4Mp2HZfidu9sJPSTad9sKMB6pZJ23pt7ZytqrIh31cp
         Sp5Mt4iEMbo2O2lqIRUzICCiiprKs4nDW4xC6edYMUPcd/GCO4be9eYJSgOi6ReO9nsz
         tz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220675; x=1750825475;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=He9GMZwZGhbuABKsoN3wz9xUeb4JLf+qOIjtO6Uhl9c=;
        b=kMzn8FOzt2cliXxowxqS3TmGR9rbwnQGCSZKDaG4+xN4P7cjWkXIloZm1QDLr5sJVJ
         1WEHOUV5mBFoaK5fWhc2+ulK1HMSEeyCS7hzq6Y+28VMgjsxFfaXx7BiOtB8utN96i8/
         avlvxLpSnGVeHENMYUdxm0Nnrs1OskQHuO4FbnZJgaQwNquuDGQUHUC2DnBfITmXAMqN
         rUamSE/sFpijQhFw3R9YDOcTiBukhFXwGgnmZyG74naHfydQ+2Va0rlLuL1INEOy6g8i
         GNOEJ+86uucjBkvNLMZRsp6//Q3h4ZJjrSV1F+7VuiylI8C8V1Zr0hX33MGzeJLg+VoN
         P5WA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+COzwAlB/EVJDFK2SqKeoyzT2GqQ5+fIhE9KbRSpBmUMK6hnUQBIQD6I1CoJNNTGu97x39en5W5rFr2aKeQ2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6yzpsfY7shJfb2ubzgFpTgwNfhRRdQYCoLbHi8p/fEo+1iIFg
	YHYaxb+W79fmpFak2u0WXSKa56ZMa7tHRgOoLECUbxJNMXMMF7S2UecmuM4vgnGEwrB2z0Iv4DH
	zsE37i3d7ueC1PJX7JgQMbw==
X-Google-Smtp-Source: AGHT+IEz+sYmwmOj4IeHxcE6XX3uQvv4AyNEb1cpKl7A16mtz5cSX2RNnd2uZJbF+w+tZiQScGXmjNJtGrMaKECU
X-Received: from pjtd15.prod.google.com ([2002:a17:90b:4f:b0:30a:31eb:ec8e])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:dacc:b0:234:c8f6:1b05 with SMTP id d9443c01a7336-2366b3fe725mr232646505ad.52.1750220674878;
 Tue, 17 Jun 2025 21:24:34 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:14 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-6-jthoughton@google.com>
Subject: [PATCH v3 05/15] KVM: x86: Add support for KVM userfault exits
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_212436_434060_FD917D75 
X-CRM114-Status: GOOD (  19.90  )
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

Only a few changes are needed to support KVM userfault exits on x86:

1. Adjust kvm_mmu_hugepage_adjust() to force pages to be mapped at 4K
   while KVM_MEM_USERFAULT is enabled.
2. Return -EFAULT when kvm_do_userfault() when it reports that the page
   is userfault. (Upon failure to read from the bitmap,
   kvm_do_userfault() will return true without setting up a memory fault
   exit, so we'll return a bare -EFAULT).

For hugepage recovery, the behavior when disabling KVM_MEM_USERFAULT
should match the behavior when disabling KVM_MEM_LOG_DIRTY_PAGES; make
changes to kvm_mmu_slot_apply_flags() to recover hugepages when
KVM_MEM_USERFAULT is disabled.

Signed-off-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c |  5 ++++-
 arch/x86/kvm/x86.c     | 27 +++++++++++++++++----------
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a4439e9e07268..49eb6b9b268cb 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3304,7 +3304,7 @@ void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	if (is_error_noslot_pfn(fault->pfn))
 		return;
 
-	if (kvm_slot_dirty_track_enabled(slot))
+	if (kvm_slot_dirty_track_enabled(slot) || kvm_is_userfault_memslot(slot))
 		return;
 
 	/*
@@ -4522,6 +4522,9 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 {
 	unsigned int foll = fault->write ? FOLL_WRITE : 0;
 
+	if (kvm_do_userfault(vcpu, fault))
+		return -EFAULT;
+
 	if (fault->is_private)
 		return kvm_mmu_faultin_pfn_private(vcpu, fault);
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b58a74c1722de..fa279ba38115c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13152,12 +13152,27 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
 	u32 new_flags = new ? new->flags : 0;
 	bool log_dirty_pages = new_flags & KVM_MEM_LOG_DIRTY_PAGES;
 
+	/*
+	 * Recover hugepages when userfault is toggled off, as KVM forces 4KiB
+	 * mappings when userfault is enabled.  See below for why CREATE, MOVE,
+	 * and DELETE don't need special handling.  Note, common KVM handles
+	 * zapping SPTEs when userfault is toggled on.
+	 */
+	if (change == KVM_MR_FLAGS_ONLY && (old_flags & KVM_MEM_USERFAULT) &&
+	    !(new_flags & KVM_MEM_USERFAULT))
+		kvm_mmu_recover_huge_pages(kvm, new);
+
+	/*
+	 * Nothing more to do if dirty logging isn't being toggled.
+	 */
+	if (!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
+		return;
+
 	/*
 	 * Update CPU dirty logging if dirty logging is being toggled.  This
 	 * applies to all operations.
 	 */
-	if ((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES)
-		kvm_mmu_update_cpu_dirty_logging(kvm, log_dirty_pages);
+	kvm_mmu_update_cpu_dirty_logging(kvm, log_dirty_pages);
 
 	/*
 	 * Nothing more to do for RO slots (which can't be dirtied and can't be
@@ -13177,14 +13192,6 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
 	if ((change != KVM_MR_FLAGS_ONLY) || (new_flags & KVM_MEM_READONLY))
 		return;
 
-	/*
-	 * READONLY and non-flags changes were filtered out above, and the only
-	 * other flag is LOG_DIRTY_PAGES, i.e. something is wrong if dirty
-	 * logging isn't being toggled on or off.
-	 */
-	if (WARN_ON_ONCE(!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES)))
-		return;
-
 	if (!log_dirty_pages) {
 		/*
 		 * Recover huge page mappings in the slot now that dirty logging
-- 
2.50.0.rc2.692.g299adb8693-goog


