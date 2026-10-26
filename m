Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA303606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0IKN0WUb;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gMJKtiEh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jz30Kqva1oj2ZOG9QQrY/EiApxn9BM5nq3IuAzI3TSs=; b=0IKN0WUbwEOiY4wZJ8ZRddawOF
	STJ4MTTUQyM+QRBBklid4FZFlMH+lDM7c4/5TKsAvXi3b3NvD7NPnQVvhcTXzZdYHZP9MZg40K0Ma
	CFgxElefx6gln1XtdE1vSvlGXg1snhuHfb7k4s3l/tbUBITgILcc/zsHruTUVeLag7GrW21kxj6SF
	fA25YTONMneJAnq8oYzdCyTNT+jwI0s7lpdDP0NEtIDYyTHiRbytSWjZqhQUjqvYMH0xgAUeX21iu
	yO+d0JevYL8mZeJZeZvcsMvfJgSBI+yAtDJ/U2BIacGr7buWac4dqSTX/FlA89CaMrsP8lHCHrCdv
	djjbheIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGKG-00000001yI3-2zfQ;
	Mon, 26 Oct 2026 08:45:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGK9-00000001yEb-46hw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:44:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EA9C415F2;
	Mon, 26 Oct 2026 08:44:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793004295;
	b=dWAN0EA67mkCKq8VUjhqFwoFk5EgPe7rQxVRZtXhCamRDaG0JOQBtpRNRIpXws6k40pC
	 tJP+5kOd6C4Hgyi6XuuQ+U01PEOO2ZtDebFLBpkLn8Y7iwkhrdzlgShRRNedcsnLEW9pl
	 MEuTuGsmbb/alOXiHDwUKAKt0La+bBfX8M9IeoOzv4BqVqkwUhQ4Sihi8wpjd/QwOKldV
	 ZTs4O9yJFEqJ3sr/NfWaipq/KZKX31pI7Q7Amj2HFcYTLGnJvwQNx4gTIvXDp5OHNwxQH
	 oD70KtbJXOLfK+HN1x4RbMqP+oalQ6zgQjLXMPz8zi5xxcu1Jqv4FN8JB9RESgKeowQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793004295;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jz30Kqva1oj2ZOG9QQrY/EiApxn9BM5nq3IuAzI3TSs=;
	b=V2glH+uPavtLp8oC12tl6S82+lnS2XoUinfKVH1jwr1dQrH703vtaCUGENd4zVgbUn9Y
	 mgmYSVnSGySHYw8kzTZc7h5zQVGBwjydRPt2D9ciAYUicEuXna+tmfyzX5hS2fQGLLd76
	 Gd00nlH8x//PWJrp4cxLMtQ80N+gzwoQpIMEuw2VnlhCNV6XKghFVdAf6S9nbRLrdFPPH
	 V0na7/SZvzGCFZYd8p+PloY8RmcgqtbqBQpf/7zF/GgK5Syo+pqZORR2MlWOdQAETG4d/
	 ifgdWx5Zdg6D6nHH+CzJ/jrj1QK1+0gCiHCxDreHj4rGweboxjftByzcmWkc9Ll1s3A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D5901F01825;
	Mon, 26 Oct 2026 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793004295;
	bh=jz30Kqva1oj2ZOG9QQrY/EiApxn9BM5nq3IuAzI3TSs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gMJKtiEhaIn1a8UWqUtN0VcNNYZr2qYm/gsIoW1ftDtXtGpU7qPh7SpqdZgRHbAov
	 3IIIl2ogDpTY+vBlxc8gH9x83SEg3WaRj8FvSiFvq4usmr5fDEd2cpw7E+pxyo0/Ow
	 hg8hMrpbFiBx+yifOqbJ0V3tzYJY7X5FcmKJ364HsmfbkFPNMbALe5QR9p7bd8pyz0
	 Xx3JrZ6JbeTA+wzR9ZnpMBlB+eZFklCcxK6iuu3X0WFS7razZ5/qo8j1c+FHQpqKFs
	 YYkXyWC6mqaQPOmzYwJB3pxKAZNroon3Vc7Z7pOXKOfwxCioUZUylIo54wRYk8I5Ir
	 lLoF+rr0JB/VA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E064A44C77;
	Mon, 26 Oct 2026 08:44:53 +0000 (UTC)
From: Enric Balletbo i Serra via B4 Relay <devnull+eballetb.redhat.com@kernel.org>
Date: Mon, 26 Oct 2026 09:44:34 +0100
Subject: [PATCH 3/3] clocksource/drivers/nxp-stm: Increase min_delta to
 20us for PREEMPT_RT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261026-nxp-stm-fixes-v1-3-20a64a4ea454@redhat.com>
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
 Enric Balletbo i Serra <eballetb@redhat.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793004293; l=1611;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=2oVeDkpoG/kZGujP8YpSokhvVMo8D6Pr1tME75FCvYQ=;
 b=oJOj++Ax9eLtn9MXj4cg6VRzFKwnoiO5tNLT0d23izNOmKsdtC/1h8bWWET1Y35f76g/bOVb0
 XhycJ+0Wl1tApeDDk7ptKBEbENZ1EAQRpXw1C/GUzgfGlAMb2CHSQBl
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

Under bus contention on PREEMPT_RT kernels, the 2us min_delta is too
small and the counter can advance past the programmed comparator value
before the overshoot check runs. While the -ETIME fallback handles this
case, repeated retries add latency. Increase min_delta to 20us to reduce
collision probability.

Cc: stable@vger.kernel.org
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 drivers/clocksource/timer-nxp-stm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index ed7662a4e2bc..a0761d7f8b01 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -335,14 +335,14 @@ static int nxp_stm_clockevent_starting_cpu(unsigned int cpu)
 	/*
 	 * The timings measurement show reading the counter register
 	 * and writing to the comparator register takes as a maximum
-	 * value 1100 ns at 133MHz rate frequency. The timer must be
-	 * set above this value and to be secure we set the minimum
-	 * value equal to 2000ns, so 2us.
+	 * value 1100 ns at 133MHz rate frequency. However, under bus
+	 * contention on PREEMPT_RT, 2us is too small and causes missed
+	 * matches resulting in 32s wraparounds. Increase to 20us.
 	 *
-	 * minimum ticks = (rate / MICRO) * 2
+	 * minimum ticks = (rate / MICRO) * 20
 	 */
 	clockevents_config_and_register(&stm_timer->ced, stm_timer->rate,
-					(stm_timer->rate / MICRO) * 2, 0x7FFFFFFFU);
+					(stm_timer->rate / MICRO) * 20, 0x7FFFFFFFU);
 
 	return 0;
 }

-- 
2.52.0



