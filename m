Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC89CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 21:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rcnyTrGXImGlSNA8JQX3j0MaK0p5tkgHi7ksH0SGoI=; b=VwtYSVCXn2C8bX7esNlyunCUrR
	caQF+jfiAay7/ptQ/wUjEoJvONffpi76Oyxu78odiiwpP3N9k70WS0nH9kWVPp2emvAFSYpALzyWe
	apRLUu9nzDMmyslbcCsVONMRSn1NJrkKikUU4b5iY1zJhL/dXwnUGjpNvwSlQK03tCVMYD5LN5C7S
	N6XeDzHglH5dD4+BJ/GdkDgT86vHfpxZ/CgqBNGkCz76b+5vAHMgxHgVoNbT+5Zun96KBBgfB70Xw
	aonREzN7rJtYhfc4+XEbeReN1/suRw0Duzbk7+8V2+WeWzeSIgQyNrD8OzDJ/SLu2YmRIGqiFDaxm
	v28DrcHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4Lg-00000006PoP-1bdh;
	Tue, 09 Jun 2026 21:51:04 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4LZ-00000006PhW-2Ld2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 21:50:59 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c85a298cd62so3938075a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 14:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781041855; x=1781646655; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1rcnyTrGXImGlSNA8JQX3j0MaK0p5tkgHi7ksH0SGoI=;
        b=FSQQPo/Ex6JQ81xg/QlykYN3/sTGhfOEauPXhhcPjQEFGpAxNYv1XheUUwbqMygI//
         rae2i7lc0Z1mEvjuGJoiJUTc2nXBAPV62Bwd7KUbBi+Cvoas41IDizbH6gxQH/KTY0iF
         mVocO+MwFs+9vDLY3nQISO5wok3f786TpPobiYbR8CbG29xVWuHSzvaH3OI5tPgZ0hmi
         LbrmN7LYupVFiQ9Wjobo2aH/GoG+nEglCiUsY7ZE+cMQdbgM3onmmY8zkNViz5H4rQGs
         yL20EC9hvc2EjwmLmfaX+TRCoMct8swrcGRXeVsfbdk58zSOc54b7JJ9OTTzryZ4ZeMz
         Jg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781041855; x=1781646655;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1rcnyTrGXImGlSNA8JQX3j0MaK0p5tkgHi7ksH0SGoI=;
        b=eThYpstdEfrPx1qQwiLbJJd3OrDLffcdGD2iaN9WOyJPnE9cZTT4k46gAnP0LC+tb7
         LaidBKffq1YZXYcRcDqDehL79JOM1gmGp1QGNHnT/brl4VjMl4VqAge2ThzeEXA+NCoj
         hndLlHwnaa1gK5DDOKinMoIVLfs/I9KfYxlr0CIq+Z9/qKWLH34bL6Den6GZd3bjN4PK
         4Qhvyp2WF2GljFYsuIyD9xwPisZqkeEf0CX+zpnxxNCFmSe1lTXvzNqVJtJKwbUrsHzz
         MAuiLS0CRLqfxg3KogBowBjyRWbrur2Nu9MFmO00wdCE1SDyKH58ciZrImofiG+X4Sd/
         BqIg==
X-Forwarded-Encrypted: i=1; AFNElJ8a8a1xn/FhXvf6+1j/+6hkY5Moke5d0UzxpdrLLtaCqb/Wf60oSCfRHrloURr8sNJdIhjRjILvwaK3OBXsHl+N@lists.infradead.org
X-Gm-Message-State: AOJu0YzwBpqu9VzmYHeqVMn8SCTPsMSTlNPJGnmS0Hl/l183BlrhT9I6
	0mUHiZ4nzFuXhHLwR/RGNXdV9rC7YsPuHZWqyQm8ATrzcpgsxUTDpiFp0Jj60N+cjhg7TtoPqYw
	3P/mcLw==
X-Received: from pfbfj40.prod.google.com ([2002:a05:6a00:3a28:b0:842:3d2d:1e84])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d28:b0:842:6a3b:60c9
 with SMTP id d2e1a72fcca58-842b0f4cc1bmr24915638b3a.24.1781041855299; Tue, 09
 Jun 2026 14:50:55 -0700 (PDT)
Date: Tue,  9 Jun 2026 14:50:44 -0700
In-Reply-To: <20260609215046.2391903-1-ctshao@google.com>
Mime-Version: 1.0
References: <20260609215046.2391903-1-ctshao@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260609215046.2391903-6-ctshao@google.com>
Subject: [PATCH v1 5/6] perf vendor events intel: Update pantherlake events
 from 1.05 to 1.06
From: Chun-Tse Shao <ctshao@google.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org
Cc: alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, james.clark@linaro.org, afaerber@suse.de, 
	mani@kernel.org, dapeng1.mi@linux.intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, Chun-Tse Shao <ctshao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_145057_630977_611A8FEE 
X-CRM114-Status: GOOD (  17.05  )
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

The updated events were published in:
https://github.com/intel/perfmon/commit/ffc03fc3b414127c5a36bbb648e500c4afeff134

Signed-off-by: Chun-Tse Shao <ctshao@google.com>
---
 tools/perf/pmu-events/arch/x86/mapfile.csv    |   2 +-
 .../arch/x86/pantherlake/counter.json         |   5 +
 .../arch/x86/pantherlake/pipeline.json        |  29 ++-
 .../x86/pantherlake/uncore-interconnect.json  |  10 +
 .../arch/x86/pantherlake/uncore-memory.json   | 221 +++++++++++++++++-
 5 files changed, 260 insertions(+), 7 deletions(-)
 create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/uncore-interconnect.json

diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-events/arch/x86/mapfile.csv
index 7d19f8fa335a..6af3cee12c8a 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -26,7 +26,7 @@ GenuineIntel-6-BD,v1.25,lunarlake,core
 GenuineIntel-6-(AA|AC|B5),v1.21,meteorlake,core
 GenuineIntel-6-1[AEF],v4,nehalemep,core
 GenuineIntel-6-2E,v4,nehalemex,core
-GenuineIntel-6-(CC|D5),v1.05,pantherlake,core
+GenuineIntel-6-(CC|D5),v1.06,pantherlake,core
 GenuineIntel-6-A7,v1.04,rocketlake,core
 GenuineIntel-6-2A,v19,sandybridge,core
 GenuineIntel-6-8F,v1.39,sapphirerapids,core
diff --git a/tools/perf/pmu-events/arch/x86/pantherlake/counter.json b/tools/perf/pmu-events/arch/x86/pantherlake/counter.json
index 432b6946ccbc..9794b435f650 100644
--- a/tools/perf/pmu-events/arch/x86/pantherlake/counter.json
+++ b/tools/perf/pmu-events/arch/x86/pantherlake/counter.json
@@ -13,5 +13,10 @@
         "Unit": "iMC",
         "CountersNumFixed": "0",
         "CountersNumGeneric": "5"
+    },
+    {
+        "Unit": "SANTA",
+        "CountersNumFixed": 1,
+        "CountersNumGeneric": "0"
     }
 ]
\ No newline at end of file
diff --git a/tools/perf/pmu-events/arch/x86/pantherlake/pipeline.json b/tools/perf/pmu-events/arch/x86/pantherlake/pipeline.json
index d476bad5e2a7..5d5303c02954 100644
--- a/tools/perf/pmu-events/arch/x86/pantherlake/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/pantherlake/pipeline.json
@@ -887,11 +887,32 @@
         "Unit": "cpu_core"
     },
     {
-        "BriefDescription": "This event counts the number of mispredicted ret instructions retired. Non PEBS [This event is alias to BR_MISP_RETIRED.RET]",
+        "BriefDescription": "This event is deprecated. [This event is alias to BR_MISP_RETIRED.NEAR_RETURN]",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "Deprecated": "1",
+        "EventCode": "0xc5",
+        "EventName": "BR_MISP_RETIRED.NEAR_RET",
+        "PublicDescription": "This event is deprecated. [This event is alias to BR_MISP_RETIRED.NEAR_RETURN] Available PDIST counters: 0,1",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x8",
+        "Unit": "cpu_atom"
+    },
+    {
+        "BriefDescription": "Counts the number of mispredicted near RET branch instructions retired. [This event is alias to BR_MISP_RETIRED.NEAR_RET]",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc5",
+        "EventName": "BR_MISP_RETIRED.NEAR_RETURN",
+        "PublicDescription": "Counts the number of mispredicted near RET branch instructions retired. [This event is alias to BR_MISP_RETIRED.NEAR_RET] Available PDIST counters: 0,1",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x8",
+        "Unit": "cpu_atom"
+    },
+    {
+        "BriefDescription": "This event counts the number of mispredicted ret instructions retired [This event is alias to BR_MISP_RETIRED.RET]",
         "Counter": "0,1,2,3,4,5,6,7,8,9",
         "EventCode": "0xc5",
         "EventName": "BR_MISP_RETIRED.NEAR_RETURN",
-        "PublicDescription": "This is a non-precise version (that is, does not use PEBS) of the event that counts mispredicted return instructions retired. [This event is alias to BR_MISP_RETIRED.RET] Available PDIST counters: 0,1",
+        "PublicDescription": "This event counts the number of mispredicted ret instructions retired [This event is alias to BR_MISP_RETIRED.RET] Available PDIST counters: 0,1",
         "SampleAfterValue": "100007",
         "UMask": "0x8",
         "Unit": "cpu_core"
@@ -1726,7 +1747,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number of machines clears due to memory renaming.",
+        "BriefDescription": "Counts the number of machine clears due to memory renaming.",
         "Counter": "0,1,2,3,4,5,6,7",
         "EventCode": "0xc3",
         "EventName": "MACHINE_CLEARS.MRN_NUKE",
@@ -1930,7 +1951,7 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "Counts the number issue slots not consumed  due to a  color request for an FCW or MXCSR control register when all 4 colors (copies) are already in use.",
+        "BriefDescription": "Counts the number of issue slots not consumed due to a color request for an FCW or MXCSR control register when all 4 colors (copies) are already in use.",
         "Counter": "0,1,2,3,4,5,6,7",
         "EventCode": "0x75",
         "EventName": "SERIALIZATION.COLOR_STALLS",
diff --git a/tools/perf/pmu-events/arch/x86/pantherlake/uncore-interconnect.json b/tools/perf/pmu-events/arch/x86/pantherlake/uncore-interconnect.json
new file mode 100644
index 000000000000..69ef928d57f6
--- /dev/null
+++ b/tools/perf/pmu-events/arch/x86/pantherlake/uncore-interconnect.json
@@ -0,0 +1,10 @@
+[
+    {
+        "BriefDescription": "This 48-bit fixed counter counts the UCLK cycles.",
+        "Counter": "FIXED",
+        "EventCode": "0xff",
+        "EventName": "UNC_CLOCK.SOCKET",
+        "PerPkg": "1",
+        "Unit": "SANTA"
+    }
+]
diff --git a/tools/perf/pmu-events/arch/x86/pantherlake/uncore-memory.json b/tools/perf/pmu-events/arch/x86/pantherlake/uncore-memory.json
index a881b99be5f3..8faa03e1c6d0 100644
--- a/tools/perf/pmu-events/arch/x86/pantherlake/uncore-memory.json
+++ b/tools/perf/pmu-events/arch/x86/pantherlake/uncore-memory.json
@@ -1,6 +1,30 @@
 [
     {
-        "BriefDescription": "Read CAS command sent to DRAM",
+        "BriefDescription": "ACT command for a read request sent to DRAM.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x24",
+        "EventName": "UNC_M_ACT_COUNT_RD",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "ACT command sent to DRAM.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x26",
+        "EventName": "UNC_M_ACT_COUNT_TOTAL",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "ACT command for a write request sent to DRAM.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x25",
+        "EventName": "UNC_M_ACT_COUNT_WR",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Read CAS command sent to DRAM.",
         "Counter": "0,1,2,3,4",
         "EventCode": "0x22",
         "EventName": "UNC_M_CAS_COUNT_RD",
@@ -8,13 +32,153 @@
         "Unit": "iMC"
     },
     {
-        "BriefDescription": "Write CAS command sent to DRAM",
+        "BriefDescription": "Write CAS command sent to DRAM.",
         "Counter": "0,1,2,3,4",
         "EventCode": "0x23",
         "EventName": "UNC_M_CAS_COUNT_WR",
         "PerPkg": "1",
         "Unit": "iMC"
     },
+    {
+        "BriefDescription": "Counting the number of clocks.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x01",
+        "EventName": "UNC_M_CLOCKTICKS",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "CKE in DRAM is low.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x29",
+        "EventName": "UNC_M_DRAM_CKE_OFF_CYCLES",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Incoming read request page status is Page Empty.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x1D",
+        "EventName": "UNC_M_DRAM_PAGE_EMPTY_RD",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "PublicDescription": "incoming read request page status is Page Empty",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Incoming write request page status is Page Empty.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x20",
+        "EventName": "UNC_M_DRAM_PAGE_EMPTY_WR",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "PublicDescription": "incoming write request page status is Page Empty",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Incoming read request page status is Page Hit.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x1C",
+        "EventName": "UNC_M_DRAM_PAGE_HIT_RD",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "PublicDescription": "incoming read request page status is Page Hit",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Incoming write request page status is Page Hit.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x1F",
+        "EventName": "UNC_M_DRAM_PAGE_HIT_WR",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "PublicDescription": "incoming write request page status is Page Hit",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Incoming read request page status is Page Miss.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x1E",
+        "EventName": "UNC_M_DRAM_PAGE_MISS_RD",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "PublicDescription": "incoming read request page status is Page Miss",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Incoming write request page status is Page Miss.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x21",
+        "EventName": "UNC_M_DRAM_PAGE_MISS_WR",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "PublicDescription": "incoming write request page status is Page Miss",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "DRAM in Self-refresh (all channels).",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x12",
+        "EventName": "UNC_M_DRAM_SELF_REFRESH",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Any Rank at Hot state.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x19",
+        "EventName": "UNC_M_DRAM_THERMAL_HOT",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Any Rank at Warm state.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x1A",
+        "EventName": "UNC_M_DRAM_THERMAL_WARM",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "PRE command sent to DRAM for a read/write request.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x27",
+        "EventName": "UNC_M_PRE_COUNT_PAGE_MISS",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Counts number of bytes read, in 32B chunk, per DDR channel. Counter increments by 1 after receiving 32B chunk data.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x3A",
+        "EventName": "UNC_M_RD_DATA",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Number of VC0 read in channel0  - this event can increment by more than 1 (per channel/sub-ch).",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x13",
+        "EventName": "UNC_M_RD_OCCUPANCY_CH0",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "PublicDescription": "Number of VC0 read in channel0  - this event can  increment by more than 1 (per channel/sub-ch)",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Number of VC0 read in channel1 - this event can increment by more than 1 (per channel/sub-ch).",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x14",
+        "EventName": "UNC_M_RD_OCCUPANCY_CH1",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
     {
         "BriefDescription": "Total number of read and write byte transfers to/from DRAM, in 32B chunk, per DDR channel. Counter increments by 1 after sending  or receiving 32B chunk data.",
         "Counter": "0,1,2,3,4",
@@ -22,5 +186,58 @@
         "EventName": "UNC_M_TOTAL_DATA",
         "PerPkg": "1",
         "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Total number of requests entering MC, this is the sum of all RD + WR requests for all VCs.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x39",
+        "EventName": "UNC_M_TOTAL_REQUESTS",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Incoming VC0 read request.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x02",
+        "EventName": "UNC_M_VC0_REQUESTS_RD",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Incoming VC0 write request.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x03",
+        "EventName": "UNC_M_VC0_REQUESTS_WR",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Incoming VC1 read request.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x04",
+        "EventName": "UNC_M_VC1_REQUESTS_RD",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Incoming VC1 write request.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x05",
+        "EventName": "UNC_M_VC1_REQUESTS_WR",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "Unit": "iMC"
+    },
+    {
+        "BriefDescription": "Counts number of bytes written, in 32B chunk, per DDR channel. Counter increments by 1 after sending 32B chunk data.",
+        "Counter": "0,1,2,3,4",
+        "EventCode": "0x3B",
+        "EventName": "UNC_M_WR_DATA",
+        "PerPkg": "1",
+        "Unit": "iMC"
     }
 ]
-- 
2.54.0.1099.g489fc7bff1-goog


