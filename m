Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424B7CF65D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OmHJweSyCaZn58+xoi2Pzi5D+f/3kb8/kFIARNGu9Y=; b=PaDErCeWevp2vZu4/E4VSnm2/C
	SJJBeE74mbb/wXjcxw273AbEdpDgI9ofJs56yem2dhHLulDXkT0IskqOI9aaZssgqHbl7/IlTp8eC
	+eEt3Rn64xQhKup8cGLL47IIN7l//7YhHvcZWZdKItkxQGY3vgOJoz2J6/z4ecGbw+PJ/W4LPhiA8
	HAIZvALeMneX+vKGnN7bSBMpEFpipQEqAAZlAMBWJYnFInCF2DJ5kpwTgLLLHShN0G5C3u22lxEhY
	lTWdJzDyoHT+6PBY6dG5jGxYo614K+JzTlAJLnkzBaRNifrkiFJNYOZiYC5ddRAXUOZH6zyZdj3gY
	JPnJguyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5I-0000000CJST-42jV;
	Mon, 26 Jan 2026 10:44:40 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5A-0000000CJK9-2i5L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:33 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b8749dd495dso353596366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424270; x=1770029070; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7OmHJweSyCaZn58+xoi2Pzi5D+f/3kb8/kFIARNGu9Y=;
        b=SPcC9HFci4mry+/rx0zKdcP4ZcWP42zaMRKsOpWD66XlyZCiaWwfMYexcgXlf5wAiT
         WhDQ/jUUGAonNuK5tOunfztV5kP5ri7LZq/x6Ocgxczld48lSfb1OeAtxbF1z+8PLLOs
         0bjbjORsTcFeT+yo+ThV0pnemdY3FI0rmamdrU31vd3ctbaVJo0l35ZjoBjTFQEt0It3
         neVGmB6mTTy4jF3X9U40tI17cIfjghTPCTv3H/yOE6cnjWZpKvY6JG7SzTHGk/iJEztX
         87DC8XgpjArgsj1Iev14XZRtsxNVlNrUt92Z4MOIT9rptXla+GxFIKEeN+jCcX3guqeL
         gvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424270; x=1770029070;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7OmHJweSyCaZn58+xoi2Pzi5D+f/3kb8/kFIARNGu9Y=;
        b=JWgdos8GXKSgWBCTV79lvytmdPzbAbfUNogMvTSCC7uAFS6+fCBzgxCjwyl2rVqWUb
         VMox+Hm+nVBBsZrwx5IIYKXCBWrJ8LxLKaFnBoFXDbHhkxy3ICFWE8yZVhvrpGyU2fQy
         9JO3kW3is697XIvaocgmlCrE+JY3fnwK3Oy0HW7V0jgxys2jd+y0muCwwsRPRxnuoN1W
         6etH7K9+WifNgUKoa9PRD7Vuxm2SGRDpOjM+8SwevLuvNF3JZDEweUz4mEDtoVppTkHE
         XoPkYZseqVwzIuXyiC5VUtSR/j69FXwAwcbkNAyJlyfWiRgn7t98soc33fKbm7DBe5G1
         8EMA==
X-Forwarded-Encrypted: i=1; AJvYcCXrwEdbrJxBwg+pzcOTWHGHqaMDFaeOD/E8Am36CJzqdQs8cMEczB6TaRBmnLhaQD7VIWaCvvH3m+R2UftJZIoR@lists.infradead.org
X-Gm-Message-State: AOJu0YyPd7HwAwFHoonZgC2K1YYqsoMOdEy8GpyIphAZk1b4zpsOIUsx
	XlALnbDSz12LE+gIcTA3BZsZDpEZE99Xk09M1c39Y38HC88qVTU/Sa4anmVRO5b3ouc4oRpERs4
	NRz40QP2vjzbXelC7t960PQ==
X-Received: from ejbgc18.prod.google.com ([2002:a17:906:c8d2:b0:b88:4972:40aa])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c10:b0:b73:4d06:bc8 with SMTP id a640c23a62f3a-b8d4f796f90mr289787966b.53.1769424270027;
 Mon, 26 Jan 2026 02:44:30 -0800 (PST)
Date: Mon, 26 Jan 2026 10:43:53 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-5-vdonnefort@google.com>
Subject: [PATCH v10 04/30] ring-buffer: Add non-consuming read for ring-buffer remotes
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_024432_699904_B6CF1658 
X-CRM114-Status: GOOD (  14.22  )
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

Hopefully, the remote will only swap pages on the kernel instruction (via
the swap_reader_page() callback). This means we know at what point the
ring-buffer geometry has changed. It is therefore possible to rearrange
the kernel view of that ring-buffer to allow non-consuming read.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 00754339733d..2d08dd326309 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5365,10 +5365,51 @@ static bool rb_read_remote_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 	return rb_num_of_entries(cpu_buffer);
 }
 
+static void rb_update_remote_head(struct ring_buffer_per_cpu *cpu_buffer)
+{
+	struct buffer_page *next, *orig;
+	int retry = 3;
+
+	orig = next = cpu_buffer->head_page;
+	rb_inc_page(&next);
+
+	/* Run after the writer */
+	while (cpu_buffer->head_page->page->time_stamp > next->page->time_stamp) {
+		rb_inc_page(&next);
+
+		rb_list_head_clear(cpu_buffer->head_page->list.prev);
+		rb_inc_page(&cpu_buffer->head_page);
+		rb_set_list_to_head(cpu_buffer->head_page->list.prev);
+
+		if (cpu_buffer->head_page == orig) {
+			if (WARN_ON_ONCE(!(--retry)))
+				return;
+		}
+	}
+
+	orig = cpu_buffer->commit_page = cpu_buffer->head_page;
+	retry = 3;
+
+	while (cpu_buffer->commit_page->page->time_stamp < next->page->time_stamp) {
+		rb_inc_page(&next);
+		rb_inc_page(&cpu_buffer->commit_page);
+
+		if (cpu_buffer->commit_page == orig) {
+			if (WARN_ON_ONCE(!(--retry)))
+				return;
+		}
+	}
+}
+
 static void rb_iter_reset(struct ring_buffer_iter *iter)
 {
 	struct ring_buffer_per_cpu *cpu_buffer = iter->cpu_buffer;
 
+	if (cpu_buffer->remote) {
+		rb_read_remote_meta_page(cpu_buffer);
+		rb_update_remote_head(cpu_buffer);
+	}
+
 	/* Iterator usage is expected to have record disabled */
 	iter->head_page = cpu_buffer->reader_page;
 	iter->head = cpu_buffer->reader_page->read;
@@ -5521,7 +5562,7 @@ rb_update_iter_read_stamp(struct ring_buffer_iter *iter,
 static struct buffer_page *
 __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 {
-	struct buffer_page *new_reader, *prev_reader;
+	struct buffer_page *new_reader, *prev_reader, *prev_head, *new_head, *last;
 
 	if (!rb_read_remote_meta_page(cpu_buffer))
 		return NULL;
@@ -5545,10 +5586,32 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 
 	WARN_ON_ONCE(prev_reader == new_reader);
 
-	cpu_buffer->reader_page->page = new_reader->page;
-	cpu_buffer->reader_page->id = new_reader->id;
-	cpu_buffer->reader_page->read = 0;
-	cpu_buffer->read_stamp = cpu_buffer->reader_page->page->time_stamp;
+	prev_head = new_reader;  /* New reader was also the previous head */
+	new_head = prev_head;
+	rb_inc_page(&new_head);
+	last = prev_head;
+	rb_dec_page(&last);
+
+	/* Clear the old HEAD flag */
+	rb_list_head_clear(cpu_buffer->head_page->list.prev);
+
+	prev_reader->list.next = prev_head->list.next;
+	prev_reader->list.prev = prev_head->list.prev;
+
+	/* Swap prev_reader with new_reader */
+	last->list.next = &prev_reader->list;
+	new_head->list.prev = &prev_reader->list;
+
+	new_reader->list.prev = &new_reader->list;
+	new_reader->list.next = &new_head->list;
+
+	/* Reactivate the HEAD flag */
+	rb_set_list_to_head(&last->list);
+
+	cpu_buffer->head_page = new_head;
+	cpu_buffer->reader_page = new_reader;
+	cpu_buffer->pages = &new_head->list;
+	cpu_buffer->read_stamp = new_reader->page->time_stamp;
 	cpu_buffer->lost_events = cpu_buffer->meta_page->reader.lost_events;
 
 	return rb_page_size(cpu_buffer->reader_page) ? cpu_buffer->reader_page : NULL;
@@ -6132,7 +6195,7 @@ ring_buffer_read_start(struct trace_buffer *buffer, int cpu, gfp_t flags)
 	struct ring_buffer_per_cpu *cpu_buffer;
 	struct ring_buffer_iter *iter;
 
-	if (!cpumask_test_cpu(cpu, buffer->cpumask) || buffer->remote)
+	if (!cpumask_test_cpu(cpu, buffer->cpumask))
 		return NULL;
 
 	iter = kzalloc(sizeof(*iter), flags);
-- 
2.52.0.457.g6b5491de43-goog


