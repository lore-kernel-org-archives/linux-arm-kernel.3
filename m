Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1282DF417F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqWYQ9lCo+j6BKFc/ZubG4EbmDj1j9ozKwcXgqRTpuk=; b=KFTn9+vryYgVht8QJ1nMCazTO5
	7E3pJWV5GdrKXvSsqz92xQQTznXdpyVTIMoVCuT1HlAfrQUlV8p8rl7QRMP6TjJS057HywFdK+G0u
	dbXHKRalf1GawZHhK9ViqhUlSmYASy+Nsi/wVKsCUwaXpOpc3+TBzy+PJDvBG0teQU9Vr07eZS0FM
	8KgFkmWXvxjgVwy1BKpa4ULJkiPsAH5sxRNfqfEt9iwflLxe1cYUR3kBFxxtOhBdasb9kksl7MZa+
	P4AUKXffilItsqpa7bKMorWup4lL9LqZ9b6AT1ko8G+CLqCvFxCLzdnLaH4pcprqkzX8R2qSqgScW
	ZsZqMPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdRU-00000007hri-3frp;
	Mon, 09 Mar 2026 16:26:52 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdR5-00000007hGB-3CVG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:26:31 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4852ccff333so27323015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773073585; x=1773678385; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sqWYQ9lCo+j6BKFc/ZubG4EbmDj1j9ozKwcXgqRTpuk=;
        b=Squ+SBTZsOL1/qw0GRRHdqqbJludot6dOSlguaNm05HIIMTEKpV5xv3Uo1p+uoXQrX
         DHpIM4knuCkUkQmlR0vnMS3yoRUFq7df6z0VXUvbuMis8+txYVVXMS8lzMTWbquPeWbN
         u5Sqyyq6otF+BQSNykHPzWpO7oLGpCPCI0Hxr+jDhZn3TG54JnRUfO9uBQTy4qFm6UyI
         jH4roVGvN5Fs4itr4xp9T5pEszr7wjR0G/qIsK44bpO10twBRaHvcMbmoHHRvzurY0l2
         xCkWLggTF6IuRftTXPgoopBAA4wy/KmgckbVv0ApG4t+a0VpPL065A6sTpOUSPikfxg7
         lDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073585; x=1773678385;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqWYQ9lCo+j6BKFc/ZubG4EbmDj1j9ozKwcXgqRTpuk=;
        b=icJ2SZrY2uY9MxA++iNYuhOXmPLU0suTVGPBLebMm6aKZ/du9X8CS3fxpejiaNbwj4
         s99FlBmothCtCwuPGFwxKT46gOqldDCSaiGbR1hTfMeNphzhjGLDPYYbqVEIDAS4JiXa
         p0lsp3YiW5iVcgrs0IF/lrvOOSZOgGwNIgx1XSz2wOn8d2ZP8jw+yJJtMNeZ0qDiA8it
         wRxt7nE+JxdBeLG5OeOpyhQYJHqGQanKWh3EavlCff3SaTTIv7LB+K/CHqF4hmB9AN+/
         uXT5FelFPjtSAObpeSL0Py3UMVhrfjNvrh7RumPoMfjR699t0gtVsMGMg1gT6AzkkM3T
         TcGA==
X-Forwarded-Encrypted: i=1; AJvYcCXJZ4MNZT5Mv+GMuBLnnXH1exR47lAJWiA44Zo+JX9BT4jlxed4N2c5nLqXxetG7k/40jC5SkFi6gGLX2Pm7yv9@lists.infradead.org
X-Gm-Message-State: AOJu0YwHGmfcTmLz9YWVP2DLgotGt6wv186ZCMMm93wBQq3XOpxp/JMr
	sJenPRtBV128DGVKw3XULate4goOat20zrSxzEcLrOjdK8cMEl3Qk9NV3mUxxGkTplSpINjh0Gf
	Wu7dPAcZRq3e4G4uxPBNctQ==
X-Received: from wmla24.prod.google.com ([2002:a05:600d:2398:b0:485:3ee6:2d4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f06:b0:485:3c66:e21d with SMTP id 5b1f17b1804b1-4853c66e362mr51934005e9.2.1773073584961;
 Mon, 09 Mar 2026 09:26:24 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:25:10 +0000
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309162516.2623589-25-vdonnefort@google.com>
Subject: [PATCH v14 24/30] KVM: arm64: Add trace remote for the nVHE/pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_092627_933366_10A776BA 
X-CRM114-Status: GOOD (  19.14  )
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

In both protected and nVHE mode, the hypervisor is capable of writing
events into tracefs compatible ring-buffers. Create a trace remote so
the kernel can read those buffers.

This currently doesn't provide any event support which will come later.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index d215348370fa..17edfe3ae615 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -75,6 +75,7 @@ if NVHE_EL2_DEBUG
 config NVHE_EL2_TRACING
 	bool
 	depends on TRACING
+	select TRACE_REMOTE
 	default y
 
 config PKVM_DISABLE_STAGE2_ON_PANIC
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 3ebc0570345c..59612d2f277c 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -30,6 +30,8 @@ kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
 kvm-$(CONFIG_PTDUMP_STAGE2_DEBUGFS) += ptdump.o
 
+kvm-$(CONFIG_NVHE_EL2_TRACING) += hyp_trace.o
+
 always-y := hyp_constants.h hyp-constants.s
 
 define rule_gen_hyp_constants
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 1371f9b3ecea..87a3d28d5f0f 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -24,6 +24,7 @@
 
 #define CREATE_TRACE_POINTS
 #include "trace_arm.h"
+#include "hyp_trace.h"
 
 #include <linux/uaccess.h>
 #include <asm/ptrace.h>
@@ -2415,6 +2416,10 @@ static int __init init_subsystems(void)
 
 	kvm_register_perf_callbacks();
 
+	err = kvm_hyp_trace_init();
+	if (err)
+		kvm_err("Failed to initialize Hyp tracing\n");
+
 out:
 	if (err)
 		hyp_cpu_pm_exit();
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
new file mode 100644
index 000000000000..2866effe28ec
--- /dev/null
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Vincent Donnefort <vdonnefort@google.com>
+ */
+
+#include <linux/trace_remote.h>
+#include <linux/simple_ring_buffer.h>
+
+#include <asm/kvm_host.h>
+#include <asm/kvm_hyptrace.h>
+#include <asm/kvm_mmu.h>
+
+#include "hyp_trace.h"
+
+/* Access to this struct within the trace_remote_callbacks are protected by the trace_remote lock */
+static struct hyp_trace_buffer {
+	struct hyp_trace_desc	*desc;
+	size_t			desc_size;
+} trace_buffer;
+
+static int __map_hyp(void *start, size_t size)
+{
+	if (is_protected_kvm_enabled())
+		return 0;
+
+	return create_hyp_mappings(start, start + size, PAGE_HYP);
+}
+
+static int __share_page(unsigned long va)
+{
+	return kvm_share_hyp((void *)va, (void *)va + 1);
+}
+
+static void __unshare_page(unsigned long va)
+{
+	kvm_unshare_hyp((void *)va, (void *)va + 1);
+}
+
+static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_buffer, size_t size)
+{
+	int nr_bpages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
+	size_t backing_size;
+	void *start;
+
+	backing_size = PAGE_ALIGN(sizeof(struct simple_buffer_page) * nr_bpages *
+				  num_possible_cpus());
+
+	start = alloc_pages_exact(backing_size, GFP_KERNEL_ACCOUNT);
+	if (!start)
+		return -ENOMEM;
+
+	trace_buffer->desc->bpages_backing_start = (unsigned long)start;
+	trace_buffer->desc->bpages_backing_size = backing_size;
+
+	return __map_hyp(start, backing_size);
+}
+
+static void hyp_trace_buffer_free_bpages_backing(struct hyp_trace_buffer *trace_buffer)
+{
+	free_pages_exact((void *)trace_buffer->desc->bpages_backing_start,
+			 trace_buffer->desc->bpages_backing_size);
+}
+
+static void hyp_trace_buffer_unshare_hyp(struct hyp_trace_buffer *trace_buffer, int last_cpu)
+{
+	struct ring_buffer_desc *rb_desc;
+	int cpu, p;
+
+	for_each_ring_buffer_desc(rb_desc, cpu, &trace_buffer->desc->trace_buffer_desc) {
+		if (cpu > last_cpu)
+			break;
+
+		__share_page(rb_desc->meta_va);
+		for (p = 0; p < rb_desc->nr_page_va; p++)
+			__unshare_page(rb_desc->page_va[p]);
+	}
+}
+
+static int hyp_trace_buffer_share_hyp(struct hyp_trace_buffer *trace_buffer)
+{
+	struct ring_buffer_desc *rb_desc;
+	int cpu, p, ret = 0;
+
+	for_each_ring_buffer_desc(rb_desc, cpu, &trace_buffer->desc->trace_buffer_desc) {
+		ret = __share_page(rb_desc->meta_va);
+		if (ret)
+			break;
+
+		for (p = 0; p < rb_desc->nr_page_va; p++) {
+			ret = __share_page(rb_desc->page_va[p]);
+			if (ret)
+				break;
+		}
+
+		if (ret) {
+			for (p--; p >= 0; p--)
+				__unshare_page(rb_desc->page_va[p]);
+			break;
+		}
+	}
+
+	if (ret)
+		hyp_trace_buffer_unshare_hyp(trace_buffer, cpu--);
+
+	return ret;
+}
+
+static struct trace_buffer_desc *hyp_trace_load(unsigned long size, void *priv)
+{
+	struct hyp_trace_buffer *trace_buffer = priv;
+	struct hyp_trace_desc *desc;
+	size_t desc_size;
+	int ret;
+
+	if (WARN_ON(trace_buffer->desc))
+		return ERR_PTR(-EINVAL);
+
+	desc_size = trace_buffer_desc_size(size, num_possible_cpus());
+	if (desc_size == SIZE_MAX)
+		return ERR_PTR(-E2BIG);
+
+	desc_size = PAGE_ALIGN(desc_size);
+	desc = (struct hyp_trace_desc *)alloc_pages_exact(desc_size, GFP_KERNEL);
+	if (!desc)
+		return ERR_PTR(-ENOMEM);
+
+	ret = __map_hyp(desc, desc_size);
+	if (ret)
+		goto err_free_desc;
+
+	trace_buffer->desc = desc;
+
+	ret = hyp_trace_buffer_alloc_bpages_backing(trace_buffer, size);
+	if (ret)
+		goto err_free_desc;
+
+	ret = trace_remote_alloc_buffer(&desc->trace_buffer_desc, desc_size, size,
+					cpu_possible_mask);
+	if (ret)
+		goto err_free_backing;
+
+	ret = hyp_trace_buffer_share_hyp(trace_buffer);
+	if (ret)
+		goto err_free_buffer;
+
+	ret = kvm_call_hyp_nvhe(__tracing_load, (unsigned long)desc, desc_size);
+	if (ret)
+		goto err_unload_pages;
+
+	return &desc->trace_buffer_desc;
+
+err_unload_pages:
+	hyp_trace_buffer_unshare_hyp(trace_buffer, INT_MAX);
+
+err_free_buffer:
+	trace_remote_free_buffer(&desc->trace_buffer_desc);
+
+err_free_backing:
+	hyp_trace_buffer_free_bpages_backing(trace_buffer);
+
+err_free_desc:
+	free_pages_exact(desc, desc_size);
+	trace_buffer->desc = NULL;
+
+	return ERR_PTR(ret);
+}
+
+static void hyp_trace_unload(struct trace_buffer_desc *desc, void *priv)
+{
+	struct hyp_trace_buffer *trace_buffer = priv;
+
+	if (WARN_ON(desc != &trace_buffer->desc->trace_buffer_desc))
+		return;
+
+	kvm_call_hyp_nvhe(__tracing_unload);
+	hyp_trace_buffer_unshare_hyp(trace_buffer, INT_MAX);
+	trace_remote_free_buffer(desc);
+	hyp_trace_buffer_free_bpages_backing(trace_buffer);
+	free_pages_exact(trace_buffer->desc, trace_buffer->desc_size);
+	trace_buffer->desc = NULL;
+}
+
+static int hyp_trace_enable_tracing(bool enable, void *priv)
+{
+	return kvm_call_hyp_nvhe(__tracing_enable, enable);
+}
+
+static int hyp_trace_swap_reader_page(unsigned int cpu, void *priv)
+{
+	return kvm_call_hyp_nvhe(__tracing_swap_reader, cpu);
+}
+
+static int hyp_trace_reset(unsigned int cpu, void *priv)
+{
+	return 0;
+}
+
+static int hyp_trace_enable_event(unsigned short id, bool enable, void *priv)
+{
+	return 0;
+}
+
+static struct trace_remote_callbacks trace_remote_callbacks = {
+	.load_trace_buffer	= hyp_trace_load,
+	.unload_trace_buffer	= hyp_trace_unload,
+	.enable_tracing		= hyp_trace_enable_tracing,
+	.swap_reader_page	= hyp_trace_swap_reader_page,
+	.reset			= hyp_trace_reset,
+	.enable_event		= hyp_trace_enable_event,
+};
+
+int __init kvm_hyp_trace_init(void)
+{
+	if (is_kernel_in_hyp_mode())
+		return 0;
+
+	return trace_remote_register("hypervisor", &trace_remote_callbacks, &trace_buffer, NULL, 0);
+}
diff --git a/arch/arm64/kvm/hyp_trace.h b/arch/arm64/kvm/hyp_trace.h
new file mode 100644
index 000000000000..c991b1ec65f1
--- /dev/null
+++ b/arch/arm64/kvm/hyp_trace.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ARM64_KVM_HYP_TRACE_H__
+#define __ARM64_KVM_HYP_TRACE_H__
+
+#ifdef CONFIG_NVHE_EL2_TRACING
+int kvm_hyp_trace_init(void);
+#else
+static inline int kvm_hyp_trace_init(void) { return 0; }
+#endif
+#endif
-- 
2.53.0.473.g4a7958ca14-goog


