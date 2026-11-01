Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632DE606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 08:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DzZ1D/aV;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=Y+7sd27m;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=EfxNYLgj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/2n5a1KAjUFX5QIFjKgZa0JwE4I7sEpFIybFYt2nWjI=; b=DzZ1D/aVFd3LuM
	2BH6bahcrD9e+fWW2uCVFPww7VMzs90QtIfLR16RW/AbhjocoaAeXnNRs61Fjj5KxHidOkQyL6XLg
	Loa5NuQ7JMN82KuRY419+4gK8WSuLDMRTeuYAcaV6AqXzlcz2KkyfJxDsulsMCSsl0nnZOa4xmQtB
	gOjeK8bF74kNmM9tmF1cQDkKVeA5lw9z/v9M69Dq57kZAVUUCAZ6nU2xtXturI44tc8/M2Bcs2gHq
	2F/ayotLinplzxuAnB1OA4ZjA6zpnNbhTzQi37CTVeq3KKe7cOL5NtNJBZXeu2maVfaDkBj8ejsmb
	U+c1s6cfcmZ17kpafJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNQr5-0000000Dyq4-0vL2;
	Sun, 01 Nov 2026 08:23:55 +0000
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNQr1-0000000Dynj-2vVw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 08:23:53 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E0248EC069F
	for <linux-arm-kernel@lists.infradead.org>; Sun,  1 Nov 2026 03:23:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 01 Nov 2026 03:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793521430; x=
	1793607830; bh=/2n5a1KAjUFX5QIFjKgZa0JwE4I7sEpFIybFYt2nWjI=; b=Y
	+7sd27mnKmM5K5xYZiX7jcTgIFIugsEJB0hA8B8OOPE/iD9BfMH+SLD47gU4vuDu
	1VfoAWcacluw6uNNY5iTSk+/5G5Ua8FndgExt9nb8RieUm+kqHjNpJWVfjibCUy6
	zSC5E6PqYE/Gjs5EVfzn/Cy/nng68xLGhwwFQmu+gJpv+PA1oguF0lYuIY/GluPx
	J92iPFext9KW+RKa57ghdyqGnR9dGEyc07eCH6hGpwNjlR1YUUnCCzl9+5SFaodW
	MNyoJtAI+45Vmz5mi4CCOMUYA6m6/WQyb4Vd2+RuhuSC64wHRouDzUNjshfUrPHb
	FV965A6JuLP4DMFFY2ivg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793521430; x=1793607830; bh=/
	2n5a1KAjUFX5QIFjKgZa0JwE4I7sEpFIybFYt2nWjI=; b=EfxNYLgjv1SVCMSX1
	UH3BKBBgR1UzfQ0/pWY7+2aEbk4UV9bOB4o2raa7DQjOnRLToPnSdw82qdAh8RFk
	U4rEmBrKLKI5m+FA2G9L4zZXkADVp9MpV64was8e9fZwn5Yynbg/NhX+X0pfLPK+
	DavnBYrKdlW7Nrd8t7S09TRi7lYlwKJ6MgN6NLjnDfdN3pNrqx1Uaw4UuOBL6idO
	dKQKoHsFbMuj6CXKnQcAT2RGrmAghV+eXCEDhDFQbLqnBrLCilXxFsUzWXnCrBhO
	NnJ4SDBpt/6choruu2Q/xkubOWg4pPMBR2Igc+d36D4RZDotDlknipKNL1g/uzMy
	VmemA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793521430; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:Ic9HUH7i0GcrKTEUM5WwDO4EaOd9svJXR5Ys6Y64NLrYOGA
	96AQEe0tq2giOEQIk5MpkHIHn67U7t2ZvO3JMsdusbAu/3P+ezqZFdxRK7FUjqvl
	a6wGjXXhuzxKT5fSPfUP0pqtwVF9w3Kt6s+JE4GLWpahJs1nfzLuho10zNWs2Dow
	jUW6G0/avxWzZyhvLAnZl6/YFlQAvINs809J03AYuZB5CP1c9dNo/9cXHUjWyfBN
	ph0xaEV4cnnrI1a/VvvoCE3gtpoHWuBONMxenI6HS+ny0qEMHl6u1qnac/kw1Cfu
	6ahElJf5os74NW8bgDjWJMAbLq48bdKfXuwcN5w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:gPamqwHn5wnioNhM7KfudWI/2qdHlRl/vF8NOysddIo=:Vf7LRxwe03pqYXW0XI3FI1OLYVjQkdtY+PzZXcUTs/E=;
X-ME-Sender: <xms:FvfmapT9DuObV9pmwbIzM6xrh6ufp2yslAL1OQ7AcUbhD3VH0s4-bw>
    <xme:Fvfmal9NeF6lJSjCo9EVjRZfCZNyCm1tmHiquUXnMQIz8bF1Ds0pT2P13OexaN6ef
    GBu6cUQqIW11stEmgc27o-iNqshREyg4o3cXi4hc7B7weydRgJ2C1TU>
X-ME-Received: <xmr:FvfmalphfX1hPuuN-WjgFA35bAtRv-PmUIJSf6QuSl2Kb-PZ45lQkxgoDrddBlGrZiLyE2jG>
X-ME-Proxy-Cause: dmFkZTG1f5xhzVY1+tDVA2GDAZsCkJLH07r+Yy8eDDwJ6JOhttyoXjIFNLHdIMBXenkhJx
    GYNu1BmhoCEfkR9grTKkLuIJN+OzTEGtgz44pzE7hxNJDyINE2djZDhuIxWCGbyrBAg8N4
    go07QXa3FbJDHoqbVIkh+YewIyKzezBgmEguYHIs5iblTpD6uKFVhdzvoEpK9WyO9LZQh2
    oZjSmXf8essUkIouu3K9xMlLp9+lzsrzT9OlAkrndhtRVZ+s7Dbtf/1n46loyb7XK1/pPJ
    EZkemaWOJwxsmDm91Iwy20kA5um10TciIZ30X1rMTa5jzi7bDygiLl3spCruOgxPW+4DhA
    g3U6HOIKA68F5qwEg0ZcOJZm2a8xkLq53Gw6cZ4F07Nt6B/05TpsQkMcbSUSEgDegH01qo
    MUQpVIxofEuUDfXsQEYfa5d8ZTT2CJ2MFS79UPFV4u5ii/59prjdqrSmyjemWU9DgdInei
    ee/5r6Ea3Zu5OmECHG2SR3+BAfcoH6EEDuvwk5GOyWlV7Ocb7ugE3y6yPdecDZvYRqhBZn
    meV8lnWgW5YaW8MypCmxb8Tq7T9Tx36/O4yQaEPWNBhusKSQx+VdXlWOAIco9HYmRFl6l+
    ngHGwEM5mM6bGG9MNk/ytNU84KRhvCCNO1DiomJztLW99O07DELJ03pEZf0g
X-ME-Proxy: <xmx:FvfmamFsYnzrc86682qZwV0S-xdu7a45yAd15_0EkpCSUivABIXKxA>
    <xmx:Fvfmak37gpoSbw-B5QUgzw79OpTg9-QLQDCXU3tDVFZYP2CU8t3T5A>
    <xmx:FvfmasND_fIhuUEUokfdYFFxNsraWOzMtqCJyXgYJEkk-zoOa6ZSOw>
    <xmx:FvfmatXz6zBIAXqX79y3W7xCP0Y_XaPjLfiBOPXem6xoQ95QyLMD-A>
    <xmx:FvfmamhrBUg-ucJQryAsRoy0d_XGnqZck-GJ-n51uxvQOMP-0OITnxGx>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 03:23:42 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v15 03/15] accel/rocket: wait for a running IRQ handler before resetting a core
Date: Sun,  1 Nov 2026 21:22:55 +1300
Message-ID: <20261101082307.151957-4-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101082307.151957-1-gahing@gahingwoo.com>
References: <20261101082307.151957-1-gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_012351_810009_2DE8874B 
X-CRM114-Status: GOOD (  25.01  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

drm_sched_stop() does not wait for a threaded handler that is already
running. Call synchronize_irq() after it, outside job_lock, which the
handler takes.

Before the sync, mask the block's interrupt and clear its raw status, so
that an active core cannot signal a completion after it. Do that under
job_lock, since rocket_job_hw_submit() arms the same mask under that lock,
and only when pm_runtime_get_if_active() returns a positive count: the
reset holds no runtime PM reference, and with the domain down a register
access takes an async SError.

Igor Paunovic's induced-reset runs on RK3588, including a two-task job that
puts hw_submit() on the IRQ thread, found no fault; as he put it, "this
does not show the race is closed".

Link: https://lore.kernel.org/all/20260819073530.6087-1-royalnet026@gmail.com/
Link: https://lore.kernel.org/all/CAEWPSH5mxTbUkNouxm6yecMZYvDowquhvYvhaXQ8HoMtHD5U1g@mail.gmail.com/
Link: https://lore.kernel.org/all/20260912113717.6819-1-royalnet026@gmail.com/
Link: https://lore.kernel.org/all/20260916132824.13527-1-royalnet026@gmail.com/
Link: https://lore.kernel.org/all/20260919103422.148834-1-royalnet026@gmail.com/
Suggested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, three cores, induced reset, JOB_TIMEOUT_MS=2
---
 drivers/accel/rocket/rocket_job.c | 71 +++++++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 03e5f094f60b..5b2abf40b618 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -401,9 +401,74 @@ rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
 	drm_sched_stop(&core->sched, bad);
 
 	/*
-	 * Remaining interrupts have been handled, but we might still have
-	 * stuck jobs. Let's make sure the PM counters stay balanced by
-	 * manually calling pm_runtime_put_noidle().
+	 * Mask the block before waiting. hw_submit() arms INTERRUPT_MASK on
+	 * every submit and only the hardirq clears it, so on an ordinary
+	 * timeout it is still live and a completion can arrive after the sync
+	 * returns. The next submit re-arms it, so nothing is lost here.
+	 *
+	 * Only when the device is already awake, though. This function holds no
+	 * runtime PM reference of its own: the only one in the window belongs to
+	 * in_flight_job, and the completion path may have put it and cleared the
+	 * pointer before the timeout worker got here. drm_sched_stop() above can
+	 * block for a long time, and it drops every pending job's credits, so
+	 * rocket_job_is_idle() is true and nothing keeps the core resumed. On
+	 * this hardware a register access with the domain down takes an async
+	 * SError, so a reset must not be the thing that causes one.
+	 *
+	 * Only a positive answer will do. pm_runtime_get_if_active() tests
+	 * power.disable_depth before power.runtime_status, so -EINVAL MASKS a
+	 * suspended device rather than excluding one: pm_runtime_force_suspend(),
+	 * which is this driver's own system suspend callback, disables runtime PM
+	 * first and turns the clocks off second, and rocket_core_fini() suspends
+	 * the core and disables before it cancels the timeout worker. Both leave
+	 * the domain down with -EINVAL on offer.
+	 *
+	 * The cost is the other half of that ambiguity. A core that is still up
+	 * with runtime PM disabled (pm_runtime_force_suspend() before its
+	 * callback has run, or CONFIG_PM=n under COMPILE_TEST) is left unmasked,
+	 * because writing to it would mean writing to the half that is down as
+	 * well.
+	 *
+	 * Clear the raw status along with the mask, the way the completion path
+	 * does. Masking alone leaves the DPU bit latched until
+	 * rocket_core_reset(), and the hardirq decides on raw status alone, so a
+	 * fault from the IOMMU that shares this line would wake the thread again
+	 * and what the comment below asserts would stop being true.
+	 *
+	 * UNDER job_lock, because rocket_job_hw_submit() arms this same
+	 * register and always runs under that lock. reset.pending is set here
+	 * without the lock and read there with it, so a submit that has already
+	 * passed its check can re-arm the mask after this clears it, and then
+	 * the synchronize_irq() below fences a handler that is no longer the
+	 * one that matters: the block is left running a task with its
+	 * interrupt live. rocket_job_handle_irq() avoids the same race on
+	 * OPERATION_ENABLE by making its completion writes under this lock.
+	 *
+	 * pm_runtime_get_if_active() does not invoke a callback -- it only
+	 * takes a reference on an already-active device -- and
+	 * pm_runtime_put_autosuspend() is asynchronous, so neither can re-enter
+	 * this driver's runtime PM callbacks while the lock is held.
+	 */
+	scoped_guard(mutex, &core->job_lock) {
+		if (pm_runtime_get_if_active(core->dev) > 0) {
+			rocket_pc_writel(core, INTERRUPT_MASK, 0x0);
+			rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
+			pm_runtime_put_autosuspend(core->dev);
+		}
+	}
+
+	/*
+	 * drm_sched_stop() returns without waiting for a threaded handler that
+	 * is already running, so wait for one here. This has to stay outside
+	 * job_lock: the handler takes that lock, so waiting for it while
+	 * holding it would deadlock instead of fencing anything.
+	 */
+	synchronize_irq(core->irq);
+
+	/*
+	 * No handler is running now, but we might still have stuck jobs. Let's
+	 * make sure the PM counters stay balanced by manually calling
+	 * pm_runtime_put_noidle().
 	 */
 	scoped_guard(mutex, &core->job_lock) {
 		if (core->in_flight_job)
-- 
2.43.0


