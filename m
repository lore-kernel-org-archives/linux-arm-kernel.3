Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268A3CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMwyr7ObjfHzk7BXLAxnkaVV3ek7lYDy19xVV+TQO8I=; b=T51U3hcG5dB6XQtmnR/kfmetdT
	ppWfCPqGcJz0tVqLhPWpNL0xIdaUf6vMddryf/CQFbERexr412zM2N2M1lQqIuHLHuxqWzuSydJ/i
	p6ToEW3DZHoNCvuPWrC+/aOvVyg8rHOLX38qru3tlacS+cRvvHSt7UgjV0jrhMWCvyRUEsqYwWIVK
	283qY4lCQsg+kAUvLL8sNaW3HLiNCveCPVypzdJqNHQHLJOt+TabJlVrsr7YmRUnhPGdrtnVDL0H9
	YX5plvDS3zP1Qm/kdN0Wx6kjG7KiqLsJBzy4aPbXPBMC7v7aXJ+PJVrN9bD7k5QARscC2MOtdbM8o
	4i36V60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHms-00000009NgU-06wd;
	Thu, 01 Oct 2026 14:29:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmn-00000009NYU-0o5B
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 14:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DMwyr7ObjfHzk7BXLAxnkaVV3ek7lYDy19xVV+TQO8I=; b=A6S+22vDJVCkm5r9NibPz9iC/W
	XC0HLNtrMTOQ7IdWDQFM2qJmmNNlO8xbWFl8tsncfl1HU+uAP9u0acuLgCHi64fp6sOyvqlXyjWVD
	CEbMsCQEjGniJKiCOuAzUY5A/x4FIbd8b9BLz3RrGFcstk6fso1d24BI6i/7WwgXYfiR8WTdBs+u3
	dL12o8422N8kqoFFQFSdRZLOO5X5zrcqPAfLJo8/LMfz51jo1LaI5y4YwPP9q36GB0tBsWczdyzD9
	T09IxCBU5/fXejkMuma3WamFdt6owoSoxG2znb6Rdpv4LWmSFQh6YaOEctcVImPN/qsWKlg5QKrFd
	dMjjJ4mA==;
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCHmk-000000054ld-1JIO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:29:24 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6ac670bc8ceso6189529a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864960; x=1791469760; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMwyr7ObjfHzk7BXLAxnkaVV3ek7lYDy19xVV+TQO8I=;
        b=ENgLF3OBSuFo4y96fwbUSeuCOhak+hUAZUXjEupMizLaCSxdGYQrrawtalWjpQE+Na
         Ach6im1fzj4YYPCb+dnocZQBeCSRd9CI9NM9bWjE54/bp5QxLv/SC1G2TvKTbNEDCMlQ
         G0gqK6pvUwLus+Xzcoe1yX9HKy9U7frEumf1Iq5mpqj3PW27AHkBmDP1wbHD+FEwZrPz
         9IKGKOvdrRUCV8Z5by0M2/w34L00LeY7RDr7w3Jt2Yhu5lj9ClCcHgoXb5v07ggErK1a
         UKHdkynM0BxL+hOeyvY0gsnXD0jf85Wm6+snZMKhsXs5riHyULsyKGdkSdDhcJWIRUfp
         7q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864960; x=1791469760;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMwyr7ObjfHzk7BXLAxnkaVV3ek7lYDy19xVV+TQO8I=;
        b=EboZhSL49+XpW+XbzxHx/KYEn1AthBgMXlPtpp5ekNF0QfzWb5yNHKfd6OeoKa/JUM
         XIjfXTU0Vn7qzOrpttwVYS4vO1tZ6C9I/cDPw8rzXrOJ+KVwfQjymXVeucwmW5gKq0uS
         7TX0dnjpmhCmOrrH/2dNViWRwXO9KOe7PFkzyjSGJfooWRhID3atp4QJvavW8TL7hRbd
         8T6GyQV/I92K624k9ShS/RTwuzH1i+VnZeLuvxk9TnEOros3+tsFGWGfX23w8tzJTzpF
         WSZcpcyeM82/Q7RqyJIqa1rKH3gHE+5E2IMk81Mv+G1s7LCR8NvRuE8pFd4qLMpjm6D/
         0h3Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6Y9R9HTM+14UdeHlQgLLz6BmfcqWBpMEQb3v/Xxa5sVtHFDBYrgFxy5tD7nafvUYiFlqLmulr91vfffCXiqlV@lists.infradead.org
X-Gm-Message-State: AFq9FYKml4cfln2SQbqXZXnkK8OsvCPXuGvHVmjBZNI2ksLZRifbKixi
	XFTxqB6P5PTSDh8Gog2Hc7t16Ljlnszoz5ISARxDPKKijPpHKs17cLlTzdl2VLk7CWVYdXQ/N4V
	e0HXWPvnBKm7n0STyoHMokw==
X-Received: from edrc14.prod.google.com ([2002:aa7:d60e:0:b0:6ad:22cb:6f0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3609:b0:6ac:af31:24f3 with SMTP id 4fb4d7f45d1cf-6ae19953e3emr4386105a12.31.1790864959647;
 Thu, 01 Oct 2026 07:29:19 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:49 +0100
In-Reply-To: <20261001142849.3367614-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001142849.3367614-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-19-vdonnefort@google.com>
Subject: [PATCH v6 18/18] KVM: arm64: Alloc simple_buffer_page using pKVM hyp allocator
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_152922_620677_E8C752BA 
X-CRM114-Status: GOOD (  23.25  )
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

In protected mode, transition the allocation of the simple_ring_buffer
structures from the host to the hypervisor using the new pKVM heap
allocator.

Previously, the host allocated and donated a contiguous backing memory
for these structures. In pKVM the hypervisor can now allocate them
dynamically.

Use the pkvm_call_hyp_req() wrapper in the host to invoke
__tracing_load, which automatically handles any top-up requests if the
hypervisor runs out of heap memory during allocation.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c |  2 +-
 arch/arm64/kvm/hyp/nvhe/trace.c    | 63 +++++++++++++++++-------------
 arch/arm64/kvm/hyp_trace.c         | 15 ++++++-
 3 files changed, 50 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index af348e008f52..7a6435725dfe 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -907,7 +907,7 @@ DEFINE_KVM_HOST_HCALL(ulong, __pkvm_hyp_reclaimable,
 DEFINE_KVM_HOST_HCALL(int, __tracing_load,
 	void __kern *, desc_hva, size_t, desc_size)
 {
-	return __tracing_load(desc_hva, desc_size);
+	return errno_to_smccc(__tracing_load(desc_hva, desc_size));
 }
 
 DEFINE_KVM_HOST_HCALL0(void, __tracing_unload)
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index 7acb81ae0e6a..0d7e4db0c3e1 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -4,6 +4,7 @@
  * Author: Vincent Donnefort <vdonnefort@google.com>
  */
 
+#include <nvhe/alloc.h>
 #include <nvhe/clock.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -62,18 +63,34 @@ static void __release_host_mem(void *start, u64 size)
 	WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(start), size >> PAGE_SHIFT));
 }
 
-static int hyp_trace_buffer_load_bpage_backing(struct hyp_trace_buffer *trace_buffer,
-					       struct hyp_trace_desc *desc)
+static int hyp_trace_buffer_alloc_bpages(struct hyp_trace_buffer *trace_buffer,
+					 struct hyp_trace_desc *desc)
 {
-	void *start = (void *)kern_hyp_va(desc->bpages_backing_start);
-	size_t size = desc->bpages_backing_size;
+	void *start;
+	size_t size;
 	int ret;
 
-	ret = __admit_host_mem(start, size);
-	if (ret)
-		return ret;
+	if (is_protected_kvm_enabled()) {
+		struct ring_buffer_desc *rb_desc;
+		int cpu;
 
-	memset(start, 0, size);
+		size = 0;
+		for_each_ring_buffer_desc(rb_desc, cpu, &desc->trace_buffer_desc)
+			size += rb_desc->nr_page_va * sizeof(struct simple_buffer_page);
+
+		start = hyp_alloc(size);
+		if (!start)
+			return hyp_alloc_errno();
+	} else {
+		start = (void *)kern_hyp_va(desc->bpages_backing_start);
+		size = desc->bpages_backing_size;
+
+		ret = __admit_host_mem(start, size);
+		if (ret)
+			return ret;
+
+		memset(start, 0, size);
+	}
 
 	trace_buffer->bpages_backing_start = start;
 	trace_buffer->bpages_backing_size = size;
@@ -81,7 +98,7 @@ static int hyp_trace_buffer_load_bpage_backing(struct hyp_trace_buffer *trace_bu
 	return 0;
 }
 
-static void hyp_trace_buffer_unload_bpage_backing(struct hyp_trace_buffer *trace_buffer)
+static void hyp_trace_buffer_free_bpages(struct hyp_trace_buffer *trace_buffer)
 {
 	void *start = trace_buffer->bpages_backing_start;
 	size_t size = trace_buffer->bpages_backing_size;
@@ -89,9 +106,12 @@ static void hyp_trace_buffer_unload_bpage_backing(struct hyp_trace_buffer *trace
 	if (!size)
 		return;
 
-	memset(start, 0, size);
-
-	__release_host_mem(start, size);
+	if (is_protected_kvm_enabled()) {
+		hyp_free(start);
+	} else {
+		memset(start, 0, size);
+		__release_host_mem(start, size);
+	}
 
 	trace_buffer->bpages_backing_start = NULL;
 	trace_buffer->bpages_backing_size = 0;
@@ -128,7 +148,7 @@ static void hyp_trace_buffer_unload(struct hyp_trace_buffer *trace_buffer)
 		simple_ring_buffer_unload_mm(per_cpu_ptr(trace_buffer->simple_rbs, cpu),
 					     __unpin_shared_page);
 
-	hyp_trace_buffer_unload_bpage_backing(trace_buffer);
+	hyp_trace_buffer_free_bpages(trace_buffer);
 }
 
 static int hyp_trace_buffer_load(struct hyp_trace_buffer *trace_buffer,
@@ -143,7 +163,7 @@ static int hyp_trace_buffer_load(struct hyp_trace_buffer *trace_buffer,
 	if (hyp_trace_buffer_loaded(trace_buffer))
 		return -EINVAL;
 
-	ret = hyp_trace_buffer_load_bpage_backing(trace_buffer, desc);
+	ret = hyp_trace_buffer_alloc_bpages(trace_buffer, desc);
 	if (ret)
 		return ret;
 
@@ -168,18 +188,16 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
 {
 	struct ring_buffer_desc *rb_desc;
 	unsigned int cpu;
-	size_t nr_bpages;
 	void *desc_end;
 
 	if (!is_protected_kvm_enabled())
 		return true;
 
 	/*
-	 * Both desc_size and bpages_backing_size are untrusted host-provided
-	 * values. We rely on __pkvm_host_donate_hyp() to enforce their validity.
+	 * desc_size is an untrusted host-provided value. We rely on
+	 * __pkvm_host_donate_hyp() to enforce its validity.
 	 */
 	desc_end = (void *)desc + desc_size;
-	nr_bpages = desc->bpages_backing_size / sizeof(struct simple_buffer_page);
 
 	if (desc->trace_buffer_desc.nr_cpus != hyp_nr_cpus)
 		return false;
@@ -197,17 +215,8 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
 		if ((void *)rb_desc + struct_size(rb_desc, page_va, rb_desc->nr_page_va) > desc_end)
 			return false;
 
-		/* Overflow bpages backing memory? */
-		if (nr_bpages < rb_desc->nr_page_va)
-			return false;
-
-		if (cpu >= hyp_nr_cpus)
-			return false;
-
 		if (cpu != rb_desc->cpu)
 			return false;
-
-		nr_bpages -= rb_desc->nr_page_va;
 	}
 
 	return true;
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 44937e257375..5bc881d6f343 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -13,6 +13,7 @@
 #include <asm/kvm_host.h>
 #include <asm/kvm_hyptrace.h>
 #include <asm/kvm_mmu.h>
+#include <asm/kvm_pkvm.h>
 
 #include "hyp_trace.h"
 
@@ -151,11 +152,18 @@ static void __unshare_page(unsigned long va)
 
 static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_buffer, size_t size)
 {
-	int nr_bpages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
 	size_t backing_size;
+	int nr_bpages;
 	void *start;
 	int ret;
 
+	if (is_protected_kvm_enabled()) {
+		trace_buffer->desc->bpages_backing_start = 0;
+		trace_buffer->desc->bpages_backing_size = 0;
+		return 0;
+	}
+
+	nr_bpages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
 	backing_size = PAGE_ALIGN(sizeof(struct simple_buffer_page) * nr_bpages *
 				  num_possible_cpus());
 
@@ -177,6 +185,9 @@ static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_
 
 static void hyp_trace_buffer_free_bpages_backing(struct hyp_trace_buffer *trace_buffer)
 {
+	if (!trace_buffer->desc->bpages_backing_start)
+		return;
+
 	free_pages_exact((void *)trace_buffer->desc->bpages_backing_start,
 			 trace_buffer->desc->bpages_backing_size);
 }
@@ -269,7 +280,7 @@ static struct trace_buffer_desc *hyp_trace_load(unsigned long size, void *priv)
 	if (ret)
 		goto err_free_buffer;
 
-	ret = kvm_call_hyp_nvhe(__tracing_load, desc, desc_size);
+	ret = pkvm_call_hyp_req(__tracing_load, desc, desc_size);
 	if (ret)
 		goto err_unload_pages;
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


