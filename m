Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064D1CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCSrMFeSurFqrsJ2giFUs5nVIkyf5eYx9hKkmNRZA3A=; b=TH66owOewLZIVU5bR4l6FeBSXg
	GY1y4QSisvV9dwE+4EiHiLzbtB67QtRMf3I6QweQfh+HevSE2+NgTFfY3q0YbTgWUpp83UWXkwXOm
	4Js4u2OgVduxxenfMfAaxw/kzznn1V+A1bn8Cp8dVwICZvtDLW1DUSmIryG8tZd+GjrhP/k5G2o3j
	kzt33nA3o9f9RZY76NiMeV33w5UgqR8Y+5fQoXqEmGr0p307mLWjHQQXp75asvESGDzjYFWmGGVZg
	AS413RT36z8jXThMXRkvv5X96mq8SNZFeTHiPO8bYNiYF+WReF6n/WmhB9g2NG2JL2sx8Y4saOGaG
	db2XaLkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgV-00000003LZa-2zny;
	Thu, 11 Sep 2025 13:49:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgQ-00000003LTM-1LCS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:49:55 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so9459695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757598592; x=1758203392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCSrMFeSurFqrsJ2giFUs5nVIkyf5eYx9hKkmNRZA3A=;
        b=I1MzgCediKOX7prKtw3BFAeTsE+4ffKDM+TArcoQGStg2+KbqyZp2tUzUels5tvyH/
         dt47X+2pLCVzcG1+YOsXGOUscY8b2W+7qKS2UOHD1THeUI524g4pDGAm1cDisSbJpANd
         hyj3D7grahpwPHo3z3PyKdFk6OP0a5f7Ugpf+of+R1U5h55genDupcg1PPVpcagNoCCb
         9QtDJfQHrkgAPpl8wvRGcTK6DcvBfNeKwoUS6RgdPYLqlGQ73kK1tahdxsUGL4YAbMRH
         Fk5TthOB6cRT9PCEyn45ioIpnfH//JwB6pqiPhqfP6722LNWsMM4QeEo6bGCjSZwynL6
         heCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598592; x=1758203392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCSrMFeSurFqrsJ2giFUs5nVIkyf5eYx9hKkmNRZA3A=;
        b=tdW5trQeHPzIJ2Hm1borZ3gYm6HcgYht24C3movnJ5tmlTLlV212HVyaYd2US3lVpU
         gsIgrcAiPO0w/Kquw+nN8KFJIrtoyqqvLRzHcnjziuwWJQ6YoLkyxDmImfn9QJXS8KKN
         dptbHYBdAm3QmJdf3mIxWl0nhklhKTM8lQTI7sZU+ECW+2/o+ii5G+9zheJEdcEKU+2s
         zW1BTx6hA6cKu9INmHpsH/8lfjQkkr0AabacQxZ0es/wiDZ+2LuqdDZkDhpec2j1EFEI
         1JfRVm3f0etxYH7ZtQE11MdF54PHSFAbV+P62funVVpO5FWEf7paFK5gW7qfhuunUKue
         BGUw==
X-Forwarded-Encrypted: i=1; AJvYcCXyWqUi3ggvfX5jUxvHmQtxFIFlZdIufcjBz+o8WhrelMrEXeUMbxMZRLNPOns7fqqA8GR61UAiDzF07wCTr3lH@lists.infradead.org
X-Gm-Message-State: AOJu0YweuUgkR2XdfqRilR7G57dj0JLR0ruudmJTHhTxUahgVowfGM2k
	zTWR9PE2sGbe3f9k95moOlBcfn1Yc79Eqz7QQDjCuwT4qeTJkBvinzTg
X-Gm-Gg: ASbGnct0pFTnqgIVMS/hhB6uwPeNHaEcTwjG7beKnfdCkj/Rze0mvwOQPNzr9+C2yp7
	68WlIS5N/l2d4znr8sPdC1NxwFuqKg26Dya5LW+c5i/4EI9Cycx7ZttdZQvGseLszs978veI6dG
	iOJn5qxEVd/Q81g5MwUMaMFKFoYcqUKE9LynRx099RtiXaQA/cGh3qyOPg5aliYX7wVwhyNAxp/
	Ov3v7bd7AIvbXOfcNB2KY0b0eXC/QSO5LijeZe0aMNeHs5EYPOWSyMpLy0xjtUFOrTy2o8UYiyv
	nEiNzcWSiMtKctNy47ZVKzCJRo77xjDvORBBqLv4620W05tyWFx/c/WW4kGnLZ/s/J1z4O60NTc
	ygwXa1x368ZfO0LXoKb4UA14mKW5M51mtPt6B1FGuGOeUiYutVm2tQ/l4i4AeySGc2YI0ilNy
X-Google-Smtp-Source: AGHT+IH842Sw/0yXJovz2FflrQNKNRtbIPTzYOgGi48h59M9xzXKWI2UOrLl/gvL8P7iUFl+9U+RTQ==
X-Received: by 2002:a05:600c:a43:b0:45b:81ad:336 with SMTP id 5b1f17b1804b1-45dddea520dmr244204245e9.16.1757598592074;
        Thu, 11 Sep 2025 06:49:52 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760778915sm2608361f8f.12.2025.09.11.06.49.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 11 Sep 2025 06:49:51 -0700 (PDT)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com,
	roypat@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.com
Subject: [PATCH 5/6] KVM: selftests: Enable pre_fault_memory_test for arm64
Date: Thu, 11 Sep 2025 14:46:47 +0100
Message-Id: <20250911134648.58945-6-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250911134648.58945-1-jackabt.amazon@gmail.com>
References: <20250911134648.58945-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_064954_402126_8CBC795B 
X-CRM114-Status: GOOD (  16.80  )
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

From: Jack Thomson <jackabt@amazon.com>

Enable the pre_fault_memory_test to run on arm64 by making it work with
different guest page sizes and testing multiple guest configurations.

Update the test_assert to compare against the UCALL_EXIT_REASON, for
portability, as arm64 exits with KVM_EXIT_MMIO while x86 uses
KVM_EXIT_IO.

Signed-off-by: Jack Thomson <jackabt@amazon.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../selftests/kvm/pre_fault_memory_test.c     | 79 ++++++++++++++-----
 2 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 90f03f00cb04..4db1737fad04 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -180,6 +180,7 @@ TEST_GEN_PROGS_arm64 += memslot_perf_test
 TEST_GEN_PROGS_arm64 += mmu_stress_test
 TEST_GEN_PROGS_arm64 += rseq_test
 TEST_GEN_PROGS_arm64 += steal_time
+TEST_GEN_PROGS_arm64 += pre_fault_memory_test
 
 TEST_GEN_PROGS_s390 = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_s390 += s390/memop
diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
index 0350a8896a2f..ed9848a8af60 100644
--- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
+++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
@@ -10,19 +10,29 @@
 #include <test_util.h>
 #include <kvm_util.h>
 #include <processor.h>
+#include <guest_modes.h>
 
 /* Arbitrarily chosen values */
-#define TEST_SIZE		(SZ_2M + PAGE_SIZE)
-#define TEST_NPAGES		(TEST_SIZE / PAGE_SIZE)
+#define TEST_BASE_SIZE		SZ_2M
 #define TEST_SLOT		10
 
+/* Storage of test info to share with guest code */
+struct test_config {
+	int page_size;
+	uint64_t test_size;
+	uint64_t test_num_pages;
+};
+
+struct test_config test_config;
+
 static void guest_code(uint64_t base_gpa)
 {
 	volatile uint64_t val __used;
+	struct test_config *config = &test_config;
 	int i;
 
-	for (i = 0; i < TEST_NPAGES; i++) {
-		uint64_t *src = (uint64_t *)(base_gpa + i * PAGE_SIZE);
+	for (i = 0; i < config->test_num_pages; i++) {
+		uint64_t *src = (uint64_t *)(base_gpa + i * config->page_size);
 
 		val = *src;
 	}
@@ -63,11 +73,17 @@ static void pre_fault_memory(struct kvm_vcpu *vcpu, u64 gpa, u64 size,
 					    "KVM_PRE_FAULT_MEMORY", ret, vcpu->vm);
 }
 
-static void __test_pre_fault_memory(unsigned long vm_type, bool private)
+struct test_params {
+	unsigned long vm_type;
+	bool private;
+};
+
+static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
 {
+	struct test_params *p = arg;
 	const struct vm_shape shape = {
-		.mode = VM_MODE_DEFAULT,
-		.type = vm_type,
+		.mode = guest_mode,
+		.type = p->vm_type,
 	};
 	struct kvm_vcpu *vcpu;
 	struct kvm_run *run;
@@ -78,10 +94,17 @@ static void __test_pre_fault_memory(unsigned long vm_type, bool private)
 	uint64_t guest_test_virt_mem;
 	uint64_t alignment, guest_page_size;
 
+	pr_info("Testing guest mode: %s\n", vm_guest_mode_string(guest_mode));
+
 	vm = vm_create_shape_with_one_vcpu(shape, &vcpu, guest_code);
 
-	alignment = guest_page_size = vm_guest_mode_params[VM_MODE_DEFAULT].page_size;
-	guest_test_phys_mem = (vm->max_gfn - TEST_NPAGES) * guest_page_size;
+	guest_page_size = vm_guest_mode_params[guest_mode].page_size;
+
+	test_config.page_size = guest_page_size;
+	test_config.test_size = TEST_BASE_SIZE + test_config.page_size;
+	test_config.test_num_pages = vm_calc_num_guest_pages(vm->mode, test_config.test_size);
+
+	guest_test_phys_mem = (vm->max_gfn - test_config.test_num_pages) * test_config.page_size;
 #ifdef __s390x__
 	alignment = max(0x100000UL, guest_page_size);
 #else
@@ -91,22 +114,31 @@ static void __test_pre_fault_memory(unsigned long vm_type, bool private)
 	guest_test_virt_mem = guest_test_phys_mem & ((1ULL << (vm->va_bits - 1)) - 1);
 
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
-				    guest_test_phys_mem, TEST_SLOT, TEST_NPAGES,
-				    private ? KVM_MEM_GUEST_MEMFD : 0);
-	virt_map(vm, guest_test_virt_mem, guest_test_phys_mem, TEST_NPAGES);
-
-	if (private)
-		vm_mem_set_private(vm, guest_test_phys_mem, TEST_SIZE);
-	pre_fault_memory(vcpu, guest_test_phys_mem, SZ_2M, 0);
-	pre_fault_memory(vcpu, guest_test_phys_mem + SZ_2M, PAGE_SIZE * 2, PAGE_SIZE);
-	pre_fault_memory(vcpu, guest_test_phys_mem + TEST_SIZE, PAGE_SIZE, PAGE_SIZE);
+				    guest_test_phys_mem, TEST_SLOT, test_config.test_num_pages,
+				    p->private ? KVM_MEM_GUEST_MEMFD : 0);
+	virt_map(vm, guest_test_virt_mem, guest_test_phys_mem, test_config.test_num_pages);
+
+	if (p->private)
+		vm_mem_set_private(vm, guest_test_phys_mem, test_config.test_size);
+	pre_fault_memory(vcpu, guest_test_phys_mem, TEST_BASE_SIZE, 0);
+	/* Test pre-faulting over an already faulted range */
+	pre_fault_memory(vcpu, guest_test_phys_mem, TEST_BASE_SIZE, 0);
+	pre_fault_memory(vcpu, guest_test_phys_mem + TEST_BASE_SIZE,
+			 test_config.page_size * 2, test_config.page_size);
+	pre_fault_memory(vcpu, guest_test_phys_mem + test_config.test_size,
+			 test_config.page_size, test_config.page_size);
 
 	vcpu_args_set(vcpu, 1, guest_test_virt_mem);
+
+	/* Export the shared variables to the guest. */
+	sync_global_to_guest(vm, test_config);
+
 	vcpu_run(vcpu);
 
 	run = vcpu->run;
-	TEST_ASSERT(run->exit_reason == KVM_EXIT_IO,
-		    "Wanted KVM_EXIT_IO, got exit reason: %u (%s)",
+	TEST_ASSERT(run->exit_reason == UCALL_EXIT_REASON,
+		    "Wanted %s, got exit reason: %u (%s)",
+		    exit_reason_str(UCALL_EXIT_REASON),
 		    run->exit_reason, exit_reason_str(run->exit_reason));
 
 	switch (get_ucall(vcpu, &uc)) {
@@ -130,7 +162,12 @@ static void test_pre_fault_memory(unsigned long vm_type, bool private)
 		return;
 	}
 
-	__test_pre_fault_memory(vm_type, private);
+	struct test_params p = {
+		.vm_type = vm_type,
+		.private = private,
+	};
+
+	for_each_guest_mode(__test_pre_fault_memory, &p);
 }
 
 int main(int argc, char *argv[])
-- 
2.43.0


