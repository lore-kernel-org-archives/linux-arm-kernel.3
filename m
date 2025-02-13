Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4CAC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KhaBNpb95Gi1j4dcCqAqa7XYiZGUbfkjJsMy2avvVao=; b=SCXOIur4Fs1tCquDRQjhZ3tg0d
	XdQ6px4LbiS8Lt5niVV+8efhDEL+Rj44hhjsq5PrS6FKRcTqHFpPhNI/BfWuCX51Mre66mr6B1GhX
	r9JWixOuETUWu6Fo267+oZ4BZjjsxDYGUWMtcsxUvxo14pST3O8Ihg/N/3Y0k+Dt1bEB8VLznTNRc
	WG07D6BVhV4bq12V5oJyHfo6GoLA7p37yKB6Oae/14lbebkpQoo1uC+yukGA2JUZRsRiZ5O9sC/ES
	VEovtiihxhJW6pUFS8L+uKwhjRNac4ZMsMl9wrbFB38pU88gijOLns9xBRJfwPXozeR7jMknrmyU6
	dqFoawAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUzG-0000000ALYI-3feH;
	Thu, 13 Feb 2025 08:54:22 +0000
Received: from out203-205-221-240.mail.qq.com ([203.205.221.240])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUwD-0000000AL4Z-438Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 08:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1739436671; bh=KhaBNpb95Gi1j4dcCqAqa7XYiZGUbfkjJsMy2avvVao=;
	h=From:To:Cc:Subject:Date;
	b=sW7x1q9BAfemQ7d9L0AJayvlQSBnJ+8+4oD42aqGJ+6cpvhQmqIKpNJTbMYaWSnpK
	 I5+wYvsphD4suhqpGFgDYHAjKlhYgIKL2KKtvzHRhbGhMLpGfHtqgMSdm4zuIcSwJ3
	 bk9/EKBgaOQSz8ldoVxlbrZgNZEwfQCFux2g3IAk=
Received: from cyy-pc.lan ([240e:379:2251:3600:f57b:26f9:9718:486c])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id B2330E54; Thu, 13 Feb 2025 16:44:35 +0800
X-QQ-mid: xmsmtpt1739436275tf62qoxf2
Message-ID: <tencent_D4ED18476ADCE818E31084C60E3E72C14907@qq.com>
X-QQ-XMAILINFO: OcN56dxiYj5TKvs7kfZibyvxHrdbil8FBd+bY5ZT7gc3Jj7B62kZYye07kdBtv
	 pkuNbbtuagFWAmjnpSOjxuKK0o1iYgXUiJjXtLZOOaCnJBPYTlxepxpofP2WkhWjt4vhlIt/G0mC
	 xY5SlOCqxPl4E15O7QMr56o83XRpGTXACrbJzhaVw/Xf4qhwsFWtwYQ9mTJdkzc2RDI/sy8Wav9L
	 f2lDSmD/5qDeP74cE1IxH43i30aYQxS5u5zkZQ0W0HVfggr5MNE9a/0LtMr/1YXcFFg0siA3Z8dL
	 d5JjUkKemrm43RVWMmcQs3zw2dUC1XYFfYuJkecVyUnbRK4Mu5afolhmtpeMXA6v6sWYcGDWD5Hc
	 79mzX9dGqozQmWwxbBGr3qJBCgARzGMQIJT488XmyVdS3toP1v9Al8Ab/cJc03sRLGBoyAD8sp0M
	 ArH9veK8hEkcQXbQj8k7DTrT6jCye5YUs//rVGqi8EaLdm96nuCZLVcC+T/PUfL3xTYIZsj7GKxh
	 4rzR8iUHtVFgFiPuPHcqy8dOKXOafineMmg+x9j8Sm3FbbQZrOcyHI1RDPWVPF2p01+IFyNMwKKK
	 gd3ueMHNCFEbvLAag+ZbnO/FkpUhLzSrWEKN8NcpJnLrzF54F62mUe6PqShNTud5ph9NARB5yG0z
	 HoL+2D24wD22QKSaoq9VgPiHJaN5KLSfukOgWjqbjcZBDjdA2/DbYMYhWKn2sw50csMJr66WU1b3
	 bLLpTavxqwmyHbhux+RSG5Qe031tcHi1zegAsBGU1/RyBezTC5ZLBmbn0Z7TgNH/vo7ka9KV/fE4
	 mw/ChjO2jX6QZijG27yuvldo0MPClGdFyi/AjMIGM/51lhweYHSFTWqoUI/C9el8XMJwKQh/IgCM
	 MyyJHFKKbw9dB5+AZ0bpDXgC8qaaAu8rHPoMfroD0g4PoVtN89Oa/YD1SAaApLEPUqR64FoN0h9Q
	 UAqqPMCoXeAJTTsfaMo8Y1qhRKLIywbRg7onUXhJyFcIip5Ex4OQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-perf-users@vger.kernel.org,
	james.clark@linaro.org,
	irogers@google.com,
	namhyung@kernel.org
Cc: acme@kernel.org,
	adrian.hunter@intel.com,
	alexander.shishkin@linux.intel.com,
	fj3333bs@aa.jp.fujitsu.com,
	fj5100bi@fujitsu.com,
	john.g.garry@oracle.com,
	jolsa@kernel.org,
	kan.liang@linux.intel.com,
	leo.yan@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mark.rutland@arm.com,
	mike.leach@linaro.org,
	mingo@redhat.com,
	peterz@infradead.org,
	will@kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH] perf vendor events arm64: Fix incorrect CPU_CYCLE in metrics expr
Date: Thu, 13 Feb 2025 16:44:09 +0800
X-OQ-MSGID: <20250213084409.109774-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_005114_320413_199D85FA 
X-CRM114-Status: GOOD (  11.21  )
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

Some existing metrics for Neoverse N3 and V3 expressions use CPU_CYCLE
to represent the number of cycles, but this is incorrect. The correct
event to use is CPU_CYCLES.

I encountered this issue while working on a patch to add pmu events for
Cortex A720 and A520 by reusing the existing patch for Neoverse N3 and
V3 by James Clark [1] and my check script [2] reported this issue.

[1] https://lore.kernel.org/lkml/20250122163504.2061472-1-james.clark@linaro.org/
[2] https://github.com/cyyself/arm-pmu-check

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 .../perf/pmu-events/arch/arm64/arm/neoverse-n3/metrics.json | 6 +++---
 .../perf/pmu-events/arch/arm64/arm/neoverse-v3/metrics.json | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/metrics.json b/tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/metrics.json
index 1f7c9536cb88..eb3a35f244e7 100644
--- a/tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/metrics.json
+++ b/tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/metrics.json
@@ -169,7 +169,7 @@
     },
     {
         "MetricName": "fp_ops_per_cycle",
-        "MetricExpr": "(FP_SCALE_OPS_SPEC + FP_FIXED_OPS_SPEC) / CPU_CYCLE",
+        "MetricExpr": "(FP_SCALE_OPS_SPEC + FP_FIXED_OPS_SPEC) / CPU_CYCLES",
         "BriefDescription": "This metric measures floating point operations per cycle in any precision performed by any instruction. Operations are counted by computation and by vector lanes, fused computations such as multiply-add count as twice per vector lane for example.",
         "MetricGroup": "FP_Arithmetic_Intensity",
         "ScaleUnit": "1operations per cycle"
@@ -383,7 +383,7 @@
     },
     {
         "MetricName": "nonsve_fp_ops_per_cycle",
-        "MetricExpr": "FP_FIXED_OPS_SPEC / CPU_CYCLE",
+        "MetricExpr": "FP_FIXED_OPS_SPEC / CPU_CYCLES",
         "BriefDescription": "This metric measures floating point operations per cycle in any precision performed by an instruction that is not an SVE instruction. Operations are counted by computation and by vector lanes, fused computations such as multiply-add count as twice per vector lane for example.",
         "MetricGroup": "FP_Arithmetic_Intensity",
         "ScaleUnit": "1operations per cycle"
@@ -421,7 +421,7 @@
     },
     {
         "MetricName": "sve_fp_ops_per_cycle",
-        "MetricExpr": "FP_SCALE_OPS_SPEC / CPU_CYCLE",
+        "MetricExpr": "FP_SCALE_OPS_SPEC / CPU_CYCLES",
         "BriefDescription": "This metric measures floating point operations per cycle in any precision performed by SVE instructions. Operations are counted by computation and by vector lanes, fused computations such as multiply-add count as twice per vector lane for example.",
         "MetricGroup": "FP_Arithmetic_Intensity",
         "ScaleUnit": "1operations per cycle"
diff --git a/tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/metrics.json b/tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/metrics.json
index d022ae25c864..4a671f55eaf3 100644
--- a/tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/metrics.json
+++ b/tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/metrics.json
@@ -169,7 +169,7 @@
     },
     {
         "MetricName": "fp_ops_per_cycle",
-        "MetricExpr": "(FP_SCALE_OPS_SPEC + FP_FIXED_OPS_SPEC) / CPU_CYCLE",
+        "MetricExpr": "(FP_SCALE_OPS_SPEC + FP_FIXED_OPS_SPEC) / CPU_CYCLES",
         "BriefDescription": "This metric measures floating point operations per cycle in any precision performed by any instruction. Operations are counted by computation and by vector lanes, fused computations such as multiply-add count as twice per vector lane for example.",
         "MetricGroup": "FP_Arithmetic_Intensity",
         "ScaleUnit": "1operations per cycle"
@@ -383,7 +383,7 @@
     },
     {
         "MetricName": "nonsve_fp_ops_per_cycle",
-        "MetricExpr": "FP_FIXED_OPS_SPEC / CPU_CYCLE",
+        "MetricExpr": "FP_FIXED_OPS_SPEC / CPU_CYCLES",
         "BriefDescription": "This metric measures floating point operations per cycle in any precision performed by an instruction that is not an SVE instruction. Operations are counted by computation and by vector lanes, fused computations such as multiply-add count as twice per vector lane for example.",
         "MetricGroup": "FP_Arithmetic_Intensity",
         "ScaleUnit": "1operations per cycle"
@@ -421,7 +421,7 @@
     },
     {
         "MetricName": "sve_fp_ops_per_cycle",
-        "MetricExpr": "FP_SCALE_OPS_SPEC / CPU_CYCLE",
+        "MetricExpr": "FP_SCALE_OPS_SPEC / CPU_CYCLES",
         "BriefDescription": "This metric measures floating point operations per cycle in any precision performed by SVE instructions. Operations are counted by computation and by vector lanes, fused computations such as multiply-add count as twice per vector lane for example.",
         "MetricGroup": "FP_Arithmetic_Intensity",
         "ScaleUnit": "1operations per cycle"
-- 
2.47.2


