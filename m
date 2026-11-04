Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959B4606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 05:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2BjMnZ7k;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYSPBPoI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NaPAIDGDHTTSnPgiyoGnXRPKLlfc2mJQHfqQ2f481xg=; b=2BjMnZ7kvOp2cImVHLegVLHdo8
	58jdni+B35Umql4e29yskyBYEsO6cDGaJLUu06oTtYr0OtGowM1mStxIOn9zCY1WEJNiJQHNMLRYt
	GrkBom5YU8T/wclha+xNds0F8blHLC4lfanW0JHBAOOAuOZGsN5pnfCjXgFpcC6Ph45FnNjiTBk53
	KqMVZJbWKTiDeholsm1D9YwSISGv3I+8J6/KVEGt/rdee5Y/I1CPVxLf3RlaCI6M/xiXe+BxO7uy+
	A9cKlfVoiohPsh01IkMUadlPD80ZTjpdaV56PDFGoX7hRBnNZ//DO8I1x3Fl4w5AY2AvSZYnUR6Sh
	MMBKkO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTdT-00000004LlL-3VXA;
	Wed, 04 Nov 2026 05:34:11 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTdR-00000004Lky-151W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 05:34:10 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1af971cd9f9so27461c88.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 21:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793770448; x=1794375248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NaPAIDGDHTTSnPgiyoGnXRPKLlfc2mJQHfqQ2f481xg=;
        b=PYSPBPoItNBckp0CNbo2nAd54prdEFIEBXhq1ExRGmozBZ1twaLosDqN+v6ZfNMjRU
         WtP+HrTGxYlaGweizIpFVTveRsBZjd6rFb4tSfDeySBJkv/ss28358J+S/gq/XV04Isz
         HmADhM7ENpr2bJrRh+NIeMU+tvjqGLV0GaMd4kD/bJP/MxKbzHYSH199CSy46fAVB6Og
         g0QP2JnfCQza9cjMGhsIt620U4NGgj9RThdP9STKBYBoWfXc4HdGmaG6rwbk3+uXAu5V
         BYgJeZEiee5E5Gi/Wwv86bw8mSahb5PPEzXI6wfgtfzNDoDqOlUxpcTS95Ht+XyQ8Hw5
         Ei/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793770448; x=1794375248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaPAIDGDHTTSnPgiyoGnXRPKLlfc2mJQHfqQ2f481xg=;
        b=zkpxVpvjqXCZrm3pzr21AJ8dsZrA9BVxX5tHOn1d26vtN3g873Qt5ItbbHWp0HEAKV
         FJtCHE7b8pyAcb3DQPc27V6NmoRs1JhV9xie8hx5ghIiKsdN9IjjnBsc8McBDwuxQ5Qv
         Xm2ORF2Ey1pZQjJQS7l46ZCc9GXjUxv1weR5j6FrV0AqFn0nectNxLyNrF+C4MkTQzXC
         diMRvwKhrPiGFVbmr/u/Q6oVPIJEVOh8/Av3NMmG3sl1qmfrzpUMIAExGOgaM5nk6Cm4
         7uDCGbtXTC5v5CJR2Vvcb/KC/iN3jLtQxEyHVgEBvZZwZYMjDbanSKbXv2GlpH0SmuZ9
         pnQA==
X-Forwarded-Encrypted: i=1; AKwUvBw+uGARdefpiAz8GzDpCyzzCYVX2KKJl1B5lWBw2bpLpuxIm7pBqzzS+FYri5BdWdEtpUrmdOB70V10PsJe8iWV@lists.infradead.org
X-Gm-Message-State: APuU4Z/yjsDptZNgiJbiNv3HEn0jWbFE6DixXFDpMddqgB/TJZFq5wgz
	IPcKYPb8qcVnVPD5dPXN5u4f3rvI1/Bxa/E9AQ+EuRWODF3ZKfYOTGHT
X-Gm-Gg: AYBFou0oo3osFYetI7Zdw4dVHgAYHSZkC14VB3PDl25LrlJJ6cSWERxfXmPqZoCAL+H
	sNUcYABzAW7UEXP2aWc0GtQ4N7Modka3NjZHkNmGsaykz2/1WZXe89z+SM/gyWHOx1ZiDWq41/4
	aZ/mxNoA/O1nZ7/ezIaaij3/XGjX0mRR2oIl+uxFD/RpEc5U4Yb16ZqXoricMVx5B/dPzC7k+wp
	Zb8CaKn//j3hwkj4bV7TwDbNLEdZeRUy6s6d6Zt1r8ZbTtVQfxLIGAUfimrSY7T/glNadtaS5jA
	EOm26goWAzVGJecxN8pY0GZrb624KwFQEdDVR5+OzMjKWy/x/sbKhtGc/S27uIIa1ROIEYQb1Mg
	jYwhP0QQ0CqJhzEMl4WygMpQWYPYpVs7KsOezIe1GzS8+7h9fSLhdOl04ZW2tURQqCyyLTxh5iY
	H18U/ho+fDtJqDdstgJ5eZnsU5pVIV1S1W1nbMpaaZhRhBJOKiL52RWi10EZjCUx+TbphUp8Ld7
	rnxLAe+gLd0DO1wP8lQMkdQAbKr3itCY+UIBZDEozRl3Kiki56APUukarRHmnyCC7siUL0JLhAz
	2my0S3GRXaW7OzBx6iQcwCR2tcWmBHlVws/gnlx+Lms=
X-Received: by 2002:a05:701b:428f:10b0:143:5c2a:e45f with SMTP id a92af1059eb24-1ac4f91ef0emr37439969c88.0.1793770447458;
        Tue, 03 Nov 2026 21:34:07 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1bcedsm4263001c88.7.2026.11.03.21.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:34:07 -0800 (PST)
From: Chengyu Liu <lui2012qwq@gmail.com>
To: sudeep.holla@kernel.org
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chengyu Liu <lui2012qwq@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: fix deadlock between reboot notifier and forceful work
Date: Wed,  4 Nov 2026 13:33:59 +0800
Message-Id: <20261104053359.1613991-1-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_213409_302566_921A62C9 
X-CRM114-Status: GOOD (  19.41  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

scmi_reboot_notifier() calls cancel_delayed_work_sync() while holding
sc->state_mtx, but the work it waits on - scmi_forceful_work_func() -
takes the same mutex.  If a forceful transition work is in flight when
the reboot notifier fires, the notifier holds the lock and waits for
the callback while the callback waits for the lock: deadlock, and the
reboot wedges.

Moving the cancel outside the lock is not sufficient on its own, as the
callback also calls unregister_reboot_notifier() unconditionally, which
blocks on the reboot chain rwsem (down_write vs. the in-progress
chain's down_read) while the notifier waits for the callback - the
deadlock would just move to a different lock.  Fix both sides:

- Notifier: compute the decision under state_mtx, drop the lock, then
  cancel.  A callback that slips in between sees state ==
  SCMI_SYSPOWER_REBOOTING (not IN_PROGRESS), skips the forceful
  request and finishes, so the cancel cannot miss it.  (The callback's
  own system_state early-return does not cover a work item that
  started before the reboot began: kernel_restart_prepare() runs the
  notifier chain before setting system_state.)

- Callback: only unregister the reboot notifier when actually forcing
  the transition - that is the only case that needs it, because the
  forceful kernel_restart()/kernel_power_off() would otherwise
  re-enter scmi_reboot_notifier and self-deadlock on state_mtx.  When
  the state is not IN_PROGRESS there is nothing to force, and skipping
  the unregister keeps the callback from blocking on the reboot chain
  rwsem while the notifier waits for it.

Found by static analysis.

Cc: stable@vger.kernel.org
Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---
 .../firmware/arm_scmi/scmi_power_control.c    | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
index 9557363360..b5a0b71505 100644
--- a/drivers/firmware/arm_scmi/scmi_power_control.c
+++ b/drivers/firmware/arm_scmi/scmi_power_control.c
@@ -121,6 +121,7 @@ static int scmi_reboot_notifier(struct notifier_block *nb,
 				unsigned long reason, void *__unused)
 {
 	struct scmi_syspower_conf *sc = reboot_nb_to_sconf(nb);
+	bool cancel_work;
 
 	mutex_lock(&sc->state_mtx);
 	switch (reason) {
@@ -138,11 +139,18 @@ static int scmi_reboot_notifier(struct notifier_block *nb,
 		break;
 	}
 
-	if (sc->state == SCMI_SYSPOWER_REBOOTING) {
+	cancel_work = sc->state == SCMI_SYSPOWER_REBOOTING;
+	mutex_unlock(&sc->state_mtx);
+
+	if (cancel_work) {
 		dev_dbg(sc->dev, "Reboot in progress...cancel delayed work.\n");
+		/*
+		 * cancel_delayed_work_sync() waits for a running
+		 * scmi_forceful_work_func(), which takes state_mtx - it must
+		 * not be called with the lock held.
+		 */
 		cancel_delayed_work_sync(&sc->forceful_work);
 	}
-	mutex_unlock(&sc->state_mtx);
 
 	return NOTIFY_OK;
 }
@@ -190,10 +198,11 @@ static void scmi_forceful_work_func(struct work_struct *work)
 
 	dev_dbg(sc->dev, "Graceful request timed out...forcing !\n");
 	mutex_lock(&sc->state_mtx);
-	/* avoid deadlock by unregistering reboot notifier first */
-	unregister_reboot_notifier(&sc->reboot_nb);
-	if (sc->state == SCMI_SYSPOWER_IN_PROGRESS)
+	if (sc->state == SCMI_SYSPOWER_IN_PROGRESS) {
+		/* avoid deadlock by unregistering reboot notifier first */
+		unregister_reboot_notifier(&sc->reboot_nb);
 		scmi_request_forceful_transition(sc);
+	}
 	mutex_unlock(&sc->state_mtx);
 }
 
-- 
2.25.1


