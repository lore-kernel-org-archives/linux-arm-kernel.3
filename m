Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF26FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vO51mkUv8czx4QMNQNbvlHwQFmUDbpKAVfeUaPjKEk=; b=vQ/6V1Dbvxo5SkwuBIg8eK/g82
	uHAYXqb3Y8B/dKGoZshFK3S3U1FCOn3EXy2laCnwuW+Z9AYPY8max3fTBmN6PLGxI86N4UiZ69bk6
	MrYrB+cJer3Dcev/pNQVrCEHiEe22oTvankU1DpDPzxWVtyaqLm3VGsyw8fkTcXRS0q6cjCT9Dwy0
	1Dv9YlGNcid0NLf1NOfV59ofeDjlKJIBNr5k4WnxqhKBovsE2/SPYwZ5ecfHvAvnAAmsFFtRaJFbL
	3F4fescFUsytDVRDdW7Bkbm8ZuTznaNrOxt+k7ci33kbRD28jkxxqzxwshY8Ud1g7Onwqa3/FJqJC
	GDywk2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlsE-0000000F14a-1GIA;
	Sat, 25 Apr 2026 22:53:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlr7-0000000Ezmc-0MeL
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 22:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4vO51mkUv8czx4QMNQNbvlHwQFmUDbpKAVfeUaPjKEk=; b=N7Iq6OTnQj2o3jhaVEAddK7ftN
	ITD5fV2Rcr7k7OMau6ANl8XCNGCt9idWFTJ3rTimry7fFBzcSzB+0uh52HdDQoWw09TNpyicTqX1N
	fHmj6tZlgzthhbG0FdaeXcQJPey8GBSpJx6tmmr7T8lnSyLeKDS+aa/z7xjYrZ442r8fYBkYRw9JR
	GhvSlnQbD5MbeBVYObPihGoBnUjCJtXC9RmLBC650B3J67YYTeTaBpnMJz3pX9bgKWqQRzuXM6C3u
	tvT+JGG6uYkM3iOxAuwo0Dm9joLumX2Z0pd3CWRFkLhCW0ZGZqvrz4F1zY+azqmA4GEOS01/hUkK4
	Q4oiS+mQ==;
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlr2-0000000GMzP-21Fz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:52:07 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2eaed3d96d7so860919eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157520; x=1777762320; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4vO51mkUv8czx4QMNQNbvlHwQFmUDbpKAVfeUaPjKEk=;
        b=qFfZXQjsyvmty72ONBWqR7xxF/2W7kIy4Yiky19YGhU8aJ8rj2feB8JQ0moqPlJI2k
         l60Jpf+PdVssXvBtOySCV12689tRF34/hk+b3WHjGaZ7U87996Ddn7DgJgKvJsvNT3T9
         eCUXqXRzGBFU5MOrddrsQtBqC3RBkkzLSCWhwCtYTAXD3c/0AxHkLTuTnpDPO9i9Th73
         WD7R8WAjc3Q0hcqTqaoFFn1SpwrHmnsoFWESI2I051x40mrecRyVkA5M20KjtqiTnF+f
         vemhsa0OBNomBFQfF8WDCka/0hq8B4A83R2UgUYv/4FQREXczEN0L3/8kRs5LiMaIrix
         5wBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157520; x=1777762320;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vO51mkUv8czx4QMNQNbvlHwQFmUDbpKAVfeUaPjKEk=;
        b=NqkuSuLn0LvzqIDAXtl5RmVRpRpwhuZ3CqdJQBy052bS2wfJzjMs2eyIK4TnB+WK/e
         Xyc4wWUzT4Su7ybwFNNRc5Ut7zrVqA7id8VsFa0gtk/ClS0Va7sOxaRUyvhy+AO938j/
         PUiOE/x2xRFphQtppm68Um6HlE+mwMCK53wRtelvpSh3NRcwtSsKNJuSE4U/vlMlMJMx
         qmP56ZszU8vmlIgVBfu4g+fh8DcY/o8PcziUuac9PS0WiatlCBQnDn29RqFCu7cGQml2
         XwMiliDo1WNdV8+vNdN4R8IVaxI5SkJ9B2l3k79mi+GsofCog1lKUw1ncjE7EFcccQ78
         gZGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vupMc01OCUD7GNnf1MeOmE7PXY7/SbX8z0jR/Y+rsF7zX/UAcW5yvQTT5UWYVvXoX5nTksXaeCMsk9xlpPGKT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx03QAtTQFamdBO7OwNXoYOeFVJ1P0fSlr8n1oSKpcXZjXICFaN
	kjj6Svu+0l3IMftoKlsEBHZ+BYQTHuMHTHaEZnQnRFzr+PpOvON4SYZx/JSZgN/riCqUoXmiIJi
	2OzfMH6rVgQ==
X-Received: from dly15-n1.prod.google.com ([2002:a05:701b:204f:10b0:12a:83c5:a16f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:90a:b0:127:33e0:ea40
 with SMTP id a92af1059eb24-12c73f7fbaamr18492849c88.15.1777157519599; Sat, 25
 Apr 2026 15:51:59 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:43 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-52-irogers@google.com>
Subject: [PATCH v7 51/59] perf wakeup-latency: Port wakeup-latency to use
 python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_235204_737286_AF34DA00 
X-CRM114-Status: GOOD (  15.83  )
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

Port the legacy Perl script wakeup-latency.pl to a python script using
the perf module in tools/perf/python.

The new script uses a class-based architecture and leverages the
perf.session API for event processing.

It measures wakeup latency by tracking timestamps of
sched:sched_wakeup and sched:sched_switch events.

Complications:
- Used min() and max() built-in functions instead of if blocks to
  satisfy pylint recommendations.
- pylint warns about the module name not being snake_case, but it is
  kept for consistency with the original script name.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

 - Fixed Wakeup Latency Logic: Modified the script to track wakeup
   timestamps per task (using sample.pid as the key) instead of per
   CPU.  This ensures that context switches are correctly paired with
   the specific task that was woken up, even if multiple tasks are
   woken up on the same CPU or if a task is migrated to a different
   CPU before running.

 - Prevented Memory Growth: Added del self.last_wakeup[next_pid] after
   successful latency calculation to prevent the dictionary from
   growing unbounded over time.

 - Added Error Tracking: Added try-except blocks around tracepoint
   field access in process_event() and tracked missing fields in self.
   unhandled instead of ignoring them.
---
 tools/perf/python/wakeup-latency.py | 88 +++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100755 tools/perf/python/wakeup-latency.py

diff --git a/tools/perf/python/wakeup-latency.py b/tools/perf/python/wakeup-latency.py
new file mode 100755
index 000000000000..1b0db115abcf
--- /dev/null
+++ b/tools/perf/python/wakeup-latency.py
@@ -0,0 +1,88 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+"""Display avg/min/max wakeup latency."""
+
+import argparse
+from collections import defaultdict
+import sys
+from typing import Optional, Dict
+import perf
+
+class WakeupLatency:
+    """Tracks and displays wakeup latency statistics."""
+    def __init__(self) -> None:
+        self.last_wakeup: Dict[int, int] = defaultdict(int)
+        self.max_wakeup_latency = 0
+        self.min_wakeup_latency = 1000000000
+        self.total_wakeup_latency = 0
+        self.total_wakeups = 0
+        self.unhandled: Dict[str, int] = defaultdict(int)
+        self.session: Optional[perf.session] = None
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Process events."""
+        event_name = str(sample.evsel)
+        sample_time = sample.sample_time
+
+        if "sched:sched_wakeup" in event_name:
+            try:
+                pid = sample.pid
+                self.last_wakeup[pid] = sample_time
+            except AttributeError:
+                self.unhandled[event_name] += 1
+        elif "sched:sched_switch" in event_name:
+            try:
+                next_pid = sample.next_pid
+                wakeup_ts = self.last_wakeup.get(next_pid, 0)
+                if wakeup_ts:
+                    latency = sample_time - wakeup_ts
+                    self.max_wakeup_latency = max(self.max_wakeup_latency, latency)
+                    self.min_wakeup_latency = min(self.min_wakeup_latency, latency)
+                    self.total_wakeup_latency += latency
+                    self.total_wakeups += 1
+                    del self.last_wakeup[next_pid]
+            except AttributeError:
+                self.unhandled[event_name] += 1
+        else:
+            self.unhandled[event_name] += 1
+
+    def print_totals(self) -> None:
+        """Print summary statistics."""
+        print("wakeup_latency stats:\n")
+        print(f"total_wakeups: {self.total_wakeups}")
+        if self.total_wakeups:
+            avg = self.total_wakeup_latency // self.total_wakeups
+            print(f"avg_wakeup_latency (ns): {avg}")
+        else:
+            print("avg_wakeup_latency (ns): N/A")
+        print(f"min_wakeup_latency (ns): {self.min_wakeup_latency}")
+        print(f"max_wakeup_latency (ns): {self.max_wakeup_latency}")
+
+        if self.unhandled:
+            print("\nunhandled events:\n")
+            print(f"{'event':<40s}  {'count':>10s}")
+            print(f"{'-'*40}  {'-'*10}")
+            for event_name, count in self.unhandled.items():
+                print(f"{event_name:<40s}  {count:10d}")
+
+    def run(self, input_file: str) -> None:
+        """Run the session."""
+        self.session = perf.session(perf.data(input_file), sample=self.process_event)
+        self.session.process_events()
+        self.print_totals()
+
+def main() -> None:
+    """Main function."""
+    parser = argparse.ArgumentParser(description="Trace wakeup latency")
+    parser.add_argument("-i", "--input", default="perf.data", help="Input file")
+    args = parser.parse_args()
+
+    analyzer = WakeupLatency()
+    try:
+        analyzer.run(args.input)
+    except IOError as e:
+        print(e, file=sys.stderr)
+        sys.exit(1)
+
+if __name__ == "__main__":
+    main()
-- 
2.54.0.545.g6539524ca2-goog


