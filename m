Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B5960A2611
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 18:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IdnsjNOB;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MjOEMYYW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AD4FupzOkNV/tXGDExVuku+h5mwG6UM+nTlzYdmocg8=; b=IdnsjNOBGaumbojpHH4g/XcftQ
	A+CIw5DVROZOKGVfXeZgi1TA6JvUyGCLr4cWeF08JK9+0ACNF/U/vUpPhzpSoMXFSeU/KIMxdsi2z
	BwEr/6MRnH1H5Qg7uwVipyNamIam0mT6TiSiUvATy3kgyL7koDzWmjCIj0tT7Y+KpKYy2u+fyA4dP
	wz7nRkJ9kiKHdxf8NwHwPJ+VIufmeq04TRPplSqN6VOipec/xSZBk9t5mEcIcnTyn0GamHTWg1XnX
	lENVm7Fu6nUY996QGPvCErvZILoioyZqAb/3SffIwHfOE0AG9QomPknfcabFPF6q5sJSGkRJ1AHW3
	Ywpg4YpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJERR-0000000AQVv-2Vqx;
	Tue, 20 Oct 2026 18:20:05 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJERN-0000000AQRj-1P1G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 18:20:02 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-3514b90bb89so9727769eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520400; x=1793125200; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AD4FupzOkNV/tXGDExVuku+h5mwG6UM+nTlzYdmocg8=;
        b=MjOEMYYWeLFqVq2FlCN/8HU/qBkzAEkRtIa1J9kPTHIOcK0AU0nFRROdvofvgVTJur
         u+9Vclpy/fE7oNb3U5M0tu5otIXEad4H+jGJqC4pVunuFzUDxRkHytThh/2yDEj9q9ZL
         nalnmIoGSrQdlZ19iGMjzeF4RFOdqgELZ2qyl3WHPZIYvAShXXjjGoyWoQcVMO8zZ14G
         D8KPIyJVEYIsBKbb2q5RX4oCw0jjmJwxwKjvT5C5WsAFx6F1osjfWNFk41IrzXW7gDiz
         J9EapDGgPNYi3+mykdLPeRNP+Acym8QbzymwS9l17fkrvGi3YC1Yz3XxuoJhzYjDF5rd
         RHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520400; x=1793125200;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AD4FupzOkNV/tXGDExVuku+h5mwG6UM+nTlzYdmocg8=;
        b=kO56xKFeC2Lo5ZpJu5Z39RGZ1Ix8EWgoFt/JYCK8AwxRMp/aAL28vXgZ+C1IsMEq7P
         DQMU/iqj2Fa7Qr97pLETuDU1xYGn+YabzjDZMU2ECKg4oYgaKhA9iAZmTLfBFI+umV/2
         Cg4z6fs+5BAy9RJ4vx7kCmI2hbIiJ+zWkjfdtC44t4jpaQfC45q4xrRKk7t258Y60Fpn
         D/n5gFiM7wMH6hGOqZPeI6cMsdVLUAMjUbeQryr8cJH7GpMsaUJRNCcaiLQthvZ4TWT/
         82VntS589f7wCKBHOsn2omZSFoM1hiBYXF+ET7MA+hORA51Gc7g72ml8+PYJSVtyf1b1
         xAuw==
X-Forwarded-Encrypted: i=1; AKwUvBypLiVhD8hr7W1tn6k/KZ2re8w9o91CT1TdYePsA+ILEkC6VZZIFHLeaDIvr9V9+h6FCAjDaCdUYA1Njuoos0UJ@lists.infradead.org
X-Gm-Message-State: AFq9FYL1eoQ+xCIEi2M/nF1RBGXSzuGuuHe766J1vuee22+6OTw8uYyi
	MATZu5TcpclCW6sdaMdn4jGJDFaqOWk6b87CDcLUwLSV19y/vvWL0Jcs
X-Gm-Gg: AYBFou03leltg5wQZuK9E+Nc08rgj7ayDYv3jKT8NbOozfdkf9X/FKmgGZNpRB4PL4i
	3pmIIzxolZ5zBbMYH4pd9YITMRN3h4B1S6GBIrjFWCiRjXvcQQuPH6yNVGvKdHyULtx2Wxl+4tQ
	hP0NYr+wlOdAW+1BQ7KIHaiEYx0K4qd+UZyf1Imec0ULV25zUYqL9E17AbgZRA51U7m3bd7mpJk
	lCTuCu0UU+A6HGtVRxnFwUP2jN5iZDkCC7fy3nzEPJoxOGNRvL3y5d7C2WAYXaoRR+kNec12Xz2
	BGfGgnTaDjSFxKngfUMwM+bfKtug/Gc+CDck0QjI5xfT0ijLjhaNY2D+GXJ0RZg0LYM4RHeNcjZ
	BqH1JyDCeYYZ1njgI6kt0z4xQsabSrPCTrjz5bJFa+VmVZT8aNhSBeFXUt+mKXwkcUDoggOk0Vf
	OzUdRE/+tzRzqVyLRRqCr84H7pjEPzX4Q7s4JsBqiYjesBZk8j9IJuq34sqtpGp+gCwc1q3Jobs
	Ow=
X-Received: by 2002:a05:693c:65cc:b0:367:23b6:94e1 with SMTP id 5a478bee46e88-3674e25bf5cmr60596eec.41.1792520400378;
        Tue, 20 Oct 2026 11:20:00 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm523728eec.2.2026.10.20.11.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:20:00 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v2 4/4] selftests/riscv: shadow stack must not leak on a failed clone3
Date: Tue, 20 Oct 2026 15:19:33 -0300
Message-ID: <2c48cc867d005e2e54ca7d6c28c7f87b32a7a70b.1792519121.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792519121.git.ivanrwcm25@gmail.com>
References: <cover.1792519121.git.ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_112001_386279_E53968D8 
X-CRM114-Status: GOOD (  22.98  )
X-Spam-Score: -0.1 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

clone3(CLONE_VM|CLONE_PIDFD) with an unwritable pidfd pointer fails
in put_user() after copy_thread() has mapped a shadow stack.
copy_process() then calls exit_thread(). Without HAVE_EXIT_THREAD
that free is a no-op and the VMA stays in the parent's mm.

Use kselftest.h / KTAP. Skip paths that cannot run the regression
run before ksft_set_plan(). Then confirm a valid clone3 writes a
pidfd, reject 16 bad-pidfd clones with -EFAULT, and require the
shadow-stack VMA count (VmFlags " ss") to stay unchanged.

ENOSYS, EINVAL, and EPERM from the valid clone skip. The rejected
child exits with a raw ecall. The test expects /proc already
mounted. The Makefile skips this binary when the compiler cannot
target zicfiss/zicfilp.

Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 tools/testing/selftests/riscv/cfi/Makefile    |   5 +-
 .../selftests/riscv/cfi/shstk-clone-pidfd.c   | 173 ++++++++++++++++++
 2 files changed, 177 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c

diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
index 418b4b5325a5..dbecb1fd3b82 100644
--- a/tools/testing/selftests/riscv/cfi/Makefile
+++ b/tools/testing/selftests/riscv/cfi/Makefile
@@ -13,10 +13,13 @@ endif
 
 
 ifeq ($(shell $(CC) $(CFLAGS) -nostdlib -xc /dev/null -o /dev/null > /dev/null 2>&1; echo $$?),0)
-TEST_GEN_PROGS := cfitests
+TEST_GEN_PROGS := cfitests shstk-clone-pidfd
 
 $(OUTPUT)/cfitests: cfitests.c shadowstack.c
 	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/shstk-clone-pidfd: shstk-clone-pidfd.c
+	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
 else
 
 $(shell echo "Toolchain doesn't support CFI, skipping CFI kselftest." >&2)
diff --git a/tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c b/tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c
new file mode 100644
index 000000000000..1f16d9c513e6
--- /dev/null
+++ b/tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clone3(CLONE_VM|CLONE_PIDFD) with an unwritable pidfd pointer must
+ * not leak a shadow-stack VMA. copy_thread() maps one, then put_user()
+ * fails and copy_process() calls exit_thread(). Without HAVE_EXIT_THREAD
+ * that free is a no-op and the VMA stays in the parent's mm.
+ *
+ * After enabling the shadow stack, do not return from main(): libc
+ * frames above that point have no shadow-stack entries.
+ */
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <linux/prctl.h>
+#include <linux/sched.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "../../kselftest.h"
+#include "cfi_rv_test.h"
+
+#ifndef __NR_clone3
+#define __NR_clone3 435
+#endif
+
+#ifndef PR_GET_SHADOW_STACK_STATUS
+#define PR_GET_SHADOW_STACK_STATUS	74
+#endif
+#ifndef PR_SET_SHADOW_STACK_STATUS
+#define PR_SET_SHADOW_STACK_STATUS	75
+#endif
+#ifndef PR_SHADOW_STACK_ENABLE
+#define PR_SHADOW_STACK_ENABLE		(1UL << 0)
+#endif
+
+#define NCLONE			16
+#define STACK_SIZE		(64 * 1024)
+
+static int count_ss_vmas(void)
+{
+	FILE *f;
+	char line[256];
+	int vmas = 0;
+
+	f = fopen("/proc/self/smaps", "r");
+	if (!f)
+		ksft_exit_fail_msg("fopen /proc/self/smaps: %s\n",
+				   strerror(errno));
+
+	while (fgets(line, sizeof(line), f)) {
+		if (!strncmp(line, "VmFlags:", 8) && strstr(line, " ss"))
+			vmas++;
+	}
+	fclose(f);
+	return vmas;
+}
+
+/*
+ * Raw ecall: the child resumes on an empty shadow stack, so a libc
+ * return after clone3 would fault.
+ */
+static long clone_pidfd(void *stack, size_t stack_size, int *pidfd_ptr)
+{
+	struct clone_args args = {
+		.flags = CLONE_VM | CLONE_PIDFD,
+		.pidfd = (uint64_t)(uintptr_t)pidfd_ptr,
+		.exit_signal = SIGCHLD,
+		.stack = (uint64_t)(uintptr_t)stack,
+		.stack_size = stack_size,
+	};
+	register long num __asm__("a7") = __NR_clone3;
+	register long ret __asm__("a0") = (long)&args;
+	register long sz __asm__("a1") = sizeof(args);
+	int st;
+
+	asm volatile("ecall"
+		     : "+r"(ret)
+		     : "r"(num), "r"(sz)
+		     : "memory", "cc");
+	if (ret == 0) {
+		register long n __asm__("a7") = __NR_exit;
+		register long e __asm__("a0") = 0;
+
+		asm volatile("ecall" : : "r"(n), "r"(e) : "memory");
+		__builtin_unreachable();
+	}
+	if (ret < 0)
+		return ret;
+	if (waitpid((pid_t)ret, &st, 0) < 0)
+		return -errno;
+	if (!WIFEXITED(st) || WEXITSTATUS(st) != 0)
+		return 1;
+	return 0;
+}
+
+int main(void)
+{
+	void *stack;
+	void *bad_pidfd;
+	unsigned long ss_mode = 0;
+	long rc;
+	int pidfd = -1;
+	int vmas0, vmas1;
+	int i, n_efault = 0;
+
+	ksft_print_header();
+
+	stack = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
+		     MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
+	if (stack == MAP_FAILED)
+		ksft_exit_fail_msg("mmap stack: %s\n", strerror(errno));
+
+	bad_pidfd = mmap(NULL, 4096, PROT_NONE,
+			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (bad_pidfd == MAP_FAILED)
+		ksft_exit_fail_msg("mmap pidfd page: %s\n", strerror(errno));
+
+	rc = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &ss_mode,
+			 0, 0, 0);
+	if (rc == -ENOSYS || rc == -EINVAL || rc == -EOPNOTSUPP)
+		ksft_exit_skip("shadow stack not available: %ld\n", rc);
+	if (rc)
+		ksft_exit_fail_msg("PR_GET_SHADOW_STACK_STATUS: %ld\n", rc);
+
+	if (!(ss_mode & PR_SHADOW_STACK_ENABLE)) {
+		rc = my_syscall5(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+				 PR_SHADOW_STACK_ENABLE, 0, 0, 0);
+		if (rc == -EOPNOTSUPP || rc == -EINVAL || rc == -EBUSY)
+			ksft_exit_skip("cannot enable shadow stack: %ld\n",
+				       rc);
+		if (rc)
+			ksft_exit_fail_msg("PR_SET_SHADOW_STACK_STATUS: %ld\n",
+					   rc);
+	}
+
+	rc = clone_pidfd(stack, STACK_SIZE, &pidfd);
+	if (rc == -ENOSYS || rc == -EINVAL || rc == -EPERM)
+		ksft_exit_skip("clone3 valid pidfd unavailable: %s\n",
+			       strerror(-rc));
+
+	ksft_set_plan(3);
+
+	ksft_test_result(rc == 0 && pidfd >= 0,
+			 "clone3 valid pidfd (rc=%ld pidfd=%d)\n",
+			 rc, pidfd);
+	if (pidfd >= 0)
+		close(pidfd);
+
+	vmas0 = count_ss_vmas();
+
+	for (i = 0; i < NCLONE; i++) {
+		rc = clone_pidfd(stack, STACK_SIZE, bad_pidfd);
+		if (rc == -EFAULT)
+			n_efault++;
+	}
+	ksft_test_result(n_efault == NCLONE,
+			 "clone3 bad pidfd returns -EFAULT x%d\n", NCLONE);
+
+	vmas1 = count_ss_vmas();
+	ksft_test_result(vmas1 == vmas0,
+			 "no shadow-stack VMA leak (%d -> %d)\n",
+			 vmas0, vmas1);
+
+	ksft_finished();
+}
-- 
2.43.0


