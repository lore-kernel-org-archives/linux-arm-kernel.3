Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F32606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SjUCcQ6Z;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJVnyJwz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vy2qrURO3C2NVUk5rtQtWRK30u4eytr719WYCKwsdRg=; b=SjUCcQ6Z4QUdkm2A2liEQaCeJp
	9yl6vDBujIrjEYWdN6VnrN46mL5qsP9HpL1x51hQGEK1cyOxC5VcLmN0VsAKJNCFW2t+gM1jksjBZ
	fPKOLuz/I6a9rN7dcT9IQvr73zbPLQLVzN/SaCgOqxoTWiZ58MBFKQ0MOlO1HtRUv6ksFmzvpiJat
	b0T2UhuDfAQhSE9v+kFvOg4pxxwqEq1safpehQq3L55wayD++YHO8OQKts5apDmtVDiBOCMzM++w5
	0Ucz9zuD+Dw03tIeGC7WnrwPYedCDhF4HhGXcJXPQ9Ps8JO41Q5RHn83TmW5aT/68UWLLIPRy70hR
	R21ibl/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGON-0000000Blmh-2W4f;
	Fri, 06 Nov 2026 09:37:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGO8-0000000BlM4-2VVe;
	Fri, 06 Nov 2026 09:37:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 53EA9403FC;
	Fri,  6 Nov 2026 09:37:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793957856;
	b=BTwecf668M1HZXhhT5Wbc8NIk+2jMFyh36Ul5eTGR/3FdX32sR/LFtd+sicGLcRKHHfD
	 7v86lbnsFVMw4HmtK9s5oRv3t9nUNRkWFtrYiTvin0u5yYQoGk3/7BKFmKP9EBJoCu53y
	 /4axu7ddStJsHwMWWaK8MUi9ZsMuEEMI1XyhzHXUsZNx5EUl84xVXKcj8TQBKTQYTOxqx
	 M9YqPGlLIF2w8kAyZxkq3cbwmTckUODWeHCvA/5tL927ubTzLvyYZe84Kyws88P3SdQJU
	 rEPlVx70ena1i2loapesYNdcephVLQ6AMljH+sMOE0yuNXCZ5YqqZ6xwLmlGtBh/sBw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793957856;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Vy2qrURO3C2NVUk5rtQtWRK30u4eytr719WYCKwsdRg=;
	b=EugPmUDQrd54jR2N5zozA/p/PeOeBQS8sD8M4sCHCxCmNTnkZl+Xnm283R0y5SJZcybx
	 fYUMpKRUMERMAOMaWDUr3Mv8A35/LIyQ304SDL95pzRNGEOM4VvnfIZKNKtvSyYVddOJj
	 bgcYqx3ujOnS3H7HPmXrgsA8u1N8VFGPedy0bijUMYjd4E3IRbviFYon5LC7SgTKyeiBe
	 5vRdx/xoAdhb1qaGtKDgb55808CDOzrAazOKRhpHYj3HlS4xn/1KDpOv7KxU2bC1AdScr
	 bUJXjq8yTMDXznkdp/xXwkFQIp8UlGG1ZwsPWizyIbFvLt6MmZ4oeGgHjsqDLprFXWQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D8D61F008A3;
	Fri,  6 Nov 2026 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957856;
	bh=Vy2qrURO3C2NVUk5rtQtWRK30u4eytr719WYCKwsdRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aJVnyJwzCMxi5faOcNas0Kvg5Ay/acdbOoA8aOij6a8RMrXY+URs+5LvzdV63bgkr
	 GkfHYkeVwsmg7zP33AIogwMEnO0wlkybk8eKfj/d1uPRH0n/TXivzUaer9mhAnzAHp
	 9AfQtm+7f53qgk4nFj61p899GPwEkywwkFqREjzkuv6KJoLAicGj7oWaDtmlD2DFZ8
	 0wKk5WLS57VxnqLx+6gAFVZws2rLb1WppvkN54rOX9yU4qvtS33pxMmXrWOZZgA8Mt
	 +TPqg+o66MSvRJd10Ei5PuzFhrXSUiBbQH2E2g6+r6Lfz0Wyia/OFfy+917a8cs7oR
	 GFg9n02OGw4jA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BAF2945CC0;
	Fri,  6 Nov 2026 09:37:33 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Fri, 06 Nov 2026 17:37:26 +0800
Subject: [PATCH net v7 7/7] can: rockchip_canfd: serialize timecounter
 timestamp conversion
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261106-rockchip-canfd-restart-close-v7-7-accdb11bc845@qq.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793957851; l=2957;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=9VhCsHzQVgwKjVIZpuLTsjW3kBG025wPmIX2/tRYdvQ=;
 b=sz/9NQvLuATVJz94MCNVfIqwEm2Gr872h5VzhPU+f8O4Du68Qr2SXiK8DNtS5baW6aVkFr9W5
 baVm4YY9zaKB9c2wcIDXAyhQp9haK+TO7+5ngmhJSGn34hHn4RLZwSp
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

The timestamp worker advances the timecounter with timecounter_read()
while RX, TX completion and error-frame paths use timecounter_cyc2time()
to convert hardware timestamps without holding timestamp_lock.

timecounter_read() updates frac, cycle_last and nsec in separate steps.
A concurrent conversion can observe the new cycle_last with the old
nsec and produce an incorrect timestamp.

Hold timestamp_lock across timecounter_cyc2time(), using the same lock
as timecounter_read() and timecounter_init(). Keep the SKB timestamp
assignment outside the critical section.

TX completion nests timestamp_lock inside tx_lock; no timestamp-lock
holder acquires tx_lock.

Fixes: 4e1a18bab124 ("can: rockchip_canfd: add hardware timestamping support")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 drivers/net/can/rockchip/rockchip_canfd-timestamp.c | 5 ++++-
 drivers/net/can/rockchip/rockchip_canfd.h           | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
index 1d2a122770dc..e255bb33a20d 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
@@ -15,13 +15,16 @@ static u64 rkcanfd_timestamp_read(struct cyclecounter *cc)
 	return rkcanfd_get_timestamp(priv);
 }
 
-void rkcanfd_skb_set_timestamp(const struct rkcanfd_priv *priv,
+void rkcanfd_skb_set_timestamp(struct rkcanfd_priv *priv,
 			       struct sk_buff *skb, const u32 timestamp)
 {
 	struct skb_shared_hwtstamps *hwtstamps = skb_hwtstamps(skb);
+	unsigned long flags;
 	u64 ns;
 
+	spin_lock_irqsave(&priv->timestamp_lock, flags);
 	ns = timecounter_cyc2time(&priv->tc, timestamp);
+	spin_unlock_irqrestore(&priv->timestamp_lock, flags);
 
 	hwtstamps->hwtstamp = ns_to_ktime(ns);
 }
diff --git a/drivers/net/can/rockchip/rockchip_canfd.h b/drivers/net/can/rockchip/rockchip_canfd.h
index 078876769a05..ecb9e2d6aa19 100644
--- a/drivers/net/can/rockchip/rockchip_canfd.h
+++ b/drivers/net/can/rockchip/rockchip_canfd.h
@@ -477,7 +477,7 @@ struct rkcanfd_priv {
 
 	/* Serialize TX submission/completion with bus-off and restart. */
 	spinlock_t tx_lock;
-	/* Protects timestamp_active and worker reads/requeueing. */
+	/* Protects tc, timestamp_active and worker requeueing. */
 	spinlock_t timestamp_lock;
 	void __iomem *regs;
 	unsigned int tx_head;
@@ -557,7 +557,7 @@ void rkcanfd_ethtool_init(struct rkcanfd_priv *priv);
 
 int rkcanfd_handle_rx_int(struct rkcanfd_priv *priv);
 
-void rkcanfd_skb_set_timestamp(const struct rkcanfd_priv *priv,
+void rkcanfd_skb_set_timestamp(struct rkcanfd_priv *priv,
 			       struct sk_buff *skb, const u32 timestamp);
 void rkcanfd_timestamp_work_init(struct rkcanfd_priv *priv);
 void rkcanfd_timestamp_init(struct rkcanfd_priv *priv);

-- 
2.34.1



