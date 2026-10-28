Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020BA606C055
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uCY31z5W;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z2gOQ6O9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ms02nrJTaBuo+AIaXcDfc5FWiw4agEchEQ/tyzSsLpc=; b=uCY31z5WqVDns+
	KENoDN7uG4xseOTiRkfozo9UTa4OuhqSVRPXdFpOeGt9yJnu5UCcjE2DL9it6UuMTnHGex5CzqwKH
	SXnIrbiZj4mDXuusxKTSmYLH52XgEB+HDVd3QX/8mblzsecnx4Tjv37n0/XRH3Nzzgu6he6bGJm8a
	LSI8W5EyAFzfbYFmuHY/aNJfSI1Jb2PPj1dB5B6IRXLOUitpzm2ZmeIW6f0qAieznniLsqLsCfraJ
	Z0bGJDMQvD/ViIUNeDw6E4kJ9KoqXtDuqU2hwR412WqqVU5HRVwSBKi9sy1qGy122ph6NiEdXl0pG
	I80QirzUYCJrl83fBlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5pT-00000007Raz-2AnM;
	Wed, 28 Oct 2026 15:44:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5pQ-00000007RXw-416o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:44:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso9769985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 08:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202279; x=1793807079; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ms02nrJTaBuo+AIaXcDfc5FWiw4agEchEQ/tyzSsLpc=;
        b=Z2gOQ6O9npd3VA7ueTFTU8C8UaNQr0HEN6smEmb/mn633dHNKxPu7Q1vLmgxiiqIEt
         AxtykygE57+8jX9b4V28HLOzymDAYeoemE/74cY8MlCBolUjKi4seYB/Ez7TcKMhSd9y
         s9+OHsrwsqBiVSb04DXtC1fGcxzDEPCo9bujG6cpqOauu2/x6uFvUyr+oCqm6uHpgpP8
         nmmMHWr24IeHvUxaS05OgPKRjS7CVl2HFOtBwrJ9rAjTcxam6yIwqro1++C3aavJgFy/
         rynxspar/m53h8pMAnftLePltDOdYeabBxkFyibSia2IGAPr6mJA9vjKokm3FgJ/56b7
         Gm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202279; x=1793807079;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ms02nrJTaBuo+AIaXcDfc5FWiw4agEchEQ/tyzSsLpc=;
        b=kAO5Yp8PMod5CTdyHmp+BQ5+62Gua2GUvdamBCzbX+wAUZnt5IrhzfrhAJXY6iO3jJ
         gea8EWIEdbhyesFYqUNMCjFCscIURjapBnBSf2eX9CgWGdVX6AtWVPXcHQkTh+Xr5muP
         uCAeUgf3wNMWqE4ISV+mXoPL4d4jN7jE3YB0lgTVbprYkZH2zPtc8WwR+/wWeBE36iFx
         upR50UsDphy/Hpemdbtboj5hZqlEsnBXsBJx2tXYRgqPWrC/pP007vqdBlE7Jpq7bU8A
         1uZ4ndxMupXHeU5kYRxMRcyx/8BGZ2qO5dgYQ6hK6BpEkJxiTeCaD2jAmPvP/Whnb4ye
         SYpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFxILyVfd1Uq/qKRLGfmEs6AbGuONdh16gcVG/4RMzyaTdRg6LlDtkQj8YC5GiB4Rpn3rAEJzmsrs6qHZd1psO@lists.infradead.org
X-Gm-Message-State: AFq9FYKPr5EtEoF6CDMqCa1f61bkpGPOhlHiswcaZ0eXqaZ5hR3NT7Wn
	CYhh18G5neC6aj+NVn6pp0L+M8tl/DWpK1gyK0Qg6d0+gqqMHQvWDEZj
X-Gm-Gg: AYBFou1Xkv1pBtsGCh+MWaghXB7CnxbGWnkjG0T8cS8VbKTvhv4Un4oIZ2BrdnOqKQE
	HKgjfS4q2MPsXYI54TZhz5wtw7KvnpDInWebkBUW7CrTnixa92xgFA4K+j9ESzsdo7Y2AumOYc3
	YM6da27LZfTO3K+AddqaD7h3P4GYjihT8Ln6dUCZspHvzTUiMPTcbUag+9F33qOboVUlMg3aDvu
	66cxfCLJAN3NQuKfWrCAsUeaspqJAvthhFd92EoTfCDg/pmqF6qHDV1KasNvmpajVGUmmfHGD1V
	dA4wdvsVaCdu+zn4DBspDb+iH/xXdXTwjWbcxcCADXY0wVIBUE5fmG1ww+zzP7EB7tDcd8y0Cf7
	HLJ0zQ0jBiivC70VwYO/7SQ73qUHCFk30Ea9LgQuDpD6rr1BWT9sADR2FJ3cskt0j+/qsLp8Yj2
	DwWXcbssKW8a4HZR5feurdb02xHSBrQ+9Y6bK4Oo2OdYFRmVS3Jqy5igqhPomgYtnXQn/QeHDUw
	bBxGTJYdx9jiOt7QDDw99j4JkCiDgD1qlnx6c7GLG+lmBStD3t6f4nqNdbGS81DqxDbsTd3xCMI
	KUIbFeN9PccNYX5rIG+4VjJIzUhCNOm4dfHwiSQ7qAEWJzR823qTB4mAv6ochL3D8g==
X-Received: by 2002:a05:600c:6211:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4a965ec94ffmr51952945e9.11.1793202278790;
        Wed, 28 Oct 2026 08:44:38 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:37 -0700 (PDT)
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
Subject: [PATCH v3 3/4] selftests/arm64: GCS must not leak on a failed clone3
Date: Wed, 28 Oct 2026 12:43:14 -0300
Message-ID: <20261028154315.1272705-4-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_084441_068120_BA1FA08E 
X-CRM114-Status: GOOD (  25.08  )
X-Spam-Score: 0.1 (/)
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

KTAP coverage for clone3(CLONE_VM|CLONE_PIDFD) with a bad pidfd
pointer: sixteen failures must not grow the parent's GCS VMA count.

Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 tools/testing/selftests/arm64/gcs/Makefile    |   3 +-
 .../selftests/arm64/gcs/gcs-clone-pidfd.c     | 168 ++++++++++++++++++
 .../testing/selftests/arm64/gcs/gcs-locking.c |  20 ---
 tools/testing/selftests/arm64/gcs/gcs-util.h  |  24 +++
 tools/testing/selftests/arm64/gcs/libc-gcs.c  |  20 ---
 5 files changed, 194 insertions(+), 41 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c

diff --git a/tools/testing/selftests/arm64/gcs/Makefile b/tools/testing/selftests/arm64/gcs/Makefile
index 1fbbf0ca1f02..f1365eea31c9 100644
--- a/tools/testing/selftests/arm64/gcs/Makefile
+++ b/tools/testing/selftests/arm64/gcs/Makefile
@@ -6,7 +6,8 @@
 # nolibc.
 #
 
-TEST_GEN_PROGS := basic-gcs libc-gcs gcs-locking gcs-stress gcspushm gcsstr
+TEST_GEN_PROGS := basic-gcs libc-gcs gcs-locking gcs-stress gcspushm gcsstr \
+		  gcs-clone-pidfd
 TEST_GEN_PROGS_EXTENDED := gcs-stress-thread
 
 LDLIBS+=-lpthread
diff --git a/tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c b/tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c
new file mode 100644
index 000000000000..96400ea376c0
--- /dev/null
+++ b/tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clone3(CLONE_VM|CLONE_PIDFD) with an unwritable pidfd pointer must
+ * not leak a GCS VMA. copy_thread() maps one, then put_user() fails
+ * and copy_process() calls exit_thread(). Without HAVE_EXIT_THREAD
+ * that free is a no-op and the VMA stays in the parent's mm.
+ *
+ * After enabling GCS, do not return from main(): libc frames above
+ * that point have no GCS entries.
+ */
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <linux/sched.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/auxv.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include <asm/hwcap.h>
+
+#include "kselftest.h"
+#include "gcs-util.h"
+
+#ifndef HWCAP_GCS
+#define HWCAP_GCS		(1UL << 32)
+#endif
+
+#ifndef __NR_clone3
+#define __NR_clone3 435
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
+ * CLONE_VM maps a new GCS. CLONE_PIDFD lets put_user() fail after that.
+ * Use a raw svc: the child resumes on an empty GCS, so a libc return
+ * after clone3 would fault; exit the same way.
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
+	register long num __asm__("x8") = __NR_clone3;
+	register long ret __asm__("x0") = (long)&args;
+	register long sz __asm__("x1") = sizeof(args);
+	int st;
+
+	asm volatile("svc #0"
+		     : "+r"(ret)
+		     : "r"(num), "r"(sz)
+		     : "memory", "cc");
+	if (ret == 0) {
+		register long n __asm__("x8") = __NR_exit;
+		register long e __asm__("x0") = 0;
+
+		asm volatile("svc #0" : : "r"(n), "r"(e) : "memory");
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
+	unsigned long gcs_mode;
+	long rc;
+	int pidfd = -1;
+	int vmas0, vmas1;
+	int i, n_efault = 0;
+
+	ksft_print_header();
+
+	if (!(getauxval(AT_HWCAP) & HWCAP_GCS))
+		ksft_exit_skip("GCS not supported\n");
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
+	rc = my_syscall2(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &gcs_mode);
+	if (rc)
+		ksft_exit_fail_msg("PR_GET_SHADOW_STACK_STATUS: %ld\n", rc);
+
+	if (!(gcs_mode & PR_SHADOW_STACK_ENABLE)) {
+		rc = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+				 PR_SHADOW_STACK_ENABLE);
+		if (rc == -EOPNOTSUPP || rc == -EINVAL || rc == -EBUSY)
+			ksft_exit_skip("cannot enable GCS: %ld\n", rc);
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
+			 "no GCS VMA leak (%d -> %d)\n", vmas0, vmas1);
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/arm64/gcs/gcs-locking.c b/tools/testing/selftests/arm64/gcs/gcs-locking.c
index 80a1317f6097..8877fd2d2eab 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-locking.c
+++ b/tools/testing/selftests/arm64/gcs/gcs-locking.c
@@ -18,26 +18,6 @@
 
 #include "gcs-util.h"
 
-#define my_syscall2(num, arg1, arg2)                                          \
-({                                                                            \
-	register long _num  __asm__ ("x8") = (num);                           \
-	register long _arg1 __asm__ ("x0") = (long)(arg1);                    \
-	register long _arg2 __asm__ ("x1") = (long)(arg2);                    \
-	register long _arg3 __asm__ ("x2") = 0;                               \
-	register long _arg4 __asm__ ("x3") = 0;                               \
-	register long _arg5 __asm__ ("x4") = 0;                               \
-	                                                                      \
-	__asm__  volatile (                                                   \
-		"svc #0\n"                                                    \
-		: "=r"(_arg1)                                                 \
-		: "r"(_arg1), "r"(_arg2),                                     \
-		  "r"(_arg3), "r"(_arg4),                                     \
-		  "r"(_arg5), "r"(_num)					      \
-		: "memory", "cc"                                              \
-	);                                                                    \
-	_arg1;                                                                \
-})
-
 /* No mode bits are rejected for locking */
 TEST(lock_all_modes)
 {
diff --git a/tools/testing/selftests/arm64/gcs/gcs-util.h b/tools/testing/selftests/arm64/gcs/gcs-util.h
index 7a81bb07ed4b..46f6ed9cf54d 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-util.h
+++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
@@ -43,6 +43,30 @@
 #define GCS_CAP(x) (((unsigned long)(x) & GCS_CAP_ADDR_MASK) | \
 		    GCS_CAP_VALID_TOKEN)
 
+/*
+ * prctl(..., arg1, arg2) with unused registers forced to zero.  The
+ * kernel rejects non-zero unused args; libc may leave garbage there.
+ */
+#define my_syscall2(num, arg1, arg2)					\
+({									\
+	register long _num  __asm__ ("x8") = (num);			\
+	register long _arg1 __asm__ ("x0") = (long)(arg1);		\
+	register long _arg2 __asm__ ("x1") = (long)(arg2);		\
+	register long _arg3 __asm__ ("x2") = 0;				\
+	register long _arg4 __asm__ ("x3") = 0;				\
+	register long _arg5 __asm__ ("x4") = 0;				\
+									\
+	__asm__ volatile (						\
+		"svc #0\n"						\
+		: "=r"(_arg1)						\
+		: "r"(_arg1), "r"(_arg2),				\
+		  "r"(_arg3), "r"(_arg4),				\
+		  "r"(_arg5), "r"(_num)					\
+		: "memory", "cc"					\
+	);								\
+	_arg1;								\
+})
+
 static inline unsigned long *get_gcspr(void)
 {
 	unsigned long *gcspr;
diff --git a/tools/testing/selftests/arm64/gcs/libc-gcs.c b/tools/testing/selftests/arm64/gcs/libc-gcs.c
index ddb0b2b20155..4e9fa9b82f0f 100644
--- a/tools/testing/selftests/arm64/gcs/libc-gcs.c
+++ b/tools/testing/selftests/arm64/gcs/libc-gcs.c
@@ -24,26 +24,6 @@
 
 #include "gcs-util.h"
 
-#define my_syscall2(num, arg1, arg2)                                          \
-({                                                                            \
-	register long _num  __asm__ ("x8") = (num);                           \
-	register long _arg1 __asm__ ("x0") = (long)(arg1);                    \
-	register long _arg2 __asm__ ("x1") = (long)(arg2);                    \
-	register long _arg3 __asm__ ("x2") = 0;                               \
-	register long _arg4 __asm__ ("x3") = 0;                               \
-	register long _arg5 __asm__ ("x4") = 0;                               \
-	                                                                      \
-	__asm__  volatile (                                                   \
-		"svc #0\n"                                                    \
-		: "=r"(_arg1)                                                 \
-		: "r"(_arg1), "r"(_arg2),                                     \
-		  "r"(_arg3), "r"(_arg4),                                     \
-		  "r"(_arg5), "r"(_num)					      \
-		: "memory", "cc"                                              \
-	);                                                                    \
-	_arg1;                                                                \
-})
-
 static noinline void gcs_recurse(int depth)
 {
 	if (depth)
-- 
2.43.0


