Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B532A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kMPo1L3h;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i0Jf44PZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2RjoLq/kIZomTqqU6zUcn3juKCDy3taGhnxzS/BtlV4=; b=kMPo1L3hkVOCC+
	/f0imLkRuzuEg8hJvytzZy28OxE0C6wE4BdrMirXAVe9+CqbOkksGYs5lrGA7nTpcIEQ4m5fdWojp
	DEbZpVWmbOCbxJscIvkYuOGRzSzDp+6/yffOJkLaR56dxfdRj6+wQNmon1jZ/RdmvJyp7Oe1NOgB9
	Wkk0cZMjht4qCyULPWYPggia0pTvkLSlCK93Y9C8hhBbu9mMePWGkfWQQfMZabROEwp07mbzLamf7
	IrIh9YfUoHVkNG2Suhm4Q+6JbfxJO1I3g7PpGOIFgmHm2yjqfL4nFGqeR0bsma9GLdovKj9EZEwSc
	Rh8mMUIuippzOncqbo/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzQn-00000000SSj-0leL;
	Mon, 02 Nov 2026 21:19:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzQk-00000000SRM-41IH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793654342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2RjoLq/kIZomTqqU6zUcn3juKCDy3taGhnxzS/BtlV4=;
	b=i0Jf44PZdXqeaaOqXYppy5uFspv7qLoVjj4uSrCrALyxQ0qgzw/YA8ZJIAxwN6FaSGE+0e
	SzfYIaLWg/m0euk7jD8UhdGOkVOPLGP+hcjNUDEXkYcSmuUhkH3B6sytVlxxI0E5fy7V21
	pbD6TUf71x5T5ITg4QZI7cdikLuT6Io=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-iA6J7iSqMVKC_mRfeBqt9w-1; Mon, 02 Nov 2026 16:16:44 -0500
X-MC-Unique: iA6J7iSqMVKC_mRfeBqt9w-1
X-Mimecast-MFC-AGG-ID: iA6J7iSqMVKC_mRfeBqt9w_1793654203
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a7417d5cd3so4533595e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 13:16:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654203; x=1794259003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RjoLq/kIZomTqqU6zUcn3juKCDy3taGhnxzS/BtlV4=;
        b=orxMEOYMWhtziuHxG1jje1TKUY7spcdxRi04JmFY9q8wFj9Kgiv8/1vtZvXWDRyRCK
         nMVRecWiS8Z2YgbwZ8madlLryz53JdZTGa3HldIeOlctiROMshzntRQHXZc4FmtBWitr
         EfUHsy4QNTaBUAA0gKNe4xYaWxQH4fA4e8O6q6GuS8VhCipCcoI2BqvQaRKDRi3pqSYX
         C95OOekqHe9UJeJRRoAgbKBObsIve45/hbmhYvM09HbpkpgkQF5VBTgzLsXdDr2IXJC3
         yFJ22BoPAoPc/8tUCSqN/uZpK1rgvLF8If6Rr8qWwxCV3cLJyjIA+CnehQulJvJLjDef
         0DcA==
X-Forwarded-Encrypted: i=1; AKwUvBwkVlyHCIgf4fi4iw7qrwyDbakuOJ79yfP2HADfUIcn/qgJCeV7zFmuv5NNjO9Yej01Jffz7xhBvNfMll9DNejh@lists.infradead.org
X-Gm-Message-State: AFq9FYJvNQhioZvMyGf9QBfCN9IZSBuio2a/OcOBenCijaJSsh4Bjd+9
	qP9AX9ZB4o9wzbrHmWVkCD0MZT5ADp9HAXNyurIvNJlWvw8Jg1LcqHYh8s7fe65Ega5x8d18HE3
	rBu9hIn7zyb3bEXqS3dPzeldvUX7bCINP+P6T0Gd7L3eSn/ogmPdADOCKosy7dqzgv0qM2giYA3
	7i
X-Gm-Gg: AYBFou1FMv9Oba9dRrMC5mdFJm3RupM2SrN5321t9qqACf+EblsWfegvGbi0J0pFO4J
	SDzUTGFopkJ9OYYJ8geHZyCXCQ2csvShzuaWrtS/ZcyGkwXdT3sSBovb/2NDbaEQgEKAuosiSni
	2jZxNQT+fgoCfHYKBr+W3Mq++/zAhQYd2/7iRr5/TUe2QVUPZyf+dy13xqlctyj7veGewLU4Kbx
	ZSDRvEG2eUnp/DkrSTPKBtXQPmDteTGhFTWssJsdhSTmm7FqHMLA/CfUlHZFfZ7GJYcB1q0P26q
	skil9WM2cPqUeSzTcriu7b+esjCZYuK4ny/Qe9GfIkAm0USFNNTFLgyTxTBhgevVM2xZqhHopqN
	Osu0kaRTU9pw8REblc9ca11v4QIfnsuoZXikhg4QBlC8HhWdIMVKfjV9fLaNN4vkIs2Ifh69BPq
	nyT39NvOSrODMYsw==
X-Received: by 2002:a05:600c:c08c:b0:4a2:1a:a115 with SMTP id 5b1f17b1804b1-4ac1209f120mr218821415e9.0.1793654203508;
        Mon, 02 Nov 2026 13:16:43 -0800 (PST)
X-Received: by 2002:a05:600c:c08c:b0:4a2:1a:a115 with SMTP id 5b1f17b1804b1-4ac1209f120mr218821095e9.0.1793654203128;
        Mon, 02 Nov 2026 13:16:43 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm24999655e9.14.2026.11.02.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:16:42 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Mon, 02 Nov 2026 22:16:22 +0100
Subject: [PATCH v2 3/3] clocksource/drivers/nxp-stm: Increase min_delta to
 20us for PREEMPT_RT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-nxp-stm-fixes-v2-3-8ca2706f30ef@redhat.com>
References: <20261102-nxp-stm-fixes-v2-0-8ca2706f30ef@redhat.com>
In-Reply-To: <20261102-nxp-stm-fixes-v2-0-8ca2706f30ef@redhat.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, stable@vger.kernel.org, 
 Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793654192; l=1953;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=9U7e/e2EyDS47BqXM0Wq4E/IVIq+iDMzJy9Mz8G/8z0=;
 b=I3diUql5Q6GbqX8veSUe45rbF94jf6KgRxB2o4ixEqSLRhaEof0uU+OQxrTWrQXV/bTJ4ErDo
 +5AE3K8aDZ7CcqtoXD4Mb0PjXDAxuRMGD18t/k2lWRpFU20e7nZ+1KK
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=5zh6xuAxTiQwglL2NXQFqWuyRPmCE8T5KPXLbNXhnKI=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kPUOpSS2_NxT7KZX6EwjFKvyMmGUa0uj6oxNbEBx4zw_1793654203
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_131903_074643_EF22FB59 
X-CRM114-Status: GOOD (  13.79  )
X-Spam-Score: -2.8 (--)
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

Under heavy bus contention on PREEMPT_RT kernels, a 2us min_delta is too
tight and causes ~32-second timer soft lockups.

Increase min_delta from 2us to 20us (~2,660 cycles at 133 MHz). This
provides sufficient margin under severe bus contention to ensure the
channel-enable write completes well before the counter reaches the match
value, resolving the 32-second soft lockup.

Fixes: cec32ac75827 ("clocksource/drivers/nxp-timer: Add the System Timer Module for the s32gx platforms")

Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 drivers/clocksource/timer-nxp-stm.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index ed7662a4e2bc..a1a0e23d3342 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -335,14 +335,18 @@ static int nxp_stm_clockevent_starting_cpu(unsigned int cpu)
 	/*
 	 * The timings measurement show reading the counter register
 	 * and writing to the comparator register takes as a maximum
-	 * value 1100 ns at 133MHz rate frequency. The timer must be
-	 * set above this value and to be secure we set the minimum
-	 * value equal to 2000ns, so 2us.
+	 * value 1100 ns at 133MHz rate frequency. However, under heavy
+	 * bus contention on PREEMPT_RT, 2us is too tight and can allow
+	 * the counter to pass the match value before the channel-enable
+	 * write takes effect, leading to 32s wraparounds.
 	 *
-	 * minimum ticks = (rate / MICRO) * 2
+	 * Increase to 20us to guarantee the comparator channel is fully
+	 * enabled before the match value is reached.
+	 *
+	 * minimum ticks = (rate / MICRO) * 20
 	 */
 	clockevents_config_and_register(&stm_timer->ced, stm_timer->rate,
-					(stm_timer->rate / MICRO) * 2, 0x7FFFFFFFU);
+					(stm_timer->rate / MICRO) * 20, 0x7FFFFFFFU);
 
 	return 0;
 }

-- 
2.56.0


