Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F81606A753
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BeDUoccd;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n6HrigJI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mY4KZSmblzicF17NIegUjErpV+VQHRUnKGe9o1onwtc=; b=BeDUoccdxkNFSN
	IM8n1Z8OQrI6k99xYxCS2Od9FV08DaU6MDCrYEShtg677qtUi4KWCzkq61v2zW9adyRXT1EEFcrcL
	gml8/LcYTpKLCMudKK9cq7iRD/oPrV1cWaeS+8bIiZe6zASK//NdngChMDUfUQi1svPoQiTLQAfHQ
	CKZOGwkXTWZFOQy1HKcE3fSAhc3RMYa+csFLFhokyGftOmrE4jhj9sCoaLn0Oz/BZk6oRfNxzegi4
	e03t6mJOHRZqNK2+QTgoUmZOnIHydyPyAI7JBCg0NLZKmsn83PQLFzxL+Ie2w5muE8N+d87iJhmrK
	v9VBfkuDatbQ/iJ7FSAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5pq-00000007Ruw-0Twa;
	Wed, 28 Oct 2026 15:45:06 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5pk-00000007Rok-2jRK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:45:03 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso852759f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202298; x=1793807098; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mY4KZSmblzicF17NIegUjErpV+VQHRUnKGe9o1onwtc=;
        b=n6HrigJIQS6UQByAUFw9eqz2S9l+cbPdOst+beHsVEeKCbNH5uSWSNpRsKGfWWL0od
         KvOzw4uQk5Kzzv7Pkj9bG/0tRh/0feq/yBe9QPTgJf6OPK8ymJ16TKugReeVoWDRm6/0
         bAF+7K9Z1FFB+d/VBszVl7o3rDEAsCyuuwMfJ+DnAX9yuDJYntZi++dY/kREdcFtlhLq
         JBX+/NxrfJ8oy7sndfRJ7YFNJsubDfLyw2VZz2iwfUbWqZ3UU4ubiCIC/eumV3HrYSuL
         IhQjjnR1B7jd2rYxUjpZwUfaGSzA38m/WJ8hGeEanF4UywuRFZYemnjWxGy6vGpm20Vl
         ktCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202298; x=1793807098;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY4KZSmblzicF17NIegUjErpV+VQHRUnKGe9o1onwtc=;
        b=rtgXKL/OZA0BMCYdJfplmlFTkDMhBaz9pge2Td8atld9VnxTFkpYQ40dEYcRNlfnBs
         FuQilj4A1mZ38LcVBVnpt90c7d5fq5BphnDROKZ3B0a2PG/IBGqEQNtnQdcPC9Nt0Urg
         A8Aegm0aX/eejAKheKws3zY03sjkeuY8CgNtzha3BnbMITo4ngB6R1URrDJY7cJ83cA2
         nrv4H9VJHCBobJdWswZhHCEDd4fzng55BwhoNHeXR8Mz4d0H0TlNHBW88xjskHzv+xt8
         jk5g+p0UfuInZjlVGyHQmo2Sc3nJQbmFvv22jtMuv9B3M21Z8MWMkbz7m/SktEdEafan
         +wOA==
X-Forwarded-Encrypted: i=1; AKwUvBzWgPTrQOl3rc+v09oVfP57TaqVP0lpCrys+JSjRIq/FrfWH/iCBiaGxOzp5wheFeSmSSp6Ql4PhE7yYaI6LDEJ@lists.infradead.org
X-Gm-Message-State: AFq9FYJbGJIipwztMTw3PNk7pCZl1oHh8Z0OFsTIN5p6W4RUB9RkD4j9
	r9AtD47UoaKNle2nT80P6htWv9Hc0juorr30FolxTDYmh+B0iR91iW5o
X-Gm-Gg: AYBFou01HJDLJfPIq1OZErb9sSX3HqBl7g0RiJdBybE74uoZN73K+IytPchGOIIQRWT
	l7BKtRH2Y/ZpJUA+aPrI541YOBHmJyCtLDBxLkem+ME+jjghCyhCQjtdMTMB/gfnXAVtyWIbZiD
	IRoqDIGbSP/ii21EJMtIx6jpuNU6byRKIq3KovN21aDvZT7Bu07TDaTOtKuvyoeLSOV7oG7/SIR
	EhPkp4uiHGEOjkSiMMe3RtH2FAeCp5EzT+OQHZY0+wZGRWxezB/+IrKBX6bvuWvWVVWSTIH8V1u
	4nA6jk03BWi1UXCG72BHw2JmCgzHOK9M11kAMoIkCTM1Yp+WAu4aeTvy5qNyxJCfBlDubtkQY2i
	7nZrfQsyzW//IQ4YQBb9bMmApm7N+LkwdIWmta3uDrFftHJrnM2joA1vCSTEZXBEkOeA5Il9jJS
	eYSYaZx0vmnRymby//N4guNXI1uTp7JycS5xW8C4CKgqWDUElAFiaEYPC+8dE72pLsDaqAUMAdk
	Bzx435jy5n9yJYDEm561390EbpsIBmnNt5WAtYxJwNyAKWoScAlYJkhgYnFWWlI1peCHq1XB68g
	NZpanDdz7IFV2nlPw+9gI4r40zKUHdN2SLT3ApMmraMfs02VKS2NBQp5OkrGc9Emkg==
X-Received: by 2002:a05:6000:1446:b0:487:91e:d8ed with SMTP id ffacd0b85a97d-48e5d58d47emr7093332f8f.2.1793202297940;
        Wed, 28 Oct 2026 08:44:57 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:55 -0700 (PDT)
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
Subject: [PATCH v3 4/4] selftests/riscv: shadow stack must not leak on a failed clone3
Date: Wed, 28 Oct 2026 12:43:15 -0300
Message-ID: <20261028154315.1272705-5-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_084500_751645_02EBD553 
X-CRM114-Status: GOOD (  21.80  )
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

Same clone3 bad-pidfd check as the arm64 GCS selftest.

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


