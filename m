Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2FBF4180F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6OW0CQFlfUo8gIs8zWJuy/R7hSbmdzTUEKNvWrAy54=; b=fxlW9twuA22gK6pZ4AftroMTnt
	2/fhJaSPSk+x9iVM82+wrtTof9m0Mu/YWGfq868EuzayCbbniLxoFJXuWTx7Qde/zRvpPinJxPxgh
	DJtV6orEtwCZLsrmplgZmmAYihbRZ8NSq7lC6GGaHegSh+sEAmyOO1J/1XeZRgow35aobJ5nuIUi3
	ary+3arZyQq4CJKN8X1BDhsWNy5PAhY4e6/RyxQjk2FFHdVFWOrecr69Gk1dtE5MZ0bTsRSM3mlaD
	R/U+iEds/1plFSO3q3M0Chip7ARCEHo5hTrpyN7bO7hlYzRgCNjsr80S1tU6ZqIQqbku0gNHfzWNl
	6Pto4eow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdRD-00000007hTN-2LyU;
	Mon, 09 Mar 2026 16:26:35 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdQw-00000007h4c-2R4E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:26:19 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4853f33b7dbso6725395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773073577; x=1773678377; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B6OW0CQFlfUo8gIs8zWJuy/R7hSbmdzTUEKNvWrAy54=;
        b=0GM25bilnxKuMysBa6IWIiQwooe1Rfhu/KXDZGn2k1tGpt3+NsQorDDTFeOChTxkFR
         SDAxmggpmyvMFQ1Cu+t/cW9Eutg6JoUcgAT66aAyyAqworY2ohvQxUjthva6RmDfiy+L
         fNfEjhVIi3yxeDW687c8byLd8Y8MM7h7Wm1wc2uf3wU/1q+RR5IT9hsLnUkDynPZyohA
         +/YIxwjDGx7YrYTzz2BNA3Uk2zJelwh/KBLgIM2LnYJ9CyfvYZxXaghQAhWfPbIjyW/I
         IMICwziXWbmSZYgfyrTPvMMO4/WCvrfPmqO0xGEcu07tgCo8gNsCcTC3f7vE9fZADepI
         O5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073577; x=1773678377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6OW0CQFlfUo8gIs8zWJuy/R7hSbmdzTUEKNvWrAy54=;
        b=get8g7JKAiiV6ASydDbRwnmWb40s35rwgjJM9YuEcfhN5E4KHpj1vNeIKW7dSF8YDa
         bRdEPfppOn60UXN6eMkYRuPo9uKix12Dtz+BmgEHrobjYMPJr2HlLejFbIWmezkkIfRx
         5Eol+LYSO9UZziuyapA4oArWzVignTpNIZdxwb7EInbF02z5rRw7qUZLoJQkixlqsBvz
         1I1gdVOiSUq9tPS3KXyRv27AICnG+7mKyGUCRkyHO57lt31+TQvcpF0K8rJhMMeOuvRQ
         ed7XI+sfRLFFFkYUchwYbEIEVFY//ITwOpvPngkIT5/++j1HeBypet+ETqNbAWj0rlE/
         JXwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzph0ewskWLEN0jut1/VDSjBcksBvB5E7Wa8m77VIm4UyLmF8uaicpre0qclQlJMdRU4hFPtHyZOLeciSo/9BF@lists.infradead.org
X-Gm-Message-State: AOJu0YxCfVl/5sFpA/RzBSno+3o/FfM5I7qaRS5PzJPXo/EFLW41u6zR
	ArOJQAmGXe9ec4uEwuS5j7oCjNjL5WNG8gO6p0rdu1yc02eWeyFWE0tKXl+Luzwe4EesFPcj9WF
	3e4cP3UkwHeKfg4wtAvh2TA==
X-Received: from wmmr21.prod.google.com ([2002:a05:600c:4255:b0:485:35d3:c8b9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d0b:b0:485:4136:99a8 with SMTP id 5b1f17b1804b1-48541369c0cmr13223965e9.22.1773073576611;
 Mon, 09 Mar 2026 09:26:16 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:25:02 +0000
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309162516.2623589-17-vdonnefort@google.com>
Subject: [PATCH v14 16/30] Documentation: tracing: Add tracing remotes
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
X-CRM114-CacheID: sfid-20260309_092618_634984_6E339DA2 
X-CRM114-Status: GOOD (  17.81  )
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

Add documentation about the newly introduced tracing remotes framework.

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/Documentation/trace/index.rst b/Documentation/trace/index.rst
index 338bc4d7cfab..036db96864d2 100644
--- a/Documentation/trace/index.rst
+++ b/Documentation/trace/index.rst
@@ -91,6 +91,17 @@ interactions.
    user_events
    uprobetracer
 
+Remote Tracing
+--------------
+
+This section covers the framework to read compatible ring-buffers, written by
+entities outside of the kernel (most likely firmware or hypervisor)
+
+.. toctree::
+   :maxdepth: 1
+
+   remotes
+
 Additional Resources
 --------------------
 
diff --git a/Documentation/trace/remotes.rst b/Documentation/trace/remotes.rst
new file mode 100644
index 000000000000..1f9d764f69aa
--- /dev/null
+++ b/Documentation/trace/remotes.rst
@@ -0,0 +1,66 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============
+Tracing Remotes
+===============
+
+:Author: Vincent Donnefort <vdonnefort@google.com>
+
+Overview
+========
+Firmware and hypervisors are black boxes to the kernel. Having a way to see what
+they are doing can be useful to debug both. This is where remote tracing buffers
+come in. A remote tracing buffer is a ring buffer executed by the firmware or
+hypervisor into memory that is memory mapped to the host kernel. This is similar
+to how user space memory maps the kernel ring buffer but in this case the kernel
+is acting like user space and the firmware or hypervisor is the "kernel" side.
+With a trace remote ring buffer, the firmware and hypervisor can record events
+for which the host kernel can see and expose to user space.
+
+Register a remote
+=================
+A remote must provide a set of callbacks `struct trace_remote_callbacks` whom
+description can be found below. Those callbacks allows Tracefs to enable and
+disable tracing and events, to load and unload a tracing buffer (a set of
+ring-buffers) and to swap a reader page with the head page, which enables
+consuming reading.
+
+.. kernel-doc:: include/linux/trace_remote.h
+
+Once registered, an instance will appear for this remote in the Tracefs
+directory **remotes/**. Buffers can then be read using the usual Tracefs files
+**trace_pipe** and **trace**.
+
+Declare a remote event
+======================
+Macros are provided to ease the declaration of remote events, in a similar
+fashion to in-kernel events. A declaration must provide an ID, a description of
+the event arguments and how to print the event:
+
+.. code-block:: c
+
+	REMOTE_EVENT(foo, EVENT_FOO_ID,
+		RE_STRUCT(
+			re_field(u64, bar)
+		),
+		RE_PRINTK("bar=%lld", __entry->bar)
+	);
+
+Then those events must be declared in a C file with the following:
+
+.. code-block:: c
+
+	#define REMOTE_EVENT_INCLUDE_FILE foo_events.h
+	#include <trace/define_remote_events.h>
+
+This will provide a `struct remote_event remote_event_foo` that can be given to
+`trace_remote_register`.
+
+Registered events appear in the remote directory under **events/**.
+
+Simple ring-buffer
+==================
+A simple implementation for a ring-buffer writer can be found in
+kernel/trace/simple_ring_buffer.c.
+
+.. kernel-doc:: include/linux/simple_ring_buffer.h
-- 
2.53.0.473.g4a7958ca14-goog


