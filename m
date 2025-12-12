Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B03D4921F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKYiBwM8t1St8n+84QzYpGj/YT5ojCQpxUi3Hsn3knw=; b=kJxVidrbwQoNU7weifj6Dmn67o
	8uLr2wSklr9ZvJSu5GwS4Pj5QlD7PeaxH+jRYcpl8i+6X9IJ7rBSal8kGtBr9k5lBpplfRw3j2MCD
	//JmUCKYDgHKYezFxc8Y7JngPx59zA/0y27WfKyzYaU2ZuJNa8mtiuUoDLPs0vq9pha/r8VEy9yqb
	+O+7k0ucRUDCtK9+Pkns/m4stQKR2EkkRCX9onFnuPW9P39qpDKSyvMlEbqsLMBbhGf/t4T0l+bTp
	YZctqQ6Ico2n1WvaAjvjihjOZwck02WJs1H7eE0nE21A2nqHXx3gxS+XqMIVHoQv+TFdDxq/CjWCa
	FaPvqpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU2VS-00000000XGB-1mCw;
	Fri, 12 Dec 2025 12:44:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU2VQ-00000000XF5-0X90
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 12:44:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 328EFFEC;
	Fri, 12 Dec 2025 04:44:12 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 820E23F762;
	Fri, 12 Dec 2025 04:44:17 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 12 Dec 2025 12:44:04 +0000
Subject: [PATCH 2/2] perf c2c: Update documentation for Arm SPE events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-perf_c2c_update_event-v1-2-29a26c7a949b@arm.com>
References: <20251212-perf_c2c_update_event-v1-0-29a26c7a949b@arm.com>
In-Reply-To: <20251212-perf_c2c_update_event-v1-0-29a26c7a949b@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Al Grant <al.grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765543453; l=1053;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=xjFry3+Qwb2If5ls7tOuCo2U0koPfIRw3LR2ftk6/dI=;
 b=gLk+Oz9sgXO0vTq5i0+d0vBbN95yxI6Har+R8p/Y7EKtJ/CGsMqtsUaBitmY4dZ5URIHp//k2
 abZPeaUXxm4DEoXtzC7gE0NvzG3txTiO3NqUpTWjMrlp0m5IsnMswNM
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_044420_227431_FA76B761 
X-CRM114-Status: UNSURE (   9.45  )
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

Document the default Arm SPE events used by the perf c2c tool.  Make a
minor adjustment to the PowerPC entry for formatting consistency.

Suggested-by: Al Grant <al.grant@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/Documentation/perf-c2c.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Documentation/perf-c2c.txt b/tools/perf/Documentation/perf-c2c.txt
index 40b0f71a2c44eb642ff3bb234631a614b7c4fc9d..b765ae2511d2418a63092fb8a90a61faa335ac91 100644
--- a/tools/perf/Documentation/perf-c2c.txt
+++ b/tools/perf/Documentation/perf-c2c.txt
@@ -170,11 +170,16 @@ following on AMD:
 
   ibs_op//
 
-and following on PowerPC:
+following on PowerPC:
 
   cpu/mem-loads/
   cpu/mem-stores/
 
+following on Arm:
+
+  arm_spe_0/ts_enable=1,pa_enable=1,load_filter=1,min_latency=30/
+  arm_spe_0/ts_enable=1,pa_enable=1,store_filter=1/
+
 User can pass any 'perf record' option behind '--' mark, like (to enable
 callchains and system wide monitoring):
 

-- 
2.34.1


