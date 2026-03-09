Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA815F41807
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ik5Gwulkcj6xpLazaW4U87LROZJemTRhzFJsU5ExpD4=; b=GB00argK7AOmnftxEkcO2NB/z7
	LLpC77A3vGemjOdA7D5XuqwQWtsRpQ0xVID2W/7NJPgMVBeqmeaYBgLd+mYnzkq9PNv0CkUmv8fC/
	5YajhaZ/H+lM/7KNAqw9MsITjyhaEAsYs6hhNQ6veKI84gsLKH7DFJ8MAoV7xhuPMqT4eSqyh8xi/
	jxaGIGqQAynnDB+IaxiSx7kKhgJlmUhm3mby6cvu0y9P0bN5nw4B9T6XVLeeDWEH4WjTYGAGevJP8
	US8nyF3YGDW537mRAelKf5W5bYnitiLddJf2+dj42S3AbI3C1Gld65CwFLqHFMwuIcfzcX34hrPX+
	Sw7TFvOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdR3-00000007hFn-1yAD;
	Mon, 09 Mar 2026 16:26:25 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdQq-00000007gw5-3Oli
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:26:14 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-6612daf5e65so5498118a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773073571; x=1773678371; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ik5Gwulkcj6xpLazaW4U87LROZJemTRhzFJsU5ExpD4=;
        b=HQHCoNvZuzP12uaVTu6J9wOEOp0vaOH4qBvZHubMxc2vy4EBaZR2XCndKcBMifQijq
         OL7cJF0RsY+ITSgjXJ2dzhEiMKEaqImqccqxRkAfadgiTdpYNs7NXVsu2d2nT6DQrokC
         1ZG37CUyH15oQQIIsaEKclvKmk1g9VGPNLcD0SOVIBgrvGVe3CGaClXFByQ3f8d6ZNsS
         tg4pSokn1R0B/asyVgicFyElMDSRwbFHWgCrA6xkphyv3YMOKv0coIDoy+NffqL5ylW4
         bfOk6OeUyAZxDaldkVCBUjmw1l1oEPhNGBKs3OQw1vG5YCrQ+0lY/J1wXBMc1OOQwnOz
         Y0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073571; x=1773678371;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ik5Gwulkcj6xpLazaW4U87LROZJemTRhzFJsU5ExpD4=;
        b=D721scPE2wyA0x8IkUureDK0QgHukalZefSqmEr9UuyMLSJ8MWvb1s+c2daPT4hKpa
         /05kTUKoieStay3rvQtOqXSzykzjqJnZ0j3eLQLvlhf8mRA4kmeHwq7qijlwY3mfV3f/
         KyGHlwbgKMJSRtyXqBEhMAh9Wf3UP3MidsLD0nO8/izRysrkRUOaD973s7cOVTopvGHW
         tOZ8swP8kZ+fQ13/k2+unulrmJqEyrbZSwoWpStuEWliBM14+YQdt5zjQZs16XYRTEZ1
         XrKY+UpcLuaciJG06LCzetvznKWziPx2Q63kpSDFKnYMPsyG6iI8cX2xIopoVPi6yWOV
         1Lfw==
X-Forwarded-Encrypted: i=1; AJvYcCVrJTyMLrayZD6mJ/d9F8IJNc7ONW8cYTYxnX2GB3W/G0H/RUuWkR6PmZQurW/fHp1X5TZmvsMG6FOJl3Ujv3uP@lists.infradead.org
X-Gm-Message-State: AOJu0YyTircqNNKmZrQPW5G8nVNad1FB9xknjZWcx5KKCT+SQU/Ub6PU
	vzWUt5V8PngNna4WqZt9CEM6whqL6haoP94oVDAUgfYsccCXSXbqN0uljeuDfa0DkhWl35bfF0Y
	dBJZRYGhCgo79mvh5fOwePQ==
X-Received: from edxu25.prod.google.com ([2002:a05:6402:659:b0:661:2fe8:17bd])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1466:b0:661:7b69:b45 with SMTP id 4fb4d7f45d1cf-6619d4d4fc4mr6921428a12.13.1773073570997;
 Mon, 09 Mar 2026 09:26:10 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:24:57 +0000
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309162516.2623589-12-vdonnefort@google.com>
Subject: [PATCH v14 11/30] tracing: Add helpers to create trace remote events
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
X-CRM114-CacheID: sfid-20260309_092612_896560_8711C0E1 
X-CRM114-Status: GOOD (  13.65  )
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

Declaring remote events can be cumbersome let's add a set of macros to
simplify developers life. The declaration of a remote event is very
similar to kernel's events:

 REMOTE_EVENT(name, id,
     RE_STRUCT(
        re_field(u64 foo)
     ),
     RE_PRINTK("foo=%llu", __entry->foo)
 )

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/trace_remote_event.h b/include/linux/trace_remote_event.h
index a4449008a075..c8ae1e1f5e72 100644
--- a/include/linux/trace_remote_event.h
+++ b/include/linux/trace_remote_event.h
@@ -5,6 +5,7 @@
 
 struct trace_remote;
 struct trace_event_fields;
+struct trace_seq;
 
 struct remote_event_hdr {
 	unsigned short	id;
@@ -20,4 +21,13 @@ struct remote_event {
 	char				*print_fmt;
 	void				(*print)(void *evt, struct trace_seq *seq);
 };
+
+#define RE_STRUCT(__args...) __args
+#define re_field(__type, __field) __type __field;
+
+#define REMOTE_EVENT_FORMAT(__name, __struct)	\
+	struct remote_event_format_##__name {	\
+		struct remote_event_hdr hdr;	\
+		__struct			\
+	}
 #endif
diff --git a/include/trace/define_remote_events.h b/include/trace/define_remote_events.h
new file mode 100644
index 000000000000..676e803dc144
--- /dev/null
+++ b/include/trace/define_remote_events.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/trace_events.h>
+#include <linux/trace_remote_event.h>
+#include <linux/trace_seq.h>
+#include <linux/stringify.h>
+
+#define REMOTE_EVENT_INCLUDE(__file) __stringify(../../__file)
+
+#ifdef REMOTE_EVENT_SECTION
+# define __REMOTE_EVENT_SECTION(__name) __used __section(REMOTE_EVENT_SECTION"."#__name)
+#else
+# define __REMOTE_EVENT_SECTION(__name)
+#endif
+
+#define REMOTE_PRINTK_COUNT_ARGS(__args...) \
+	__COUNT_ARGS(, ##__args, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0)
+
+#define __remote_printk0()								\
+	trace_seq_putc(seq, '\n')
+
+#define __remote_printk1(__fmt)								\
+	trace_seq_puts(seq, " " __fmt "\n")						\
+
+#define __remote_printk2(__fmt, __args...)						\
+do {											\
+	trace_seq_putc(seq, ' ');							\
+	trace_seq_printf(seq, __fmt, __args);						\
+	trace_seq_putc(seq, '\n');							\
+} while (0)
+
+/* Apply the appropriate trace_seq sequence according to the number of arguments */
+#define remote_printk(__args...)							\
+	CONCATENATE(__remote_printk, REMOTE_PRINTK_COUNT_ARGS(__args))(__args)
+
+#define RE_PRINTK(__args...) __args
+
+#define REMOTE_EVENT(__name, __id, __struct, __printk)					\
+	REMOTE_EVENT_FORMAT(__name, __struct);						\
+	static void remote_event_print_##__name(void *evt, struct trace_seq *seq)	\
+	{										\
+		struct remote_event_format_##__name __maybe_unused *__entry = evt;	\
+		trace_seq_puts(seq, #__name);						\
+		remote_printk(__printk);						\
+	}
+#include REMOTE_EVENT_INCLUDE(REMOTE_EVENT_INCLUDE_FILE)
+
+#undef REMOTE_EVENT
+#undef RE_PRINTK
+#undef re_field
+#define re_field(__type, __field)							\
+	{										\
+		.type = #__type, .name = #__field,					\
+		.size = sizeof(__type), .align = __alignof__(__type),			\
+		.is_signed = is_signed_type(__type),					\
+	},
+#define __entry REC
+#define RE_PRINTK(__fmt, __args...) "\"" __fmt "\", " __stringify(__args)
+#define REMOTE_EVENT(__name, __id, __struct, __printk)					\
+	static struct trace_event_fields remote_event_fields_##__name[] = {		\
+		__struct								\
+		{}									\
+	};										\
+	static char remote_event_print_fmt_##__name[] = __printk;			\
+	static struct remote_event __REMOTE_EVENT_SECTION(__name)			\
+	remote_event_##__name = {							\
+		.name		= #__name,						\
+		.id		= __id,							\
+		.fields		= remote_event_fields_##__name,				\
+		.print_fmt	= remote_event_print_fmt_##__name,			\
+		.print		= remote_event_print_##__name,				\
+	}
+#include REMOTE_EVENT_INCLUDE(REMOTE_EVENT_INCLUDE_FILE)
-- 
2.53.0.473.g4a7958ca14-goog


