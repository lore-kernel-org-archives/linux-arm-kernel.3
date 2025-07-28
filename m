Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333B3C87FD5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5HIRn165MoldehQ9ZBRdjnNlH0EFnjbrSE/QAIh1uE=; b=jWfPQe6rFhCfd8jWHpbGlfvAxF
	lEIWVT02OvMZUuZ05Zvdd0umoFx4yfJvA0qUAxk0AmNU5O8JJCexQKojE6cstghFh7ZXMloTVycLn
	+8OOo+qJKBC4w63qA/QHoq+/IFyG0JSqCA5NR7LIyAZrsMyKaqGvaYxqcmF2Y3kSV6aOPAPQc8nH+
	1ri9yJdthopmdmJqVzlNC6R2hyQjzyyEyC9IfG8IwvI7hNAJStqy1k4H3D/Yzx4Wg06+815oV09be
	KxVYG48Wp/fkFRsh/ug989njVr5Gzco8Q4BXHuJw5sE1q6JUHlGopgnBKDIyFy2TJSFteB4pg4CNv
	WTzD7jVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTim-0000000FHxM-2lln;
	Mon, 28 Jul 2025 19:41:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2r-0000000F8yl-02Jx
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Jul 2025 17:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=v5HIRn165MoldehQ9ZBRdjnNlH0EFnjbrSE/QAIh1uE=; b=HtTZwXljyvyULVaRABxaD4Vha3
	uYVhe/RopBa+veuNIjs4L5q5/5UPXHyxIorEzBO3dHVijU7c2jyh4bWiquB7FqYTokc8ZXfJ5QYfo
	U1BFM328x0w2lkYCyoxP9kkP5mGqHmWgw2QQSL+MNYBF6Qm580B1JytQMxyzYN7g27vOWPxMkpYq5
	kzhD233XNJzawi+L7CN49C6fgJFcY2E+xWmuKbnxAz3WltfZpSZwkub44qeovcKe4Z0SOZ1EczT4T
	erlVgFVjEW9mLZFut1bhgLOnc2CjLhAKL37+CCWfPhRDGfarbJNu4l831ScwzAtIyKro0/q1tp2J1
	uP2LF+rA==;
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2o-0000000CWGk-0JQg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:51 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-612b23a8064so5162915a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725227; x=1754330027; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v5HIRn165MoldehQ9ZBRdjnNlH0EFnjbrSE/QAIh1uE=;
        b=piT3jm62ZjZC0H2cFDH+Y0dHrFfj8krVV5yDkabkBd9CmY7y+kSmO8VGKbMdYCygzr
         cgLQ8gaL2loEV9c0shiwrcnqAvwqhhWHmkfsAIFY34IbQKGif9Gigkrv1am8KM5qp6mb
         0YkD2b6MMlVgW4/Pc3xvQGlmcgq1Qn5eT2A7H7e8WNkx7oGRagz4m5YYQRnhsNJowfIm
         JOvcP3WtiMV32j3FWi8P7myMVNZJ8O7bYO1YCt21XG7WEAhfP96aCeBXyqHO4mw2msH1
         qcLEosB5rQV3lg6cnyjBexcUQFyHyOyY49Lj20HGeHjdcT3NGwDCVt/OYC3H8hHktJyo
         FPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725227; x=1754330027;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5HIRn165MoldehQ9ZBRdjnNlH0EFnjbrSE/QAIh1uE=;
        b=COGDgH3QI1Zs+BPCKppZxS7XGdULbEzMSkWX0TaxlFhhR0qWPhlJTg/SxeuF4SJYlO
         VnqSIDGQyblt/wba/54TRWKkGK5a/bDskJt3z9t2iQWwbaPWsCgHGcOXn0Tj9ESaFH3J
         tTUghHTLUncqj6P5byRhoKINA7BPZVG+t8WWUHFXZBM4c/fJKJdUTKnlHzqriZnzLaa+
         d52h+U8/Olu67k8NJtbiGbH4nhTat1gQNJJVZ3lDi2tha3arp5kTY3LcyidMM8UcNLdF
         atlPL5QITozPusFGcY5qyDNkFTosx5lCNaad7Ano1s297Ajr/T/eaNJVNzKxI/a5/j5M
         qqow==
X-Forwarded-Encrypted: i=1; AJvYcCUc+nKWAsfk48/Vl4IUFv8NxppNzXkDFfxlhRk7zosBcSy/iYh24S2tfrHCg5cEqqga5sVck/aQo4BKgKl/Q0sA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7QZv3FqA7lQx4xAR6v3lOscDFLoPn8VJkQ+BkJ0RTko234xYL
	uPmi3LWyAyfdVAeiFviYjYSeT8P2tGzaxoMkhd4orDz+wFB5H4xKDrlCwgSdhXLcrtIAjpEsGYA
	qaW2RMm3pTFqmWg==
X-Google-Smtp-Source: AGHT+IGGnwZ54cHjudi9OgEir3052Ieofd0m3S19aQWQ1olBQ/FDeg6VwFY9xtf9BbfXUJAwUrST3D+tRGzU/A==
X-Received: from edxw15.prod.google.com ([2002:a05:6402:70f:b0:615:226c:afb4])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:354f:b0:612:a77e:1816 with SMTP id 4fb4d7f45d1cf-614f0b348ebmr11424984a12.0.1753725227149;
 Mon, 28 Jul 2025 10:53:47 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:53:04 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-18-smostafa@google.com>
Subject: [PATCH v3 17/29] KVM: arm64: iommu: Add enable/disable hypercalls
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_185350_292038_8E79D103 
X-CRM114-Status: GOOD (  14.30  )
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

Add hypercalls to enable/disable devices, this is needed as
IOMMUs as SMMUv3 can have massive ID space, and it would be
inefficient to enable translation for all of them, as most of them
are not used.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_asm.h        |  2 ++
 arch/arm64/kvm/hyp/include/nvhe/iommu.h |  5 ++++-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      | 19 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 14 ++++++++++++++
 4 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index bec227f9500a..51cedc405e77 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -87,6 +87,8 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
 	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
+	__KVM_HOST_SMCCC_FUNC___pkvm_iommu_enable_dev,
+	__KVM_HOST_SMCCC_FUNC___pkvm_iommu_disable_dev,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 9f4906c6dcc9..82e00cb37f82 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -8,6 +8,8 @@
 struct kvm_iommu_ops {
 	int (*init)(void);
 	void (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
+	int (*enable_dev)(pkvm_handle_t iommu, pkvm_handle_t dev);
+	int (*disable_dev)(pkvm_handle_t iommu, pkvm_handle_t dev);
 };
 
 int kvm_iommu_init(void *pool_base, size_t nr_pages);
@@ -16,5 +18,6 @@ void kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
 				 enum kvm_pgtable_prot prot);
 void *kvm_iommu_donate_pages(u8 order);
 void kvm_iommu_reclaim_pages(void *ptr);
-
+int kvm_iommu_enable_dev(pkvm_handle_t iommu, pkvm_handle_t dev);
+int kvm_iommu_disable_dev(pkvm_handle_t iommu, pkvm_handle_t dev);
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 3206b2c07f82..8739895ee22b 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -15,6 +15,7 @@
 #include <asm/kvm_mmu.h>
 
 #include <nvhe/ffa.h>
+#include <nvhe/iommu.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
 #include <nvhe/pkvm.h>
@@ -573,6 +574,22 @@ static void handle___pkvm_teardown_vm(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = __pkvm_teardown_vm(handle);
 }
 
+static void handle___pkvm_iommu_enable_dev(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(pkvm_handle_t, iommu, host_ctxt, 1);
+	DECLARE_REG(pkvm_handle_t, dev, host_ctxt, 2);
+
+	cpu_reg(host_ctxt, 1) = kvm_iommu_enable_dev(iommu, dev);
+}
+
+static void handle___pkvm_iommu_disable_dev(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(pkvm_handle_t, iommu, host_ctxt, 1);
+	DECLARE_REG(pkvm_handle_t, dev, host_ctxt, 2);
+
+	cpu_reg(host_ctxt, 1) = kvm_iommu_disable_dev(iommu, dev);
+}
+
 typedef void (*hcall_t)(struct kvm_cpu_context *);
 
 #define HANDLE_FUNC(x)	[__KVM_HOST_SMCCC_FUNC_##x] = (hcall_t)handle_##x
@@ -612,6 +629,8 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_vcpu_load),
 	HANDLE_FUNC(__pkvm_vcpu_put),
 	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
+	HANDLE_FUNC(__pkvm_iommu_enable_dev),
+	HANDLE_FUNC(__pkvm_iommu_disable_dev),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
index 1673165c7330..c1ba7e042a7a 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -113,3 +113,17 @@ void kvm_iommu_reclaim_pages(void *ptr)
 {
 	hyp_put_page(&iommu_pages_pool, ptr);
 }
+
+int kvm_iommu_enable_dev(pkvm_handle_t iommu, pkvm_handle_t dev)
+{
+	if (kvm_iommu_ops && kvm_iommu_ops->enable_dev)
+		return kvm_iommu_ops->enable_dev(iommu, dev);
+	return -ENODEV;
+}
+
+int kvm_iommu_disable_dev(pkvm_handle_t iommu, pkvm_handle_t dev)
+{
+	if (kvm_iommu_ops && kvm_iommu_ops->disable_dev)
+		return kvm_iommu_ops->disable_dev(iommu, dev);
+	return -ENODEV;
+}
-- 
2.50.1.552.g942d659e1b-goog


