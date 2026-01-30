Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2223EE6BF0A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 19:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rjy71wms5szan9FXTuTPKKlYyd/zTVsqWF/S5ag+Qgc=; b=Nn9eSOmkjUI6zpzNSaznNUm21s
	7j5bdwW8EmxdR82M0T8tqCjWYkt8oY5JtLc5Zp/IYiOwk3zEKSlkMTEQIfUZnuPy/n+QbVcvaCgMN
	y3mq26ipMECLIx26Y9LMgYfP+A0P1ab2iEd/LkyIU3qtlQCd9vmG8bwQWKaSYknUa5TfjKnyajhOK
	EYmjSmYxk0MGdUSfLXjPTckeAN3pXdbE83UQcUbkx7c7OmCnVcs3JWAmW/QQ2DJz5UpL1APhKw3Ij
	T8OwWYssR6pcTua2QuQ+PMqRTcmbfH204Fi1dY9BL3IHdfA3SOccMV71os77dzKpIeG2K39flY1O3
	VJd1EA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vluAf-00000001t20-2s2j;
	Fri, 30 Jan 2026 19:28:45 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vluAd-00000001t1c-0qrh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 19:28:44 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34c5d6193daso5524057a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 11:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769801321; x=1770406121; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rjy71wms5szan9FXTuTPKKlYyd/zTVsqWF/S5ag+Qgc=;
        b=LCel3BL9z6iAU9oSuWtpIosgVGvmIm/jv2T7zgK/eSOxBpGpwprqa7gata+Y7j74O+
         HXRTaDVWE/AXGe96R+bbhxtBB177ce0Wrn6kO0JsreyVvF21NB/m95hSvhEKTA244dja
         69qrBHjGeC+nidsovdLijZGYQO1m9MlChnL0jvaeYqPbR4dnhyJNjeGhChcTVVtU4q7j
         n2/T6QJlGLXC2Ztg9cNJd+4PBixVvWQ914dBqdsRXBI33yK94PZObWcJoxBM6sUhPT/f
         +hsm4qylPkd5C/QRLriAa/FWP++hIh/qDQeEnNfkEzrZDNWkha3agurV/rJR7BpPjUg9
         Yj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769801321; x=1770406121;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rjy71wms5szan9FXTuTPKKlYyd/zTVsqWF/S5ag+Qgc=;
        b=HGABQYYT60OrLAQI4+wizQ1O8ARwPEClGUI3ogrRkImT+ZzO/0IGBnFjK+NuDMgnX9
         mlSY6vnDONm7OibOj6gtR1sFsap/TJEaQavsh/0i79uCH41dvuNRJ19vPuEeB+z5r4Vm
         D0taZ3qSeLVBtJ4gQHeLJZuMN6c3beDyHJJpfwD8Bq4vJeqfBn3h9bEjDTtgXi00OOpY
         5pLkyIQHbDUYZd1Q+0y20uTMxp96S+ttJR3jZnfqzZuO+bCGcCWX8ElujyjwcvF8c91u
         Vc9TR5vHkn/d/eIm/yqkEYP8/prpq6LtBuWkraE3jru8w9oyfgiyOkcZ/fJqUeeMfRD4
         Y87w==
X-Forwarded-Encrypted: i=1; AJvYcCUeTjV9wfbgyHzVd4qdeueIhEhomqb0J88kkfMH1O1ypZLqoZbfeKsbzQbMm4Y0xv9qobZHYsxSfyuFrfqBQhzA@lists.infradead.org
X-Gm-Message-State: AOJu0YznYGhKftheeC1fCnCZzKT8ChwAhNj1aHckuTb72G3QxTsJpI5U
	uGIN3ymYVjN9e4m8IQlSMOGvANqnY2mPYqR2m4m+rgkpyP2KYXxjAo98+5vGbJ1VGje2QnpAJ7a
	/L7J7tLOTm9AeOA==
X-Received: from pgct22.prod.google.com ([2002:a05:6a02:5296:b0:bd9:19be:503c])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a11c:b0:38e:9d3b:470b with SMTP id adf61e73a8af0-392e01096dbmr3663945637.42.1769801321501;
 Fri, 30 Jan 2026 11:28:41 -0800 (PST)
Date: Fri, 30 Jan 2026 19:28:37 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260130192837.890688-1-jiaqiyan@google.com>
Subject: [PATCH v1] KVM: selftests: Improve sea_to_user test
From: Jiaqi Yan <jiaqiyan@google.com>
To: oupton@kernel.org
Cc: sebott@redhat.com, gshan@redhat.com, yuzenghui@huawei.com, maz@kernel.org, 
	rananta@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	pbonzini@redhat.com, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_112843_273319_2CB2942C 
X-CRM114-Status: GOOD (  18.39  )
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

Several improvments to the test for KVM_EXIT_ARM_SEA:

- Refactor run_vm to catch GUEST_FAIL, instead of causing confusing
  unhandled MMIO kvm exit.

- Sync far_invalid to guest.

- Exit test with KSFT_SKIP or KSFT_FAIL when should.

- Add comment about VM backing memory type.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 .../testing/selftests/kvm/arm64/sea_to_user.c | 94 +++++++++++--------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/sea_to_user.c b/tools/testing/selftests/kvm/arm64/sea_to_user.c
index 573dd790aeb8e..4a3511fa1f940 100644
--- a/tools/testing/selftests/kvm/arm64/sea_to_user.c
+++ b/tools/testing/selftests/kvm/arm64/sea_to_user.c
@@ -12,6 +12,11 @@
  * including the notrigger feature. Otherwise the test will be skipped.
  * The under-test platform's APEI should be unable to claim SEA. Otherwise
  * the test will also be skipped.
+ *
+ * The VM backing memory is tied to HugeTLB 1G hugepage so far. Make sure
+ * there are more than 4 1G hugepage on the system. They can be allocated
+ * at runtime by:
+ *   echo 4 > /sys/kernel/mm/hugepages/hugepages-1048576kB/nr_hugepages
  */
 
 #include <signal.h>
@@ -98,11 +103,15 @@ static void write_einj_entry(const char *einj_path, uint64_t val)
 
 static void inject_uer(uint64_t paddr)
 {
-	if (access("/sys/firmware/acpi/tables/EINJ", R_OK) == -1)
-		ksft_test_result_skip("EINJ table no available in firmware");
+	if (access("/sys/firmware/acpi/tables/EINJ", R_OK) == -1) {
+		ksft_test_result_skip("EINJ table not available in firmware\n");
+		exit(KSFT_SKIP);
+	}
 
-	if (access(EINJ_ETYPE, R_OK | W_OK) == -1)
-		ksft_test_result_skip("EINJ module probably not loaded?");
+	if (access(EINJ_ETYPE, R_OK | W_OK) == -1) {
+		ksft_test_result_skip("EINJ module probably not loaded?\n");
+		exit(KSFT_SKIP);
+	}
 
 	write_einj_entry(EINJ_ETYPE, ERROR_TYPE_MEMORY_UER);
 	write_einj_entry(EINJ_FLAGS, MASK_MEMORY_UER);
@@ -123,12 +132,13 @@ static void sigbus_signal_handler(int sig, siginfo_t *si, void *v)
 	ksft_print_msg("SIGBUS (%d) received, dumping siginfo...\n", sig);
 	ksft_print_msg("si_signo=%d, si_errno=%d, si_code=%d, si_addr=%p\n",
 		       si->si_signo, si->si_errno, si->si_code, si->si_addr);
-	if (si->si_code == BUS_MCEERR_AR)
+	if (si->si_code == BUS_MCEERR_AR) {
 		ksft_test_result_skip("SEA is claimed by host APEI\n");
-	else
+		exit(KSFT_SKIP);
+	} else {
 		ksft_test_result_fail("Exit with signal unhandled\n");
-
-	exit(0);
+		exit(KSFT_FAIL);
+	}
 }
 
 static void setup_sigbus_handler(void)
@@ -158,7 +168,6 @@ static void expect_sea_handler(struct ex_regs *regs)
 {
 	u64 esr = read_sysreg(esr_el1);
 	u64 far = read_sysreg(far_el1);
-	bool expect_far_invalid = far_invalid;
 
 	GUEST_PRINTF("Handling Guest SEA\n");
 	GUEST_PRINTF("ESR_EL1=%#lx, FAR_EL1=%#lx\n", esr, far);
@@ -166,7 +175,7 @@ static void expect_sea_handler(struct ex_regs *regs)
 	GUEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_DABT_CUR);
 	GUEST_ASSERT_EQ(esr & ESR_ELx_FSC_TYPE, ESR_ELx_FSC_EXTABT);
 
-	if (expect_far_invalid) {
+	if (far_invalid) {
 		GUEST_ASSERT_EQ(esr & ESR_ELx_FnV, ESR_ELx_FnV);
 		GUEST_PRINTF("Guest observed garbage value in FAR\n");
 	} else {
@@ -185,25 +194,19 @@ static void vcpu_inject_sea(struct kvm_vcpu *vcpu)
 	vcpu_events_set(vcpu, &events);
 }
 
-static void run_vm(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
+static void validate_kvm_exit_arm_sea(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 {
-	struct ucall uc;
-	bool guest_done = false;
 	struct kvm_run *run = vcpu->run;
 	u64 esr;
 
-	/* Resume the vCPU after error injection to consume the error. */
-	vcpu_run(vcpu);
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_ARM_SEA);
 
-	ksft_print_msg("Dump kvm_run info about KVM_EXIT_%s\n",
-		       exit_reason_str(run->exit_reason));
+	ksft_print_msg("Dumping kvm_run as arm_sea:\n");
 	ksft_print_msg("kvm_run.arm_sea: esr=%#llx, flags=%#llx\n",
 		       run->arm_sea.esr, run->arm_sea.flags);
 	ksft_print_msg("kvm_run.arm_sea: gva=%#llx, gpa=%#llx\n",
 		       run->arm_sea.gva, run->arm_sea.gpa);
 
-	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_ARM_SEA);
-
 	esr = run->arm_sea.esr;
 	TEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_DABT_LOW);
 	TEST_ASSERT_EQ(esr & ESR_ELx_FSC_TYPE, ESR_ELx_FSC_EXTABT);
@@ -211,39 +214,48 @@ static void run_vm(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	TEST_ASSERT_EQ((esr & ESR_ELx_INST_SYNDROME), 0);
 	TEST_ASSERT_EQ(esr & ESR_ELx_VNCR, 0);
 
-	if (!(esr & ESR_ELx_FnV)) {
-		ksft_print_msg("Expect gva to match given FnV bit is 0\n");
+	far_invalid = esr & ESR_ELx_FnV;
+	sync_global_to_guest(vm, far_invalid);
+
+	if (!far_invalid) {
+		ksft_print_msg("Expect gva to match\n");
 		TEST_ASSERT_EQ(run->arm_sea.gva, EINJ_GVA);
 	}
 
 	if (run->arm_sea.flags & KVM_EXIT_ARM_SEA_FLAG_GPA_VALID) {
-		ksft_print_msg("Expect gpa to match given KVM_EXIT_ARM_SEA_FLAG_GPA_VALID is set\n");
+		ksft_print_msg("Expect gpa to match\n");
 		TEST_ASSERT_EQ(run->arm_sea.gpa, einj_gpa & PAGE_ADDR_MASK);
 	}
+}
 
-	far_invalid = esr & ESR_ELx_FnV;
-
-	/* Inject a SEA into guest and expect handled in SEA handler. */
-	vcpu_inject_sea(vcpu);
+static void run_vm(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
+{
+	struct ucall uc;
+	bool guest_done = false;
 
 	/* Expect the guest to reach GUEST_DONE gracefully. */
 	do {
 		vcpu_run(vcpu);
-		switch (get_ucall(vcpu, &uc)) {
-		case UCALL_PRINTF:
-			ksft_print_msg("From guest: %s", uc.buffer);
-			break;
-		case UCALL_DONE:
-			ksft_print_msg("Guest done gracefully!\n");
-			guest_done = 1;
-			break;
-		case UCALL_ABORT:
-			ksft_print_msg("Guest aborted!\n");
-			guest_done = 1;
-			REPORT_GUEST_ASSERT(uc);
-			break;
-		default:
-			TEST_FAIL("Unexpected ucall: %lu\n", uc.cmd);
+		if (vcpu->run->exit_reason == KVM_EXIT_ARM_SEA) {
+			validate_kvm_exit_arm_sea(vm, vcpu);
+			vcpu_inject_sea(vcpu);
+		} else {
+			switch (get_ucall(vcpu, &uc)) {
+			case UCALL_PRINTF:
+				ksft_print_msg("From guest: %s", uc.buffer);
+				break;
+			case UCALL_DONE:
+				ksft_print_msg("Guest done gracefully!\n");
+				guest_done = 1;
+				break;
+			case UCALL_ABORT:
+				ksft_print_msg("Guest aborted!\n");
+				guest_done = 1;
+				REPORT_GUEST_ASSERT(uc);
+				break;
+			default:
+				TEST_FAIL("Unexpected ucall: %lu\n", uc.cmd);
+			}
 		}
 	} while (!guest_done);
 }
-- 
2.53.0.rc2.204.g2597b5adb4-goog


