Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79860606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m00oN77L;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xc5q6CC1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CwmLXq/62/1T0UmWDZrUZhiTccO4dV8Xr/kNTOz6adY=; b=m00oN77LlYIha6lw/zd3b+R7cu
	8/g4lfymXWA3L/+dbXQRsrzgzKqns42lfTFomJGUuGEKgeBqsvsN9vMlV6oq5QNAvwNHNZsM01pqz
	BAiXSm2v5xTPJXg5WIEDRQuwDOo8aezYykiFscyC3PalJOg4tNG3OGGcVuq7E+sH+xplMs7eYtzkc
	NN+R/Pecdg6DH5nnI9wZQ7cD4xEFm5TEYCRX4qpLEDELlLprQLZu5jyTVgay+DBn26nL1rVSMeMoB
	2znHDisYn2wqV1UCkkshUaibr0U4LB88llZjDdHxDr1kSDIaSxh7rXGj3QLodJCl8to5vDIypsJC3
	RF+/v6lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGKG-00000001yHc-1yjJ;
	Mon, 26 Oct 2026 08:45:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGK9-00000001yEc-46nM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:44:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C3F643B37;
	Mon, 26 Oct 2026 08:44:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793004295;
	b=UCt+sVlOfGqPAFO3JcduXWgJPqXcOUFTtk5MXaHywzPTX6tLli6/xydbdz5UezNGpqm/
	 HFOkWJvXPVtGXYv+XF7m+xOjP8DGVk6mAQx3Qtj59oC33ReCdO06GzafmOgwQ7iaIdlGO
	 T65xy6aavzLIXClTSGKZzq93YgEl+IPnH6SX1Licvn+w4UB52iDFnrwbUCS6k5tsrGJR2
	 JbCHHF2RZ2Y6tKm5CXfQZpqjT4ssBXZpeNyi9NINpaSKULvKd2HGfRxtcGO+EXkro2EuO
	 Gfikf+biH/vzuy8sqvSmjZMIulwuYXSZwg5Zn+8Yd5KR28GSOxeQ52raROLuApoLNIw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793004295;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CwmLXq/62/1T0UmWDZrUZhiTccO4dV8Xr/kNTOz6adY=;
	b=ttoptV2xFpGG21/7v97wdJrB4QJA8ng8XfTNtYWYbe+q3bjlAeIcU1Gjy8t0DIdC82GV
	 nx1mlJ0WLGZkXivB5dvNSUQWCQcYkbTCfdQPuXhu/O1kHf+g51eUtVQoi4d8J5G6R0BrV
	 UViw6x80x4VVcMhWu+2/JctLvaoC8vBlUa3tfRhjbfAOXDFYKrML9MHbqK/9pOmgAdrY+
	 7FXBjWYnWtGaMiKXR3AS3d92H+JEIeSvGL1jjP6oGjeN0aZaRrqQh1zcGnSG/8+pp0F4G
	 UFIStO87yLDeMIhXfEEJqU0n38Cpc0TcLKYNnRgeFixbUcL91A9H25CKRKDgA0+9M+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D8F31F031E0;
	Mon, 26 Oct 2026 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793004295;
	bh=CwmLXq/62/1T0UmWDZrUZhiTccO4dV8Xr/kNTOz6adY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Xc5q6CC1mA++ZWcktVfrj06NR4JMNBJ4gtakErtSbHIsif/a+FGmOuBSZFvktkkUd
	 o3/KQAM+GJ7V73igm1DzK4EbNnEKcmLo4zPIthUClj5Bu1lAFr6nKhkLdpmH+xhul2
	 cOTbyxoIqcAK6QJOaJ2JUlpYp6KZLT6ABiEDPo4KETLz/imGZR6tYn5CpGGMjsl+/y
	 eYGvA4ParOIIZUI0+ZS9mGM4o4Q06efPIDmpl9YL/B0We0E3LdGcJ8hYRGSwfPO5JN
	 S4Cey0MHWBWMKIgTCX6gL0SmBs5hSlURy2GucvATEBYx/Oumjuzfl8/NuoahXOyHOd
	 7HrAKLSGwBGnA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CC6E744C53;
	Mon, 26 Oct 2026 08:44:53 +0000 (UTC)
From: Enric Balletbo i Serra via B4 Relay <devnull+eballetb.redhat.com@kernel.org>
Date: Mon, 26 Oct 2026 09:44:32 +0100
Subject: [PATCH 1/3] clocksource/drivers/nxp-stm: Fix max_delta overflow on
 64-bit platforms
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261026-nxp-stm-fixes-v1-1-20a64a4ea454@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793004293; l=1278;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=L/BLJLtJsSwjiNTJzNs2bQ3gnalbIFR0HTGJUr2gtfo=;
 b=N/PIuCcPsLpSKSx+Ly1tUPcdSOC2jsr2xVHqYW0T2xAMbSOHcrN53tOzDFvZfmJkOngsoGRY4
 L8tqQnULEYTCFSsCclXrgCCSmAFRANc7OxepC788tKJ3P0wnPJQoAZx
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

The NXP STM timer has a 32-bit counter and 32-bit compare registers.
Using ULONG_MAX as the max_delta parameter for
clockevents_config_and_register() is incorrect on 64-bit platforms where
unsigned long is 64 bits, as this exceeds the hardware's capability.

Cap the max_delta to 0x7FFFFFFFU to match the 32-bit compare channel
width, avoiding potential timer event misses or unexpected delays caused
by programming an unreachable compare value.

Fixes: cec32ac75827 ("clocksource/drivers/nxp-timer: Add the System Timer Module for the s32gx platforms")

Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 drivers/clocksource/timer-nxp-stm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index 6fe098a4a33f..ee249fed1b91 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -346,7 +346,7 @@ static int nxp_stm_clockevent_starting_cpu(unsigned int cpu)
 	 * minimum ticks = (rate / MICRO) * 2
 	 */
 	clockevents_config_and_register(&stm_timer->ced, stm_timer->rate,
-					(stm_timer->rate / MICRO) * 2, ULONG_MAX);
+					(stm_timer->rate / MICRO) * 2, 0x7FFFFFFFU);
 
 	return 0;
 }

-- 
2.52.0



