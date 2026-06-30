Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F5DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xeeQssBNTO3J1bvVWzkGkdk1huJO9dqSXxjEfYbBfis=; b=NQhF/ev8GpaN4gdYFDDTtbQNsA
	RoEzipmSLgOJz9y8Zwzf9KMaH7qjSoYLoEXCaDEcukxYlbi6UG1pqWHg7+8gqqSB62fbe1UM92oBD
	zDdoXUcZ+aKWXjNaQHAvhLG+lvFG2LJgjf/IvtFUJysG2erwZktT44gp0flQRKoNWVOrL4bfR1Puk
	bMFb9j6bixPaH3lADs/yu+o9Iqdy3Ypm0MrjladKx+ynB3xCldfo5Q4HCVradtEbNGh+l//4PhGa/
	QdtTSkUtM91qYndrOCpT4jpSqGsdi0q04c3z5VR5T2sUXxslLzaxp3uXVytFHMabx97/8DB8YTMWb
	D+bbhwcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webS4-0000000HU6t-2rNv;
	Tue, 30 Jun 2026 16:36:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webRU-0000000HTpO-2hyC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:36:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so39797145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 09:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1782837371; x=1783442171; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xeeQssBNTO3J1bvVWzkGkdk1huJO9dqSXxjEfYbBfis=;
        b=kPAVpAzGEje6+iuk2EZl95aq2N+gw5eEEWD+gHAQ8KeI/AxabwMUy2g2ws7iVGlwG0
         PxNCzDNltr6pOQ7ekY0zjJ7W3XQPBcno3a87ct1/5uxaZVcx7mcP0fqmrSyAw82uH/ZQ
         UT5QmaKVW7DDfRAoTnEgaarmwEE86aYRxB8SJ6Nb30zcxcJ8HF1wIf+ReaI0hDAvUyGk
         Wj7aY/5oMwgnDTJE84EYQzRJuVa3C53gYDkxCpdlS387WlFkID5M8iCuQn5JE5stVjV/
         pHNxDvqzJXDeF9ilhNi3PSlnaf/5cDNaJ/rlrLxSWScy39u8fuSXQCti65P9lW45fju+
         sZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782837371; x=1783442171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xeeQssBNTO3J1bvVWzkGkdk1huJO9dqSXxjEfYbBfis=;
        b=MSdh5DiX0Jd7pHrdZXSC2V/rrmWBs8NZMNkOcSGZ0F0Wf8T6FaxXMC7FfF0a3Cxnsl
         ThazCPVgHgVKPfn3TGuHRrLWqq/tNLxZsN8KwDxEo2hcykt/Xa8tvDY09VrEk4ZnoNMs
         2SPAMda1uhOsmFDqEjfpuBNpdmHOXRDuUE/NdTIc8ECVnIgdvcPlni2xiYxrI1DbAL9D
         8cVxK19Z4+2j788wkcc++Sjwx2wlB8fmq8irQFdIHlH3NAdfTIdVt+ngkOzLF/mTbZHW
         h5XemEDydLVjrNNW9CNLD0BWPg0BMtThorgNbQOkauPeUMlCUyqcPJFOqseIieJ3bn61
         SVMg==
X-Forwarded-Encrypted: i=1; AFNElJ+EoaQFiJKGyjWRl83Ge5iXgxoVti2wii1xjoEHexH8OwLJkuKTIEEmj5D0mFvd+Bs38eRy+EO87u0WGHppw8ct@lists.infradead.org
X-Gm-Message-State: AOJu0YwjdJyitAh33iFL/gidvvB2LF2Gw/PZXIVA5xWknSORVpq25RRN
	kKAg/d0nnQpZqeoaSVmChLDa6vdx7YEsQRICCwHMjmmRJL0yhrEkNh39C0+Lo1kngRo=
X-Gm-Gg: AfdE7cn7aIXPSAKjsmgn6KvKkgiwvYGoCj0pRpan2ePw1XKBaZNrdKvQncjoTpIRCBM
	PxMmOE7GwKPw7nNjM4cwO0OTazT17Zh+5TFdKGyWxg+oEZNwHzhB8637qjPzqp9LC3aCawIBFEY
	gIjODy4iaHUFnx9uUgNf3VszoZyY+QjtSI0gJ5Ir9euUpwdTMI+IUSewhnXfz8BafDqLFjKO3gw
	p9NVhOpV+gasvGWIYe6zlQGFkDmlPgnfHWw2xUgAaDw1Msinlo99+uC8oERqZIZ09kXsPJNG6+F
	3sDIB0NkZYwkUXy+Zb+myJoKcRX7QPUGfiJI41HdnRjCmwBhCzOeEMObVYKz7uBljiSqJMG965A
	SUk8ZzuIUlI4u4hwr36mOIe1LTDUiARJO7UsRY+XtFGYRsRgvm2DC04HahzYAUAlYypROTCryQ2
	xykrk9S4dVx2oByYju5GE7KMcps8YCllxGX2d2JgeO0UeWSU5KSjevnOKPv39+Cknnw/NLiI85u
	FbwL8PMz0T6w/Zw8TpWkdVitoSLtMC0kFKCl6g=
X-Received: by 2002:a05:600c:a43:b0:493:b2c1:b2f9 with SMTP id 5b1f17b1804b1-493b827ed93mr68399645e9.8.1782837370761;
        Tue, 30 Jun 2026 09:36:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be486f52sm8452225e9.0.2026.06.30.09.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:36:10 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Tue, 30 Jun 2026 17:35:59 +0100
Subject: [PATCH v2 3/4] printk: nbcon: move printk_delay to console emiting
 code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
In-Reply-To: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782837365; l=6945;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=djAd1fl/L9WrXyymlSdju3NF9QaDoL1LPfIaXfDPCoM=;
 b=mbmqSLg+AQXmdJ8mhzw1IIoKcD77VwckXl6S3VA4/5SqRlokCss9F0DU9sXh9/Rl1813M7M+j
 Rj4F0n49CuSDF4T3wExjG9RRM1XGZ9K9+k1i+QAML7yhGmodQrAqvM3
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_093613_251702_91F33A10 
X-CRM114-Status: GOOD (  25.79  )
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

The printk_delay and boot_delay features are helpful for debugging
as kernel output can be slowed down during boot allowing messages to
be seen before scrolling off the screen, or to correlate timing between
some physical event and console output.

However, since the introduction of nbcon and the legacy printer thread
for PREEMPT_RT kernels, printk records are now emited to the console
asynchronously to the caller of printk. Thus, any printk delay added by
boot_delay/printk_delay continues to slow down the calling process but
may not have any impact to the rate in which records are emited to the
console.

Let's address this by moving the printk delay from the calling code
to the console emiting code instead. Whilst this ensures that delays
are still observed (especially for slower consoles), it doesn't improve
the use-case of using boot_delay/printk_delay to correlate timings
between physical events and console output.

Behavior change:

Please note that printk delays now occur after messages are emitted
rather than before.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 include/linux/console.h  |  5 ++++-
 include/linux/printk.h   |  1 -
 kernel/printk/internal.h |  6 ++++++
 kernel/printk/nbcon.c    | 13 +++++++++++++
 kernel/printk/printk.c   | 15 +++++++--------
 5 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/include/linux/console.h b/include/linux/console.h
index d624200cfc1708bf73925892a466efe0c95c5586..3478b556c0eb9579530409dc6fbb9b5a8bff581c 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -290,6 +290,8 @@ struct nbcon_context {
  * @outbuf:		Pointer to the text buffer for output
  * @len:		Length to write
  * @unsafe_takeover:	If a hostile takeover in an unsafe state has occurred
+ * @emitted:		The write context attempted to emit the message. Might
+ *			be incomplete.
  * @cpu:		CPU on which the message was generated
  * @pid:		PID of the task that generated the message
  * @comm:		Name of the task that generated the message
@@ -298,7 +300,8 @@ struct nbcon_write_context {
 	struct nbcon_context	__private ctxt;
 	char			*outbuf;
 	unsigned int		len;
-	bool			unsafe_takeover;
+	unsigned char		unsafe_takeover : 1;
+	unsigned char		emitted		: 1;
 #ifdef CONFIG_PRINTK_EXECUTION_CTX
 	int			cpu;
 	pid_t			pid;
diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266bfd411f2238b45374e8a71222f0407c..8885e11367d50ea1cd7642249852d011e589adb4 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -188,7 +188,6 @@ extern int __printk_ratelimit(const char *func);
 extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
 				   unsigned int interval_msec);
 
-extern int printk_delay_msec;
 extern int dmesg_restrict;
 
 extern void wake_up_klogd(void);
diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
index 85fbf1801cbe070ad96d253bccdf775a11bf945a..c3586f8b8360208902bbbd4607413997bcbd5fb9 100644
--- a/kernel/printk/internal.h
+++ b/kernel/printk/internal.h
@@ -33,6 +33,8 @@ int devkmsg_sysctl_set_loglvl(const struct ctl_table *table, int write,
 # define force_legacy_kthread()	(false)
 #endif
 
+extern unsigned int printk_delay_msec;
+
 #ifdef CONFIG_PRINTK
 
 #ifdef CONFIG_PRINTK_CALLER
@@ -131,6 +133,8 @@ static inline void nbcon_kthread_wake(struct console *con)
 	rcuwait_wake_up(&con->rcuwait); /* LMM(nbcon_kthread_wake:A) */
 }
 
+void printk_delay(bool use_atomic);
+
 #else
 
 #define PRINTK_PREFIX_MAX	0
@@ -162,6 +166,8 @@ static inline bool nbcon_legacy_emit_next_record(struct console *con, bool *hand
 static inline void nbcon_kthread_wake(struct console *con) { }
 static inline void nbcon_kthreads_wake(void) { }
 
+static inline void printk_delay(bool use_atomic) { }
+
 #endif /* CONFIG_PRINTK */
 
 extern bool have_boot_console;
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 4b03b019cd5ee25d68e9ace84392045e91241a7f..ae45cb0589c0effafc66f1756bdaecd1c1e53ab9 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1069,6 +1069,8 @@ static bool nbcon_emit_next_record(struct nbcon_write_context *wctxt, bool use_a
 	else
 		con->write_thread(con, wctxt);
 
+	wctxt->emitted = 1;
+
 	if (!wctxt->outbuf) {
 		/*
 		 * Ownership was lost and reacquired by the driver. Handle it
@@ -1267,11 +1269,16 @@ static int nbcon_kthread_func(void *__console)
 
 		con_flags = console_srcu_read_flags(con);
 
+		wctxt.emitted = 0;
+
 		if (console_is_usable(con, con_flags, false))
 			backlog = nbcon_emit_one(&wctxt, false);
 
 		console_srcu_read_unlock(cookie);
 
+		if (backlog && wctxt.emitted)
+			printk_delay(false);
+
 		cond_resched();
 
 	} while (backlog);
@@ -1525,6 +1532,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
 	}
 
 	progress = nbcon_emit_one(&wctxt, use_atomic);
+	if (progress && wctxt.emitted)
+		printk_delay(use_atomic);
 
 	if (use_atomic) {
 		start_critical_timings();
@@ -1584,6 +1593,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 			if (!nbcon_context_try_acquire(ctxt, false))
 				return -EPERM;
 
+			wctxt.emitted = 0;
+
 			/*
 			 * nbcon_emit_next_record() returns false when
 			 * the console was handed over or taken over.
@@ -1600,6 +1611,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 			if (nbcon_seq_read(con) < stop_seq)
 				err = -ENOENT;
 			break;
+		} else if (wctxt.emitted > 0) {
+			printk_delay(true);
 		}
 	}
 
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index cc203327247aa4f81f55b907c66ac88f30ce6da8..5278d9cb19e4177a00998fba5c1438251e033578 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2140,18 +2140,17 @@ static inline void late_boot_delay_msec(void)
 	}
 }
 
-static inline void printk_delay(int level)
+void printk_delay(bool use_atomic)
 {
-	bool suppress = !is_printk_force_console() &&
-			suppress_message_printing(level);
-
-	if (likely(!printk_delay_msec) || suppress)
+	if (likely(!printk_delay_msec))
 		return;
 
 	if (system_state < SYSTEM_RUNNING)
 		early_boot_delay_msec();
-	else
+	else if (use_atomic)
 		late_boot_delay_msec();
+	else
+		msleep(printk_delay_msec);
 }
 
 #define CALLER_ID_MASK 0x80000000
@@ -2471,8 +2470,6 @@ asmlinkage int vprintk_emit(int facility, int level,
 		ft.legacy_direct = false;
 	}
 
-	printk_delay(level);
-
 	printed_len = vprintk_store(facility, level, dev_info, fmt, args);
 
 	if (ft.nbcon_atomic)
@@ -3211,6 +3208,8 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
 		*handover = console_lock_spinning_disable_and_check(cookie);
 		printk_safe_exit_irqrestore(flags);
 	}
+	printk_delay(true);
+
 skip:
 	return true;
 }

-- 
2.34.1


