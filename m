Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD14C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 21:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SSyPGzRmH+p29W/zOgc1ak7tYCQVhV0niieNsI3F3T0=; b=0DNd9Sgz7CxI8jY7UPo4ICaUEw
	PGl9u8v22h1JhMYVtigXwIQcdJF9NLy0bnH8rhbRQnQgAkgpCpap/HD8FGP0wseDY0cMXojnfIEJP
	fdilJrcbq30BDJhPn68nC9i3vwdVh7Gz3WQGzbedEy7Vs+a+4g23vdDNVJAXh2pmH8LE99NDdfMKo
	MECywEg8jM/21DwdOr7YADMMhdA7oXAvz/a1KthMYG5oR5vHa0EdIkEfZTvn5hVtOuGHtYJDcB+/1
	gnKv3y1d332XSz8j7EJoJpjZ10GqQu9dwbbp0wkefCMzbs6U69UX4jHD07+B3lBVjoJcXNitDoET2
	9jPI1pgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9saA-0000000Arne-15v1;
	Tue, 29 Apr 2025 21:33:38 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sYD-0000000ArUD-47Eh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 21:31:39 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-73720b253fcso5212998b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 14:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745962296; x=1746567096; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SSyPGzRmH+p29W/zOgc1ak7tYCQVhV0niieNsI3F3T0=;
        b=P5g3BJLf9dojPciaWRcF8LRDh8my+WlwILG8LpK6AY9H8YuS4PE68lEFny5qbKIjKG
         nX/ZfdcHKED1OdvsBAX/S16SFV8Dgn8mo1dhbhisU+Mf+O15ISA3/nomnLlKASyMkSl7
         zwtNU3d/k7gRcMCZ9i26DwsoNU0W9hSRJ36WFF+aBbvLJdGpPJFCsr1RqDCTxceeaPXF
         ULUN54s9o6B+M63v4EwgyB/LuQXtJv8GLnQ2+sw27Vc43jbTkBzqzo9sZVq7N+gb5UiJ
         h/WnuXnT3zdva+ZRC2j30hQWpbd8ns67iJyglOD4lnvI6lJ7w+rFqUSsExJZynRstuN/
         KvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745962296; x=1746567096;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSyPGzRmH+p29W/zOgc1ak7tYCQVhV0niieNsI3F3T0=;
        b=ELQrrMsmpkTZ/fiBxddIpybDoWaXHKqRflMp8zdfz/MGH69DNr9ThXSpCtuTmIALJs
         Aq94txqtQnymVI6ZIzBPD9vyDboXl7sfBjb9QR9O2+/kCdML7CR+Ny+ezzxn6fD0gWxW
         Mdinp3rhf8b58WD/7NxJ3IRCfFoVzWUwiPx3ehk2kqz1Dt3itDP3yEU5jsv32jqQGjmn
         daPZKiAJtK6+f+SeCT0fcATtugw3lSJE97WSUsPJJ4DWTFzR1fQ2zw6wHPT55YGubLeE
         CX7JCAlzWXQB4LOFtTo3JJEFO+wd8JGDgAS16ViiPiIsUfXInfaBLjmBfVebgoEFtUZQ
         sg+A==
X-Forwarded-Encrypted: i=1; AJvYcCUdBAk/l/RCDlbEo3EZgmQFWLpm0GXP7/eVRb8fX8KiYsCGfkW2C05yH/VKkUnVnz6W5lv8DgXgq5akxrwJeUUc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz07lCNwVx3sPkj1mCpvTpFyav/c36Xmxn0NRB6+J1SXhOWGCph
	aekXarhwf7/16JwFJ35SGhg1ZO0mwI3YJehLTWu2si7PWHU2wAIkFn9H2yY0GEQemJsYJZgEmRR
	7
X-Google-Smtp-Source: AGHT+IHOSDOIqpZpmYQaY3Yz/7hu12LY8GBmRluDIfh5RN3+pVvh6Z7iPpXYxLligqfOYM9sLtdxd65Na1g=
X-Received: from pfble20.prod.google.com ([2002:a05:6a00:4fd4:b0:73d:65cb:b18b])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e03:b0:73d:fa54:afb9
 with SMTP id d2e1a72fcca58-7403899f538mr1059841b3a.7.1745962296306; Tue, 29
 Apr 2025 14:31:36 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:31:33 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250429213133.922495-1-yabinc@google.com>
Subject: [PATCH v2] perf: Allocate non-contiguous AUX pages by default
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_143138_021273_E6C19398 
X-CRM114-Status: GOOD (  18.73  )
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

perf always allocates contiguous AUX pages based on aux_watermark.
However, this contiguous allocation doesn't benefit all PMUs. For
instance, ARM SPE and TRBE operate with virtual pages, and Coresight
ETR allocates a separate buffer. For these PMUs, allocating contiguous
AUX pages unnecessarily exacerbates memory fragmentation. This
fragmentation can prevent their use on long-running devices.

This patch modifies the perf driver to allocate non-contiguous AUX
pages by default. For PMUs that can benefit from contiguous pages (
Intel PT and BTS), a new PMU capability, PERF_PMU_CAP_AUX_PREFER_LARGE
is introduced to maintain their existing behavior.

Signed-off-by: Yabin Cui <yabinc@google.com>
---
Changes since v1:
In v1, default is preferring contiguous pages, and add a flag to
allocate non-contiguous pages. In v2, default is allocating
non-contiguous pages, and add a flag to prefer contiguous pages.

v1 patchset:
perf,coresight: Reduce fragmentation with non-contiguous AUX pages for
cs_etm

 arch/x86/events/intel/bts.c |  3 ++-
 arch/x86/events/intel/pt.c  |  3 ++-
 include/linux/perf_event.h  |  1 +
 kernel/events/ring_buffer.c | 18 +++++++++++-------
 4 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/x86/events/intel/bts.c b/arch/x86/events/intel/bts.c
index a95e6c91c4d7..9129f00e4b9f 100644
--- a/arch/x86/events/intel/bts.c
+++ b/arch/x86/events/intel/bts.c
@@ -625,7 +625,8 @@ static __init int bts_init(void)
 		return -ENOMEM;
 
 	bts_pmu.capabilities	= PERF_PMU_CAP_AUX_NO_SG | PERF_PMU_CAP_ITRACE |
-				  PERF_PMU_CAP_EXCLUSIVE;
+				  PERF_PMU_CAP_EXCLUSIVE |
+				  PERF_PMU_CAP_AUX_PREFER_LARGE;
 	bts_pmu.task_ctx_nr	= perf_sw_context;
 	bts_pmu.event_init	= bts_event_init;
 	bts_pmu.add		= bts_event_add;
diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
index fa37565f6418..37179e813b8c 100644
--- a/arch/x86/events/intel/pt.c
+++ b/arch/x86/events/intel/pt.c
@@ -1866,7 +1866,8 @@ static __init int pt_init(void)
 
 	pt_pmu.pmu.capabilities		|= PERF_PMU_CAP_EXCLUSIVE |
 					   PERF_PMU_CAP_ITRACE |
-					   PERF_PMU_CAP_AUX_PAUSE;
+					   PERF_PMU_CAP_AUX_PAUSE |
+					   PERF_PMU_CAP_AUX_PREFER_LARGE;
 	pt_pmu.pmu.attr_groups		 = pt_attr_groups;
 	pt_pmu.pmu.task_ctx_nr		 = perf_sw_context;
 	pt_pmu.pmu.event_init		 = pt_event_init;
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 0069ba6866a4..56d77348c511 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -301,6 +301,7 @@ struct perf_event_pmu_context;
 #define PERF_PMU_CAP_AUX_OUTPUT			0x0080
 #define PERF_PMU_CAP_EXTENDED_HW_TYPE		0x0100
 #define PERF_PMU_CAP_AUX_PAUSE			0x0200
+#define PERF_PMU_CAP_AUX_PREFER_LARGE		0x0400
 
 /**
  * pmu::scope
diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
index 5130b119d0ae..d76249ce4f17 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -679,7 +679,7 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 {
 	bool overwrite = !(flags & RING_BUFFER_WRITABLE);
 	int node = (event->cpu == -1) ? -1 : cpu_to_node(event->cpu);
-	int ret = -ENOMEM, max_order;
+	int ret = -ENOMEM, max_order = 0;
 
 	if (!has_aux(event))
 		return -EOPNOTSUPP;
@@ -689,8 +689,8 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 
 	if (!overwrite) {
 		/*
-		 * Watermark defaults to half the buffer, and so does the
-		 * max_order, to aid PMU drivers in double buffering.
+		 * Watermark defaults to half the buffer, to aid PMU drivers
+		 * in double buffering.
 		 */
 		if (!watermark)
 			watermark = min_t(unsigned long,
@@ -698,16 +698,20 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 					  (unsigned long)nr_pages << (PAGE_SHIFT - 1));
 
 		/*
-		 * Use aux_watermark as the basis for chunking to
+		 * For PMUs that prefer large contiguous buffers,
+		 * use aux_watermark as the basis for chunking to
 		 * help PMU drivers honor the watermark.
 		 */
-		max_order = get_order(watermark);
+		if (event->pmu->capabilities & PERF_PMU_CAP_AUX_PREFER_LARGE)
+			max_order = get_order(watermark);
 	} else {
 		/*
-		 * We need to start with the max_order that fits in nr_pages,
+		 * For PMUs that prefer large contiguous buffers,
+		 * we need to start with the max_order that fits in nr_pages,
 		 * not the other way around, hence ilog2() and not get_order.
 		 */
-		max_order = ilog2(nr_pages);
+		if (event->pmu->capabilities & PERF_PMU_CAP_AUX_PREFER_LARGE)
+			max_order = ilog2(nr_pages);
 		watermark = 0;
 	}
 
-- 
2.49.0.967.g6a0df3ecc3-goog


