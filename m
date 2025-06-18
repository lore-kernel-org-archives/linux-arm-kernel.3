Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D905C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 04:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lktvEP9OF/yBrtwNGnOYj58Kkb3on7duF4eax38mNfc=; b=4/1jCitDNn4l94Tjw3jfE6dHas
	SAXqroc7cEOahNUvGSsn1i93/z8exdONOPfLE+KS8/P0N2vnGPg2roiXQMeOSw8CD05M6uaNwEBxY
	I2JK9sfe72mvBat5wuU5VN3QkyqvLNdrkphXF3V/zulnbiWILdgSWVtxpCAhjE4SdV4nk9/3BClon
	VI91NHqgSsHMn2u9M7TeB2oJwt/k/IuRY9O22agpgKjdSdlL/MlmtS2OhajQB1o6S4wuJ0KO/aqKr
	/tkr1qE4oEtEVwMb8BTyqUy6g+U9y8DAybtSir+uGFZQOLUmZOPPhNyZfydv3+GxYC3iQP599zW4B
	koW8k2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkPy-0000000911R-1nyV;
	Wed, 18 Jun 2025 04:28:58 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLd-00000008znf-44md
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:24:31 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-235eefe6a8fso44559015ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 21:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220669; x=1750825469; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lktvEP9OF/yBrtwNGnOYj58Kkb3on7duF4eax38mNfc=;
        b=P1sTMA74W/pM2qwyLfMAD8vhmPQam7A4hbkme8RIL73uKyaBrgBL77sC1yI5TcAXt1
         ohoZXfDRUL0UH6prdrM8p2G1Z5Sl02gUlqoY83d4q07DvmX4vXaypcHYnhEyGQhQy2lP
         svx08MNzDky+VVnoswN5+MUkKplCbMGZ2/AhHtKdmpn5/kGYyqb/Roo04MEl+8RvOu3N
         6U7gCWd0ZX+jIb81IgkvLlILnussoUmhLsPJ9I2+n4g9WPl9JGGqvGCZWHnoPUDDF+GJ
         ljDBhzgFfRVdtySj0Ro/Tpl6OCoJ/7Iifjj34rC8/7g/903LeRa1KTcTeh8fKWd8xAV7
         +a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220669; x=1750825469;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lktvEP9OF/yBrtwNGnOYj58Kkb3on7duF4eax38mNfc=;
        b=O7zvN+0ou+5S5JOuTVffMxakxDOTR9XdR733J3DWRIukdDuyAeLkK263AIxOEKob1V
         F7+1qhnCdy/RkLxCPog9/Z9G2nI8G2OrVf998xT49VV+6SGsZQKxLWEvQ75LI/VDZQYS
         MJbtTQRldrhUm1DoUSTgGjCeo+VDhS8RI7qSGTZrm6RCl2F/nuYJ+oiG7Yy76N2PavMC
         gOr0CHgll89puFmfLmLGI8oEaE6ZyDwFrNvuiU7lhTzu8sEYsxcdlNqzgusc30LCjpy0
         hj6tZ6n/cniQJUChHIc2gIhH5wlJt26jab+Y8PJenbKu3xdAw69V7+EipcxkbJqgIG0W
         sBjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWCNkc5jIY0Rs0XdDL55vMMTB9HtO4ldhMj9xbpgv+UOQCL06EgseLOxwUjA5BwDMlhYcHxD62D3GC0OMz/GUb@lists.infradead.org
X-Gm-Message-State: AOJu0YzqE1blB1Qru+BLGZUntA0CM2r6nKxKPTq3hs9xoQfwKDQl1i5+
	omUj3qJj0uAeIfIU7w85j3Uon/1JSTvHyJEhz5LWI3A2UyksCHeT0Ne/f1tiPVF559eDvHwmYTn
	Q6M+iECXGn9YvreTWOeDCwg==
X-Google-Smtp-Source: AGHT+IFjtADbYlxljhsDQTOZW3D7A0uJ9AI1mGomIpn2hF7RaxHZsBqEwbheSqwAOtTN5nAEPPlQmENaTESm3DrC
X-Received: from pgbck15.prod.google.com ([2002:a05:6a02:90f:b0:b2c:4bfe:fb79])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:da81:b0:234:a063:e2c1 with SMTP id d9443c01a7336-2366b17b667mr224708415ad.42.1750220668697;
 Tue, 17 Jun 2025 21:24:28 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:10 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-2-jthoughton@google.com>
Subject: [PATCH v3 01/15] KVM: x86/mmu: Move "struct kvm_page_fault"
 definition to asm/kvm_host.h
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
X-CRM114-CacheID: sfid-20250617_212430_012235_3E7F6F2D 
X-CRM114-Status: GOOD (  17.85  )
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

From: Sean Christopherson <seanjc@google.com>

Make "struct kvm_page_fault" globally visible via asm/kvm_host.h so that
the structure can be referenced by common KVM.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/x86/include/asm/kvm_host.h | 68 ++++++++++++++++++++++++++++++++-
 arch/x86/kvm/mmu/mmu_internal.h | 67 --------------------------------
 2 files changed, 67 insertions(+), 68 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index b4a391929cdba..f9d3333f6d64b 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -443,7 +443,73 @@ struct kvm_mmu_root_info {
 #define KVM_HAVE_MMU_RWLOCK
 
 struct kvm_mmu_page;
-struct kvm_page_fault;
+
+struct kvm_page_fault {
+	/* arguments to kvm_mmu_do_page_fault.  */
+	const gpa_t addr;
+	const u64 error_code;
+	const bool prefetch;
+
+	/* Derived from error_code.  */
+	const bool exec;
+	const bool write;
+	const bool present;
+	const bool rsvd;
+	const bool user;
+
+	/* Derived from mmu and global state.  */
+	const bool is_tdp;
+	const bool is_private;
+	const bool nx_huge_page_workaround_enabled;
+
+	/*
+	 * Whether a >4KB mapping can be created or is forbidden due to NX
+	 * hugepages.
+	 */
+	bool huge_page_disallowed;
+
+	/*
+	 * Maximum page size that can be created for this fault; input to
+	 * FNAME(fetch), direct_map() and kvm_tdp_mmu_map().
+	 */
+	u8 max_level;
+
+	/*
+	 * Page size that can be created based on the max_level and the
+	 * page size used by the host mapping.
+	 */
+	u8 req_level;
+
+	/*
+	 * Page size that will be created based on the req_level and
+	 * huge_page_disallowed.
+	 */
+	u8 goal_level;
+
+	/*
+	 * Shifted addr, or result of guest page table walk if addr is a gva. In
+	 * the case of VM where memslot's can be mapped at multiple GPA aliases
+	 * (i.e. TDX), the gfn field does not contain the bit that selects between
+	 * the aliases (i.e. the shared bit for TDX).
+	 */
+	gfn_t gfn;
+
+	/* The memslot containing gfn. May be NULL. */
+	struct kvm_memory_slot *slot;
+
+	/* Outputs of kvm_mmu_faultin_pfn().  */
+	unsigned long mmu_seq;
+	kvm_pfn_t pfn;
+	struct page *refcounted_page;
+	bool map_writable;
+
+	/*
+	 * Indicates the guest is trying to write a gfn that contains one or
+	 * more of the PTEs used to translate the write itself, i.e. the access
+	 * is changing its own translation in the guest page tables.
+	 */
+	bool write_fault_to_shadow_pgtable;
+};
 
 /*
  * x86 supports 4 paging modes (5-level 64-bit, 4-level 64-bit, 3-level 32-bit,
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index db8f33e4de624..384fc4d0bfec0 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -230,73 +230,6 @@ static inline bool is_nx_huge_page_enabled(struct kvm *kvm)
 	return READ_ONCE(nx_huge_pages) && !kvm->arch.disable_nx_huge_pages;
 }
 
-struct kvm_page_fault {
-	/* arguments to kvm_mmu_do_page_fault.  */
-	const gpa_t addr;
-	const u64 error_code;
-	const bool prefetch;
-
-	/* Derived from error_code.  */
-	const bool exec;
-	const bool write;
-	const bool present;
-	const bool rsvd;
-	const bool user;
-
-	/* Derived from mmu and global state.  */
-	const bool is_tdp;
-	const bool is_private;
-	const bool nx_huge_page_workaround_enabled;
-
-	/*
-	 * Whether a >4KB mapping can be created or is forbidden due to NX
-	 * hugepages.
-	 */
-	bool huge_page_disallowed;
-
-	/*
-	 * Maximum page size that can be created for this fault; input to
-	 * FNAME(fetch), direct_map() and kvm_tdp_mmu_map().
-	 */
-	u8 max_level;
-
-	/*
-	 * Page size that can be created based on the max_level and the
-	 * page size used by the host mapping.
-	 */
-	u8 req_level;
-
-	/*
-	 * Page size that will be created based on the req_level and
-	 * huge_page_disallowed.
-	 */
-	u8 goal_level;
-
-	/*
-	 * Shifted addr, or result of guest page table walk if addr is a gva. In
-	 * the case of VM where memslot's can be mapped at multiple GPA aliases
-	 * (i.e. TDX), the gfn field does not contain the bit that selects between
-	 * the aliases (i.e. the shared bit for TDX).
-	 */
-	gfn_t gfn;
-
-	/* The memslot containing gfn. May be NULL. */
-	struct kvm_memory_slot *slot;
-
-	/* Outputs of kvm_mmu_faultin_pfn().  */
-	unsigned long mmu_seq;
-	kvm_pfn_t pfn;
-	struct page *refcounted_page;
-	bool map_writable;
-
-	/*
-	 * Indicates the guest is trying to write a gfn that contains one or
-	 * more of the PTEs used to translate the write itself, i.e. the access
-	 * is changing its own translation in the guest page tables.
-	 */
-	bool write_fault_to_shadow_pgtable;
-};
-
 int kvm_tdp_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault);
 
 /*
-- 
2.50.0.rc2.692.g299adb8693-goog


