Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63F3606D238
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TjfgOTpL;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cALW2hlF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a05nv5fincC2k/bvjU+c6gmqxIBRW8o0fYRmcOAk9I0=; b=TjfgOTpLsnV60v
	0WEGwBTeFTNXO5so6NraqrBnpykcjIKW5CYdcLMEZiP/SmJctpQHVW8gaz9vEAnZ8wGbfzU4QL47+
	MKTU13pb656yI9lzCZWuwo4Lpi5Ix04VqA882G/b+2pXU9R0yTKLNMuXBT2+e6SzHofyF0hmTyI7y
	ZNEoqBM+RxYK4KeYNeBb1nPol4GSaNS1sd0KJaFLQflZHdGZhba/7pKwNidlq3p+hBJNhaXC0gdEN
	l5Yr7NXJ2Ap+keeieRASCaaXQOTjv/C2rHekGO3nWKXksLPOEyyykWMlJYwwIL8+WELm2i6rH0s8O
	Fyu03qNhGZLqldRujxKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxQ-0000000GQvD-16wA;
	Mon, 02 Nov 2026 12:16:12 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxK-0000000GQeo-0e6n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:16:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso28853525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621764; x=1794226564; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a05nv5fincC2k/bvjU+c6gmqxIBRW8o0fYRmcOAk9I0=;
        b=cALW2hlFYHMjaGh/L6DI8G4bJwonoB6mrO2THbBSMi3esOOxc2VBSCIsRnRHSYArR+
         4ES2u+4/L3tyRJFHTMMBs7Ufl0qbAWtRy+MhqI4Kwav0kFlqG6Y0voWVA6+0S0f5fH48
         qFjvpqQb8JWq8O2cox3g/dhmR6EgELczvHkynvdx3iVwDVl6PzrzZGn66C3FkTB5xlBW
         KMakNjO/fcBNGReNstXE3rWBjEWasjj8Ud9W4XHq/mZZ8QetRr9QDqD7utkDKT0y8sVt
         OqEjFecx36Gw1DkbolFb10S90o13JI4J9X1ts3Bp0kXG8atbLc9AYDqUyjXdx0JI95sq
         ro7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621764; x=1794226564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a05nv5fincC2k/bvjU+c6gmqxIBRW8o0fYRmcOAk9I0=;
        b=NUP8fiU5PJtz5ckNCDYm7TZpDxpm9ixvtcZGNmRB5XqjEVZ64rZVObchS1Cqrt8UJv
         uUQzC2CBA4uxJb22rrqh7TPFmgA1lMo7BO0G90FOk2Kro2MInnqIwRTxdK2Chk9FuxGY
         3XXjaK/qr+TgV+ehutz9skqSYbqksWCj5cPok0XxhQfNznALTI1bGfo6y1JjiIZmKlDD
         s9RB6UpBTHsMlM/u+j55u4shOJk+D1fX5lZRDmCv8Yjj/03z049Rb18bTEW6xtQdZL5p
         +3Bm90HdtXMhejBjMWjlyoXlOgM+hDJ6MbbaZ90SjhWcrPgR5srM6ag8jlaOYpRTmdn0
         IM9A==
X-Forwarded-Encrypted: i=1; AKwUvBz1oMBxUfzWYtK9d7hnu6bXYyrNCQNadqII6ORa8zMsByvT074BJDVdmC9tTKDF5bN7649fn+eGhLDqRvllcwos@lists.infradead.org
X-Gm-Message-State: AFq9FYJdj/EL2IhRF8tUqb/s20TPd+reYAICcRlS+NosqdFYPWCgC7Gy
	994nJ2RbCmmA5H7EbQ5wlwoY1NvX0idVO9GubuLT00+RyaIHQhqiuMT+R8Ff+9o5MYg=
X-Gm-Gg: AYBFou2JX+zJ/N5wMozkL1+VAdsYnb/6cFFCHDsQHDPyeM40LiYrg2U9nKf1gW3JNhC
	M6AkwoDX7YYlP5xq32H9rsIw1QezUj5MvYP9LyPCFwSl95yjIQ+nL72I8WxjendLlePDxUZvdxb
	Xx4sbeu+A665mWcokuY1T/oK+S6zc+wznk98xknmH349iRfisTwmEnoE4cn34k/HEP4RQ8stWal
	C1FwTYd200v4sQOT7MD7b8YxUfaOVgvRlEmwcL88ZReGn1hR04pD/K0zMULex32tzpw0Md9ydrY
	svnlQiU1qsgLn6clN9JClW3AtOUjtNnFJ08nO0FFZDz9vVF7W1qMU6j5auW6SQuFv5yBeeEzeWk
	h2iL25RcbEfvKEIlRDtHoC2f1IUeLdRSt6Bamtd/dqnegHTWdLF2u7XYq7SKROyABHGg4t6bHyk
	ymFxdldCJ93OK/q2r1qL9cQkoWJLo6GHjUPTWJJ4qHsg1QK67JLIUFCrCuQjD6Nr29zYJGh9XoE
	T6H6k6LDitNv6d7Lk9uFz3UNe8//IZ2VKNwCTS7M7c6W//mQLKDPp1jR2ne80kQ1DZqIQ+hcezC
	vHUMLXK/kpLKuCBPMWsn0I9w4Q/XNTH1+lVkt0vRIP8XzBFuiMi6Ra0=
X-Received: by 2002:a05:600c:3b88:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4ac187a6ffcmr237933795e9.29.1793621764239;
        Mon, 02 Nov 2026 04:16:04 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:16:03 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:30 +0000
Subject: [PATCH v3 16/18] perf test: Allow infinite named_thread loops
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-16-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_041606_288553_307EDCD4 
X-CRM114-Status: GOOD (  14.48  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following test will want this to run forever, so add support by
treating 0 loops as infinite.

Convert i and named_threads_work to be unsigned to avoid undefined
signed overflow behavior in infinite loop mode.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Documentation/perf-test.txt     | 2 +-
 tools/perf/tests/workloads/named_threads.c | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/perf/Documentation/perf-test.txt b/tools/perf/Documentation/perf-test.txt
index f66ccd77bfe7..9fbfe7819a61 100644
--- a/tools/perf/Documentation/perf-test.txt
+++ b/tools/perf/Documentation/perf-test.txt
@@ -98,7 +98,7 @@ OPTIONS
 		nrloops: brstack, context_switch_loop
 
 	'named_threads' accepts the number of threads and the number of loops to
-	do in each thread.
+	do in each thread. Use 0 for an infinite loop.
 
 	The datasym, landlock, deterministic and callchain workloads don't accept
 	any.
diff --git a/tools/perf/tests/workloads/named_threads.c b/tools/perf/tests/workloads/named_threads.c
index d051d41a3cfe..6672c2f77684 100644
--- a/tools/perf/tests/workloads/named_threads.c
+++ b/tools/perf/tests/workloads/named_threads.c
@@ -11,7 +11,7 @@
 #define MAX_THREADS 25
 
 static int iterations = 500;
-int named_threads_work = 1234;
+unsigned int named_threads_work = 1234;
 
 typedef void *(*thread_fn_t)(void *);
 
@@ -19,7 +19,8 @@ typedef void *(*thread_fn_t)(void *);
 noinline void *named_threads_thread##n(void *arg __maybe_unused)	\
 {									\
 	pthread_setname_np(pthread_self(), "thread" #n);		\
-	for (int i = 0; i < iterations; i++)				\
+	for (unsigned int i = 0;					\
+	     i < (unsigned int) iterations || iterations == 0; i++)	\
 		named_threads_work += 3;				\
 									\
 	return NULL;							\
@@ -65,7 +66,7 @@ static thread_fn_t thread_fns[MAX_THREADS] = {
 
 /*
  * Creates argv[0] threads that run a unique function named "thread[x]" which performs
- * a multiplication in a loop for argv[1] loops.
+ * a multiplication in a loop for argv[1] loops (use 0 for infinite loop).
  */
 static int named_threads(int argc, const char **argv)
 {

-- 
2.43.0


