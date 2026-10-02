Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7464CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 23:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cj31ExEyFV3PoRNZbMP+vqda3AvxSrb2+xWS+DVF+S4=; b=Shuyeq65k4XXZ3Eqs4nVIPOxpf
	c74gYfV+/HvJy2WzgTZWVF+ZgLhk2VoOwWcvceXWP8sHZRTxkPxr1i8w5c28ErhGKLQXe/gM2s99R
	kcbE5CRwu090BZ5YN5cmEn8j7BTadQy3sk/6++cDs8ntmAQ7rJG0ULVxZRrTWPqqqF96Gag6ocigV
	YssD81W8HIVnHhbbgJGsM00FVgED8eM+M0oFOlkrOmYiZMQr0JXKrwvjrBnDcEZD/gS8vKu70Ltr9
	do0jdXe8EBc6XXAEgNbY5dD8Vtm7Gek+YO05tt1qGq50+npsJgFXl01lO9OWRUKlESCNa0DRYUQNY
	2OR/Oe6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmLe-0000000CfMo-3DHK;
	Fri, 02 Oct 2026 23:07:26 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmLc-0000000CfKv-1gUk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 23:07:26 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-33fb4680717so300184eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 16:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790982443; x=1791587243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cj31ExEyFV3PoRNZbMP+vqda3AvxSrb2+xWS+DVF+S4=;
        b=Ks6XWHDOYi50P1uhYoq3gYdlkQQtdfa2wNiz5yHtwhkOgpnAYQ4Ri6p/gAvUq17JRU
         w2p4pdmOk2v5miz9gEApfUsPufLFFw4usDq0D7LfjGGIk1BXIrEyu2Zw2+idJFaPQJqP
         vEJL2PjSbQIerGd8YnjWGOVwlX3cTMEIdtniw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790982443; x=1791587243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cj31ExEyFV3PoRNZbMP+vqda3AvxSrb2+xWS+DVF+S4=;
        b=CnRIw24AY9STOyN8KZqmgctmbyo1jZoYVLMYgyqn7GuQJpAsad0uYmnL+/g0yCzW4M
         asPVnI493XSXxIvtdJSaEMpe666YQjEFseSPzT3N594HBsinJKP8u5dBXfwhRYrJMhzH
         WJBOdbliAxR4zU0Pgitb9AQKc82fh1rTRP5WOf6xJ0W2hhFFtqMJtDFef8jt+bBXh6+t
         b6IkL2onMJ6VvwwEEgQyGrN0eb5igQWXUTtozAMe2bXCdNFk7lgQuS7XCw1dEgzLShQg
         uothnDOt58uZ9a5A8DSApTjRhGSd/EnDhG0+ivZh9h/RlMkkjkdqsSiytYGUyuviZqJe
         u0mw==
X-Forwarded-Encrypted: i=1; AKwUvBz2vAJKBv/D9d7aqhwL/DJ5c4FyChaDoDaesK7yG37PCeSbvzFoPyzLFBmSpoN/cBC2uAM4IzMDEz9rAXbN6/PI@lists.infradead.org
X-Gm-Message-State: AFq9FYL9NrfXu+HvscmyE9xZQyLX/KH9W3kHvfZdvTbaLzh5fAHhIiwR
	BA5Bkcy/yuwTtoFWmMJceYa7+t1+LrJvKL9jrmWhbGlIoi1iaYNnrP327syI4GPnDQ==
X-Gm-Gg: AYBFou1+WW82RiyaBWFey7NIWL73/X5eZste74eeOf4j+B7/OIpoyaJktr4AHtEErQr
	K/EuQrzhNcKkCvmUFTzzLS/ZKEVgFaBXfTZNQc10wJktAt34ehLjJqfD6tEMPCmYPz0KUrEwQj5
	+PqQStpScGuN5UDfVtzTVcd+Ns59cNKaoIw/551VhYHSJh9qAwP5UuqnbpBVplg0kZZIxk7XhAl
	P2W+9HJUcQ4KwexK8G+trF0Oge9qdgbTTkYmW1W0uaBmt92qsQ6IsG1c/nWrqRsv+ZZXyC5FXFt
	WuWhUQUYNx3k43ax8uzToypHAcliBz1XWBS6ituMmAPZJIjMOuj/Tm/enB5+NSnCUELeb2MJnA+
	tQo9eaY6pHHCNndGf9xMcwW21SEuLJ5rs0DnEPgeBX8zyDSRPJUz/2df46OMYjqqhwsxzbU4dvf
	2vq9YlKScm3jmriv7vcf6ocDhFMv+Z8Wp54w42Uwzie6Y7NpAp/nW6DoEyaFpHoiTUJscwUZfCI
	mzi9f3GpDZjxYNBEuAeJPriQV99R9VDX5z79Q==
X-Received: by 2002:a05:693c:41c7:10b0:351:13b4:9c59 with SMTP id 5a478bee46e88-35113b49cb0mr571453eec.2.1790982443465;
        Fri, 02 Oct 2026 16:07:23 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b0dc:e72e:e96b:3323])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-34f0672c2d1sm12058791eec.4.2026.10.02.16.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 16:07:22 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-arm-kernel@lists.infradead.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 2/5] PM: runtime: Convert last_busy to atomic64_t
Date: Fri,  2 Oct 2026 16:03:06 -0700
Message-ID: <20261002160309.2.I998d26c0d635b80496ad12daa33b8de602030eb6@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261002230714.507921-1-briannorris@chromium.org>
References: <20261002230714.507921-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_160724_441805_40F8A37B 
X-CRM114-Status: GOOD (  16.08  )
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

I want to use the atomic64 compare/exchange helpers. There are no
similar 32-bit-portable helpers for non-atomic64_t.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This conflicts with some pending work I have here:

  [PATCH 2/5] PM: runtime: Avoid racy clock checks for autosuspend-retry
  https://lore.kernel.org/all/20260929114714.2.Id0a3276d23d30e0b5fd4d6dca730be0f9d8fe018@changeid/

It shouldn't be much trouble for me to rework one of the two, pending
feedback on whether my approaches are acceptable.

 drivers/base/power/runtime.c | 4 +++-
 include/linux/pm.h           | 3 ++-
 include/linux/pm_runtime.h   | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index e70726b499e7..9eed1f79429d 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -5,6 +5,8 @@
  * Copyright (c) 2009 Rafael J. Wysocki <rjw@sisk.pl>, Novell Inc.
  * Copyright (C) 2010 Alan Stern <stern@rowland.harvard.edu>
  */
+
+#include <linux/atomic.h>
 #include <linux/sched/mm.h>
 #include <linux/ktime.h>
 #include <linux/hrtimer.h>
@@ -186,7 +188,7 @@ u64 pm_runtime_autosuspend_expiration(struct device *dev)
 	if (autosuspend_delay < 0)
 		return 0;
 
-	expires  = READ_ONCE(dev->power.last_busy);
+	expires = atomic64_read(&dev->power.last_busy);
 	expires += (u64)autosuspend_delay * NSEC_PER_MSEC;
 	if (expires > ktime_get_mono_fast_ns())
 		return expires;	/* Expires in the future */
diff --git a/include/linux/pm.h b/include/linux/pm.h
index ef3f1310e749..531e46ff878e 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -8,6 +8,7 @@
 #ifndef _LINUX_PM_H
 #define _LINUX_PM_H
 
+#include <linux/atomic.h>
 #include <linux/completion.h>
 #include <linux/export.h>
 #include <linux/hrtimer_types.h>
@@ -812,7 +813,7 @@ struct dev_pm_info {
 	enum rpm_status		last_status;
 	int			runtime_error;
 	int			autosuspend_delay;
-	u64			last_busy;
+	atomic64_t		last_busy;
 	u64			active_time;
 	u64			suspended_time;
 	u64			accounting_timestamp;
diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
index 322e3b17f987..289fa72c0af7 100644
--- a/include/linux/pm_runtime.h
+++ b/include/linux/pm_runtime.h
@@ -242,7 +242,7 @@ static inline bool pm_runtime_has_no_callbacks(struct device *dev)
  */
 static inline void pm_runtime_mark_last_busy(struct device *dev)
 {
-	WRITE_ONCE(dev->power.last_busy, ktime_get_mono_fast_ns());
+	atomic64_set(&dev->power.last_busy, ktime_get_mono_fast_ns());
 }
 
 /**
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


