Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7B36070588
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kkshWQiq;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q7UJLD0n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MjAT6tcxdQUYupMnJ6VDsN2Krtta9HnVtSCs1NLKAM4=; b=kkshWQiqhanBE6Kv7M6wg9gKoH
	hg8QA/JNQO3ZlyIidgjeIlisOz2NPj3YqacFsjBeeLPFBFFvtizNM9tEvIUcYOpKCPAXtv/OKYO6y
	uUZbVHIOpRHnr1v7Vb8KJwlYNCEbhEDx1PbdJt1N8UkkRAhBVVzIgeargYXxPRNeyHnvopWJIAfRe
	EoRkstDcWFbBCUkPShstkblVqyCgxNkPC434nJ80VW8nUZc54HHLsYH1ER4WgMGRDYBVxO/yB2t2F
	/MuxNd1B5VGP56acWHsqwP9YN7Y6zCa3IW874CCrc6pHcteev4oamjB4CnuLxTEZ5Dcy9H4NF6f43
	MO4qfpow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGO9-0000000BlMX-23y1;
	Fri, 06 Nov 2026 09:37:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGO7-0000000BlLI-3NYR;
	Fri, 06 Nov 2026 09:37:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 441216062A;
	Fri,  6 Nov 2026 09:37:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793957855;
	b=Ad36THbRFS7mkmraIQBfRKKRrZR6qcizMHZzUE4Nlhw5+Sqd4m1WVxZtTH6cB8LogtXC
	 tDo/4k5fNKm11p2mA925rlREy8246WAIb7yrL0EJvELdL1u7GPbtXF5M5g3unF7soE4t3
	 nMmjzd1jaLc6Stdx/S1uUot4Zm/zTVWcUHvTCzcvzMucUwW1TKhiklZjOczoBOzHqQTau
	 GlER2+vVJGiRzQ8warolRhV64t6AwAHcaw8ui/EZog4NXx9xGrZCXjer6PzKk8qz26I8g
	 cN+JzFzSisjgPOoCHYitgbxRMZxnOQDfwzYUrSz9JDcGGbZcn4wa2a40Y4+gVnNRd9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793957855;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MjAT6tcxdQUYupMnJ6VDsN2Krtta9HnVtSCs1NLKAM4=;
	b=KZZDUgWaTCxRBikdUQQNmLvr7fhSqHN6OQKC1n+j6DCXzWjKwKh8wMGrjUov651onLm3
	 gmSCPcdKIbWivWTyV6/coF9e7eOBF/iwTsGt15ehDG/Z0n9JZOo/29uiqy30vPK31fCcW
	 ztX+DrJ17zBzL7R4GEkSROrHQUsNa+pk36YZOfSpf6BZlcUy84yc2GpLIITSn+9ANCTx/
	 vK+pqHsniZT/0xWxIbJlJyuOwg6ikXQcsx9hacghfl50zY+c7MANHx+bD28nIG6aTVA1W
	 5Gr/HQfCZmxClsKG05la2hMzEl1gLBI3PXeO8TwVb7h9+Eq38rilylQEoeWyuJWoOzw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE4EA1F00934;
	Fri,  6 Nov 2026 09:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957854;
	bh=MjAT6tcxdQUYupMnJ6VDsN2Krtta9HnVtSCs1NLKAM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Q7UJLD0nuLpE73sXSGLQWSlwSFEn3rIt+DrKv4r8+Bc2fNCrRl+1wFogPogYlTtPS
	 G97hekswK9d+FM++zlN0HSL3ImYK5lDvHW+FLA8ZZatkALTzaF1yOkqPGOU+OIQQq1
	 spA6H0S7GS1epJD22If/uoddCe8C4pLYmC/nRJGivgXWSws8K/tTtkBznuz0SJm/lV
	 R++4DOM2qIiGBGZEzI1PKQzcOf3mT1z/ZpvokGMdklluorEooewGsQTgapa5fCmoM+
	 ZxG7G6CojabAtPnOAlGL40p8Y3Zs6QiFzV0PNb8f1LNwERrEGkyTAkcb4IAzkJMpgM
	 d2G/BobWjVmcQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 696F245CAD;
	Fri,  6 Nov 2026 09:37:33 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Fri, 06 Nov 2026 17:37:21 +0800
Subject: [PATCH net v7 2/7] can: dev: add
 close_candev_cancel_restart_sync()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261106-rockchip-canfd-restart-close-v7-2-accdb11bc845@qq.com>
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
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793957851; l=2772;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=46cXQFJirAOhSlbZ8ElaP0fZTVygGkjM0w80cYNhAoQ=;
 b=DnHalpqOJ4fjdDJOTVPErxSULYsdITzqWxiZ9nJLJcozYxvDNT2xgYBBs79aXg/wvEDpva39y
 wrzlIEpUQ+wBF/uejafyC4jB1dVTIUlDWnJ2UUBu/w2uJkvlJnOSBwn
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

Drivers may need to wait for bus-off recovery before tearing down the
IRQ and hardware resources used by their restart callback. Calling
close_candev() at that point also flushes echo skbs, which belongs after
the driver has quiesced the users of those buffers.

Add close_candev_cancel_restart_sync() in linux/can/dev.h so drivers can
cancel the core restart work separately, without accessing can_priv's
work item directly. The helper only cancels restart work; callers must
still stop its producers and call close_candev() for the final cleanup.

Use the helper in close_candev(), preserving its existing cancellation
and echo cleanup order.

The following Rockchip fix uses the helper at the start of rkcanfd_stop()
to wait for recovery before IRQ teardown, leaving echo cleanup to
close_candev().

Signed-off-by: Cunhao Lu <1579567540@qq.com>

---
Changes in v6:
- Describe the helper's use by the following Rockchip fix.
---
 drivers/net/can/dev/dev.c |  4 +---
 include/linux/can/dev.h   | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/dev/dev.c b/drivers/net/can/dev/dev.c
index a893a49a3381..39271a3ef0fa 100644
--- a/drivers/net/can/dev/dev.c
+++ b/drivers/net/can/dev/dev.c
@@ -537,9 +537,7 @@ EXPORT_SYMBOL_GPL(of_can_transceiver);
  */
 void close_candev(struct net_device *dev)
 {
-	struct can_priv *priv = netdev_priv(dev);
-
-	cancel_delayed_work_sync(&priv->restart_work);
+	close_candev_cancel_restart_sync(dev);
 	can_flush_echo_skb(dev);
 }
 EXPORT_SYMBOL_GPL(close_candev);
diff --git a/include/linux/can/dev.h b/include/linux/can/dev.h
index 6d0710d6f571..1b08ee263b1f 100644
--- a/include/linux/can/dev.h
+++ b/include/linux/can/dev.h
@@ -22,6 +22,7 @@
 #include <linux/can/skb.h>
 #include <linux/ethtool.h>
 #include <linux/netdevice.h>
+#include <linux/workqueue.h>
 
 /*
  * CAN mode
@@ -115,6 +116,22 @@ struct can_priv *safe_candev_priv(struct net_device *dev);
 
 int open_candev(struct net_device *dev);
 void close_candev(struct net_device *dev);
+
+/**
+ * close_candev_cancel_restart_sync() - cancel bus-off restart synchronously
+ * @dev: CAN network device
+ *
+ * Call before tearing down resources used by the restart callback.
+ * The driver must quiesce restart work producers before calling
+ * close_candev() for the final cleanup.
+ */
+static inline void close_candev_cancel_restart_sync(struct net_device *dev)
+{
+	struct can_priv *priv = netdev_priv(dev);
+
+	cancel_delayed_work_sync(&priv->restart_work);
+}
+
 void can_set_default_mtu(struct net_device *dev);
 void can_set_cap_info(struct net_device *dev);
 int __must_check can_set_static_ctrlmode(struct net_device *dev,

-- 
2.34.1



