Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D6EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDWqfNf0Ci0kqTl0GDSnxlhwnncAHfDpHJ3DMUVydnk=; b=mrsoe/tf9v0nzAsLe3r1DuaNsd
	IKH4XrWbicC991pgKgTJYv9MFhetxNjkfawh67yNibDvYz0FLgMHWTj0DlN5ElReJs6Iqn044xRI1
	zkxl+ItwyeG4Qfnp+2z4/thBDI0se7UaPN4LVzkoy2AdyauKGaxMUx0xCQkqsTo0iW9mdBGrnTOXG
	8O2LGjV9IxhlF0x6o+tZy09+zCQrRzGoQiNuQfFT2QefJGkyXeMC3r6wGlmr1npoAldgwrodm5kqb
	aoNY8OmikCk1c5tKmb8EhsvWnDUvWv9k775WW1Ck9J8OTuRmfVB94eIdrVDQivtcFFQpERM3HSiSb
	H1imbuFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh0h-0000000B5mr-0DaE;
	Thu, 13 Mar 2025 11:45:59 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgvm-0000000B4Pu-0LJM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:40:55 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4394c489babso4385485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 04:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741866052; x=1742470852; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NDWqfNf0Ci0kqTl0GDSnxlhwnncAHfDpHJ3DMUVydnk=;
        b=CNNx4Vki+6t7l302hcvlYcHSgztMXWNa1i1NqCMRLClPO0viUCfBvZlsoL/8iPz8Ah
         LQBAkKpszsz1AgPGqYIDPSQm6ZIduHzTNCm+PPrCbddEhveeni3fXBqb26VvSnQ+rHwE
         Chzcr6zosVhj8/GTQPwvIwwu5gBwbnjMZPjJRRnz2lO1GVYioWs3IbSA7mlAROisU+U8
         EQBMWOCK7d1WwoBF8013VbaXIPgP8rEEY8Y1xpn6rS5rwMylvff0lcpTHRbrVhoqcATo
         QZlUeBnTeiLdYvbIMoq95XFbcu0qh33SEEFJQTBKGokec27MM5zuJbyIRzgdkmU+zTkY
         bGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866052; x=1742470852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NDWqfNf0Ci0kqTl0GDSnxlhwnncAHfDpHJ3DMUVydnk=;
        b=XQseWfssNYt5aOumHhPwb/aIUCKY1x7JjcAAxlfp7ek7zQNwoZCJGzm2lYlBz+e+lj
         TwkBe2XzDmh7vmj2wqR+sJqVXYuEiZUo4ZmiAOSeM0boxErmpDIAIpYRRWrQoUNENFmE
         kSpbXJaXUxNrQjmp5VjE5eKSo6tQ/N6+5U7UhrQFCEC410YXR4JQOW6gE05V4zu++QT4
         +eR8RFI8lbublWb2vUMl152Hsump+5OQtXHnLt7/eU2Npi0vTtoQH5fdKWgUWn/LkYEx
         BM5qhZ3yExcFq7PdAZGDGF4Z6vxDkPxwx7qQ56wDSQyr5a3rAIkoN0KdA1EYVZASjQye
         zH5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjWcgm+qHQHA6M9FeHFTvt8/VZEPA+DdvTwc1byOlQtbGIK6e3mI2lzjakz2TyC5y8vXTb2lMSwjVACpcdTnRa@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9kcYuXkxGzu0TVQ4NRO0ne24G3zrVx+lc8CXGjknvTLiTC1G1
	rQFR/09B08yArO8DV2MxilhpQGI46BFfKfho6JBOZ3rDPopPG4fEknOtlw/+1m6FpiXjgVzVGFH
	RuGmD2qWz/f1XD4Ckiw==
X-Google-Smtp-Source: AGHT+IFKKo1u7bMMw5ZxGIjRt9SaBMTtCTn1z/fHmkTMPIsujAZAFsyBOCACwf96nv+XqVJo4hWsVe0aFo0TzDK4
X-Received: from wmbgz9-n2.prod.google.com ([2002:a05:600c:8889:20b0:43c:fcbd:f2eb])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f4f:b0:43d:d06:3798 with SMTP id 5b1f17b1804b1-43d0d063a25mr31305935e9.20.1741866052022;
 Thu, 13 Mar 2025 04:40:52 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:40:37 +0000
In-Reply-To: <20250313114038.1502357-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250313114038.1502357-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250313114038.1502357-3-vdonnefort@google.com>
Subject: [PATCH v4 2/3] KVM: arm64: Distinct pKVM teardown memcache for stage-2
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044054_131437_72598E32 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

In order to account for memory dedicated to the stage-2 page-tables, use
a separated memcache when tearing down the VM. Meanwhile rename
reclaim_guest_pages to reflect the fact it only reclaim page-table
pages.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 12691ae23d4c..ace3969e8106 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -246,6 +246,7 @@ typedef unsigned int pkvm_handle_t;
 struct kvm_protected_vm {
 	pkvm_handle_t handle;
 	struct kvm_hyp_memcache teardown_mc;
+	struct kvm_hyp_memcache stage2_teardown_mc;
 	bool enabled;
 };
 
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 978f38c386ee..ea0a704da9b8 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -56,7 +56,7 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt);
 
 int hyp_pin_shared_mem(void *from, void *to);
 void hyp_unpin_shared_mem(void *from, void *to);
-void reclaim_guest_pages(struct pkvm_hyp_vm *vm, struct kvm_hyp_memcache *mc);
+void reclaim_pgtable_pages(struct pkvm_hyp_vm *vm, struct kvm_hyp_memcache *mc);
 int refill_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages,
 		    struct kvm_hyp_memcache *host_mc);
 
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 19c3c631708c..f34f11c720d7 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -266,7 +266,7 @@ int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
 	return 0;
 }
 
-void reclaim_guest_pages(struct pkvm_hyp_vm *vm, struct kvm_hyp_memcache *mc)
+void reclaim_pgtable_pages(struct pkvm_hyp_vm *vm, struct kvm_hyp_memcache *mc)
 {
 	struct hyp_page *page;
 	void *addr;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 3927fe52a3dd..ac85bc51b8d3 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -678,7 +678,7 @@ teardown_donated_memory(struct kvm_hyp_memcache *mc, void *addr, size_t size)
 
 int __pkvm_teardown_vm(pkvm_handle_t handle)
 {
-	struct kvm_hyp_memcache *mc;
+	struct kvm_hyp_memcache *mc, *stage2_mc;
 	struct pkvm_hyp_vm *hyp_vm;
 	struct kvm *host_kvm;
 	unsigned int idx;
@@ -706,10 +706,10 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
 
 	/* Reclaim guest pages (including page-table pages) */
 	mc = &host_kvm->arch.pkvm.teardown_mc;
-	reclaim_guest_pages(hyp_vm, mc);
+	stage2_mc = &host_kvm->arch.pkvm.stage2_teardown_mc;
+	reclaim_pgtable_pages(hyp_vm, stage2_mc);
 	unpin_host_vcpus(hyp_vm->vcpus, hyp_vm->nr_vcpus);
 
-	/* Push the metadata pages to the teardown memcache */
 	for (idx = 0; idx < hyp_vm->nr_vcpus; ++idx) {
 		struct pkvm_hyp_vcpu *hyp_vcpu = hyp_vm->vcpus[idx];
 		struct kvm_hyp_memcache *vcpu_mc = &hyp_vcpu->vcpu.arch.pkvm_memcache;
@@ -717,7 +717,7 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
 		while (vcpu_mc->nr_pages) {
 			void *addr = pop_hyp_memcache(vcpu_mc, hyp_phys_to_virt);
 
-			push_hyp_memcache(mc, addr, hyp_virt_to_phys);
+			push_hyp_memcache(stage2_mc, addr, hyp_virt_to_phys);
 			unmap_donated_memory_noclear(addr, PAGE_SIZE);
 		}
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 930b677eb9b0..19921ca407c6 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -111,6 +111,7 @@ static void __pkvm_destroy_hyp_vm(struct kvm *host_kvm)
 
 	host_kvm->arch.pkvm.handle = 0;
 	free_hyp_memcache(&host_kvm->arch.pkvm.teardown_mc);
+	free_hyp_memcache(&host_kvm->arch.pkvm.stage2_teardown_mc);
 }
 
 /*
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


