Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C78BFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lupTwS5/K/xdMFN4T0R1lWQWxBJkMX0Mah0jUIak+cQ=; b=wpG6mtwT16vL4U7vA2kL15pIQA
	xzY7zKIfJIJYkmoTwaj1ZrHF22qmkvwLF0mki3Qpqz/U51KDBlLA0SzZkaUsinnKIfgHO+jX71I7C
	yV4Pu20XCHWtF5vlPVYNxE5hRqi/hDTmLk/09DCswrInMhbIorIU2jVGw8andLYy+AjxumwyqVEh4
	y5TlVtWoncVNxwWST+JvflEnO9kdBweW0bgidznb56dqJr8NdnhuX3xl3Lssov4EAerm2w0EZ8IYh
	daJMS5fus208B2aPx7WTdXNcW4xNF1w4w7gcveOO66agBxxdk+mnOvjTsF2DcjqRPM4reX44lVq9C
	xrOObBUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcky-00000000iJV-2xNh;
	Tue, 28 Apr 2026 07:21:20 +0000
Received: from mail-dy1-f201.google.com ([74.125.82.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHck7-00000000hLj-3z7f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:20:39 +0000
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso14245971eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360826; x=1777965626; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lupTwS5/K/xdMFN4T0R1lWQWxBJkMX0Mah0jUIak+cQ=;
        b=LRcEp0sD155445ng02DpxeygjGQE9xQAXWYpHWY7BL4w0CadUburegeMdovpmSs5XB
         Lj+ZGEwRlm/OnHLhGStnF9xGWPEXtYjxNfBzgLNuoHPYLvWcTR5J3LcgFxeTtWlReSo+
         Qkz7tY2d9oHF3bUenKI4YOdn/GM8vKf+WkXj+pl8uijW8VoJ+y/b0K4NPGFLXjvzsZVP
         z3biiEbc+A2V5NpQBGYs83yq2JXZw12mu7QdvKrlaDv4CxAEEIN1UI7hlo5u2IjVEuKa
         X5Bpk0QKkMLniI1GAxxwc9whj1CWMpfZPkrvfEEW5tORNgWg/qP4G8ERcQXf2yfd44UV
         DEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360826; x=1777965626;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lupTwS5/K/xdMFN4T0R1lWQWxBJkMX0Mah0jUIak+cQ=;
        b=QGqjA5XVdHHWuj8bVLe6Ce+QPnjHcqThuXX1+b7l82PjU+nQzMtxtoJtOdTg30T8cn
         O8MMVkPrlKJDpZ9pIWoFvwvNsT3HGLn7QtY5sYObX2gtvRgqSK30euoyIL2RYx1nfutw
         WlzObJ6opgspBYiUxTtt7sHgsjXvXdeffHUsWpxAhxJ1DmbBYUGTrJzhp6SU+bkUapdc
         dkspeto7VUsL/9ZV87g3D3trZ9IF5hz+tVTo+h0IdJ7K4PS7h1yconEHZ2wPGyO+jAYm
         qqL21JN3eLHnXtl1Thb8Avhx8GBJzyRYoe57EPCTfVMZDZdrHdQtB+kvvTjdlt+2hS54
         sBNw==
X-Forwarded-Encrypted: i=1; AFNElJ9I0gjQC32wGVo5xi6+QzBvlegpCXKDLhDvmNrR68dpgJKC8lWphV4ePPmfQ/USLikta7e0GQzpeKyAi7Jds6W5@lists.infradead.org
X-Gm-Message-State: AOJu0YwUywU+xxybo19uw6PKJSjWclF10lTK1Y4Ivy+AtH4KrwH+3oBV
	tAckA7OXzzvXF+toprFkgKMZHdmMCYAXVAcJmPgSXF3YDuxaDPN91/oCrxsJiym/P+XSScaGqeZ
	6zN31jNNy5Q==
X-Received: from dybnj5.prod.google.com ([2002:a05:7300:d085:b0:2dd:4573:2897])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:fd0d:b0:2ea:d965:a4b9
 with SMTP id 5a478bee46e88-2ed0a03466amr992245eec.7.1777360825780; Tue, 28
 Apr 2026 00:20:25 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:38 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-34-irogers@google.com>
Subject: [PATCH v8 33/58] perf check-perf-trace: Port check-perf-trace to use
 python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_002028_077546_205FF489 
X-CRM114-Status: GOOD (  17.45  )
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

Add a port of the check-perf-trace script that uses the perf python
module directly. This approach is significantly faster than using perf
script callbacks as it avoids creating intermediate dictionaries for
all event fields.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:
1. String Match Accuracy: Replaced the substring check for `irq:softirq_entry`
   events with a robust exact string match.

v3:
1. Safe Thread Resolution: Swapped out sample.sample_pid with
   sample.sample_tid and safeguarded the session process lookup with
   a try-except block.

v4:
1. Git Fixup Cleanup: Squashed the lingering fixup commit from the previous
   session into its proper patch.

v8:
- Wrapped session.find_thread in a try-except block to prevent
  crashing on untracked PIDs.
---
 tools/perf/python/check-perf-trace.py | 120 ++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100755 tools/perf/python/check-perf-trace.py

diff --git a/tools/perf/python/check-perf-trace.py b/tools/perf/python/check-perf-trace.py
new file mode 100755
index 000000000000..bbcd0c520745
--- /dev/null
+++ b/tools/perf/python/check-perf-trace.py
@@ -0,0 +1,120 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+Basic test of Python scripting support for perf.
+Ported from tools/perf/scripts/python/check-perf-trace.py
+"""
+
+import argparse
+import collections
+import perf
+
+unhandled: collections.defaultdict[str, int] = collections.defaultdict(int)
+session = None
+
+softirq_vecs = {
+    0: "HI_SOFTIRQ",
+    1: "TIMER_SOFTIRQ",
+    2: "NET_TX_SOFTIRQ",
+    3: "NET_RX_SOFTIRQ",
+    4: "BLOCK_SOFTIRQ",
+    5: "IRQ_POLL_SOFTIRQ",
+    6: "TASKLET_SOFTIRQ",
+    7: "SCHED_SOFTIRQ",
+    8: "HRTIMER_SOFTIRQ",
+    9: "RCU_SOFTIRQ",
+}
+
+def trace_begin() -> None:
+    """Called at the start of trace processing."""
+    print("trace_begin")
+
+def trace_end() -> None:
+    """Called at the end of trace processing."""
+    print_unhandled()
+
+def symbol_str(event_name: str, field_name: str, value: int) -> str:
+    """Resolves symbol values to strings."""
+    if event_name == "irq__softirq_entry" and field_name == "vec":
+        return softirq_vecs.get(value, str(value))
+    return str(value)
+
+def flag_str(event_name: str, field_name: str, value: int) -> str:
+    """Resolves flag values to strings."""
+    if event_name == "kmem__kmalloc" and field_name == "gfp_flags":
+        return f"0x{value:x}"
+    return str(value)
+
+def print_header(event_name: str, sample: perf.sample_event) -> None:
+    """Prints common header for events."""
+    secs = sample.sample_time // 1000000000
+    nsecs = sample.sample_time % 1000000000
+    comm = "[unknown]"
+    try:
+        if session:
+            thread = session.find_thread(sample.sample_pid)
+            if thread:
+                comm = thread.comm()
+    except (TypeError, AttributeError):
+        pass
+    print(f"{event_name:<20} {sample.sample_cpu:5} {secs:05}.{nsecs:09} "
+          f"{sample.sample_pid:8} {comm:<20} ", end=' ')
+
+def print_uncommon(sample: perf.sample_event) -> None:
+    """Prints uncommon fields for tracepoints."""
+    # Fallback to 0 if field not found (e.g. on older kernels or if not tracepoint)
+    pc = getattr(sample, "common_preempt_count", 0)
+    flags = getattr(sample, "common_flags", 0)
+    lock_depth = getattr(sample, "common_lock_depth", 0)
+
+    print(f"common_preempt_count={pc}, common_flags={flags}, "
+          f"common_lock_depth={lock_depth}, ")
+
+def irq__softirq_entry(sample: perf.sample_event) -> None:
+    """Handles irq:softirq_entry events."""
+    print_header("irq__softirq_entry", sample)
+    print_uncommon(sample)
+    print(f"vec={symbol_str('irq__softirq_entry', 'vec', sample.vec)}")
+
+def kmem__kmalloc(sample: perf.sample_event) -> None:
+    """Handles kmem:kmalloc events."""
+    print_header("kmem__kmalloc", sample)
+    print_uncommon(sample)
+
+    print(f"call_site={sample.call_site:d}, ptr={sample.ptr:d}, "
+          f"bytes_req={sample.bytes_req:d}, bytes_alloc={sample.bytes_alloc:d}, "
+          f"gfp_flags={flag_str('kmem__kmalloc', 'gfp_flags', sample.gfp_flags)}")
+
+def trace_unhandled(event_name: str) -> None:
+    """Tracks unhandled events."""
+    unhandled[event_name] += 1
+
+def print_unhandled() -> None:
+    """Prints summary of unhandled events."""
+    if not unhandled:
+        return
+    print("\nunhandled events:\n")
+    print(f"{'event':<40} {'count':>10}")
+    print("---------------------------------------- -----------")
+    for event_name, count in unhandled.items():
+        print(f"{event_name:<40} {count:10}")
+
+def process_event(sample: perf.sample_event) -> None:
+    """Callback for processing events."""
+    event_name = str(sample.evsel)
+    if event_name == "evsel(irq:softirq_entry)":
+        irq__softirq_entry(sample)
+    elif "evsel(kmem:kmalloc)" in event_name:
+        kmem__kmalloc(sample)
+    else:
+        trace_unhandled(event_name)
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser()
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    args = ap.parse_args()
+
+    trace_begin()
+    session = perf.session(perf.data(args.input), sample=process_event)
+    session.process_events()
+    trace_end()
-- 
2.54.0.545.g6539524ca2-goog


