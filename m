Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1D4CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zawHBExVrVkRr6zchrF2uLNtWOiWbz0AAntBfqVKmTU=; b=jNBjNNzo4bh9hjJv0fZwH0fWxl
	NNTkAOf6s8CoK+dHBu56K4usNjkW9cMVq6eMU161V1BRKrQH4vSH04oII5ppETnp87JACyUgX1j/w
	IP2MvU4Wf5mP+mi5Q5U2nlChHhkRBak/Ued1tVMoLpRRKrWTTwV3D/oPSeHFzsrV+qH5safFGYDdI
	o9e6vi30AtlhtMJFV8yFtvTn9t1Io1iiZsG9GPMOEEdcPKXAyw3v8VzP846Bucy8jcusa65fNFjAq
	fcn46c1C1Gvsfbn+vZmWmocacZfRE5GrzsrtmjKroM1PHsrd840bz0IhAbyjICP4FZ3xHVZM3TmU7
	u7R/Idrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDnO-0000000EITb-2d0z;
	Mon, 01 Sep 2025 23:18:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utB0g-0000000Dlky-3ofi
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Sep 2025 20:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zawHBExVrVkRr6zchrF2uLNtWOiWbz0AAntBfqVKmTU=; b=MpyS1WtLmXa7ryQ+ZJbNw2VhrE
	XDEPNOsv0vm/zPYQLvGZUx7Amv3WMbRlq1NCRvDeZ1xrKLCjuS8yBo26ZmD7wkJ5N6Fq9MwChh828
	sDOj2ASz97ClwjpUq9ui6S4DT13c2xmSKxvy6KBO+PLQEIt/5i2LzAnhKooBx34uy/wk2hjjPooRe
	7hnX8YHlJRRxJZbfvuKeCAlEpKxMRx+vfP+6DSFU59oiRDrPAiIYI4U1Qyk9zguDBBhqNLDZNo23t
	Sz4yBMso/XJOhduOlu7oeprR/qFspE0QSR5wolsmLFzMt3ypdfK8use4ViBr+oFBE8NKaYENX/gfe
	WqlUgubw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utB0Z-00000003rmV-3g0T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F40F8451B5;
	Mon,  1 Sep 2025 20:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E76C4CEF7;
	Mon,  1 Sep 2025 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756758003;
	bh=JT5BiLSYDda9F7JFlPUyma7+VlywOSy3ji25SAsdSjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cIv556mj78srUYKhhiIsf5bRS5w3KmxqdTYYJ3t9pCTlMTQrWVdEk8o4UiDSI4da8
	 TwsnQcPkOLEGWnNN1i2BvzYxwKRZ2OL0Xta/6Ry1WG3dir2IyTPt2hQxAUf4ntRghe
	 Qe3qXPdw4iRHmCGfnZEdjb7cuzGd6mJy/wkpeWJB8sF6j3htHmWrVaTt4a9x6uB2BJ
	 8z++/1e0hOWXaqiyejBAk+ZC8jwyKDjZw3SRztPnBveuthxLs3GaAFdqU/wbcFpAj1
	 pOllmIj46N5FxKdsXbpS96eu3Mb7G6CjI/62ePYuW+7e0qpRcA4nQMVPFDzXmezuRQ
	 CxtulhW2ELojA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 3/6] lib/crypto: tests: Add Curve25519 benchmark
Date: Mon,  1 Sep 2025 13:18:12 -0700
Message-ID: <20250901201815.594177-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901201815.594177-1-ebiggers@kernel.org>
References: <20250901201815.594177-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_212011_670598_E2F28D0E 
X-CRM114-Status: GOOD (  12.52  )
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

Add a benchmark to curve25519_kunit.  This brings it in line with the
other crypto KUnit tests and provides an easy way to measure
performance.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/tests/curve25519_kunit.c | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/lib/crypto/tests/curve25519_kunit.c b/lib/crypto/tests/curve25519_kunit.c
index 585f7ad3ed5f7..2e1d781563648 100644
--- a/lib/crypto/tests/curve25519_kunit.c
+++ b/lib/crypto/tests/curve25519_kunit.c
@@ -3,10 +3,11 @@
  * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
 
 #include <crypto/curve25519.h>
 #include <kunit/test.h>
+#include <linux/timekeeping.h>
 
 struct curve25519_test_vector {
 	u8 private[CURVE25519_KEY_SIZE];
 	u8 public[CURVE25519_KEY_SIZE];
 	u8 result[CURVE25519_KEY_SIZE];
@@ -1317,13 +1318,43 @@ static void test_curve25519_basepoint(struct kunit *test)
 		KUNIT_EXPECT_MEMEQ_MSG(test, out, out2, CURVE25519_KEY_SIZE,
 				       "in=%*phN", CURVE25519_KEY_SIZE, in);
 	}
 }
 
+static void benchmark_curve25519(struct kunit *test)
+{
+	const u8 *private = curve25519_test_vectors[0].private;
+	const u8 *public = curve25519_test_vectors[0].public;
+	u8 out[CURVE25519_KEY_SIZE];
+	const size_t warmup_niter = 5000;
+	const size_t benchmark_niter = 1024;
+	bool ok = true;
+	u64 t;
+
+	if (!IS_ENABLED(CONFIG_CRYPTO_LIB_BENCHMARK))
+		kunit_skip(test, "not enabled");
+
+	/* Warm-up */
+	for (size_t i = 0; i < warmup_niter; i++)
+		ok &= curve25519(out, private, public);
+
+	/* Benchmark */
+	preempt_disable();
+	t = ktime_get_ns();
+	for (size_t i = 0; i < benchmark_niter; i++)
+		ok &= curve25519(out, private, public);
+	t = ktime_get_ns() - t;
+	preempt_enable();
+	KUNIT_EXPECT_TRUE(test, ok);
+	kunit_info(test, "%llu ops/s",
+		   div64_u64((u64)benchmark_niter * 1000000000, t ?: 1));
+}
+
 static struct kunit_case curve25519_test_cases[] = {
 	KUNIT_CASE(test_curve25519),
 	KUNIT_CASE(test_curve25519_basepoint),
+	KUNIT_CASE(benchmark_curve25519),
 	{},
 };
 
 static struct kunit_suite curve25519_test_suite = {
 	.name = "curve25519",
-- 
2.50.1


