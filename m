Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6D1CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 01:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RfHZyp4m5tmkPr9VyImO6O6N4Xg50uWqFUJ+KR5mPA=; b=4o1kTD/KDduk0K2Z2cNKbWPp3F
	qRn1EAU42o3SvLbjIn3/Be2q64z4a2c0Mu+ESGejWN0niPguvwaxii6V71i7SQHJBvxdXgJP1qxPo
	nMRkbRDfbZCBDloR1SEkK9ECQSqG5HI+uZqZl7GwyLmF3/6tLFDGd8nyy3jv6rJLhSnexz8PwtGVC
	zREWgA51di+DERdf6xP2sSkmMdM/RnygD2QpYKQtQf+yR6C6fjqy/PlOnW/BBB2XzxDMHBM4ygMVf
	Ooa9hxa6hCcZDb53grXzdmACTV3nBOHcC539HEs176h0yMFyyXSpdLPSckIKJ/2ofd0D+Wi4M7tzR
	d/cG1EIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFjfx-000000091km-24ju;
	Mon, 03 Nov 2025 01:48:05 +0000
Received: from unicom145.biz-email.net ([210.51.26.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFjft-000000091hR-0w4O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 01:48:03 +0000
Received: from Jtjnmail201617.home.langchao.com
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202511030947365699;
        Mon, 03 Nov 2025 09:47:36 +0800
Received: from jtjnmailAR02.home.langchao.com (10.100.2.43) by
 Jtjnmail201617.home.langchao.com (10.100.2.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 3 Nov 2025 09:47:34 +0800
Received: from inspur.com (10.100.2.107) by jtjnmailAR02.home.langchao.com
 (10.100.2.43) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 3 Nov 2025 09:47:34 +0800
Received: from localhost.localdomain.com (unknown [10.94.13.117])
	by app3 (Coremail) with SMTP id awJkCsDwmPmyCQhp9KQJAA--.13804S5;
	Mon, 03 Nov 2025 09:47:34 +0800 (CST)
From: Chu Guangqing <chuguangqing@inspur.com>
To: <john.g.garry@oracle.com>, <will@kernel.org>, <james.clark@linaro.org>,
	<mike.leach@linaro.org>, <leo.yan@linux.dev>, <peterz@infradead.org>,
	<mingo@redhat.com>, <acme@kernel.org>, <namhyung@kernel.org>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <irogers@google.com>, <adrian.hunter@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Chu Guangqing <chuguangqing@inspur.com>
Subject: [PATCH v2 1/1] perf vendor events arm64 AmpereOneX: Fix spelling typo in the metrics file
Date: Mon, 3 Nov 2025 09:46:33 +0800
Message-ID: <20251103014633.1213-2-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20251103014633.1213-1-chuguangqing@inspur.com>
References: <20251103014633.1213-1-chuguangqing@inspur.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: awJkCsDwmPmyCQhp9KQJAA--.13804S5
X-Coremail-Antispam: 1UD129KBjvJXoWxZFy3ArW5XryUtw48uw1Dtrb_yoW5Cr1UpF
	W8uF4DWr4Sgr9xKas5trWIqF4S9ayruF4ftw1UKw1UuwnrZr1Yga9Fq3s7AF48ZrykGa13
	uF1qyryUGr1UCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHqb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY
	1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4
	xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCa
	FVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI4
	02YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCF
	54CYxVCY1x0262kKe7AKxVW8ZVWrXwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wryl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pEq2N
	tUUUUU=
X-CM-SenderInfo: 5fkxw35dqj1xlqj6x0hvsx2hhfrp/
X-CM-DELIVERINFO: =?B?ChgN9pRRTeOiUs3aOqHZ50hzsfHKF9Ds6CbXmDm38RucXu3DYXJR7Zlh9zE0nt/Iac
	D+KRzbM3WG6wK3TdXpl4ALTskQ/51zyjXsDLAUWvI3FwgIEgo4lAMTnf3ETstjRH9TRkEG
	jKmC1H9zckCaoXwPIj8=
Content-Type: text/plain
tUid: 202511030947368a84a2fbb5776b2b60707d1027002bd8
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_174801_603110_7002942A 
X-CRM114-Status: UNSURE (   7.51  )
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


