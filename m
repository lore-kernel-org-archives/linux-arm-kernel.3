Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44480606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mUFJnQqf;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OIEOyB49
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NVNdZHoQPN+JOSE1vDDpIyMY0YkiFmXQ5S2CPq/BOTY=; b=mUFJnQqfKPEGz+
	b1eUaXxX31t64bxiB9TSv7xCnzjWsj/fEz0e2VJqLfFJpbrVkPp2tRtbqp3wgGiUIXa3ekNDy6LL+
	VbIdjb7mbZrbliqDxGw7olYDYmZGQ2g4CuiiOFNTlXbtJHA+JqcutTJtsHJTDKPh1qi9lK99kaNhB
	Kezl45UlQdgruS75gFfiEWUSi0rrgRTslrnO9rmPAeEapK4gJhdPkWqs/eTJskATNOxVTdBTyX64T
	HlO7ICEOMcXzDosM3J97Rj04NCl36u4DsTAyvUDCDD5kYHeguirpC1fTT6MlMhqAz68PkES72y9sp
	71wdOMcQM1XuhJeD8Lkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzQ1-00000000SD4-39Ww;
	Mon, 02 Nov 2026 21:18:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzPx-00000000SC0-21XO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793654292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NVNdZHoQPN+JOSE1vDDpIyMY0YkiFmXQ5S2CPq/BOTY=;
	b=OIEOyB492/tRcTwJZfKHXeCpFXQ5LZ8IVdmN0yJp+vraogD1R38fKM2OPEGHoc52trES0R
	Ri0c8sjfc1H3ySkdmlN1GbmAZkzK2yuRGVGzTg2W6Sq9Wt1oOcFSLkO16/1Jhw9nUDXpOa
	qpqrQGWqo7CNty2xI6FQuoZad7NeCLo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-mXX4ZmskOVipWCGicPrCPQ-1; Mon, 02 Nov 2026 16:16:43 -0500
X-MC-Unique: mXX4ZmskOVipWCGicPrCPQ-1
X-Mimecast-MFC-AGG-ID: mXX4ZmskOVipWCGicPrCPQ_1793654202
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4aa7a73b799so4907905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 13:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654202; x=1794259002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVNdZHoQPN+JOSE1vDDpIyMY0YkiFmXQ5S2CPq/BOTY=;
        b=cT8sPf39Ef3TxiCcU+W6IUrt6B2T9kfBBItL5YtQ6GuwaCaOgsgZF0AigJtNaUAA5r
         edEWa52ffjX9PD5qRwqiB5aUOsSPgy6zyfxtnP8D/YpcNDVevtKpN7yBy/CNK7BAwOa/
         XuMfPYQR5MP0KhYnAmiBn2AO+g9XKJENVJK3K3k9coUxQr6WRbEUG9Gtb5IPw3M1N5ve
         hZlcTXgf91LXaAsizjH1KrHk3sTEqTUMbm4KEeodclvpjucs2Ju7q6Ncan1Y04Qr7/pC
         aGhtxRJyRYlyEAv/A+joSs37Ek0Ds6QjnZQypJ+DcVPBlInNQIbjRZbBtxo9IqpBpfU9
         Bd3A==
X-Forwarded-Encrypted: i=1; AKwUvBxBo9KSbjKY5QIBs14Wz1qQyaITNGaNvYoVodREIbg0n8xaFzAXmgn+G6FGS5N6zTAqQKcD9m0lcrXiXD0omWjx@lists.infradead.org
X-Gm-Message-State: AFq9FYL58WuJWAh9ZnJRy5QYPEPaDOtNEVHjfLdXvFpPhcg4Z6T24Cjj
	XTPSK2BeWLiZL0nqwtgxON2fnjav34TqFKQhP4k0ZItigM3cfP+o1YaIZdEwOO6G06P4eJGnYNC
	oaO+2QYGmxr0nxEQnlfOsvlhIbNxZXWlpwTffl0v7iSbXNDcrbJ9XlvQNir0Q2H1yCa4QMhVDVG
	fkqrk4aMHJn6E=
X-Gm-Gg: AYBFou11kssENf9KBMlnozM5sUy+bDudt9SIcOSKIjtNnV7jWGON7gIaNoymwvM46S9
	0dnis5PrKItt8Qgq7klcSAvGVmNuG1wRl7lMX5Tw11uBjKBQxCnKdzxoQLUtjpMk3TDUp7PnuNn
	tSVCyRHVPN7xve1LUHhOnQBdhX9tYthxNG7Zem/8xHu4EjjqPIa2FOFu5CVyEvIoT4rzQviDsRf
	JuJsaiH5Jn7yHfjm30Dp6j+nKWX1gWC4fNAQObEkEA8oit4UOiJOsGzg43ZFjkIQF5+ubd1sAxu
	5L25aTcPg1IwJ64h7BsRMB4bSPaIZuL9SAm41LBsboXO1AFz3MsWZkSFm6BG/9GTrkB3T1JDmst
	vydxb5IBEhyuwnwgdiqEeFaBD0R5sa19jL/dJgPCFEJ/pIuNnYeUp7o7V8xRk/s6rRehLwUvN+b
	BR9ZX/8wgMuf0KhA==
X-Received: by 2002:a05:600c:c08c:b0:4a0:1e9f:64f6 with SMTP id 5b1f17b1804b1-4ac12193b17mr209123875e9.0.1793654202090;
        Mon, 02 Nov 2026 13:16:42 -0800 (PST)
X-Received: by 2002:a05:600c:c08c:b0:4a0:1e9f:64f6 with SMTP id 5b1f17b1804b1-4ac12193b17mr209123535e9.0.1793654201707;
        Mon, 02 Nov 2026 13:16:41 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm17123535e9.3.2026.11.02.13.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:16:38 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Mon, 02 Nov 2026 22:16:21 +0100
Subject: [PATCH v2 2/3] clocksource/drivers/nxp-stm: Fix missed comparator
 match in set_next_event
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-nxp-stm-fixes-v2-2-8ca2706f30ef@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793654192; l=2807;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=kUWoWgTvYPenE4IKiBrz1IwM+AB6oxN1Q/yu3Rn0P74=;
 b=IpqG5whRDSxl3Gemnzq/I3tMvPQOsvjl6i/rI0ZXL9gB1z0N/7it4tFHtVRUPlAyMQCeZQxH7
 xIRxFfg7tweD7qacyfG/703TsKhVCLMA+IC05ckAZvQ9CwLerQxPFso
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=5zh6xuAxTiQwglL2NXQFqWuyRPmCE8T5KPXLbNXhnKI=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i05L-gMTvsvWoBJ_OVs0Xk_1BrBkbdJEvIqYAOXhOXA_1793654202
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_131813_600674_809876AF 
X-CRM114-Status: GOOD (  19.39  )
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

The NXP STM generates an interrupt only on exact match between STM_CNT
and STM_CMP0. If the counter passes the comparator value before the
overshoot check runs, the match is missed and the hardware must count
through all 2^32 ticks (~32.2s at 133 MHz) before firing, causing soft
lockups.

The existing overshoot check:
    if (val > nxp_stm_clockevent_read_counter(stm_timer) + delta)
simplifies to checking if counter_before > counter_after, which only
detects a 32-bit counter wrap and misses the normal overshoot case where
the counter advances past val.

Use a signed comparison on the difference between the target and current
counter values instead, following the established pattern in
timer-imx-gpt. If the counter has reached or passed val, the signed
difference goes to zero or negative and we return -ETIME so the
clockevents layer retries immediately.

Fixes: cec32ac75827 ("clocksource/drivers/nxp-timer: Add the System Timer Module for the s32gx platforms")

Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 drivers/clocksource/timer-nxp-stm.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index ee249fed1b91..ed7662a4e2bc 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -247,7 +247,7 @@ static int nxp_stm_clockevent_shutdown(struct clock_event_device *ced)
 static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct clock_event_device *ced)
 {
 	struct stm_timer *stm_timer = ced_to_stm(ced);
-	u32 val;
+	u32 val, now;
 
 	nxp_stm_clockevent_disable(stm_timer);
 
@@ -258,16 +258,12 @@ static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct clock_e
 	writel(val, STM_CMP0(stm_timer->base));
 
 	/*
-	 * The counter is shared across the channels and can not be
-	 * stopped while we are setting the next event. If the delta
-	 * is very small it is possible the counter increases above
-	 * the computed 'val'. The min_delta value specified when
-	 * registering the clockevent will prevent that. The second
-	 * case is if the counter wraps while we compute the 'val' and
-	 * before writing the comparator register. We read the counter,
-	 * check if we are back in time and abort the timer with -ETIME.
+	 * If the counter reached or passed 'val' during or before the
+	 * write to the comparator, the hardware match will be missed,
+	 * resulting in a full 32-bit (32.2s) wraparound lockup.
 	 */
-	if (val > nxp_stm_clockevent_read_counter(stm_timer) + delta)
+	now = nxp_stm_clockevent_read_counter(stm_timer);
+	if ((int)(val - now) <= 0)
 		return -ETIME;
 
 	nxp_stm_clockevent_enable(stm_timer);

-- 
2.56.0


