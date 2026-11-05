Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B527606A929
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4NE7wRDR;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=axm+WJwL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YBXbNjgUg+UURoPn7/k5hFGZ3UtlzmwcEk29veboZWk=; b=4NE7wRDRSDyFwJ
	xaNsDk1GMogv1dXIYkLwFissyRXgyC6DVWdVrOrmh/Zz8yI0FWY8BK8pvMjEyArlHaOtm/qnrRyZh
	OVa40u6/BPviFMwe1F8FOd2JUIj/tbP8JmRT5WryCnlodKo9l07H11UbI15hyw0noDlb+U4DPMC7s
	5wjoKplQFPDaP+dfxCxvmYM//hVmkAXSp+B6PvntkT5JdXNeUXyUkDMUGd3yZQDX6UEVXwmDVKhg6
	0bGsuJiuR0YOFVCcemmltcBUpmaMmJlmj6V4kU9wBXGDeQ/DFR0WHPbK6tb6Nd6PpOOHLDa6xzcTU
	2wE0IzZQdk3ogaTV23oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvul-00000008jW7-3nFS;
	Thu, 05 Nov 2026 11:45:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvua-00000008j9o-2QMn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so10726225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879143; x=1794483943; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YBXbNjgUg+UURoPn7/k5hFGZ3UtlzmwcEk29veboZWk=;
        b=axm+WJwL808fmMFObGSZ4926ieu6gbBP1Fsl9xTAHKkltf2VAq88sweAvVb6lhjCFf
         wBWdmbxywj29DYDSE+/EDtm0fkEeHZQgmZ/g8Btwt9OUuqq7IImiJY46d35dk7W0B5eG
         bzWDZO4Ftj2qRG9rsdd8Fta3AESg4a/S7rJaVg+BxnejjNEjVdyXf6Cz9MmgIAt+5iub
         Zwn+djVA1IEkLm4MJh66QT2fa6QmnIkNRWL9QpSXgNZ6rqAnpkp0jYShsU43CImIgTib
         C2PtJZs3kHpJ8/WRXPH43ZGsSt29X3DtsM+R3F2S927Q/Xc4rXcghJ7Q2FX43Aoz80SL
         brHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879143; x=1794483943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBXbNjgUg+UURoPn7/k5hFGZ3UtlzmwcEk29veboZWk=;
        b=ilFjA2CnzGnGJckfGbqj+b1IBKSfZzZRA2P+YAUl7U1h87MqKfwpz3mVJbA6q2ZB/Q
         M4E7orcUQ+C6AIddWT+YnB6NUqmqsw1qtr7IyRtFoUY2tyHYR4zTu11ykzVFMRxTIGg9
         n+rlQ1uFVdXwXrShtKYMxthBkhQrEUidLSne2M169owgAYY8QXeJotE+PRuDmX5S74wU
         t3jhFZ1bWjeZMGyoUmsN9Q/XwfRRianeDzTqOhE3JS5OMMKQtF6d4rjCQG0AWA4M1GgK
         DkylxRDnz7UMaT4Y7vB7nqpIIDN6K1KFHn1x31qx8K9I5A1FQaeEDqEyG2knvMWv5/Ss
         3S8A==
X-Forwarded-Encrypted: i=1; AKwUvBz37Fqc3hPwQ84a0161UCFObf+HH6+/S2NGvlbBeGOlM50o+5FcSZg8f7Ku9Uip2TigZKRs3z3U9/fdSTxbZTLb@lists.infradead.org
X-Gm-Message-State: APuU4Z+blsKFCazt1TF7ojb2rnEZ2Ly8byQtvMcBGEKRUhFsP6p4Aoqd
	BYYTL8/7jxSTl8bqzdv21Ny77Lsu3Po3zjC6IDJfq6Vz8TZ24ue8h55A9g06eUkZR1I=
X-Gm-Gg: AYBFou0+nxb1Hvnfc9aa11AWnNHmBogFgLrmMgPJf7dnMn/eNNJoV0WSq2Sbrn3BO2Y
	6U9a8jnbFDnW1QVMvfNyFym0X2yg2/BjaHbpBe6h+CRsjDywz8Oh8eOCX9jdQHA62YMhWdVM2bJ
	xkojMoyBAHSwunarcvlqJyyEcwykx9mGGhwMTqrNy0TrLVeh36hQrnOgyVwzpu8b2iezOVyrEuk
	9QrwpWZJ4CTskSmPCvIXbKdqTfPNG6u37LCT5BfAsil/CZVnVeMGt1SlL5xaEfVMpoE9DARUlh8
	ulhV3nkyxvyZGXqc5ZNmKOfSrPfFs/n/s6lFqttAMtU/z6Rtive4olgtHbCNRU6uZ+6x5Y+0c0Q
	FSenE5GIP2mC54uAqmCJntTW3kmKcOmcLB4+q+3hvPDDv4CzDq+evH0munHRhHbEVLwMdtjqvJn
	VuLuYWk7ZPukm05h6SOW5hE5XayHfxYT89PYx4hBG7+R7LRCp8zptwVmOP2dg1DoXJDupHCzOgK
	B3EQelcIN6kv7nAZ823yjNOBzW2Zf32FV80Ll0kS07pirvAiHZp6X3jx9QdA9vLoROosCfH2Ekf
	iA94WGJf4S6quZttx6+frukNlM/aIkmA
X-Received: by 2002:a05:600c:348d:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4ac19234acbmr385559145e9.33.1793879143001;
        Thu, 05 Nov 2026 03:45:43 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:42 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:04 +0000
Subject: [PATCH v4 16/19] perf test: Allow infinite named_thread loops
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-16-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
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
X-CRM114-CacheID: sfid-20261105_034544_716378_9D70B306 
X-CRM114-Status: GOOD (  13.97  )
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

Tested-by: Leo Yan <leo.yan@arm.com>
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


