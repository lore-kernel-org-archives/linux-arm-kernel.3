Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1E1CCF2CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 21:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRSGP4EkTpjaP8ikhGifE89Rqs96cJ2tofmmbq1YDTQ=; b=RY4sRJDRdQymuXndCysCtVFcYb
	xO67lkU39WLaCFj7v0vZjITvIG5dXV9cVdS3WeUJId0k15gB1SN0um6tiRb5ndn6kwLDZOqYO/cRS
	kgy6s9M7OLy8a6HgHA6ayLdHMvDt3gVnrzWLJI794Xx1WXBp1Acb7Fr/o8rxjsyqmM1soaAG8xYXz
	w0DgxhqIHBt+L9vbt/VmP00xS+UB2fftTJdnPQ9JsAbPSpOup5IXzGS+RawXf6gNKvtqF21whsSmd
	NUx0mLW7CDGAPlTFraLXNUB9n+bqlR4LEpcPGpxThczR0zilgskvOjhuVijA0HpgyOCyRmehAtuPB
	cvqb/5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpE7-000000044Gc-3sAI;
	Fri, 16 Oct 2026 21:12:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpDv-0000000447t-0Nkx
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 21:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TRSGP4EkTpjaP8ikhGifE89Rqs96cJ2tofmmbq1YDTQ=; b=QUvEwGU+B21YyIwrvBpW3LJmyW
	Zqxx8oQCSZP2nego7sx4p6UTPPWaOK1R8i+DdblaSovkfeFTTebz6di7R+jEzjjtZucZoogBjrQXY
	aEL9Ha6phpiz+hvp+ladXezedL57Y1twDHd7+jSNkJ2g4klKw1aBXLYpHW/1gerlQS8FJfJ90r4XE
	tOS0AMF3OMhbdFlura+BMYM5UNXkEAFrusBKoSXVIqgtTeS2O8cNpWSK22INjPJwNKFJLVkDBSsAv
	jqCF+js+52v4FUxoi++o4trasajMlcrDDrerC17QZxSuqPDdrrXWGMRelorfMCmG/ZCa6atZiwEmA
	x+HZFHXg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHpDs-00000001xUq-0w3i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 21:12:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 239FE1764;
	Fri, 16 Oct 2026 14:12:11 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D673D3F673;
	Fri, 16 Oct 2026 14:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185134; bh=odB4IVmHAE0cO3FyTTEtE7ltEbt7Y3v/azgxS4p/Qy8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TTe6IyY3z/gRvdssqiTxmQYMmw8PwpHbPTj78b6YCTkmbATpS+aAgFcNoi7Z6xbwE
	 2j65Je3HKUIP3EdyO6PpIwy6oYYg/JE4zoocgfi78JL9xxLaHlIJgEPcyrD0feQIwu
	 nULRnQ8ZLRdNNZlei/j+BlY3Xidlxc7SR1WJqJjs=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:49 +0100
Subject: [PATCH v2 11/11] perf cs-etm: Set watermark for AUX trace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-11-383ac26382fa@arm.com>
References: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
In-Reply-To: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=1957;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=odB4IVmHAE0cO3FyTTEtE7ltEbt7Y3v/azgxS4p/Qy8=;
 b=y0UuvGWrgW81YUULLpdhMtovKFv4pBBYJmBEzCG1h0joDfu/oWeSNI4i65dsioMv7tdMnYp+2
 D5tjrwRNWhBC8YLmLtU180UlQJhglJ7DibFFXyhbkYEXPZtS/9MXRgc
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_221216_494459_2AF6490F 
X-CRM114-Status: GOOD (  12.39  )
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

The kernel defaults to a watermark of half the AUX buffer. With small
buffers, the reader can be notified too late to drain the trace before
the available space is exhausted.

Use a quarter-buffer watermark for normal recording to wake the reader
earlier and leave more space for trace generated while it handles the
notification.

If the computed watermark is at most one page, set it to zero so the
kernel selects its default. TRBE's write-out-of-range workaround requires
PAGE_SIZE + 64 bytes per trace span and disables trigger counts. A
one-page watermark can leave every span too small to enable tracing.
The fallback retains a two-page watermark for a four-page AUX mapping.

Leave snapshot and AUX sampling behavior unchanged.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/arch/arm/util/cs-etm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index d2861d66a6612ea213066258672ba41769e578cb..2b29cd5fde4b8cc18e04d02308635d7b0c13ccf6 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -438,6 +438,21 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 		pr_debug2("%s snapshot size: %zu\n", CORESIGHT_ETM_PMU_NAME,
 			  opts->auxtrace_snapshot_size);
 
+	if (!opts->auxtrace_snapshot_mode && !opts->auxtrace_sample_mode) {
+		size_t aw = opts->auxtrace_mmap_pages * (size_t)page_size / 4;
+		u32 aux_watermark = aw > UINT_MAX ? UINT_MAX : aw;
+
+		/*
+		 * TRBE workarounds can require more than one page per trace
+		 * span. If the watermark is too small, let the kernel select
+		 * its default.
+		 */
+		if (aux_watermark <= page_size)
+			aux_watermark = 0;
+
+		cs_etm_evsel->core.attr.aux_watermark = aux_watermark;
+	}
+
 	/*
 	 * To obtain the auxtrace buffer file descriptor, the auxtrace
 	 * event must come first.

-- 
2.34.1


