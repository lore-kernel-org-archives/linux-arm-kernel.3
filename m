Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EF46070599
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XakovEvT;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cr6ejxUv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eq9e5/JVOIYpfaf2X6q2/pV4dCFq8e5rt1cZux4duCo=; b=XakovEvTM+yjtfLeluCV5H6sBV
	FyYvGnaohQiSHUYTvR8efCL2exXCz/BDN/6WeA1urHCCDqnes4j0OMxAoP0ep+s3BSQt5bp9EiJQs
	y8j0l9Bh1alIXioUhY2l4VLdNGqKNfURqMRX9Rw1iTsYMqMzaGT2MWn2BCY3bcletvTcCKwSCi51z
	/cTtqT3nAoKXMeU7zgV44Qm/DSV/9f7fxjpvTkaOoEoQQF2j6oCD2WPwyhAUz/dB9j1N23Avfbeib
	A3V9QaxlZIPo6JP6Kzn95mGZdvB4WNeDpV0s/veXJz/FVgQeR7j/mfEch45GsbO94GEkCGZlWJlvi
	8UoxKuCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGOB-0000000BlRa-15fB;
	Fri, 06 Nov 2026 09:37:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGO8-0000000BlLs-1Ym6;
	Fri, 06 Nov 2026 09:37:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FD1C42D83;
	Fri,  6 Nov 2026 09:37:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793957856;
	b=VPjVMP6hDoEa9F+Qm6en2ASZnE3B+fD9nF/d180BFyoGrss1jWaF7d0lyJK0M7l+IAZU
	 Y9AExoTKtPUQkepYxF6zxR+gJE4lTCSqvJoDj+LDGDlnvUu2yQoJQHPhCUOmjSW1VI6eL
	 Fxf5BoDBVbrmpFCRMnTdH7wgWTLZzyZBlkzgy6cD6GJVBPWa0S66ge7Y3Zqk8ABwhwz60
	 KZF54Ah3wj3ESGGwHeok1gu/TyHbms0hkCVcorQbuC6M+kYviRzJCEap6VKVJrzYr6wzo
	 eiALr3qrb2z5YX5x0exO5VaxPCpTGABIIllCPOa/umPolUs6xEW9SrpJXYrm0wrhTJg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793957856;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eq9e5/JVOIYpfaf2X6q2/pV4dCFq8e5rt1cZux4duCo=;
	b=lYj3h8TqukePkczZBaxr0o3i/j7ofECs37NFnTf0LpgX1xm4XsB7OTnSWTH9P08f85jK
	 B8l7JuW7OO/27ZhD10IaFGnmPL+qqfg3BvW032i3842STC75uig084Es605eYsRblLsWM
	 za/Sepm2FnLaksDHoc1WNtPpNef/Ywjh2Po46DvhQR4b1GAMMbwwdkkfsVgyggkrGzo+7
	 FuVKnVidxGsrJ5aKQ0XKZups+lVN0BzRri3BPipL50CTuO6yOX41qbEFEAqifc7wtI2xq
	 ON+2gtCpMEGOZKv4fDZLtoHEe1PBveftsR5AFYf9S0u3d+Zx5PlqYyHyQp4a5icMMTw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34F701F0092F;
	Fri,  6 Nov 2026 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957856;
	bh=eq9e5/JVOIYpfaf2X6q2/pV4dCFq8e5rt1cZux4duCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cr6ejxUvFAj+PEJpiaBAQRaCzZgbRWmYiZpg11CgLT/aK+ja2grnP/L/3r2e3JLdd
	 b+WV3vTwITstZ2qZaXSS8XwNvaE2x8DQuK6xh9hrO5puR+qvVGmDp/9cXOAGHxvaxj
	 Z83TFzmH0iNbYh4lKr0qvQs5aMnUGGjq1G1UteFZETwBjRD6z5JfCU2YtzaQjMsP9R
	 krwUSlkLJfdzZdkW/2VnQnhcf/BP2/3KSJwvUOYAnCCUDVh1mhJtK+jijMX3C2vaOC
	 rnxYEKENhX/6Q/PXghzsLPBkEvqcDToZ5Dg+cQ4L+SkCsaEXwCqN/ugeO0bqvertG1
	 sWuTijU9IFp9g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AACD645CBC;
	Fri,  6 Nov 2026 09:37:33 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Fri, 06 Nov 2026 17:37:25 +0800
Subject: [PATCH net v7 6/7] can: rockchip_canfd: prevent timestamp work
 from rearming after bus-off
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261106-rockchip-canfd-restart-close-v7-6-accdb11bc845@qq.com>
References: <20261106-rockchip-canfd-restart-close-v7-0-accdb11bc845@qq.com>
In-Reply-To: <20261106-rockchip-canfd-restart-close-v7-0-accdb11bc845@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Wolfgang Grandegger <wg@grandegger.com>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, kernel@pengutronix.de, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Cunhao Lu <1579567540@qq.com>, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793957851; l=4333;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=SOO163gzYNYZNP6n4OTUiW0fL5Doo8hMgGkDjKR3yOc=;
 b=v3Eb7AUU44S2vzABSrZSahv4Srx7OImuvmgWdoBAG80QO1eryPiddCh3E8WUHp6CW8STytDri
 DG2BDSs0K0+DlfqXpyKl3XgALPg6Z1ljFV8hLT2xEoeeiPjGKAfLZ1h
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
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
Reply-To: 1579567540@qq.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Cunhao Lu <1579567540@qq.com>

The bus-off IRQ cancels timestamp work asynchronously. If the worker
is already running, it can requeue itself after cancellation and keep
polling while the controller remains bus-off.

Add a dedicated lock and an active flag, initialized once at probe.
Serialize the worker's active check, counter read and self-requeue with
start and stop. Clear the flag under the lock before cancelling work
so no worker can read the counter or rearm after deactivation. Enable
the flag and schedule the initial work under the same lock at start.

Keep both cancellation calls outside the lock so synchronous stop can
wait for the worker to finish.

Fixes: 4e1a18bab124 ("can: rockchip_canfd: add hardware timestamping support")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 .../net/can/rockchip/rockchip_canfd-timestamp.c    | 34 +++++++++++++++++++---
 drivers/net/can/rockchip/rockchip_canfd.h          |  3 ++
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
index ad582afbbd68..1d2a122770dc 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
@@ -30,18 +30,27 @@ static void rkcanfd_timestamp_work(struct work_struct *work)
 {
 	const struct delayed_work *delayed_work = to_delayed_work(work);
 	struct rkcanfd_priv *priv;
+	unsigned long flags;
 
 	priv = container_of(delayed_work, struct rkcanfd_priv, timestamp);
-	timecounter_read(&priv->tc);
-
-	schedule_delayed_work(&priv->timestamp, priv->work_delay_jiffies);
+	spin_lock_irqsave(&priv->timestamp_lock, flags);
+	if (priv->timestamp_active) {
+		timecounter_read(&priv->tc);
+
+		/* Serialize requeueing with timestamp deactivation. */
+		schedule_delayed_work(&priv->timestamp, priv->work_delay_jiffies);
+	}
+	spin_unlock_irqrestore(&priv->timestamp_lock, flags);
 }
 
 void rkcanfd_timestamp_work_init(struct rkcanfd_priv *priv)
 {
+	spin_lock_init(&priv->timestamp_lock);
+	priv->timestamp_active = false;
 	INIT_DELAYED_WORK(&priv->timestamp, rkcanfd_timestamp_work);
 }
 
+/* The caller must quiesce IRQs and timestamp work before reconfiguration. */
 void rkcanfd_timestamp_init(struct rkcanfd_priv *priv)
 {
 	const struct can_bittiming *dbt = &priv->can.fd.data_bittiming;
@@ -93,17 +102,34 @@ void rkcanfd_timestamp_init(struct rkcanfd_priv *priv)
 
 void rkcanfd_timestamp_start(struct rkcanfd_priv *priv)
 {
-	timecounter_init(&priv->tc, &priv->cc, ktime_get_real_ns());
+	unsigned long flags;
 
+	spin_lock_irqsave(&priv->timestamp_lock, flags);
+	timecounter_init(&priv->tc, &priv->cc, ktime_get_real_ns());
+	priv->timestamp_active = true;
 	schedule_delayed_work(&priv->timestamp, priv->work_delay_jiffies);
+	spin_unlock_irqrestore(&priv->timestamp_lock, flags);
 }
 
 void rkcanfd_timestamp_stop(struct rkcanfd_priv *priv)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->timestamp_lock, flags);
+	priv->timestamp_active = false;
+	spin_unlock_irqrestore(&priv->timestamp_lock, flags);
+
 	cancel_delayed_work(&priv->timestamp);
 }
 
 void rkcanfd_timestamp_stop_sync(struct rkcanfd_priv *priv)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->timestamp_lock, flags);
+	priv->timestamp_active = false;
+	spin_unlock_irqrestore(&priv->timestamp_lock, flags);
+
+	/* The worker needs timestamp_lock to finish. */
 	cancel_delayed_work_sync(&priv->timestamp);
 }
diff --git a/drivers/net/can/rockchip/rockchip_canfd.h b/drivers/net/can/rockchip/rockchip_canfd.h
index 3664124a8da2..078876769a05 100644
--- a/drivers/net/can/rockchip/rockchip_canfd.h
+++ b/drivers/net/can/rockchip/rockchip_canfd.h
@@ -477,6 +477,8 @@ struct rkcanfd_priv {
 
 	/* Serialize TX submission/completion with bus-off and restart. */
 	spinlock_t tx_lock;
+	/* Protects timestamp_active and worker reads/requeueing. */
+	spinlock_t timestamp_lock;
 	void __iomem *regs;
 	unsigned int tx_head;
 	unsigned int tx_tail;
@@ -485,6 +487,7 @@ struct rkcanfd_priv {
 	u32 reg_int_mask_default;
 	bool tx_enabled;
 	bool irq_suspended;
+	bool timestamp_active;
 	struct rkcanfd_devtype_data devtype_data;
 
 	struct cyclecounter cc;

-- 
2.34.1



