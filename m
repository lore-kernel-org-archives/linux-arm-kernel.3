Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F58C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOWK+ThY516lMh047e8qidZAr1KsboApKQXs49+vyHs=; b=OJGP7B6AsYK0m9LnnYbsSvi91w
	5IcrYI2Ffe7cwptUlJ0fUJQLaq7Ky2zB6N95ysMWy1gte5RFuIXFl6PxGGivnlWl2g7MIVLpCViRq
	qaazDhRjG9pPJ30BmcS9hXGA0YVzKJKMr93vHSgSTb2BVeR9Q09GBQcRssT/SWD9u/7JC9k+rQygv
	a/2tSgD9TCOMA7E8QMggAm5hD3wecoBR+dyPIFKNf5mKlrXe3tdO5lAPYbPjuIvFyDsUufen7l07W
	BPd6TLO47/93fHZSkWUUgGgU5gAurJpLncHIdGtb9EVOG8yOOJOWd6RJf1GVe4r70/OHUkQsWeAWQ
	0K/nfiEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHO-0000000Dn5W-2SeE;
	Mon, 24 Feb 2025 13:13:50 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXMv-0000000DeIs-3Lbf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:15:30 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43942e82719so32768425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 04:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740399328; x=1741004128; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OOWK+ThY516lMh047e8qidZAr1KsboApKQXs49+vyHs=;
        b=zKn68x/6Kq1NXOYQzTrbA+EyqgOb8B1R7A+YqsSy1m7GXpNk0NqgLJ1eG0O3SUEGRx
         gsjEY75yik6z110V58TX+dzqwCCZvautD1gl7DVLEqFqMt0ow4c1BIHolxk5BjvCgFf8
         Lrw6PQITSc3FVCUSwV6KrA/Cmk3TAZoC9G9bbVF7GjxtLBAvq+kobHSmJnXxIZNsrCFf
         SgUYvs07Hz9vSl1JZfso4lXQMpLmgoR73xDSLaqwW38lAigA8XBqGDQtGwc7147RLfP5
         WviBkSyByFNk9XSt86mULoHUzP8AjLY27rP2TOor0tb7mhMjrlERKjvwD91dfOjbcx67
         kalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740399328; x=1741004128;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOWK+ThY516lMh047e8qidZAr1KsboApKQXs49+vyHs=;
        b=QsGhcHlgPW4O1gM5omyuCXsrjS+XDWMtZa1JU9BrCBCtT5eZdZo9v91MSTKntTomta
         dq119SFrEURleHbwYOjoUzmmwhsiLA0+H2h98iBL5hGmAbuy/ElCTiFBT6QpQY6bu5z3
         Ai6LZvRxcWelMiRn/aOn7uGFRnj54oqQm5mz9BTH+a1b0kfsfrIvqTR9f/4+zh5N646T
         i2irhOTONNUUC6Uu+dwQdj13syMsrddHtKJrs2yEwB91Pf21HVHCXOiu5WzDuxdt+/EU
         q3uDhzUzu0k2Re24GDGcslda0MU8thmfBqqYllxjRowuno8Wj3PHyj15W9mWe87lPHgV
         hqzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnGYmtzuDZYhb298XZLTqbaI0if3rhD9yk63JRzL5vCOGypmC+PfglzpyFlbS78mWgr+RcfoeacIpRG1pycizW@lists.infradead.org
X-Gm-Message-State: AOJu0YxxjGxPg5wpkxvljO/BO7tX1h6kga5Vf+rezH5IW+bi/Hujac7Y
	Gg6J1NYMkEkHSkEP/teKY6yaXB6HGFEL31a9izqTEjWPeS5Wh0ph18RCM9gEnJO98xIxIqo3AXR
	l7PsEnw38354kX463hg==
X-Google-Smtp-Source: AGHT+IFhLM25JrhF91PI/1xl0Ucx2pu2bGxwHFlKnZCcYx2J0q55kmjIHyBfWwosFL87FFfcYtOKkEve+OiYyvpF
X-Received: from wmbfk5.prod.google.com ([2002:a05:600c:cc5:b0:439:7c0b:a4c9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b08:b0:439:5da7:8e0 with SMTP id 5b1f17b1804b1-439ae1f30dbmr129078825e9.16.1740399328153;
 Mon, 24 Feb 2025 04:15:28 -0800 (PST)
Date: Mon, 24 Feb 2025 12:13:44 +0000
In-Reply-To: <20250224121353.98697-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250224121353.98697-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250224121353.98697-3-vdonnefort@google.com>
Subject: [PATCH 02/11] ring-buffer: Expose buffer_data_page material
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_041529_836053_0780AEAE 
X-CRM114-Status: GOOD (  13.32  )
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

In preparation for allowing the write of ring-buffer compliant pages
outside of ring_buffer.c, move to the header, struct buffer_data_page and
timestamp encoding functions into the publicly available ring_buffer.h.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index 2a1330a65edb..75cd0cb46768 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -3,8 +3,10 @@
 #define _LINUX_RING_BUFFER_H
 
 #include <linux/mm.h>
-#include <linux/seq_file.h>
 #include <linux/poll.h>
+#include <linux/seq_file.h>
+
+#include <asm/local.h>
 
 #include <uapi/linux/trace_mmap.h>
 
@@ -20,6 +22,8 @@ struct ring_buffer_event {
 	u32		array[];
 };
 
+#define RB_EVNT_HDR_SIZE (offsetof(struct ring_buffer_event, array))
+
 /**
  * enum ring_buffer_type - internal ring buffer types
  *
@@ -61,11 +65,50 @@ enum ring_buffer_type {
 	RINGBUF_TYPE_TIME_STAMP,
 };
 
+#define TS_SHIFT        27
+#define TS_MASK         ((1ULL << TS_SHIFT) - 1)
+#define TS_DELTA_TEST   (~TS_MASK)
+
+/*
+ * We need to fit the time_stamp delta into 27 bits.
+ */
+static inline bool test_time_stamp(u64 delta)
+{
+	return !!(delta & TS_DELTA_TEST);
+}
+
 unsigned ring_buffer_event_length(struct ring_buffer_event *event);
 void *ring_buffer_event_data(struct ring_buffer_event *event);
 u64 ring_buffer_event_time_stamp(struct trace_buffer *buffer,
 				 struct ring_buffer_event *event);
 
+#define BUF_PAGE_HDR_SIZE offsetof(struct buffer_data_page, data)
+
+/* Max payload is BUF_PAGE_SIZE - header (8bytes) */
+#define BUF_MAX_DATA_SIZE (BUF_PAGE_SIZE - (sizeof(u32) * 2))
+
+#define BUF_PAGE_SIZE (PAGE_SIZE - BUF_PAGE_HDR_SIZE)
+
+#define RB_ALIGNMENT		4U
+#define RB_MAX_SMALL_DATA	(RB_ALIGNMENT * RINGBUF_TYPE_DATA_TYPE_LEN_MAX)
+#define RB_EVNT_MIN_SIZE	8U	/* two 32bit words */
+
+#ifndef CONFIG_HAVE_64BIT_ALIGNED_ACCESS
+# define RB_FORCE_8BYTE_ALIGNMENT	0
+# define RB_ARCH_ALIGNMENT		RB_ALIGNMENT
+#else
+# define RB_FORCE_8BYTE_ALIGNMENT	1
+# define RB_ARCH_ALIGNMENT		8U
+#endif
+
+#define RB_ALIGN_DATA		__aligned(RB_ARCH_ALIGNMENT)
+
+struct buffer_data_page {
+	u64		 time_stamp;	/* page time stamp */
+	local_t		 commit;	/* write committed index */
+	unsigned char	 data[] RB_ALIGN_DATA;	/* data of buffer page */
+};
+
 /*
  * ring_buffer_discard_commit will remove an event that has not
  *   been committed yet. If this is used, then ring_buffer_unlock_commit
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index c27516a384a8..e70f39e0adb1 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -152,23 +152,6 @@ int ring_buffer_print_entry_header(struct trace_seq *s)
 /* Used for individual buffers (after the counter) */
 #define RB_BUFFER_OFF		(1 << 20)
 
-#define BUF_PAGE_HDR_SIZE offsetof(struct buffer_data_page, data)
-
-#define RB_EVNT_HDR_SIZE (offsetof(struct ring_buffer_event, array))
-#define RB_ALIGNMENT		4U
-#define RB_MAX_SMALL_DATA	(RB_ALIGNMENT * RINGBUF_TYPE_DATA_TYPE_LEN_MAX)
-#define RB_EVNT_MIN_SIZE	8U	/* two 32bit words */
-
-#ifndef CONFIG_HAVE_64BIT_ALIGNED_ACCESS
-# define RB_FORCE_8BYTE_ALIGNMENT	0
-# define RB_ARCH_ALIGNMENT		RB_ALIGNMENT
-#else
-# define RB_FORCE_8BYTE_ALIGNMENT	1
-# define RB_ARCH_ALIGNMENT		8U
-#endif
-
-#define RB_ALIGN_DATA		__aligned(RB_ARCH_ALIGNMENT)
-
 /* define RINGBUF_TYPE_DATA for 'case RINGBUF_TYPE_DATA:' */
 #define RINGBUF_TYPE_DATA 0 ... RINGBUF_TYPE_DATA_TYPE_LEN_MAX
 
@@ -311,10 +294,6 @@ EXPORT_SYMBOL_GPL(ring_buffer_event_data);
 #define for_each_online_buffer_cpu(buffer, cpu)		\
 	for_each_cpu_and(cpu, buffer->cpumask, cpu_online_mask)
 
-#define TS_SHIFT	27
-#define TS_MASK		((1ULL << TS_SHIFT) - 1)
-#define TS_DELTA_TEST	(~TS_MASK)
-
 static u64 rb_event_time_stamp(struct ring_buffer_event *event)
 {
 	u64 ts;
@@ -333,12 +312,6 @@ static u64 rb_event_time_stamp(struct ring_buffer_event *event)
 
 #define RB_MISSED_MASK		(3 << 30)
 
-struct buffer_data_page {
-	u64		 time_stamp;	/* page time stamp */
-	local_t		 commit;	/* write committed index */
-	unsigned char	 data[] RB_ALIGN_DATA;	/* data of buffer page */
-};
-
 struct buffer_data_read_page {
 	unsigned		order;	/* order of the page */
 	struct buffer_data_page	*data;	/* actual data, stored in this page */
@@ -397,14 +370,6 @@ static void free_buffer_page(struct buffer_page *bpage)
 	kfree(bpage);
 }
 
-/*
- * We need to fit the time_stamp delta into 27 bits.
- */
-static inline bool test_time_stamp(u64 delta)
-{
-	return !!(delta & TS_DELTA_TEST);
-}
-
 struct rb_irq_work {
 	struct irq_work			work;
 	wait_queue_head_t		waiters;
-- 
2.48.1.601.g30ceb7b040-goog


