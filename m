Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E567D0C61D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUYtFsl8I2NATkjZr4N8nzokgh8OWRXI/p+TxqeAA1k=; b=RQU5nVAT8YXgvXMrOonrzEIiAF
	Xe1EKRd2AVYzmMAkPmwq1VvpcrM+ypomXFWcLyxDSMg76o/G5q3y6F+OfvpC0MZWzbc/6a1yHytk+
	k1TygCEhAUna6lHLOlXPTl588qL72a+G71APz5p5qkfPF+/dgzdGOerEtfLOymASJVOEOWwugALVx
	betIhajCTnMJDx4MDfOI7oFIn8m6m0RNCLIuRKTGto1b84ivpQBHj1ZRF8LwUg7Ma/1jjZNmLJGU+
	+RtsgjpcswrtTIv3LrkB7z+EG5952Jx5r3aJpTQLpUNp/C1RnG8hpw2TXSODiVhupUiEiQsC0hDqX
	Jp46g3aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LpC-000000047v1-28N0;
	Fri, 25 Oct 2024 15:02:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LLB-000000041QJ-3jgi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:31:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21C22339;
	Fri, 25 Oct 2024 07:31:31 -0700 (PDT)
Received: from VDW30FN91H.arm.com (unknown [10.57.79.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 249AB3F73B;
	Fri, 25 Oct 2024 07:30:58 -0700 (PDT)
From: Graham Woodward <graham.woodward@arm.com>
To: acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	irogers@google.com,
	james.clark@linaro.org,
	mike.leach@linaro.org,
	leo.yan@linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	Graham Woodward <graham.woodward@arm.com>
Subject: [PATCH v1 4/4] perf arm-spe: Update --itrace help text
Date: Fri, 25 Oct 2024 15:30:09 +0100
Message-Id: <20241025143009.25419-5-graham.woodward@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241025143009.25419-1-graham.woodward@arm.com>
References: <20241025143009.25419-1-graham.woodward@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_073102_011968_3BA1DA69 
X-CRM114-Status: UNSURE (   8.75  )
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

The --itrace help now needs updating to reflect that
the --itrace=b argument sythesises branches as well
as branch misses.

Signed-off-by: Graham Woodward <graham.woodward@arm.com>
---
 tools/perf/Documentation/itrace.txt       | 2 +-
 tools/perf/Documentation/perf-arm-spe.txt | 2 +-
 tools/perf/util/auxtrace.h                | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/perf/Documentation/itrace.txt b/tools/perf/Documentation/itrace.txt
index 19cc179be9a7..40476b227f8d 100644
--- a/tools/perf/Documentation/itrace.txt
+++ b/tools/perf/Documentation/itrace.txt
@@ -1,6 +1,6 @@
 		i	synthesize instructions events
 		y	synthesize cycles events
-		b	synthesize branches events (branch misses for Arm SPE)
+		b	synthesize branches events
 		c	synthesize branches events (calls only)
 		r	synthesize branches events (returns only)
 		x	synthesize transactions events
diff --git a/tools/perf/Documentation/perf-arm-spe.txt b/tools/perf/Documentation/perf-arm-spe.txt
index 0a3eda482307..de2b0b479249 100644
--- a/tools/perf/Documentation/perf-arm-spe.txt
+++ b/tools/perf/Documentation/perf-arm-spe.txt
@@ -187,7 +187,7 @@ groups:
   7 llc-access
   2 tlb-miss
   1K tlb-access
-  36 branch-miss
+  36 branch
   0 remote-access
   900 memory
 
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index a1895a4f530b..dddaf4f3ffed 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -75,7 +75,6 @@ enum itrace_period_type {
  *          (not fully accurate, since CYC packets are only emitted
  *          together with other events, such as branches)
  * @branches: whether to synthesize 'branches' events
- *            (branch misses only for Arm SPE)
  * @transactions: whether to synthesize events for transactions
  * @ptwrites: whether to synthesize events for ptwrites
  * @pwr_events: whether to synthesize power events
@@ -650,7 +649,7 @@ bool auxtrace__evsel_is_auxtrace(struct perf_session *session,
 #define ITRACE_HELP \
 "				i[period]:    		synthesize instructions events\n" \
 "				y[period]:    		synthesize cycles events (same period as i)\n" \
-"				b:	    		synthesize branches events (branch misses for Arm SPE)\n" \
+"				b:	    		synthesize branches events\n" \
 "				c:	    		synthesize branches events (calls only)\n"	\
 "				r:	    		synthesize branches events (returns only)\n" \
 "				x:	    		synthesize transactions events\n"		\
-- 
2.40.1


