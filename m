Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E173A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eicIZeup;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQ4agUDs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xvrYZ0vevd0WRZhsvkJLTJASZ1aW+K5RqejugueGri8=; b=eicIZeupxafIVl
	wapl3Mef5kSEMTwWgY2FujLYtBGHHE/T1rP1NxtLmwrCNPZxbvGF5oEpdiXFBCu8LFk54h+g+tufg
	2rgEgItAl1uc8oEBh54LMtLGq6Mc3NrO2O+EIroDN9NtdBoSj067dB/Nak6aXcMMHFTaaWesoG5v+
	inimb0cyC2+Zehue7Kmdc6S+UAcYSwLU+XQlnUuQCav307eaB2rOothukgTXlP7CY6eoQaidhehsE
	TnhM3VNHt61fW73lv0sV2ydgiUE9Y17eAEslfsUpbTg9mWRSO/VypVO6lGLyeyJTca8/dnX1R/1sZ
	omuiKpNDfTGfbxedpmTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpyi-0000000CBL5-0Yqp;
	Fri, 30 Oct 2026 17:01:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpyf-0000000CBJu-1yB2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:01:19 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so8854605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379675; x=1793984475; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xvrYZ0vevd0WRZhsvkJLTJASZ1aW+K5RqejugueGri8=;
        b=jQ4agUDsaRMFkxDBA3p1PzEGRedDQgxyc0DLkbnpmY1NdI2l5vcJWoHZEn9PbJv1RU
         tdoIOHdMADCJO6Z7bmW7X81DgraHyk+2kc2EuMMaCf2ty6tkmXwfWOGJjSSi/6SR14gw
         24ZrFFAkMYdtpgRKMfXOOxxMwz9hlxQYizXokfu7NBtPc/nviXqAkAzm2aMmXxQFg65V
         hwd9e2Pe4tGHj54vi7J7fJ8FolketXrLfhwZsC8b/bgzR7lJHR52hlU6h2yRH5OMJ+wF
         1iGHoc+KrkLVAAAZySJpvtjXWJoZXa3IdPdyqtTsx4PCyEQDAx+TSj7fWJo3UCuSl8pG
         mbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379675; x=1793984475;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xvrYZ0vevd0WRZhsvkJLTJASZ1aW+K5RqejugueGri8=;
        b=oktjQgzeeH3O6XcypoAWzXVya7prSDsrYztVNUMilf7a47VWQ2iJmtiHHiYMR6JBoj
         E/cuIz+hLBKsyisYqR/JeOtSw5uN0vQldoxszJaiO0eODJlM8Tdq9WGVVzYMsBgR5RiO
         0aFXGrAFUvAHsvSa9C7ApSLYYm7O/+bSdD9nja1cs14tYXDPrzlmFFQT0lRGSsf0w9AG
         DLSxX1xP4pd30oV4DZRkj+PDUYxf3pgaZMIOZCg5w0IbiwaDgBJ0Y0u6kp6E1CMQ9SEP
         8e9xn2YpnDbdfm7AkLG9KTtpZ/+zGJq//Z4ziArEfGiTI2NVxbYrfRHmq+A9HYcGRU+x
         xmGg==
X-Forwarded-Encrypted: i=1; AKwUvBw59WzeFRmZjAoEwpg0yUJY6sm0ib1Y0Q2HYlAp/fjAkIVerAEr3SyQdB00gSxg+ks2xAfTaXkH/rmMag03LrWh@lists.infradead.org
X-Gm-Message-State: AFq9FYJI1P1ipGZElzKDqdNeCuedw8L7JZVfJL3R0cXtZl3l1YNZB1IH
	7i3htVgRHwpQujLD+9C8C1wB+BTegJo82bqKP6qsJ8IvnFrsLGSX5fgw
X-Gm-Gg: AYBFou0uOmPR0JZh9XaaQYZKrG1OBxNwPdL32B+AF7RaaDJrMRXtuLPs7ioVcHObOSQ
	odY7b5QKsSSf1Iz47+QPMmUw7dMPit94uON9NC7AYDU2tT2mBuqLJnHQy6dgpKLZOaSmMtQ9juy
	dghfV9OXW+/kRTl67ufDiXtSKvibrSZyYVhalowEpp7Fa4nqYN0QjXnZopViHimVDlMeZyl3x7T
	nJr38LEfaIsmEDEdh3bEbmqjdr7x+5ZbwnXnD8HGxFJrs0urpD7dgnhuf+okLBMli5mKctWQrdx
	7qFglPYLq1It9/fzrffgXGn++8afatEICJSCxI8eyvotjcozoJVkjygHZ7OQnpd5oDeTNz2hn7S
	oHu2lsKICYqKmqCYbEuAiQnf1ry+MfzP1bCxpnxiDq060LAIf5WDiTYVA+h+dmtfsjM5Ls1jFLq
	P8E6W/FHyH4kv+59B48/nei8CT/cxn0k3Z+AhVBZjSGO1zjFgJdGdoh2AF18Gr2WgortAuAuvsu
	vyab/wdEhrmxSQEYzZMjjgzdCIEIDhY49wf+W9EfBmTf8Jwp0K8RXnvPc4hgNPKXAAjYLgpQGb8
	SQ9mAXDd1zDPbAEYe+qMyyB21V33cryFB1vCFt5dpZtUFmMicjdHPaRYrCHICuHTQhA=
X-Received: by 2002:a05:600c:8b4c:b0:4a5:1cf1:b7b8 with SMTP id 5b1f17b1804b1-4ac17b2cf8amr65565185e9.28.1793379674473;
        Fri, 30 Oct 2026 10:01:14 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0950d533sm41126555e9.3.2026.10.30.10.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:01:13 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] selftests/arm64: GCS must survive io_uring SQPOLL worker exit
Date: Fri, 30 Oct 2026 14:00:46 -0300
Message-ID: <20261030170046.439736-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030170046.439736-1-ivanrwcm25@gmail.com>
References: <179330742036.2531571.12603232226357262067.b4-ty@b4>
 <20261030170046.439736-1-ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_100118_134910_8E68BBBE 
X-CRM114-Status: GOOD (  22.48  )
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

SQPOLL threads are create_io_thread() workers (args->fn + CLONE_VM).
They inherit GCS tracking via arch_dup_task_struct(); without
gcs_reset_thread() their exit runs gcs_free() on the parent's stack.

Create a SQPOLL ring, wait for iou-sqp-* to appear and leave
/proc/self/task (close only queues async teardown), then check the
parent ss VMA count is unchanged. QEMU: pass with the reset, SIGSEGV
without it.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 tools/testing/selftests/arm64/gcs/Makefile    |   2 +-
 .../selftests/arm64/gcs/gcs-uring-worker.c    | 254 ++++++++++++++++++
 2 files changed, 255 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-uring-worker.c

diff --git a/tools/testing/selftests/arm64/gcs/Makefile b/tools/testing/selftests/arm64/gcs/Makefile
index f1365eea31c9..a427041f8cd1 100644
--- a/tools/testing/selftests/arm64/gcs/Makefile
+++ b/tools/testing/selftests/arm64/gcs/Makefile
@@ -7,7 +7,7 @@
 #
 
 TEST_GEN_PROGS := basic-gcs libc-gcs gcs-locking gcs-stress gcspushm gcsstr \
-		  gcs-clone-pidfd
+		  gcs-clone-pidfd gcs-uring-worker
 TEST_GEN_PROGS_EXTENDED := gcs-stress-thread
 
 LDLIBS+=-lpthread
diff --git a/tools/testing/selftests/arm64/gcs/gcs-uring-worker.c b/tools/testing/selftests/arm64/gcs/gcs-uring-worker.c
new file mode 100644
index 000000000000..737e1a14177b
--- /dev/null
+++ b/tools/testing/selftests/arm64/gcs/gcs-uring-worker.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * io_uring SQPOLL uses create_io_thread() (args->fn + CLONE_VM) and
+ * inherits GCS tracking via arch_dup_task_struct(). Without
+ * gcs_reset_thread() on that path, worker exit runs deactivate_mm()
+ * -> gcs_free() and unmaps the parent's GCS.
+ *
+ * close(2) on the ring only queues teardown; wait for the iou-sqp-*
+ * thread to leave /proc/self/task so gcs_free() has finished before
+ * counting VMAs.
+ *
+ * After enabling GCS, do not return from main() through libc frames
+ * that were pushed before enable.
+ */
+#define _GNU_SOURCE
+
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <linux/io_uring.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/auxv.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <unistd.h>
+
+#include <asm/hwcap.h>
+
+#include "kselftest.h"
+#include "gcs-util.h"
+
+#ifndef HWCAP_GCS
+#define HWCAP_GCS			(1UL << 32)
+#endif
+
+#ifndef __NR_io_uring_setup
+#define __NR_io_uring_setup		425
+#endif
+#ifndef __NR_io_uring_enter
+#define __NR_io_uring_enter		426
+#endif
+
+#define SQPOLL_WAIT_MS			5000
+
+struct uring {
+	int fd;
+	struct io_uring_params params;
+	void *sq;
+	size_t sq_len;
+	struct io_uring_sqe *sqes;
+	size_t sqes_len;
+};
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
+static bool has_iou_sqp(void)
+{
+	DIR *d;
+	struct dirent *de;
+	char path[96], comm[32];
+	int fd, n;
+	bool found = false;
+
+	d = opendir("/proc/self/task");
+	if (!d)
+		return false;
+
+	while ((de = readdir(d))) {
+		if (de->d_name[0] < '1' || de->d_name[0] > '9')
+			continue;
+		if (snprintf(path, sizeof(path), "/proc/self/task/%s/comm",
+			     de->d_name) >= (int)sizeof(path))
+			continue;
+		fd = open(path, O_RDONLY);
+		if (fd < 0)
+			continue;
+		n = read(fd, comm, sizeof(comm) - 1);
+		close(fd);
+		if (n <= 0)
+			continue;
+		comm[n] = '\0';
+		if (!strncmp(comm, "iou-sqp-", 8)) {
+			found = true;
+			break;
+		}
+	}
+	closedir(d);
+	return found;
+}
+
+static int wait_iou_sqp(bool want, int timeout_ms)
+{
+	int slept = 0;
+
+	while (has_iou_sqp() != want) {
+		if (slept >= timeout_ms)
+			return -ETIMEDOUT;
+		usleep(1000);
+		slept++;
+	}
+	return 0;
+}
+
+static void uring_close(struct uring *r)
+{
+	if (r->sqes && r->sqes != MAP_FAILED) {
+		munmap(r->sqes, r->sqes_len);
+		r->sqes = MAP_FAILED;
+	}
+	if (r->sq && r->sq != MAP_FAILED) {
+		munmap(r->sq, r->sq_len);
+		r->sq = MAP_FAILED;
+	}
+	if (r->fd >= 0) {
+		close(r->fd);
+		r->fd = -1;
+	}
+}
+
+static int uring_sqpoll_open(struct uring *r)
+{
+	size_t cq_len;
+	int ret;
+
+	memset(r, 0, sizeof(*r));
+	r->fd = -1;
+	r->sq = MAP_FAILED;
+	r->sqes = MAP_FAILED;
+
+	r->params.flags = IORING_SETUP_SQPOLL;
+	r->params.sq_thread_idle = 100;
+	r->fd = syscall(__NR_io_uring_setup, 8, &r->params);
+	if (r->fd < 0)
+		return -errno;
+
+	if (!(r->params.features & IORING_FEAT_SINGLE_MMAP)) {
+		ret = -EOPNOTSUPP;
+		goto err;
+	}
+
+	r->sq_len = r->params.sq_off.array +
+		    r->params.sq_entries * sizeof(unsigned int);
+	cq_len = r->params.cq_off.cqes +
+		 r->params.cq_entries * sizeof(struct io_uring_cqe);
+	if (cq_len > r->sq_len)
+		r->sq_len = cq_len;
+
+	r->sq = mmap(NULL, r->sq_len, PROT_READ | PROT_WRITE,
+		     MAP_SHARED | MAP_POPULATE, r->fd, IORING_OFF_SQ_RING);
+	if (r->sq == MAP_FAILED) {
+		ret = -errno;
+		goto err;
+	}
+
+	r->sqes_len = r->params.sq_entries * sizeof(struct io_uring_sqe);
+	r->sqes = mmap(NULL, r->sqes_len, PROT_READ | PROT_WRITE,
+		       MAP_SHARED | MAP_POPULATE, r->fd, IORING_OFF_SQES);
+	if (r->sqes == MAP_FAILED) {
+		ret = -errno;
+		goto err;
+	}
+
+	return 0;
+err:
+	uring_close(r);
+	return ret;
+}
+
+int main(void)
+{
+	struct uring ring;
+	unsigned long gcs_mode;
+	long rc;
+	int vmas0, vmas1;
+
+	ksft_print_header();
+
+	if (!(getauxval(AT_HWCAP) & HWCAP_GCS))
+		ksft_exit_skip("GCS not supported\n");
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
+	rc = uring_sqpoll_open(&ring);
+	if (rc == -ENOSYS || rc == -EINVAL || rc == -EPERM ||
+	    rc == -EOPNOTSUPP || rc == -EACCES)
+		ksft_exit_skip("io_uring SQPOLL unavailable: %s\n",
+			       strerror(-rc));
+	if (rc)
+		ksft_exit_fail_msg("io_uring_setup SQPOLL: %s\n",
+				   strerror(-rc));
+
+	rc = syscall(__NR_io_uring_enter, ring.fd, 0, 0,
+		     IORING_ENTER_SQ_WAKEUP, NULL, 0);
+	if (rc < 0)
+		ksft_exit_fail_msg("io_uring_enter SQ_WAKEUP: %s\n",
+				   strerror(errno));
+
+	if (wait_iou_sqp(true, SQPOLL_WAIT_MS)) {
+		uring_close(&ring);
+		ksft_exit_fail_msg("SQPOLL thread did not appear\n");
+	}
+
+	vmas0 = count_ss_vmas();
+	if (vmas0 < 1) {
+		uring_close(&ring);
+		ksft_exit_fail_msg("expected a GCS VMA before worker exit\n");
+	}
+
+	ksft_set_plan(1);
+
+	uring_close(&ring);
+
+	if (wait_iou_sqp(false, SQPOLL_WAIT_MS))
+		ksft_exit_fail_msg("SQPOLL thread did not exit\n");
+
+	vmas1 = count_ss_vmas();
+	ksft_test_result(vmas1 == vmas0,
+			 "parent GCS VMA survives SQPOLL exit (%d -> %d)\n",
+			 vmas0, vmas1);
+
+	ksft_finished();
+}
-- 
2.43.0


