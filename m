Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55C5C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 07:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9243hlKBPdeZ1Gi9lTPRhe1+dSif74gAofzJyXdpiIE=; b=u2dmQ0OZ+A3+OE5uFM0NL//wKQ
	AYN2Nr611oyis1P9Y0AC047qXaK118QAhKQHft+Oln5HnBtV76iaVxWIxRoB4vhA204AwEAE54EWo
	179nsYdc4kH/OOT7mk6PeE+VeE7F7jFDxxmNLWuXJ3FwwQNv6gd8A/WswwK38S+iiMD7x4rm2GLtt
	T6Ppq9u9marlAHVIs2IDGFQvGiLsWFPLDi3Xpm8/F5+FTy5W1QjmhN81HANo150D5ocfWXb/AfUAd
	mdQ2BFxJjfWtyOPHy+rvJNzZFYljlS5rAXHz0nDoYvKS9SQklMGkmpOnwOj1DcWyHY83weunSrZnZ
	uiWv2DSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoOf-0000000A7Bo-0swW;
	Tue, 27 May 2025 07:06:49 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJo14-0000000A3ZL-3xER
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 06:42:28 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7429f7f9ee3so2091244b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 23:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748328146; x=1748932946; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9243hlKBPdeZ1Gi9lTPRhe1+dSif74gAofzJyXdpiIE=;
        b=drQbgIrQY1M7NqiOGwGA5dSrLRD/skiEFTQFWaBY0JBAkgszyoJVu+Mu23kiZjMvBt
         uTtoVwxV/n/ArHx85Gp9ulu4YMjJGVq7WHZFnrqDBvP6kGYNY5gD63uAvFgV+Z83Gocp
         UiKS/AO1LfEEooGt7vj7ZuacJbnALOrTV/jvxHpoVSQFqvP0UUsEOq5nR+xHjX9f2yQQ
         JdMbsGe2Immz+IQS+JtFt5ONwmvMtdoUTr6sMN3AdBDQS8wcnX2iOHhunjG8qqpUvj7A
         JzBtR4MLJ50jKWFImVJkTznj8KRU/9JHnkOpTPx50h9ngNy1NirEAJmbiSUad3y7S4xX
         Tdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748328146; x=1748932946;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9243hlKBPdeZ1Gi9lTPRhe1+dSif74gAofzJyXdpiIE=;
        b=oUCNM8mB9ittwcPJyU4xh87+7PhvfYY4HWjvFJ7ofHIetwwYKq77o6w8lxrsf+t9R3
         Jjn8DSKEnROwZLBT0OqRXnoeoyZO1Fw/7aJClOZ9f3wYHjOywrKnrQAbdvh6QHeGCfa1
         ShL+lbl6aMQGNG9IxK5dG8XY7yoQopNhd6GDsgyYrZ87+Vxy1BLznaDKuRRN7iqTGIO6
         XkJVt5mfAqtsbFyE58OLxd3X4iibnH0rZ8lUh0779soGB7vwtuWUKXux/O8tviW2DDt2
         NgAf8E4WmuSoSNcJe0cstApKH9h5QqDG+uNKr5OUaubmIqx8dQvu6yyYaZWUBQMDo0Li
         79+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdIvnR6IPNyR7ni7fxPFQy0q1mDPW52WyN0JAu+s/+0GFpA3zygh6I+g7+Tb9KlPPlHLzrf0dMd9+RBQNW3Z9+@lists.infradead.org
X-Gm-Message-State: AOJu0YwpeJl1a6+GU9QhROFAk2lhLDPHYRlPNulEL4Lqa1Ew6UWO7iNw
	uYJGGa0TbNIbO94P6mqWiTl23gKbEEE7sTU2f6bdehG27KTwnwS6oRQXVCLQNn2ES9mZa++MGe0
	f30gpVJWbUw==
X-Google-Smtp-Source: AGHT+IFSaCGMgzGcQR5sH0WwCDihQ6b4O7L/EdB23UzxzbsOhbA+EnKf4bgJh66renmbJCUXk6BdAwgRNDxo
X-Received: from pfbjc32.prod.google.com ([2002:a05:6a00:6ca0:b0:736:b315:f15e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4646:b0:742:ae7e:7da8
 with SMTP id d2e1a72fcca58-745fdfcc5e9mr17415149b3a.8.1748328145586; Mon, 26
 May 2025 23:42:25 -0700 (PDT)
Date: Mon, 26 May 2025 23:41:52 -0700
In-Reply-To: <20250527064153.149939-1-irogers@google.com>
Mime-Version: 1.0
References: <20250527064153.149939-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250527064153.149939-11-irogers@google.com>
Subject: [PATCH v1 10/11] perf auxtrace: Pass perf_env from session through to
 mmap read
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Howard Chu <howardchu95@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Levi Yun <yeoreum.yun@arm.com>, 
	Weilin Wang <weilin.wang@intel.com>, Michael Petlan <mpetlan@redhat.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Chun-Tse Shao <ctshao@google.com>, Ben Gainey <ben.gainey@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_234226_980319_3E23520D 
X-CRM114-Status: GOOD (  14.80  )
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

 auxtrace_mmap__read and auxtrace_mmap__read_snapshot end up calling
 `evsel__env(NULL)` which returns the global perf_env variable for the
 host. Their only call is in perf record. Rather than use the global
 variable pass through the perf_env for `perf record`.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-record.c |  8 ++++++--
 tools/perf/util/auxtrace.c  | 13 +++++++------
 tools/perf/util/auxtrace.h  |  6 ++++--
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
index 406b2166a3e9..3f5b9add43d5 100644
--- a/tools/perf/builtin-record.c
+++ b/tools/perf/builtin-record.c
@@ -773,7 +773,9 @@ static int record__auxtrace_mmap_read(struct record *rec,
 {
 	int ret;
 
-	ret = auxtrace_mmap__read(map, rec->itr, &rec->tool,
+	ret = auxtrace_mmap__read(map, rec->itr,
+				  perf_session__env(rec->session),
+				  &rec->tool,
 				  record__process_auxtrace);
 	if (ret < 0)
 		return ret;
@@ -789,7 +791,9 @@ static int record__auxtrace_mmap_read_snapshot(struct record *rec,
 {
 	int ret;
 
-	ret = auxtrace_mmap__read_snapshot(map, rec->itr, &rec->tool,
+	ret = auxtrace_mmap__read_snapshot(map, rec->itr,
+					   perf_session__env(rec->session),
+					   &rec->tool,
 					   record__process_auxtrace,
 					   rec->opts.auxtrace_snapshot_size);
 	if (ret < 0)
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 03211c2623de..ebd32f1b8f12 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -1890,7 +1890,7 @@ int __weak compat_auxtrace_mmap__write_tail(struct auxtrace_mmap *mm, u64 tail)
 }
 
 static int __auxtrace_mmap__read(struct mmap *map,
-				 struct auxtrace_record *itr,
+				 struct auxtrace_record *itr, struct perf_env *env,
 				 const struct perf_tool *tool, process_auxtrace_t fn,
 				 bool snapshot, size_t snapshot_size)
 {
@@ -1900,7 +1900,7 @@ static int __auxtrace_mmap__read(struct mmap *map,
 	size_t size, head_off, old_off, len1, len2, padding;
 	union perf_event ev;
 	void *data1, *data2;
-	int kernel_is_64_bit = perf_env__kernel_is_64_bit(evsel__env(NULL));
+	int kernel_is_64_bit = perf_env__kernel_is_64_bit(env);
 
 	head = auxtrace_mmap__read_head(mm, kernel_is_64_bit);
 
@@ -2002,17 +2002,18 @@ static int __auxtrace_mmap__read(struct mmap *map,
 }
 
 int auxtrace_mmap__read(struct mmap *map, struct auxtrace_record *itr,
-			const struct perf_tool *tool, process_auxtrace_t fn)
+			struct perf_env *env, const struct perf_tool *tool,
+			process_auxtrace_t fn)
 {
-	return __auxtrace_mmap__read(map, itr, tool, fn, false, 0);
+	return __auxtrace_mmap__read(map, itr, env, tool, fn, false, 0);
 }
 
 int auxtrace_mmap__read_snapshot(struct mmap *map,
-				 struct auxtrace_record *itr,
+				 struct auxtrace_record *itr, struct perf_env *env,
 				 const struct perf_tool *tool, process_auxtrace_t fn,
 				 size_t snapshot_size)
 {
-	return __auxtrace_mmap__read(map, itr, tool, fn, true, snapshot_size);
+	return __auxtrace_mmap__read(map, itr, env, tool, fn, true, snapshot_size);
 }
 
 /**
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index b0db84d27b25..f001cbb68f8e 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -23,6 +23,7 @@ union perf_event;
 struct perf_session;
 struct evlist;
 struct evsel;
+struct perf_env;
 struct perf_tool;
 struct mmap;
 struct perf_sample;
@@ -512,10 +513,11 @@ typedef int (*process_auxtrace_t)(const struct perf_tool *tool,
 				  size_t len1, void *data2, size_t len2);
 
 int auxtrace_mmap__read(struct mmap *map, struct auxtrace_record *itr,
-			const struct perf_tool *tool, process_auxtrace_t fn);
+			struct perf_env *env, const struct perf_tool *tool,
+			process_auxtrace_t fn);
 
 int auxtrace_mmap__read_snapshot(struct mmap *map,
-				 struct auxtrace_record *itr,
+				 struct auxtrace_record *itr, struct perf_env *env,
 				 const struct perf_tool *tool, process_auxtrace_t fn,
 				 size_t snapshot_size);
 
-- 
2.49.0.1151.ga128411c76-goog


