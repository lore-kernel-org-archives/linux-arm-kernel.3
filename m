Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCB4D59D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 17:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMV5UvltQwKiCAncZOMo8D3sYorSnzeE9iQeYGODl6U=; b=UwKJBB8jQIZzHcPXuq2gEGJZpN
	ixU+izbNCnT+uoFDaWyLZOL2t1es9Iud1WLCQKe9q/xOToh6ahKETcueykUaK+QfNMvOC9vFwKdAP
	stAg991iXyBn2zXH6AOzbbvsnLdaJ8Zlgx1MzVlmd6Eu5+PqhW3ZP7PKaIWasSMQW4/SLvRvoPVv+
	fjKbfu1hZhBK79x9K4rcyIZrTzO0BEMznd7xFNqlShGyawO2+Ie1nr1ZPDdWdWhGOGaeyWjSMNT0S
	sUDyVv9VKqv8zi5Larefmu4ZE7IzNzo0/m6dolySea+/WEXmruKNwK8iXL6QGf5kcJYamCcaVK2fR
	TJJbIDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU6tH-00000000tCj-3wU4;
	Fri, 12 Dec 2025 17:25:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU6tD-00000000tBJ-3xSQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 17:25:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E55C165C;
	Fri, 12 Dec 2025 09:25:04 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FDB13F762;
	Fri, 12 Dec 2025 09:25:09 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 12 Dec 2025 17:25:00 +0000
Subject: [PATCH v2 2/2] perf c2c: Update documentation for adding memory
 event table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-perf_c2c_update_event-v2-2-27df9a6cb1d4@arm.com>
References: <20251212-perf_c2c_update_event-v2-0-27df9a6cb1d4@arm.com>
In-Reply-To: <20251212-perf_c2c_update_event-v2-0-27df9a6cb1d4@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Al Grant <al.grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765560305; l=5821;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=4sENnGgYOHx/gUayinw+QoHCGnkzWEnPWvka3BMCrtU=;
 b=jxujxi9t2BzTy6A7hBC9TsDumro1k4Km+1WDkJS5SoA0uaZ+GSte//QNRQepJDkvlZC8wrXM6
 AMaIIiB27eJDFScd1aPp7JVMoPmfMwIWs5Yq91SihUsH36dCaNdxuA1
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_092512_063458_1BF8BEE6 
X-CRM114-Status: GOOD (  10.80  )
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

Users may occasionally need to see which options are applied to memory
events.  This helps to understand the behavior of "perf c2c" and
"perf mem", and provides guidance for configuring memory event options
directly.

Add a table to track memory events and their corresponding options, and
include the Arm SPE events in it.

Suggested-by: Al Grant <al.grant@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/Documentation/perf-c2c.txt | 51 +++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/tools/perf/Documentation/perf-c2c.txt b/tools/perf/Documentation/perf-c2c.txt
index 40b0f71a2c44eb642ff3bb234631a614b7c4fc9d..e57a122b8719f1b2e20dd509959fc1563a6c20fd 100644
--- a/tools/perf/Documentation/perf-c2c.txt
+++ b/tools/perf/Documentation/perf-c2c.txt
@@ -160,20 +160,43 @@ Following perf record options are configured by default:
 
   -W,-d,--phys-data,--sample-cpu
 
-Unless specified otherwise with '-e' option, following events are monitored by
-default on Intel:
-
-  cpu/mem-loads,ldlat=30/P
-  cpu/mem-stores/P
-
-following on AMD:
-
-  ibs_op//
-
-and following on PowerPC:
-
-  cpu/mem-loads/
-  cpu/mem-stores/
+The following table lists the events monitored on different architectures.
+Unless specified otherwise with the -e option, the tool will select the
+default events.
+
+  +--------+---------------+-----------------+--------------------------------------------------------------------------------+
+  | Arch   | Configuration | Options         | Events                                                                         |
+  +--------+---------------+-----------------+--------------------------------------------------------------------------------+
+  | Intel  | Default       | -e ldlat-loads  | cpu/mem-loads,ldlat=30/P                                                       |
+  |        |               | -e ldlat-stores | cpu/mem-stores/P                                                               |
+  |        |---------------+-----------------+--------------------------------------------------------------------------------+
+  |        | Load only     | -e ldlat-loads  | cpu/mem-loads,ldlat=30/P                                                       |
+  |        |---------------+-----------------+--------------------------------------------------------------------------------+
+  |        | Store only    | -e ldlat-stores | cpu/mem-stores/P                                                               |
+  +--------+---------------+-----------------+--------------------------------------------------------------------------------+
+  | Intel  | Default       | -e ldlat-loads  | {cpu/mem-loads-aux/,cpu/mem-loads,ldlat=30/}:P                                 |
+  | with   |               | -e ldlat-stores | cpu/mem-stores/P                                                               |
+  | AUX    |--------------+------------------+--------------------------------------------------------------------------------+
+  |        | Load only     | -e ldlat-loads  | {cpu/mem-loads-aux/,cpu/mem-loads,ldlat=30/}:P                                 |
+  |        |---------------+-----------------+--------------------------------------------------------------------------------+
+  |        | Store only    | -e ldlat-stores | cpu/mem-stores/P                                                               |
+  +--------+---------------+-----------------+--------------------------------------------------------------------------------+
+  | AMD    | Default       | -e mem-ldst     | ibs_op// (without latency support)                                             |
+  |        |               |                 | ibs_op/ldlat=30/ (with latency support)                                        |
+  +--------+---------------+-----------------+--------------------------------------------------------------------------------+
+  | PowerPC| Default       | -e ldlat-loads  | cpu/mem-loads/                                                                 |
+  |        |               | -e ldlat-stores | cpu/mem-stores/                                                                |
+  |        |---------------+-----------------+--------------------------------------------------------------------------------+
+  |        | Load only     | -e ldlat-loads  | cpu/mem-loads/                                                                 |
+  |        |---------------+-----------------+--------------------------------------------------------------------------------+
+  |        | Store only    | -e ldlat-stores | cpu/mem-stores/                                                                |
+  +--------+---------------+-----------------+--------------------------------------------------------------------------------+
+  | Arm    | Default       | -e spe-ldst     | arm_spe_0/ts_enable=1,pa_enable=1,load_filter=1,store_filter=1,min_latency=30/ |
+  | SPE    |---------------+-----------------+--------------------------------------------------------------------------------+
+  |        | Load only     | -e spe-load     | arm_spe_0/ts_enable=1,pa_enable=1,load_filter=1,min_latency=30/                |
+  |        |---------------+-----------------+--------------------------------------------------------------------------------+
+  |        | Store only    | -e spe-store    | arm_spe_0/ts_enable=1,pa_enable=1,store_filter=1/                              |
+  +--------+---------------+-----------------+--------------------------------------------------------------------------------+
 
 User can pass any 'perf record' option behind '--' mark, like (to enable
 callchains and system wide monitoring):

-- 
2.34.1


