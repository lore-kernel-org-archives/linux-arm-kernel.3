Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B66C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ghK/bHWVhFAELNGljeYZIiXRp8blDDlnVpWM9nrKUg=; b=L4fyagkkKapMbI3zbVbrQk5Msc
	j/dkZfFlTT91LJVKE5xsNgKMbxJ5Wy6Drp7OPP02U3atLuJgkgC/K6sK5WFNsm0Cz9qF4v2v8beuV
	FC1bx2ylZbGmtPjjxo9scFbuZ2fWW3otoWeUesi6kAN0nsTkYzXNiUyyu3xGeL43azYfrU5Ch+oIt
	jrGyM3Oz91W56vvTQf2RPZpUNmQtF8Lr2e7QDmwW4njs+rtC+btL5kZ64fxF55fd9tWUhKvAZtPho
	SdoIcsMvIc+G1QuW6aLkvXltYDemvElo0YJixF7qJVd44ur73/mc5PunrdERBtIlbZOVck0He3qyH
	NglRZQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqodT-0000000GeAL-10CZ;
	Mon, 03 Aug 2026 09:07:03 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqodP-0000000Ge7q-2jkD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:07:02 +0000
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6735hHdG490521;
	Mon, 3 Aug 2026 02:06:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=0ghK/bHWVhFAELNGljeYZIiXRp8blDDlnVpWM
	9nrKUg=; b=AuGMxT/OosoD3V1q6XpdaQRjk6YZhmYHz/qx9mi22quude+fmaCWj
	1MbQNK11gk9bq5+fDfAQJi+VGAEoH7M/cnu6GhfeJgTjZpSt4fqNmhMdFqXHg8V6
	IkkvqPgii9gFVc0VuD5UXYp0FrJ8EeiuJpgeyuGjbaRwvyMNIn9gNb6WObU/XPc8
	gC8wlfhrTShNEwrkZ3C9uoJrPnl7VL0NAQ1sX5y7U50wzV4/oy9D+xkA3Ci4JpEs
	ynSyefCgLmSJnMBGCIQnd2i6L/5jw5gsx1WF9xcEK5eeCSzAZPpf8lG4LWUbMMEk
	VPqhJLparUvE+24NbQpglC2Q8ertu7luA==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4fsdw80c3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 03 Aug 2026 02:06:43 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.45; Mon, 3 Aug
 2026 09:06:42 +0000
From: Amir Ayupov <aaupov@fb.com>
To: <linux-perf-users@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan
	<leo.yan@arm.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
	<mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim
	<namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>
CC: <linux-doc@vger.kernel.org>, Mike Leach <mike.leach@arm.com>,
        Jonathan
 Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Swapnil
 Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH 2/9] perf thread-stack: Report branch stack hw_idx as not available
Date: Mon, 3 Aug 2026 02:06:33 -0700
Message-ID: <20260803090640.2412336-2-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260803090640.2412336-1-aaupov@fb.com>
References: <20260803090640.2412336-1-aaupov@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:208::f]
X-Proofpoint-ORIG-GUID: pvrznZBnpB91_2NTEiNB_sZCTbJZ0Ta0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfXzV2QmRQ0/eSt
 6AQVobwJUgaY2hfKbvuBVDtNXVQKGQvgvYmSGcCgmqWo//nVJXy7KnJ9811c8nsvz+GgeiOKvlI
 5dcK9xDSpgEqxcL0kSeOiXoVFRbBJOs=
X-Proofpoint-GUID: pvrznZBnpB91_2NTEiNB_sZCTbJZ0Ta0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX306oAGCw+eZQ
 PoccYJzHNQqelf5HYONXdUjJ7cLcjM8DcVp4I8FuziGoTCUXRG/wj+xy95DBqhvcI0kqo0KntVo
 7hg1xQCoouWmg69gCtZY4+LUUHeszpAMVSbesrkOeVzeAszj4pJwtUbLgGHENyKBLkI35JqMPJK
 B0ce3WFrTKZW3HMbMEqy+axdk1aR3RWLh3tmpOXrs8q9mMYzfU7IdrYnH8iEFyrm3Yf5qREW97C
 /HzNFx9SfYBa/81jg9apntldSsfTL1YmkkB8AlO+u7li0GF4yLYe6C6Ciz+VXuCFilksBv8URm9
 AXpR9ketFfk2mVCLSqhYS24u9uncP3+GiiyYIOFBPmjAEbMdCqKOZKC/ZwZXZG4atb3wyv29VWB
 p9pef/tCJV74M//hbnXzOfHitYtts0BCMQ9PQCQhW/OlfWmpLoQaWjiy4A2ekYm0QidfhzQsfXH
 2TRrce7Jo8PPs58Y4AA==
X-Authority-Analysis: v=2.4 cv=auGCzyZV c=1 sm=1 tr=0 ts=6a705a23 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=03ozwUkBphtHgyqjj1sw:22 a=FOH2dFAWAAAA:8 a=tFPw7G4F2t7FTvsiR7UA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_020659_699857_CA35B11D 
X-CRM114-Status: GOOD (  13.01  )
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

thread_stack__br_sample() and thread_stack__br_sample_late() fill a
caller-supplied branch_stack that is typically allocated with zalloc(),
leaving hw_idx as 0. Zero is a valid hardware index, so consumers that
honour PERF_SAMPLE_BRANCH_HW_INDEX see a reconstructed branch stack
claiming to start at LBR TOS entry 0.

These branch stacks are reconstructed from instruction trace and have no
hardware index at all. Set hw_idx to -1ULL, which is the established way
to say "not available" and matches what intel-pt and cs-etm already put
in the branch stacks they synthesise directly.

Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 tools/perf/util/thread-stack.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/util/thread-stack.c b/tools/perf/util/thread-stack.c
index c5ce741b07446..1a3dffa83bde2 100644
--- a/tools/perf/util/thread-stack.c
+++ b/tools/perf/util/thread-stack.c
@@ -624,6 +624,7 @@ void thread_stack__br_sample(struct thread *thread, int cpu,
 	unsigned int nr;
 
 	dst->nr = 0;
+	dst->hw_idx = -1ULL;
 
 	if (!ts)
 		return;
@@ -686,6 +687,7 @@ void thread_stack__br_sample_late(struct thread *thread, int cpu,
 	bool start = false;
 
 	dst->nr = 0;
+	dst->hw_idx = -1ULL;
 
 	if (!ts)
 		return;
-- 
2.52.0


