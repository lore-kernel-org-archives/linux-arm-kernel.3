Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FB5D7976C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmv9pvVDnZ4go9IGE3NPxdNq415YebjgteYn5xFgp+s=; b=oCJheHc4g3Xh/0Jg1AK2kZfyyZ
	PCzMAIH6E8KnBSpL+Lg0c5EwmI9sXghEXvzX/p2Y+Y+88qVj0JZ0ugH7xxthqdPbYiUuQ1DjXisGS
	t/JW2QquSoiOxLkzRcKyPB/2t0M+WdXKatlmYJaao/duKAWaH76JtRtVOA/Ad4B9/Qqq6Spa0aryV
	2wgXtlX0LP3PU5iHskFIq3OFdhXEYRhmW0H8W0aaWOqlLMNudmFmLFzsQk3HLEwKnYEWVKkN4p/LP
	cXzuOLQzy2KddHv4+2XDNlmNqrk+yyyZFKDhSdMGkbJYG744Er5AdZ6ZsCqrrgohSn96jSqMtF7mw
	J1FGV/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2i-00000002c0a-4ANI;
	Sat, 31 Jan 2026 13:29:40 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2c-00000002bsy-1Yfu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:35 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b83c3dd2092so319720966b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866172; x=1770470972; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cmv9pvVDnZ4go9IGE3NPxdNq415YebjgteYn5xFgp+s=;
        b=MbFkkHYi6zvcHzjRzyf5Z05ZHXdFkgJaKreMjkxJnR3bDj6Rc4kv3bZoeuXeGInl5S
         /Nu5aFIiT9v8K2IE9FAibmnIG4ulRInM7f903q4EqAN9wudCND9OAnHCBY8R8XzPrPVD
         wYh6rWtTcXfdjLMRUwXN+92jS7DWtZpB3vKHE6hZg2LTcu3/oTF/5+0ToOYJphr7BBdE
         gugPhOU6z84J6FvidIlUmmrTFXm9ROG2jvsR/JineqDBmcZRCCnngVGx6qdI6Fblusi+
         SqPCykVSwTNTmhiCL9ByNc3te0stTKlVdoTE0vr0w+P8cPrA7VLAlLZuUxa2yVna+pvI
         2JMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866172; x=1770470972;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cmv9pvVDnZ4go9IGE3NPxdNq415YebjgteYn5xFgp+s=;
        b=PobZk45m+y46VoUTKEfI73jNhSrcXAQ7A6ZL4zsJBqo26N9g/88/w50TDtRoUzqY2H
         F5Bw3pcK4P1wVY4MdHz/jawKk8lAtdi6Jj0HjugIasPFCWoIpFbqvySsDXotP5VAc8k+
         hWtRA/W8DFpufUxKz+OZCfj+xe+t91bp1FWX6BD46U80QOeOo/MOMQI3OevSwXvgK5Vc
         ico0yvteq2nZVS5w+83ysBXydHAGaU8M6wPSXW09kmA1TA4NbCJukErAfn4pliMaBfzN
         Sg/deND8/Z7FgcA/Z5q+mtNV73F0Ecfbs0LajRJo4lfe0HShOguvE2upzbPsbbD77Dxo
         W9Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWtbR0RZpml5E61n9OGDvfHLi5tkKuZpq8h7OLRk2SDMvL7oVx/WzvA1L8TfQ1bljG/aNgtpObzcdB0u+BNXDsg@lists.infradead.org
X-Gm-Message-State: AOJu0YyD3aAq68aoLOCSJfGn/4eF4GN5efD5R+4AIiX4ZN6JIuGHIqPa
	yRNbx3v7IphixNmNFwpf729ZKfn+++483WPaBY7FSq0cVq7g4fuORT7QnoR13DN/Hx7m6upp833
	56oL200KI49eg0DUDrG1ziw==
X-Received: from ejpk1.prod.google.com ([2002:a17:906:66c1:b0:b84:4fbe:af3b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2d1f:b0:b87:efa:8786 with SMTP id a640c23a62f3a-b8dff6f7d99mr386552866b.55.1769866171645;
 Sat, 31 Jan 2026 05:29:31 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:29 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-12-vdonnefort@google.com>
Subject: [PATCH v11 11/30] tracing: Add helpers to create trace remote events
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
X-CRM114-CacheID: sfid-20260131_052934_445166_3B0610A1 
X-CRM114-Status: GOOD (  12.94  )
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
2.53.0.rc1.225.gd81095ad13-goog


