Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F65CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 02:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2RfHZyp4m5tmkPr9VyImO6O6N4Xg50uWqFUJ+KR5mPA=; b=QMKcXYEZ7KS1o48CigryuHD3DD
	6uNKRJmLOsnHLCKWHFm1BWbYV3V53C9MAfTp28su0gVKLqXJDYNQGr+XKLoW9jvLBdUEKU1VPko1C
	iwQzFP6CVw/cnnj6HwIQA+JclmbegjJYNt0+FOFAWXRXEPSh/S4WGVa0ulENXQSdC0ys2XSp6p7M5
	w9NX4LcK/5V4aTSo8RqzGDHpL0z0fQ5IiJUdnYThAxF3ZnJ0Q9+NnbvMI9aRQ06+p/A0NhC0rhLOk
	Mp4hAxZgdBakcPAmyAmPQhTw+S9DaJSVldfYJbJ+w5f/YlG0KS2toXd4hCGiD3L+xXOFujkadUSS8
	bbKyf41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfMQ-00000005IQW-1GTm;
	Fri, 31 Oct 2025 02:59:30 +0000
Received: from unicom146.biz-email.net ([210.51.26.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfMM-00000005INU-2lyW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 02:59:28 +0000
Received: from Jtjnmail201617.home.langchao.com
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id 202510311059002425;
        Fri, 31 Oct 2025 10:59:00 +0800
Received: from jtjnmailAR01.home.langchao.com (10.100.2.42) by
 Jtjnmail201617.home.langchao.com (10.100.2.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 31 Oct 2025 10:58:59 +0800
Received: from inspur.com (10.100.2.96) by jtjnmailAR01.home.langchao.com
 (10.100.2.42) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 31 Oct 2025 10:58:59 +0800
Received: from localhost.localdomain.com (unknown [10.94.18.144])
	by app1 (Coremail) with SMTP id YAJkCsDwdHTxJQRpDoE5AA--.2227S4;
	Fri, 31 Oct 2025 10:58:59 +0800 (CST)
From: Chu Guangqing <chuguangqing@inspur.com>
To: <john.g.garry@oracle.com>, <will@kernel.org>, <james.clark@linaro.org>,
	<mike.leach@linaro.org>, <leo.yan@linux.dev>, <peterz@infradead.org>,
	<mingo@redhat.com>, <acme@kernel.org>, <namhyung@kernel.org>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <irogers@google.com>, <adrian.hunter@intel.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Chu
 Guangqing <chuguangqing@inspur.com>
Subject: [PATCH] tools/perf: Fix spelling typo in tools/perf
Date: Fri, 31 Oct 2025 10:58:10 +0800
Message-ID: <20251031025810.1939-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: YAJkCsDwdHTxJQRpDoE5AA--.2227S4
X-Coremail-Antispam: 1UD129KBjvJXoWxZFy3ArW5XryUtw48uw1Dtrb_yoW5Cr1UpF
	W8uF4DWr4Sgr9xKas5trWIqF4S9ayruF4ftw1UKw1UuwnrZr1Yga9Fq3s7AF48ZrykGa13
	uF1qyryUGr1UCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl
	6s0DM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7sRidbbtUUUUU==
X-CM-SenderInfo: 5fkxw35dqj1xlqj6x0hvsx2hhfrp/
X-CM-DELIVERINFO: =?B?2i/CDZRRTeOiUs3aOqHZ50hzsfHKF9Ds6CbXmDm38RucXu3DYXJR7Zlh9zE0nt/Iac
	D+KSsk7pV3dl0RDxB5lh+8iA1sgC2aonM+cb2ich98r/c+ONOc/CtnYH4qOsQlllj5oCnS
	+g25hQ9F1vYY068nJEw=
Content-Type: text/plain
tUid: 2025103110590000223a6740299a0011290c2d99340e5e
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_195926_990678_F9D25F06 
X-CRM114-Status: UNSURE (   6.82  )
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

The json file incorrectly used "acceses" instead of "accesses".

Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
---
 .../arch/arm64/ampere/ampereonex/metrics.json    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
index 6817cac149e0..a29aadc9b2e3 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
@@ -388,55 +388,55 @@
         "MetricExpr": "L1D_CACHE_RW / L1D_CACHE",
         "BriefDescription": "L1D cache access - demand",
         "MetricGroup": "Cache",
-        "ScaleUnit": "100percent of cache acceses"
+        "ScaleUnit": "100percent of cache accesses"
     },
     {
         "MetricName": "l1d_cache_access_prefetches",
         "MetricExpr": "L1D_CACHE_PRFM / L1D_CACHE",
         "BriefDescription": "L1D cache access - prefetch",
         "MetricGroup": "Cache",
-        "ScaleUnit": "100percent of cache acceses"
+        "ScaleUnit": "100percent of cache accesses"
     },
     {
         "MetricName": "l1d_cache_demand_misses",
         "MetricExpr": "L1D_CACHE_REFILL_RW / L1D_CACHE",
         "BriefDescription": "L1D cache demand misses",
         "MetricGroup": "Cache",
-        "ScaleUnit": "100percent of cache acceses"
+        "ScaleUnit": "100percent of cache accesses"
     },
     {
         "MetricName": "l1d_cache_demand_misses_read",
         "MetricExpr": "L1D_CACHE_REFILL_RD / L1D_CACHE",
         "BriefDescription": "L1D cache demand misses - read",
         "MetricGroup": "Cache",
-        "ScaleUnit": "100percent of cache acceses"
+        "ScaleUnit": "100percent of cache accesses"
     },
     {
         "MetricName": "l1d_cache_demand_misses_write",
         "MetricExpr": "L1D_CACHE_REFILL_WR / L1D_CACHE",
         "BriefDescription": "L1D cache demand misses - write",
         "MetricGroup": "Cache",
-        "ScaleUnit": "100percent of cache acceses"
+        "ScaleUnit": "100percent of cache accesses"
     },
     {
         "MetricName": "l1d_cache_prefetch_misses",
         "MetricExpr": "L1D_CACHE_REFILL_PRFM / L1D_CACHE",
         "BriefDescription": "L1D cache prefetch misses",
         "MetricGroup": "Cache",
-        "ScaleUnit": "100percent of cache acceses"
+        "ScaleUnit": "100percent of cache accesses"
     },
     {
         "MetricName": "ase_scalar_mix",
         "MetricExpr": "ASE_SCALAR_SPEC / OP_SPEC",
         "BriefDescription": "Proportion of advanced SIMD data processing operations (excluding DP_SPEC/LD_SPEC) scalar operations",
         "MetricGroup": "Instructions",
-        "ScaleUnit": "100percent of cache acceses"
+        "ScaleUnit": "100percent of cache accesses"
     },
     {
         "MetricName": "ase_vector_mix",
         "MetricExpr": "ASE_VECTOR_SPEC / OP_SPEC",
         "BriefDescription": "Proportion of advanced SIMD data processing operations (excluding DP_SPEC/LD_SPEC) vector operations",
         "MetricGroup": "Instructions",
-        "ScaleUnit": "100percent of cache acceses"
+        "ScaleUnit": "100percent of cache accesses"
     }
 ]
-- 
2.43.7


