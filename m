Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC65CC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kanYow5EJehBk+mNXNXPOES1suOkimpKJHJWqZ9ZoBQ=; b=iHnmchldRZi7WCtA+Yr+D/fQut
	91eaY5hjzZmT8YHE7MOJAxfGD0aAI74CKCBlqI7pcQte6WQ2rIz41sOjRYdtZU0cOtrkQ0G3TWmVu
	a98QxithUsny4KardZTTyBT2ThRjRBelljKwyuZghoBEaxgCsILXe2cZRXHLyDTVsSJiHe3sUa1ho
	vl7Mb3M6VGa7dzKYQYdWRqFFkkBnNFvFD/G47UmOEiAliY0/7PDPlgjoyN6a/JNG1WTc7zQNJ+/fb
	01lIaQWr98ZkvjZTmDV4pjtdnyDadgYEoJoWQxORg2zl7UIye18rFkYYEdslIn3NP3D+ij3h4l4xe
	0+3tKg8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPP-00000007Hhq-236N;
	Tue, 15 Sep 2026 15:49:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPE-00000007HfF-438R
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 15:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kanYow5EJehBk+mNXNXPOES1suOkimpKJHJWqZ9ZoBQ=; b=nV4yD87pI0/0QnU8C75Zqqc6vl
	MbDqYH0GOyEXzmnBwOQm9HGAex4In7o3p4l92zYmydo0186ncLjxLbgsWVosXxOba4fyaa5FnMz6k
	jv503cdhIuD1zkZIPwE1kt2/G1Fuv+UnL5P6VLX2YaMnwdIyJAPlugFx17oE48m+IBqRWxG8Nedj/
	W9T8U5qoLvfci6HIHVjV+mqnB0oJTIOWyXmfnrNLk1UH1fXYdsgYeyNqs+zCUZ3BAqwzbkQYuHYhk
	lyFUVMLD895QdGlNzDdIjAooxVuCsxIjRdJRP08H4jgc0J7Xccii5YhyacMzOpEHRAonCmFeCeC02
	vGiQTzqw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6VPC-00000006yPL-002s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F9EB1BF3;
	Tue, 15 Sep 2026 08:49:05 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 881773F882;
	Tue, 15 Sep 2026 08:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487348; bh=B0UpuY1UdwYGmq+lypGwMC9Rr8VbjvbhGjJOTbTkvgg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y2m8tbMyFKI7i6DtKAsBVajowPHcKU+EhCiHmbR02SdpzMuaksIa6cija/04cTuRW
	 BFjZbXoTp5F0Y+v6Jl2HV5YeotzxXmhpa1aQLTzIxhpRyVFhuREeB1FRmSd4LjTVFu
	 3a6HYrVb7e1QnyArLClsly+KB45I/tPvnTMlDeAg=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:48:48 +0100
Subject: [PATCH 02/25] perf/core: Prevent AUX sampling from racing with
 pause/resume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-2-35cf6f297d20@arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=2358;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=B0UpuY1UdwYGmq+lypGwMC9Rr8VbjvbhGjJOTbTkvgg=;
 b=WfTg/03reVi5kRMDM9V0J2d7OosG9mo6fY4Ts2KQmsi56+F2MvdU4wqtAP9rcPyGIxN0oMUz6
 Fsb+2AOOzf9DzQKRfzEKZ6w7GWnVXSlJRYYruCMouVKZ6rOLWk9nmAx
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_164910_470401_08B3FD8E 
X-CRM114-Status: GOOD (  16.87  )
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

AUX snapshot sampling and AUX pause/resume can both run from NMI
context. Each path currently guards only against its own recursion.
An NMI can therefore enter one path while the other is changing the
AUX hardware or buffer state, allowing snapshot_aux() and the PMU
pause/resume callbacks to overlap.

Use aux_in_sampling and aux_in_pause_resume as a shared exclusion
scheme. If sampling nests inside pause/resume, emit the regular sample
without an AUX payload. If pause/resume nests inside AUX sampling, drop
the AUX action, matching the existing behavior for recursive
pause/resume.

This prevents overlapping PMU operations without waiting in NMI
context.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 kernel/events/core.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 17355e4b8b7c6c106117153c9eb8509e6f9a41e3..a524eb381d4b5731650ec0105d9794b8c89fba4d 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7990,10 +7990,12 @@ static unsigned long perf_prepare_sample_aux(struct perf_event *event,
 		goto out;
 
 	/*
-	 * If this is an NMI hit inside sampling code, don't take
-	 * the sample. See also perf_aux_sample_output().
+	 * If this is an NMI hit inside AUX sampling or pause/resume, don't
+	 * include AUX data in the sample. See also perf_aux_sample_output()
+	 * and perf_event_aux_pause().
 	 */
-	if (READ_ONCE(rb->aux_in_sampling)) {
+	if (READ_ONCE(rb->aux_in_sampling) ||
+	    READ_ONCE(rb->aux_in_pause_resume)) {
 		data->aux_size = 0;
 	} else {
 		size = min_t(size_t, size, perf_aux_size(rb));
@@ -8869,10 +8871,13 @@ static void perf_event_aux_pause(struct perf_event *event, bool pause)
 
 	scoped_guard (irqsave) {
 		/*
-		 * Guard against self-recursion here. Another event could trip
-		 * this same from NMI context.
+		 * Guard against self-recursion and AUX sampling. Another event
+		 * could trigger either path from NMI context, in which case the
+		 * AUX action is dropped instead of waiting for the preempted
+		 * context.
 		 */
-		if (READ_ONCE(rb->aux_in_pause_resume))
+		if (READ_ONCE(rb->aux_in_pause_resume) ||
+		    READ_ONCE(rb->aux_in_sampling))
 			break;
 
 		WRITE_ONCE(rb->aux_in_pause_resume, 1);

-- 
2.34.1


