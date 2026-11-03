Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB3E606D801
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UDoJ/1j5;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ngOSM7GX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f/GjwPB9R1GefsC7sb/ZiS61uSaQkMOnfI2lEQvw+YY=; b=UDoJ/1j5VUsaua
	uFLK7RzpS1D5QFlyYK5k501gBII1qM/KLh9fR2cJEzE8XRUtap8KUdD9jbbi6E8zT58BiOMfkzXLz
	yxOD7KERuZsvK8lfCG+RvGAJf/Km3Budlod7t8HYvkqsqSrSC7cHwJZK0Ei3dpuz3csD0NWZnRDQT
	qagBuLob0x0eNGv+RuyNkIw3xUtj+1nWhpq4pFn1dwQ343JZ1WvcQVZEf2T0hdSN3qKf3yXIXsqaY
	5WG3Yu9Yh1KKjVJMxoVXevOjOxLuO7aS6Hl081s/p2CtrsjDUCiQjpOtw97zHKD+aRinxfxCs8I76
	kPxhgJ6CGHtjY8MQ4/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMuN-00000003pkk-1xXh;
	Tue, 03 Nov 2026 22:23:11 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMuJ-00000003piE-35Pc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 22:23:09 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-14394530ec6so176617c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 14:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793744587; x=1794349387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/GjwPB9R1GefsC7sb/ZiS61uSaQkMOnfI2lEQvw+YY=;
        b=ngOSM7GXe4/MTZcYYRs0c9EwsYAHs7edI8Z5+l5FvaI9h/twctKpMo6J0EJu47ZpNe
         mDbbs1IjEk8i6fJt3hcuhkTiwwH/xbavl5gQNtLcOzUE18HlnPSHI0l8Ir+t4ZBODZo8
         gAp0LYcT28Lo5fpkmYsvd7Z+USTkOrhHdU2pE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744587; x=1794349387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f/GjwPB9R1GefsC7sb/ZiS61uSaQkMOnfI2lEQvw+YY=;
        b=vcuaD0fjSZNPNaKs+LOfuYsPuD+gp4a6oJqDc/M9ZWhTk+Pj0xlcm76F/Fboq3+9f4
         gkFFfHY0a2zJIEXk1BiDEOFgcs+88h8tlEK72pbNtIwWSa/li3j7rqdAMJNRw6+lH4TA
         0j6en7vp6jZICtDhX6tjYse28TLnMC+vLHV061YJw03gsmGUNRaiyBhHNg+Fq2keQ7RH
         XaHuPc604ZeHYektTcKmIks1cl9r43QC+7Ts2vsh8+7yNx/rYYsGjlZtKu+25hJ+hrNM
         KdQn5U2GIxaZa/nTLugcGS7eX0D5VqZGgk+c2dsOOEkFdXAvcGUUX0GE/gDv1uwkvaM+
         gsMw==
X-Forwarded-Encrypted: i=1; AKwUvBxpSitEQvKNHb46W9H5KeheSgi1V/fgkUTmAyf+fFiinPY34tRb8ocuJQVpyGQkekfBFlY7rUtZJRByQG2xbspG@lists.infradead.org
X-Gm-Message-State: APuU4Z+4ANHnB0KDgD18T/YbcCiap8VYhzoLy5eYNu0sbovnG0MvE2Wn
	dquzws1ohQRQYfVs8CPhN6HlO3gL9Tm2AD1l7B7VwLavYet5b5N4kHo1bquxYz+0NA==
X-Gm-Gg: AYBFou0EnVBr+b4AYvnDZflC4rOCA6mDU7i+v4xtCndPL6NutD3gt5YwSxLL4IU1KN+
	JPhd48sSHLg329GG9WfHxhTURd/OlaIpUrgSqt4Aji2yUgairMYEL6jHBGnV5WUe3uMZEkwaARz
	vhgHMukrtGqyA7lUB3ea7EO+eN8VTbzovX3VTGHTSi/khcZvmXCKg99dUw9e0TWe/OrncyLRIeI
	1mKOmTWzesFRlLN3xPoBAh4If2rq05dWNJsiqyqsJDJC00BIwr5fnmIV7Cvh0ji+UKmcVTB4tkw
	Hd1H7ojwMnMIu0mlIrX7HHjHMBQmjk6xdBQaxtF3chDE9birJPJy8nNcP4EwqbSR0eHLNNqsgqP
	8+9RIt2VDPIbYIWfGyYwEMuUTYM9avkKuPAk6/MlsTcFhXEa5Q+V5t+eX2KWtya2hyhL9W/euh0
	ZTPdH8s23MXRZfcxGYcVpGHBNIH84vDXEbNMes2hwlmXgvnOHgkO6NageWk2JRn+iHpQfB+jcGg
	P8ZdlDbod4G8MVX8eZq/lvPuYcuuv5DBF9q9zq7jrAljYrZyQ580xuNK6G/Ers+sJpcHJmiauoK
	k5J8wh6DSuhQwwYxiET4yuqg3+AY5GD23RsPpjSPPE++Wuu1aDpdPeLn6/tsZWtpqhI6
X-Received: by 2002:a05:7022:7f17:b0:168:3243:c937 with SMTP id a92af1059eb24-1ac5cb1c8b3mr24793689c88.16.1793744586621;
        Tue, 03 Nov 2026 14:23:06 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36ca390df28sm1162364eec.18.2026.11.03.14.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:23:05 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 2/5] PM: runtime: Convert last_busy to atomic64_t
Date: Tue,  3 Nov 2026 14:14:40 -0800
Message-ID: <20261103141442.v2.2.I998d26c0d635b80496ad12daa33b8de602030eb6@changeid>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261103221717.3840215-1-briannorris@chromium.org>
References: <20261103221717.3840215-1-briannorris@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_142307_821182_A1AEF353 
X-CRM114-Status: GOOD (  15.09  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I want to use the atomic64 compare/exchange helpers. There are no
similar 32-bit-portable helpers for non-atomic64_t.

As a side effect, this also should avoid some minor load/store tearing
corner cases on 32-bit architectures.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Add <linux/atomic.h> to pm_runtime.h too

 drivers/base/power/runtime.c | 4 +++-
 include/linux/pm.h           | 3 ++-
 include/linux/pm_runtime.h   | 3 ++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 9d3508d9b4a2..2a117d6a776f 100644
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
index ae68a9dc7fc5..da537be94732 100644
--- a/include/linux/pm_runtime.h
+++ b/include/linux/pm_runtime.h
@@ -8,6 +8,7 @@
 #ifndef _LINUX_PM_RUNTIME_H
 #define _LINUX_PM_RUNTIME_H
 
+#include <linux/atomic.h>
 #include <linux/device.h>
 #include <linux/notifier.h>
 #include <linux/pm.h>
@@ -242,7 +243,7 @@ static inline bool pm_runtime_has_no_callbacks(struct device *dev)
  */
 static inline void pm_runtime_mark_last_busy(struct device *dev)
 {
-	WRITE_ONCE(dev->power.last_busy, ktime_get_mono_fast_ns());
+	atomic64_set(&dev->power.last_busy, ktime_get_mono_fast_ns());
 }
 
 /**
-- 
2.56.0.398.g882cbad275-goog


