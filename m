Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F114606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AbCedBMf;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cOs2Z/H3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YnYl0grphqtCTW16mbqB5OZ7Ar0uK9ejWodFsFluXmA=; b=AbCedBMf9ZXzT6
	yh2b5O/9buGZOJyEF+TgpM5+8kVD9XhQCz4CEFWDnZDd5LGmcfhGZABdqtpNkbNsErJEJ6+UHAAKN
	QXl4MwFszHkr3kyLJFD2g07NlTC5ziibfoCsomMlSxggGIJkJGM6smmL5rjkhJ8QCHwc0Lrl7webU
	vu9iJQzrlI6P+GBubWPV9folVzOTC+sMN0uYzT8QUFoFMTvu87EgfSosnem4RT9xczg2vAtnIY4TY
	+E+s2Mhvutif1zMnPxkc7n5j759aeEH/mizU7GYKV+n0xH+d50spGCKUukdSEnYinwbHPV4gwAcuc
	LvCOUWi61707TjdY21DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsgW-000000087pH-1JUx;
	Thu, 05 Nov 2026 08:19:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsgN-000000087k6-0W4n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793866730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YnYl0grphqtCTW16mbqB5OZ7Ar0uK9ejWodFsFluXmA=;
	b=cOs2Z/H3fyglf48BU0THLdP2KnSdCqAFRgw/QMUR2e/5k5FXZ2YJAKG3F6lRcVbviNFW/O
	CSTFlBRkODuDbbwX2wfgUk4CzBC5OZ08fxypB8FCgI+09azSiPKx0vUw1oyDpxDVIOLD07
	iFt31ptmICj9BCexWB1sMOl6PXvn9ag=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-QjuUrWn4MTa5eSg1J3qeLQ-1; Thu, 05 Nov 2026 03:18:49 -0500
X-MC-Unique: QjuUrWn4MTa5eSg1J3qeLQ-1
X-Mimecast-MFC-AGG-ID: QjuUrWn4MTa5eSg1J3qeLQ_1793866728
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ae58bf15d0so3359755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866728; x=1794471528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnYl0grphqtCTW16mbqB5OZ7Ar0uK9ejWodFsFluXmA=;
        b=2SElJOW1v3J6GzMJGCfqr1Wc1q3T9Lq8beY7LcDDtW4yRONrEYuo07eWTVZRvbFQhM
         XIBpFTJBc1TqbZTEF52rzXSuB5OuxGmEa91HMxwuYFl1PghPW7idFiaeUYC3o30fpbQG
         fCKPuPXMBG9uMtoecn1KkKCvvX7gCFTyHLgSJPBHxpAP5MQ19VLmAYwdzv4sZ3bacjDq
         jVG9AeREs3aboecE/26Xiv0cmv9nMurZNlo9Ut1K8H31fJYojxlCIST+eWySl8LRs2/+
         iDJg5CqgtAiSl+9PdyqR38Ls9FJcyVHXqyr6rhpbaoRJLXlo8VuxlN4U7LvLDtqOKppY
         NQaA==
X-Forwarded-Encrypted: i=1; AKwUvBzhWXNJk79GFy/xeKMNiOtdhvl8hZDi9mzegrooILRQTK69cxMIVWZdCm89LZmdwgD4FOAN/sECfoUY+Q8PtEyA@lists.infradead.org
X-Gm-Message-State: APuU4Z9UVSmyHB3fffjDfI/vRckiuE4BvlzIUD7RjWSryQpOZejspx4G
	pqFLpaZEm4C3LoZA7aqBUl6/2967SWvvkJXH0BCSHPMqD46UC0U8yDBelZoHWlU6b6BQ4zrQSBB
	D3m2HO8uwbTea4OkxcrT1pcEvcP5lZnbZLJxrVjHNIYffSR7PLzfSZSzQX1PjrxOmaKD+0mvrvr
	XG
X-Gm-Gg: AYBFou01kDAoxp+JXKDst5pncWFtgRxSBIFNZt1TUOUVoGWfO1UUiktkl/JcwQ68Sp3
	p2HGGEgtn86pcmD+iAC9Hy1hsQ1wgQXqhR1F+MkEXHBV/dQ4LYCre2SAP2LJvv606ZpLSJ3rTux
	PzAg5tbIbt63vJ6j9ANtfpfO/9oOJLsut6J3pX1nYe+uePiRu3rfuMAQCCm/4hfbA5nuPMQZLN+
	2Zmp5KKslXoZypLl0wyamEA+7hgAFJYXKlAoRfAO9cW8ruPhvsCMUFeZnONHqmtIWBoYj0T8v+h
	aVHqQCEEN8HfiR88WXJMeg8TRWayDVLbDbo+Z7M2oUAWVO7dha1yBzag+nUHekiP4g7tKlbxfgf
	NF39TJpI/c6jAz7RbMMKWnoqgO4ceq5qZpDfWhepEmvbg1jPnDhsf1uo9XThJTLab3eCSPjLvYi
	SS3WoP1IMc/gOk9Q==
X-Received: by 2002:a05:6000:2587:b0:48e:5ad1:5e77 with SMTP id ffacd0b85a97d-48e6e261607mr37451518f8f.0.1793866727924;
        Thu, 05 Nov 2026 00:18:47 -0800 (PST)
X-Received: by 2002:a05:6000:2587:b0:48e:5ad1:5e77 with SMTP id ffacd0b85a97d-48e6e261607mr37451467f8f.0.1793866727444;
        Thu, 05 Nov 2026 00:18:47 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda203b6sm8437363f8f.48.2026.11.05.00.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:18:46 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 05 Nov 2026 09:18:34 +0100
Subject: [PATCH v3 3/3] clocksource/drivers/nxp-stm: Arm the compare
 channel from the state callbacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-nxp-stm-fixes-v3-3-8129b912e74b@redhat.com>
References: <20261105-nxp-stm-fixes-v3-0-8129b912e74b@redhat.com>
In-Reply-To: <20261105-nxp-stm-fixes-v3-0-8129b912e74b@redhat.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, stable@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793866718; l=4847;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=gKd+ISmeFZF91zn4FW3sChMabdau9YNhi9yQ9k+mIyE=;
 b=vyi+xrok9WUJjuZ1aq0y/R2QRzxzfZKBFUfjS/ufrPzTsHkchLnh3UsYDssaTGvwk2ad1KIFl
 fqgaUxkZlyaBuKQMQv+qtIzSGIyZOpwerNeuoyWlgaPGdY7D7wfZzk0
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=5zh6xuAxTiQwglL2NXQFqWuyRPmCE8T5KPXLbNXhnKI=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qOkCUI_KS-Z--Z1G_pxbzY9vV0muRLDbQJyxrR4U5MI_1793866728
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_001851_320488_25355761 
X-CRM114-Status: GOOD (  20.06  )
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

set_next_event() disables the compare channel, programs the comparator
and enables the channel again after the overshoot check. The trailing
channel-enable write is a posted write landing after the check: if the
counter passes the programmed value before the enable takes effect, the
match is missed. No min_delta can close that window.

Keep the channel armed for the whole ONESHOT operation instead, and
manage it from the state callbacks, like the HPET driver does:

  - set_state_oneshot() and set_state_periodic() enable the channel;
    a stale pending interrupt flag is cleared before enabling.
    set_state_oneshot_stopped() and set_state_shutdown() disable it.

  - set_next_event() now only writes the comparator, covered by the
    overshoot check.

  - The interrupt handler reprograms the comparator only in periodic
    mode; in ONESHOT mode the stale value stays armed until the core
    programs a new event or stops the channel.

Fixes: cec32ac75827 ("clocksource/drivers/nxp-timer: Add the System Timer Module for the s32gx platforms")
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 drivers/clocksource/timer-nxp-stm.c | 52 +++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index 81527745b7e2..8ad99863bdff 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -254,14 +254,27 @@ static int nxp_stm_clockevent_shutdown(struct clock_event_device *ced)
 	return 0;
 }
 
+static int nxp_stm_clockevent_set_oneshot(struct clock_event_device *ced)
+{
+	struct stm_timer *stm_timer = ced_to_stm(ced);
+
+	/*
+	 * Clear a stale interrupt flag so that enabling the channel
+	 * cannot fire an event from a previous match.
+	 */
+	writel(STM_CIR_CIF, STM_CIR0(stm_timer->base));
+
+	nxp_stm_clockevent_enable(stm_timer);
+
+	return 0;
+}
+
 static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct clock_event_device *ced)
 {
 	struct stm_timer *stm_timer = ced_to_stm(ced);
 	u32 val;
 	s32 res;
 
-	nxp_stm_clockevent_disable(stm_timer);
-
 	stm_timer->delta = delta;
 
 	val = nxp_stm_clockevent_read_counter(stm_timer) + delta;
@@ -288,18 +301,16 @@ static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct clock_e
 	 */
 	res = (s32)(val - nxp_stm_clockevent_read_counter(stm_timer));
 
-	if (res < STM_MIN_CYCLES)
-		return -ETIME;
-
-	nxp_stm_clockevent_enable(stm_timer);
-
-	return 0;
+	return res < STM_MIN_CYCLES ? -ETIME : 0;
 }
 
 static int nxp_stm_clockevent_set_periodic(struct clock_event_device *ced)
 {
 	struct stm_timer *stm_timer = ced_to_stm(ced);
 
+	writel(STM_CIR_CIF, STM_CIR0(stm_timer->base));
+	nxp_stm_clockevent_enable(stm_timer);
+
 	return nxp_stm_clockevent_set_next_event(stm_timer->rate, ced);
 }
 
@@ -327,6 +338,8 @@ static int nxp_stm_clockevent_per_cpu_init(struct device *dev, struct stm_timer
 	stm_timer->ced.name = name;
 	stm_timer->ced.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	stm_timer->ced.set_state_shutdown = nxp_stm_clockevent_shutdown;
+	stm_timer->ced.set_state_oneshot = nxp_stm_clockevent_set_oneshot;
+	stm_timer->ced.set_state_oneshot_stopped = nxp_stm_clockevent_shutdown;
 	stm_timer->ced.set_state_periodic = nxp_stm_clockevent_set_periodic;
 	stm_timer->ced.set_next_event = nxp_stm_clockevent_set_next_event;
 	stm_timer->ced.suspend = nxp_stm_clockevent_suspend;
@@ -384,19 +397,18 @@ static irqreturn_t nxp_stm_module_interrupt(int irq, void *dev_id)
 	writel(STM_CIR_CIF, STM_CIR0(stm_timer->base));
 
 	/*
-	 * Update STM_CMP value using the counter value
+	 * The STM hardware has no periodic mode: the comparator stays
+	 * armed after a match, so periodic mode is emulated by
+	 * reprogramming the comparator here. In ONESHOT mode the stale
+	 * comparator value stays armed instead; the clockevents core
+	 * either programs a new event or stops the channel long before
+	 * the counter can wrap around to the stale value (~32.2s at
+	 * 133 MHz).
 	 */
-	val = nxp_stm_clockevent_read_counter(stm_timer) + stm_timer->delta;
-
-	writel(val, STM_CMP0(stm_timer->base));
-
-	/*
-	 * stm hardware doesn't support oneshot, it will generate an
-	 * interrupt and start the counter again so software needs to
-	 * disable the timer to stop the counter loop in ONESHOT mode.
-	 */
-	if (likely(clockevent_state_oneshot(ced)))
-		nxp_stm_clockevent_disable(stm_timer);
+	if (clockevent_state_periodic(ced)) {
+		val = nxp_stm_clockevent_read_counter(stm_timer) + stm_timer->delta;
+		writel(val, STM_CMP0(stm_timer->base));
+	}
 
 	ced->event_handler(ced);
 

-- 
2.56.0


