Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92702606D80D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ACqXawJQ;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ENuPAFr5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QSh3FZ61lDmn3YnE+4HHyt0kXFsbYoPQ+T2xj8w5o54=; b=ACqXawJQZpkqhA
	jASAIZlsJEZWe5Z2kWtqOUK2JQvN/zBB//laQK+lNP8YJfRqC2vhLNiMAZ9uxt57lLUA0xOEoj6ef
	ecV/U17EIexbwdLR6SHCNt3Qx8YIMK16Dyu5Ckzil8W80gbZJ1WRRBVrb2dpVVD/XmJmmtIv4+f8V
	TJkIZfifNwPLYyw+Gnd8PAHU5H8dH8ImcuVHLc9pDstQznKUfm/unxWZGxnWgw3+SQB1DoydzB9j5
	x7bjHNx3tuVEV8B+KB0UKRg6xXo3l1R3lD9TTQq4v7pMX0VSLmambOcqTiPae1H/mJUQDLlMW6QYW
	NouPtPpx1h/x2M+snf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsgV-000000087oa-3HOV;
	Thu, 05 Nov 2026 08:18:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsgL-000000087j8-1kLK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793866728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QSh3FZ61lDmn3YnE+4HHyt0kXFsbYoPQ+T2xj8w5o54=;
	b=ENuPAFr5n+b6c03kYMc7ERCZunDiV7R3es+TTab/dqoORG/ehRLaYMgT9xDGMYL42CH1sw
	LNk8FJi1Q9CiINcCIL3pWllJyuZTVamnYTU0R2f/3MaQbVIId8rXsGUTkyxp2+eCUYaWxy
	SjvtgQgFT3U8YIcFk90cmG1E2ikyiqE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-RYOdkAxsMuKRrvt6oiM8Kw-1; Thu, 05 Nov 2026 03:18:47 -0500
X-MC-Unique: RYOdkAxsMuKRrvt6oiM8Kw-1
X-Mimecast-MFC-AGG-ID: RYOdkAxsMuKRrvt6oiM8Kw_1793866726
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-491330c5523so89043f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:18:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866726; x=1794471526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QSh3FZ61lDmn3YnE+4HHyt0kXFsbYoPQ+T2xj8w5o54=;
        b=fOAOpQxlg/UnpnHLsqKTtMhU5KGXJCBO8c1EUY6uZ7DBtJU+fH3Xlor7t5LmP8D9s8
         aImi67Q6dx4nQGA6TwKg9OFlXr4uDm3K/X2nYOcQNxpVuDpY97MbfqOKo2IOkTFy048a
         awxqNZfOK2AjNFwcQhL/wu3zlYrcH98JIgGe7j04/Ob/aoKz0wPREA7largx5Enz0L/B
         aM60mojcidBNIzhQ0FBPdnSdMaePz3ym7WoLw5+sMtBOQOD7CdC/lP3K1ikFdQvu2d74
         iSbxhGd9bZc1DrTVI6anJjVOmDRqQ9Sx5vtnTHE+aA9JU9Mz9oEWiJVVKFa6/L5YHvt2
         biTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcPW4qQXvP1DEKbSIdwyBKp1Gp4KrzySfFsNz44re5VTidhq+RA4OQbSyopYEX+Ce3goA2MpRMHpRZSJcocfYj@lists.infradead.org
X-Gm-Message-State: APuU4Z/6ShCRgqsvqutvjYYJau3cW/b4HEKIcuoZIwMmMdYN48ENOv7m
	A2AcdvJlDqNLPHBs/2HZIi5JUwCcvgGhbVi2mdXQ8A8kosHN7OuzcS2w1KMz6r2wJB5f57rL1ck
	O3TSXEkldz+Zv5ViUauKVO3kYzx9lybwICX4SKqcYKppkK6OxHjZDJN8kXDLkVCgmQeLPbmoQfO
	Lu
X-Gm-Gg: AYBFou3k4/w5bcXVoKnfIEcsIjy3mqs62tbNrllhRTvz8MZvVgjG1pdMDsyFrejctSg
	TifLrLfamf+os4VZdMZhrA6MnoFsQ3u9FWW6QGoRYftanZZU2dpsEUkQjqvyCUnQKNDMUikqdmt
	EdwMTGusyvIbJUdLdm9jXWXajUvW+NfXeJVH4Hv/RSCbSGtZcwUlN7Uj7ugS2etPBXVJTjyx3vu
	QMNQKDPQ360eZUh56i49c70PJuuZden3zxOzQyQxnS2ULYIC7/uHr2wOSGk6OMrh+Se9g50cTdM
	soSE0giHD+OFZ2nn33N/acc5FS+D30TJZYKcOevHA+IbZYAyFE5bqFEbELxSQNyvQ2C7Wn1qlb1
	KM58dICQDukAckw1ALqG0kIf7Ngj3qRwJxGQTDylZQUeyoY5H2lr5YEGRs39oUHrKHJ47urdP18
	GwGMdJqwlEXL5+bQ==
X-Received: by 2002:a05:600c:1798:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4ac1228a41emr256212925e9.0.1793866725983;
        Thu, 05 Nov 2026 00:18:45 -0800 (PST)
X-Received: by 2002:a05:600c:1798:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4ac1228a41emr256212735e9.0.1793866725536;
        Thu, 05 Nov 2026 00:18:45 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba0f3sm44809715e9.9.2026.11.05.00.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:18:44 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 05 Nov 2026 09:18:33 +0100
Subject: [PATCH v3 2/3] clocksource/drivers/nxp-stm: Fix overshoot
 detection in set_next_event
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-nxp-stm-fixes-v3-2-8129b912e74b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793866718; l=4750;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=SfBQfG5mlmibe1DcTKzD+JsL6HElJN8/ugHv0KDBhSM=;
 b=hhPQnLcN4q07hzTusiQDClj/QCvvst7v1mFKYKmIvqGnjjFcMs+XXcftGeKP7p3kegMMr1oWu
 I2BB1+q+URHCJ1Fy/H1MOdHbH13htNKxeLY5Sdops2YsB8BLWxAfOiS
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=5zh6xuAxTiQwglL2NXQFqWuyRPmCE8T5KPXLbNXhnKI=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LfpRMFCPM-CfZqnbHrkRJAP8NxPlInupW53XHs3MnUc_1793866726
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_001850_040263_28D9C5E2 
X-CRM114-Status: GOOD (  25.79  )
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

The existing overshoot check effectively compares two counter readings
and only triggers on a counter wraparound between reads; the normal
case where the counter advances past the programmed value during the
read/write sequence is not detected.

Replace it with the approach of hpet_clkevt_set_next_event(): read the
counter after the comparator write and return -ETIME when less than
STM_MIN_CYCLES remain until the match. Derive the minimum programming
delta from that margin. See the cover letter for the measurement
procedure and constant derivation.

Fixes: cec32ac75827 ("clocksource/drivers/nxp-timer: Add the System Timer Module for the s32gx platforms")
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 drivers/clocksource/timer-nxp-stm.c | 53 ++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index ee249fed1b91..81527745b7e2 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -20,7 +20,6 @@
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/sched_clock.h>
-#include <linux/units.h>
 
 #define STM_CR(__base)		(__base)
 
@@ -52,6 +51,17 @@
 
 #define STM_ENABLE_MASK	(STM_CR_FRZ | STM_CR_TEN)
 
+/*
+ * The comparator fires only on an exact match with the counter.
+ * STM_MIN_CYCLES is the post-write overshoot margin used by
+ * nxp_stm_clockevent_set_next_event(), following the same approach
+ * as hpet_clkevt_set_next_event(). STM_MIN_PROG_DELTA is the
+ * minimum programming delta derived from it. Both values are
+ * empirically sized from measurements on S32G.
+ */
+#define STM_MIN_CYCLES		512
+#define STM_MIN_PROG_DELTA	(STM_MIN_CYCLES * 3)
+
 struct stm_timer {
 	void __iomem *base;
 	unsigned long rate;
@@ -248,6 +258,7 @@ static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct clock_e
 {
 	struct stm_timer *stm_timer = ced_to_stm(ced);
 	u32 val;
+	s32 res;
 
 	nxp_stm_clockevent_disable(stm_timer);
 
@@ -258,16 +269,26 @@ static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct clock_e
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
+	 * The comparator generates an interrupt only on an exact match
+	 * with the counter. If the counter reaches the programmed value
+	 * before the write to the comparator takes effect, the match is
+	 * missed and the next interrupt only fires after a full 32-bit
+	 * counter wraparound (~32.2s at 133 MHz).
+	 *
+	 * The counter read below targets the same module as the
+	 * comparator write, so it can only complete once the write has
+	 * reached the device, and the signed difference between the
+	 * programmed value and the counter reflects the hardware state at
+	 * that point. If less than STM_MIN_CYCLES remain to the match, the
+	 * write might not have made it into the comparator in time;
+	 * return -ETIME so the clockevents core retries with a larger
+	 * delta.
+	 *
+	 * This is the same approach as hpet_clkevt_set_next_event().
 	 */
-	if (val > nxp_stm_clockevent_read_counter(stm_timer) + delta)
+	res = (s32)(val - nxp_stm_clockevent_read_counter(stm_timer));
+
+	if (res < STM_MIN_CYCLES)
 		return -ETIME;
 
 	nxp_stm_clockevent_enable(stm_timer);
@@ -337,16 +358,12 @@ static int nxp_stm_clockevent_starting_cpu(unsigned int cpu)
 		return ret;
 
 	/*
-	 * The timings measurement show reading the counter register
-	 * and writing to the comparator register takes as a maximum
-	 * value 1100 ns at 133MHz rate frequency. The timer must be
-	 * set above this value and to be secure we set the minimum
-	 * value equal to 2000ns, so 2us.
-	 *
-	 * minimum ticks = (rate / MICRO) * 2
+	 * The minimum programming delta absorbs the measured worst case
+	 * read/write/read round trip and the overshoot margin, see the
+	 * comment on STM_MIN_CYCLES.
 	 */
 	clockevents_config_and_register(&stm_timer->ced, stm_timer->rate,
-					(stm_timer->rate / MICRO) * 2, 0x7FFFFFFFU);
+					STM_MIN_PROG_DELTA, 0x7FFFFFFFU);
 
 	return 0;
 }

-- 
2.56.0


