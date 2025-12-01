Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2863D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncUrUvW/nC5jSahl67q994bMChHWaihbbdVTjPLqTnU=; b=U6Jccnbdet5SJ6gIkooIHdHCpD
	khRP/RVTRzlT+EpqS7X9yacA1VQD5RBS2WbgVUUccPzKDQuulYCNa3IU96xH5MaIvH+iwq2hKW5bZ
	8joH5IuMqvz53IM5BO1IqUZc1RwhhCX7X6Z3hkHw2gr8Eeper/0SaPxKM0eHiah9hOSZNp+MKOQi0
	KEfDBOUB/5TUjtm8BUcifOQALvPQRcSGZ5tFIfxGXKnOikCWTJnjwHT0wTNEhUxmfSi8tkN9u6tUi
	WzA0i26IiO/hVf4uNUnZ5FqFstEF93s+1OJFHjKRiHg76m8Itj6umQWIkXj+/Il81tgt9fLqtLmQc
	XjtJPwpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zT-00000003RJz-11UD;
	Mon, 01 Dec 2025 11:22:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zR-00000003RGg-0sCv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:22:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63F85153B;
	Mon,  1 Dec 2025 03:22:37 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41E053F59E;
	Mon,  1 Dec 2025 03:22:42 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 01 Dec 2025 11:22:03 +0000
Subject: [PATCH 13/19] coresight: trbe: Remove misleading comment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-trbe_buffer_refactor_v1-1-v1-13-7da32b076b28@arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>, 
 Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764588125; l=1975;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=tI23wHWbnF4yzdYIODYmTmujHYxBfWMJv1sYUQXmTec=;
 b=RIRbbXcq3hGGI2EJ1tcNL6xKmXI8GPtNQJN0zCfuGLhEufkzi2hxCfk9zj/nB4NPQprWUPel+
 NNUomz9IsgYA1ODwFJFyowfrz5o9URya2JGODB2lFPLrysXOSBGdyR4
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_032245_323347_F8191DAA 
X-CRM114-Status: GOOD (  11.68  )
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

Since the rounded-up wakeup address is always higher than the head, the
limit cannot be less than the head caused by wakeup capping.

The described scenario is never valid caused by wakeup capping, remove
the comment to avoid confusion.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 48bc03bd339908b5eac9466dc60325ff1b238976..206eaf103cd94f36220cb6bddd1a78012f5de35a 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -488,10 +488,10 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 		limit = min(limit, round_up(wakeup, PAGE_SIZE));
 
 	/*
-	 * There are two situation when this can happen i.e limit is before
+	 * There is a situation when this can happen i.e limit is before
 	 * the head and hence TRBE cannot be configured.
 	 *
-	 * 1) head < tail (aligned down with PAGE_SIZE) and also they are both
+	 * head < tail (aligned down with PAGE_SIZE) and also they are both
 	 * within the same PAGE size range.
 	 *
 	 *			PAGE_SIZE
@@ -502,18 +502,6 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 	 * |$$$$$$$$$$$$$$$$$$$|========|$$$$$$$|
 	 * +------------|------|--------|-------+
 	 * trbe_base				trbe_base + nr_pages
-	 *
-	 * 2) head < wakeup (aligned up with PAGE_SIZE) < tail and also both
-	 * head and wakeup are within same PAGE size range.
-	 *
-	 *		PAGE_SIZE
-	 *	|----------------------|
-	 *
-	 *	limit	head	wakeup  tail
-	 * +----|------|-------|--------|-------+
-	 * |$$$$$$$$$$$|=======|========|$$$$$$$|
-	 * +----|------|-------|--------|-------+
-	 * trbe_base				trbe_base + nr_pages
 	 */
 	if (limit > head)
 		return limit;

-- 
2.34.1


