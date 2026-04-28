Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FA2FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niT+j+ygae4DUDVZvlLCzSKgJX/QJcllkfXgy9y3G00=; b=z8Aqi+10H9opew2WOMs3cwy07v
	OKTUs/1sNnLW4VIV+3fjBn01ADP5NVGfTC748dgWW6iN+83FKkNdsfAxy+ulBKMPTyhDuIi1skY7u
	W1ty5Cr75k/OaJ+aAj4s6jpW+T6XthJ8UDuEtg6V1hwPX9B0d/KPB7vVZbvA4hSCVarnQQAbnxN/S
	cBf4vyxqVHGvrYk0ddhGWTByN5dtK1xIxORODuaX5cF0NA2TYfezdzR/9XjLu2l9YL2g9X695i97l
	+euVrpBAeOUlxziM2yV/JGPNy9u+Ws/xW6LhgGhhttyqj0Ak6Km9tkxtlgYIvuGCfl5ciqaMcakof
	58DwVPYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcja-00000000gfU-3eZP;
	Tue, 28 Apr 2026 07:19:54 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjG-00000000gMK-3eeK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:19:35 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12c8d7d4a79so10309066c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360774; x=1777965574; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=niT+j+ygae4DUDVZvlLCzSKgJX/QJcllkfXgy9y3G00=;
        b=dkRYo9NybNA2sJse87giiY2k6OappX2BTpAANyCxJtxF5DsMvGFsOigflgaoOvm8Bh
         O2fJnvMiqOIOVhX7mrZcCd6z5/0II7HC6r8y6Z37dPHWmArFLiqU9CgS3uKWVSDL18NC
         U4qk99AMSyH4lDo8Sq43FXyaoUA2Io3rFqnoD76+td5Kg242IlvVmnUDDA2G4mMZDxoX
         8BSHXPcEsnz4m98CcfhMll2jZL4TeU8P6c10zs4HLTXIYieuZ7whceRYvZabd1VH0KXS
         sxl9KikBQAUflF8LgejtVXpQjym+jpfaoaCIDyEwfevm7iBXUcXAy4torQGgoh2RgT25
         YXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360774; x=1777965574;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=niT+j+ygae4DUDVZvlLCzSKgJX/QJcllkfXgy9y3G00=;
        b=tBGOe76dvM1tJOjVALaeEVH6Ni7ht+EBUTctaIoYOHtR9iDngaExKgKeaacmrGkv4t
         GyME1+SdHZFXAd2i6Ur4wuZpxPkGMatfZxYZJFLjoZh6iWUKgnRwox0NHSdpFczkfnUX
         cYvQtIp4+oSG5Q6efIqUHTk+YRAwak/4kRqqGXx2h16qiesqSOQPHPwXTC4Os1VBx9av
         saOPO00eiIf7wcO7r46zhxEZWa7sciRBB27YQ1zyBYM3rI23vIE+KcgD8I0l+0LS4N/a
         fbOEeyhuL2WIoz/yr8hc2y7lHEdvVhOIZk7V6D0EcYrs9rwX4f+7kNkkfxugYSq+5Wro
         +g0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8rMHYp50P7OllIZVQ91ruriPpjRvZJyxXGpH9Dk31MXrOf+aUWfuiSHljresSqqi8/RaD+ZwNWVloAmVc1ST0N@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Ax+AE4ZM04Ysxetx6GZT+HynUxMwT51GxeK5goPKxU33+0eZ
	VjHf1DEcAloHfBxyblb0cLMEcHFcStkENGvSVCBZWiod683jQT1grtFuy5XvIboc8pEtFR0tWj6
	FkgvG+zI6EA==
X-Received: from dlae27.prod.google.com ([2002:a05:701b:231b:b0:12d:b86f:f7a6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:439d:b0:12b:ebc9:2464
 with SMTP id a92af1059eb24-12ddd98e9f7mr774500c88.22.1777360773119; Tue, 28
 Apr 2026 00:19:33 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:12 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-8-irogers@google.com>
Subject: [PATCH v8 07/58] perf evsel/evlist: Avoid unnecessary #includes
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_001934_910447_0FFDD178 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

Use forward declarations and remove unnecessary #includes in
evsel.h. Sort the forward declarations in evsel.h and evlist.h.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evlist.h | 15 +++++++++------
 tools/perf/util/evsel.h  | 20 +++++++++++---------
 2 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/tools/perf/util/evlist.h b/tools/perf/util/evlist.h
index e507f5f20ef6..e54761c670b6 100644
--- a/tools/perf/util/evlist.h
+++ b/tools/perf/util/evlist.h
@@ -2,29 +2,32 @@
 #ifndef __PERF_EVLIST_H
 #define __PERF_EVLIST_H 1
 
+#include <signal.h>
+
 #include <linux/compiler.h>
 #include <linux/kernel.h>
-#include <linux/refcount.h>
 #include <linux/list.h>
+#include <linux/refcount.h>
+#include <pthread.h>
+#include <unistd.h>
+
 #include <api/fd/array.h>
 #include <internal/evlist.h>
 #include <internal/evsel.h>
 #include <perf/evlist.h>
+
 #include "affinity.h"
 #include "events_stats.h"
 #include "evsel.h"
 #include "rblist.h"
-#include <pthread.h>
-#include <signal.h>
-#include <unistd.h>
 
-struct pollfd;
-struct thread_map;
 struct perf_cpu_map;
 struct perf_stat_config;
+struct pollfd;
 struct record_opts;
 struct strbuf;
 struct target;
+struct thread_map;
 
 /*
  * State machine of bkw_mmap_state:
diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index 339b5c08a33d..b099c8e5dd86 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -2,28 +2,30 @@
 #ifndef __PERF_EVSEL_H
 #define __PERF_EVSEL_H 1
 
-#include <linux/list.h>
 #include <stdbool.h>
-#include <sys/types.h>
+
+#include <linux/list.h>
 #include <linux/perf_event.h>
 #include <linux/types.h>
+#include <sys/types.h>
+
 #include <internal/evsel.h>
 #include <perf/evsel.h>
+
 #include "symbol_conf.h"
-#include "pmus.h"
-#include "pmu.h"
 
+struct bperf_follower_bpf;
+struct bperf_leader_bpf;
+struct bpf_counter_ops;
 struct bpf_object;
 struct cgroup;
+struct hashmap;
 struct perf_counts;
+struct perf_pmu;
 struct perf_stat_config;
 struct perf_stat_evsel;
-union perf_event;
-struct bpf_counter_ops;
 struct target;
-struct hashmap;
-struct bperf_leader_bpf;
-struct bperf_follower_bpf;
+union perf_event;
 
 typedef int (evsel__sb_cb_t)(union perf_event *event, void *data);
 
-- 
2.54.0.545.g6539524ca2-goog


