Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C52606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LAeTP8gs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mQ8kgciu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xEGFMoBSqlCkE1A3S7YRAvd7sH19TwEaNbWjjfQgI9I=; b=LAeTP8gs1Ea+8SgORowtFHJSSp
	Z8ANHa/8q761RrwEWOwocAi2GBdf1rARBDYpnlZAZ4sewcdenFsp5uABgSvYqjemgim13mOqv0TI3
	VmStKHal9ZXvMjtdH0ar0OO3eNZw0dE/GyiBMjMoZnUiyjtuvgO4dOU9lBlCZ+pp/B3AGfvFvT1z1
	/y0411HcDHjdnBsQEm2+DdW4SsoFfqhoTNItUV4Q3nSM+1H1qqVCGUDa/vcN0Q1R5WkehuS+vKI2y
	bTMq7Y35UmRk4IJj5GtwWyzFcYNM6pDAbH5SE5P65DHnTMb44qM8vMRaErDEa3t+qZap5eaDBu0LI
	3SKvQ71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGKG-00000001yHI-1T0x;
	Mon, 26 Oct 2026 08:45:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGK9-00000001yEd-46hm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:44:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B355E43C6B;
	Mon, 26 Oct 2026 08:44:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793004295;
	b=0SyfhU9oz03BL0ldli+0fcDQunM5HVWF9ZdL4W9c/aTipC4HyrY+KUV+1WdIu1X4XwnP
	 5Vt90wCH9yF+KQ51xCAt30np9I/jshcMRbivVuZPhjG34HQEcoXrDbHM+HGqx1NxZy5sF
	 Z22OYzJZdijDzbt4w6OZ23rRv7v79l2rk9CkyyfD80AIjJ39b0FRSXlqkbSSIOaIdSsw9
	 Wm/pfIe+biNU9/D4mcofiL6mVLjV1+5O5mifzhKYXl9/yEe2Hwqu3qlF+V4u115QWNF4/
	 G9jG0/bLXLlFu1EjramlAXdksR3LuHdoLw6L8hi1dmoee0SzSyCI3xKCKKjyeJtv3rw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793004295;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xEGFMoBSqlCkE1A3S7YRAvd7sH19TwEaNbWjjfQgI9I=;
	b=r5p73S8WQhI00Ia60CmB4hKoNQcUI8RaaBRcIzTqmzFKZcbzBSBTR7fmKTVobVOw1so+
	 nry/XdFLLdX+z8M7vmfdMMOfyOC+u6VsPzdCPVWZ2kwKXwB7H0AsXAqLF7sseVuY/N/BY
	 Gn+XrtswMYBOW48FHSs0XGuSonfyiwYxOjYj2/Tx+Ifh3BhcICvI3/BXrb+6/wA2YUMua
	 Yr8igp2JYoBT9HTfqp8b2JGVeULJM1prYOLjw4GrJqYD/dPXK9O2vIfKpN8sxOcekv2mC
	 A6q0YEsEvfRS0tYNaXDYKRC7n9NXaUT6v6/dWTYpDFAHhc8UuC2FWd6P+kLjOTQE5pQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D69D1F01828;
	Mon, 26 Oct 2026 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793004295;
	bh=xEGFMoBSqlCkE1A3S7YRAvd7sH19TwEaNbWjjfQgI9I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mQ8kgciuLtx28dkxCOTRzbeMcOaH+IQPUg10oV7RhkISkE9sloLazxOHhRgnjm4/C
	 Sc4zIac4G4HR2gNTeXhvvLy3Du8O8PQ24OpJSuIBE44T7Lw5oZLBELm539UxcW8KB7
	 SNCy4CCajdzPo8THscby490MJz3yG5SUyAKajNeLhSQLNY/X1o2a3+olODgDvyylwn
	 jv9LL5Y7MAvnUrtGd1rRAnZBoCRF5p71mDt2D3PM+pjLYvDNJpg9+qQAwZV7mMUj4Y
	 1ymIKeoXt2UYC2C8lg/KCmiE6ZUdAsiLLGHCGm4PiMdogmM43vw9zt10mOxiTDC1Si
	 Wm4Is3X6Vyadw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D69B844C73;
	Mon, 26 Oct 2026 08:44:53 +0000 (UTC)
From: Enric Balletbo i Serra via B4 Relay <devnull+eballetb.redhat.com@kernel.org>
Date: Mon, 26 Oct 2026 09:44:33 +0100
Subject: [PATCH 2/3] clocksource/drivers/nxp-stm: Fix missed comparator
 match in set_next_event
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261026-nxp-stm-fixes-v1-2-20a64a4ea454@redhat.com>
References: <20261026-nxp-stm-fixes-v1-0-20a64a4ea454@redhat.com>
In-Reply-To: <20261026-nxp-stm-fixes-v1-0-20a64a4ea454@redhat.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev, 
 Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793004293; l=2807;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=L1v5tjj5j+Wq0siw9q/hKpdjRRXRlMLbbuhC7iKp4ic=;
 b=cGWaYFHHdQAsdou2DcXrTVsUM5zfG6BRmXstksyJxMgAfkKif+TedfSdBhJTJ4xbtCHlyzVNj
 9tqansaOe7dBKdq00wXcVflgmQKIeqRmfXu0rqghT4itUZO/ol+DvI8
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=5zh6xuAxTiQwglL2NXQFqWuyRPmCE8T5KPXLbNXhnKI=
X-Endpoint-Received: by B4 Relay for eballetb@redhat.com/20261026 with
 auth_id=1324
X-Original-From: Enric Balletbo i Serra <eballetb@redhat.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: eballetb@redhat.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Enric Balletbo i Serra <eballetb@redhat.com>

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
2.52.0



