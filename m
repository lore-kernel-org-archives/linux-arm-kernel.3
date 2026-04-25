Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3C3FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vO51mkUv8czx4QMNQNbvlHwQFmUDbpKAVfeUaPjKEk=; b=ecBK0feJnkQUqdULuaiMdzLQCa
	okktB11ov4IvmMY7MA1zL/ygc6iJkBK0zMHNUsjU72wd4MdcleLzjm0cyRCmpbDQjMNzTeSkFU3Ly
	eY0BZeJHhA0a8l+Sbvg5JCop9RKlXON+cohgKrogholEos69EC65KnjxS9p1bMiMlwSSVGXP+TWi7
	5cXwyLiOsWY5y1MOKEo9GX7d5R81VOedC52S+mje+Yfleeuqrkp3dq3FTuZ8WE1qq3ACFTziXh59O
	9yRWhT8DwPYziTL7a0x/jdtgU0vQT84OcMeGwB06hKtVb8V0B86tzGtZqCD57RcqN5t67VtpaIH1j
	3jibagMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhBW-0000000EfDJ-0fUA;
	Sat, 25 Apr 2026 17:52:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh9W-0000000EdwE-2784
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 17:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4vO51mkUv8czx4QMNQNbvlHwQFmUDbpKAVfeUaPjKEk=; b=EwPKHEWgNLJtP5UFaUnGUPZGSH
	eSE3JUKKsHaB4rOBigiPGmlc1rod0HvgzxlBaABqtPplH4fU5rvStQ3X7Imu27F7rpqwlj9KzJGrJ
	+bmt2vDfgPZU0TlW06bNzZy7K8nUhjD1kvBZZaCCuX3rsclCSu1KnubPXvclq7A8vWIMuW8UAsQZ5
	VLxCUjo0hF7WTYykt72vY1aeMI7GW1g5uPHwtTYLRM3PoIuXEorJb+z8oiaKG3trAnouoPr4KE4v6
	F23sL9BxJC0bZLUxuUHoUZwycFqT8QE6WJoGQcqGN8F3LE1b58kgBEVwkDVmiP/0pbMN4T6QcWbop
	3RlK0lkQ==;
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh9S-0000000G8qs-1Rk9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:50:48 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so13449872eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139444; x=1777744244; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4vO51mkUv8czx4QMNQNbvlHwQFmUDbpKAVfeUaPjKEk=;
        b=jHbqTOUdPtT0oNVeIKOLhC0/aDm07NDfxiRk8N6087jxgwd0BTfqnRJ8AFlECLE00Y
         rhMCWdubgsqMaDrPJEUM/VWfi51bRm++RCk0kAlaJDe5bBL1mkYHCsz96QhU74+Ods4l
         /bw4WYOLBCFGtW9Z1+agaHt46yqBI6EyWEwl4FdB3mkU2J1TJkKKAOmljkMGLkOq1Snh
         8aF+9zqNH4aEDmA3o5aqedLcYwxsCn0IrKdCINs70ebG+LOwB6LJVqPNN18Mw5kPWpug
         f44vht3b7t6L7g6DkC+zQpz0YnhTNleuLM9TV70PKuDsAyhyBKx0u8bBvFCtHqpqHNip
         /aWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139444; x=1777744244;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vO51mkUv8czx4QMNQNbvlHwQFmUDbpKAVfeUaPjKEk=;
        b=cDPlwpsrNU0zW7DgLtbS2F+NdcXTw5OBXW/yh+yOFGdGhNqdcQo+uLh3EFY9OeJLyo
         2sVj6Y3xipsif/mUIy2iNIWpCraCKXxvorVAVLF8pZ21mun4n//WqZjyaWZXKX4C8tvy
         7hxWanoPPiOC44aLbLz3lz4aiX2iTWlzGt4soFa29abH+i4KDTvaZVbElX4OWIlgeGJs
         cErkPmQQgpJBvstsQy3wZk4lwZwhzOhmifoSNIwm7Vp30k2lnz5A5Yyq3hT2CVls1ggT
         1wMQKDzDxPMKUtspwVaZpcyyT7VgYaMzqN9l7pK1EE2NOUNCUnm11tiNzyglBLDHcITy
         p7jA==
X-Forwarded-Encrypted: i=1; AFNElJ9IutzJ/utSJmC/Tf2g2DIIM9B0QUhOVnXS8Q6Q0pGia52zwBGqFgy/IjWj//3EPFo/U5VeITqmqCBi11MODaea@lists.infradead.org
X-Gm-Message-State: AOJu0YzG1GWzXwTc+UQSwrBjRJTaTXZsylhtoUY8BveqQuLdPZb1CBI6
	TYiWJC9DRJ+tAlDpC+YingZcbb3Hi3k2P4l+mROU1ntAoRfuXqdbkUpn6OOW6YXkTJsXtNdOCn6
	4zkTLwSeKhQ==
X-Received: from dyjh29.prod.google.com ([2002:a05:7300:561d:b0:2e0:f299:f616])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:5725:b0:2ea:ed70:3ea8
 with SMTP id 5a478bee46e88-2eaed703ed1mr1585196eec.29.1777139443462; Sat, 25
 Apr 2026 10:50:43 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:49 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-52-irogers@google.com>
Subject: [PATCH v6 51/59] perf wakeup-latency: Port wakeup-latency to use
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
X-CRM114-CacheID: sfid-20260425_185046_495867_800BF986 
X-CRM114-Status: GOOD (  15.79  )
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


