Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DD3C55197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhvvUEtEfWoODdofTIYNfBNSRpCWZhs8L4PbCBJfhZw=; b=QQu8Q9V1toaPPp2ez0fFVjxBwh
	5zzAcu1YxAEzTnUjEJmHkq+3NQhe9BjVoA4+gk1wFVKJ/LQZkeESqVZhPbDAd+G8JNOxBtYtBl4bG
	KFs1hUCFgZWW3MUk7XX6k/KErbKdQ59mQFXc/DHzXQHf+jqaflFtfGEa1QxSDt+kc2v7Z5bzFlpU6
	3JxFiVwzDuGFUOzbuddWoUdGfcXvu9LCMcToDuDvmujKQk9dovxi7sNxmm4L9AUdYS0SnSrakzD/8
	fgUKP+Y2+Bki3rnQYr2aniSHTRu/FNN4e4o023F6zHgc/KXQgqDW31b+WTJfA1PRxy3Wi6SNefICv
	nBs2y7Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqodW-0000000GeDg-3ToC;
	Mon, 03 Aug 2026 09:07:06 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqodP-0000000Ge7s-2jwi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:07:03 +0000
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6735Dkfs283605;
	Mon, 3 Aug 2026 02:06:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=qhvvUEtEfWoODdofTIYNfBNSRpCWZhs8L4PbC
	BJfhZw=; b=qLsY1Q1qOCiKaYj9Z/QvYscJxaQCvcFHioJsduwZzhU+0ArF6QQc/
	HMmygM34x/jC5lkm5FO9o5IiFVincA60sBG9/39osKmuQaJvjhJ526MyO009chTp
	Rn00/VsHOb36MnprwRwo+ovxSwOSElMpBQT7vBi4cgkXdMYIFVfKhZ4rxptyQzrM
	dz3+yXmHD790EZBUj3TVVRVaK7JBYx5yWTqMSYhwvb/65NDcfI1IH5duk6lrvrZl
	Xy54CZWEpMC1b8t/JrcDRaIGVCaAB3D2wKbnOkzIKu8clc8WEbKWFPWJTenniaos
	mPSS2uOUwJ5WABdx6CnTDqcrw2xtWNstQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4fsg3h00de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 03 Aug 2026 02:06:44 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::7cb7) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.45; Mon, 3 Aug
 2026 09:06:44 +0000
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
Subject: [PATCH 4/9] perf dlfilter: Add non-empty branch stack filter
Date: Mon, 3 Aug 2026 02:06:35 -0700
Message-ID: <20260803090640.2412336-4-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260803090640.2412336-1-aaupov@fb.com>
References: <20260803090640.2412336-1-aaupov@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:208::7cb7]
X-Authority-Analysis: v=2.4 cv=PtSjqQM3 c=1 sm=1 tr=0 ts=6a705a24 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=crHB47gyY4rKiduisYu9:22 a=FOH2dFAWAAAA:8 a=xLaWpbBnj8biFduWQD8A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX35tavSruDhN6
 mnO5AkbkYWqB2syzU28Jjm2nkZABQSpcpA6DFyV0vm6Q0HPt99cYA8gEdkFBT2c5RshrAFm12uA
 lQ9GrUonqN1Dwm/MrVsEqz/KTdCL0Uc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX7wp/MPWxfm7s
 8/gHwq13e4ODH40iYpbWlPZMbNzS9pWdV0ZVQShHhoLhyX7gY+1uKW/kk13HY2tYx+Rr5aRh47+
 EmMfhOxkw91yJzDsQn16flb9zqAqlCf+GTDzrNApHwusZXCauFWD51O1YBvPg80Z9b9/hOHUHur
 62SG7z4iUPjA42YCV28VAtIi3lIvSy2PVjYJyas8qQcA0ca/uHmH8e9kxUbDScC+XyMTIRvbEiS
 oMXrAqqPVHP6AHeVrn8+pxaDjwrccosda5iyL8e+vMDVEvz8V6CDS/aMEQsdzVOMOXez11STlYc
 QmqNcXtBUS3ETXytojoEdOK5MKjYBYN4nPJ6lEzqr+xlPtFQXFmWmPHPu8vRRLSyGz+RT3JclwO
 fC/pfVujro8G/xHQREP/eisV8TMfHV+GA2Q7Ht3iyLsaLU6dNmBlfxepwyPTGTVbO2rNZZ5+ppV
 /Eelj4QNMxtfTXdyW+A==
X-Proofpoint-ORIG-GUID: jxuHbwdfb23KNCIq2bmwgCYgrm9jxTU1
X-Proofpoint-GUID: jxuHbwdfb23KNCIq2bmwgCYgrm9jxTU1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_020659_701642_E733C36F 
X-CRM114-Status: GOOD (  17.14  )
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

--itrace=L adds decoded branch history to existing samples, but a sample
that was recorded while the decoder had no trace for that thread keeps an
empty branch stack. Consumers of the resulting perf script output, such
as profile generators for context-sensitive PGO, have no use for those
samples.

Add an opt-in dlfilter that drops samples whose parsed branch stack is
empty, so users can exclude them without changing default sample
semantics. Build and install it alongside perf's existing dlfilters.

Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 tools/perf/Makefile.perf                      |  1 +
 .../dlfilters/dlfilter-nonempty-brstack.c     | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 tools/perf/dlfilters/dlfilter-nonempty-brstack.c

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 0031112c036e8..aeb8085b0756d 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -427,6 +427,7 @@ PROGRAMS += $(OUTPUT)$(LIBJVMTI)
 endif
 
 DLFILTERS := dlfilter-test-api-v0.so dlfilter-test-api-v2.so dlfilter-show-cycles.so
+DLFILTERS += dlfilter-nonempty-brstack.so
 DLFILTERS := $(patsubst %,$(OUTPUT)dlfilters/%,$(DLFILTERS))
 
 # what 'all' will build and 'install' will install, in perfexecdir
diff --git a/tools/perf/dlfilters/dlfilter-nonempty-brstack.c b/tools/perf/dlfilters/dlfilter-nonempty-brstack.c
new file mode 100644
index 0000000000000..9e66205b841d5
--- /dev/null
+++ b/tools/perf/dlfilters/dlfilter-nonempty-brstack.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dlfilter-nonempty-brstack.c: Filter out samples with no branch stack
+ * Copyright (c) 2026, Meta Platforms, Inc.
+ */
+#include <stddef.h>
+
+#include <perf/perf_dlfilter.h>
+
+int filter_event(void *data, const struct perf_dlfilter_sample *sample, void *ctx)
+{
+	/* Return 1 to filter out the sample, 0 to keep it */
+	return !sample->brstack_nr;
+}
+
+const char *filter_description(const char **long_description)
+{
+	static char *long_desc =
+		"Instruction trace decoders can add branch history to existing "
+		"samples, but samples that were recorded while no trace was "
+		"being collected get an empty branch stack. Filter those out so "
+		"that only samples carrying branch history remain.";
+
+	*long_description = long_desc;
+	return "Keep only samples with a non-empty branch stack";
+}
-- 
2.52.0


