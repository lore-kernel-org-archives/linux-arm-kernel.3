Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90854CC6B1F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 02:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlaBJZtNavmX6zCqmUviGf9ic7El5j7ShsoZ2FR8fJQ=; b=bgYpmJUcIq/RyIghLfyfD5WUES
	pBFmfTDhYr0D/PHGN1+SVt4Jh8gSVSDfC9LhNGFP7dwyEr1QHyvmvR4NJof8oWv6/1ShBQlTq3xRr
	VrdGW5HeyFXMvhX5Kl2ym6/c0LaKHM2hDWdZ4sE2BKorBS0WxRjI/Hu4Z+pvfj811XXpfV02Tpkm2
	KSWW6VAdODrEqeJGsPwaYroAwnvrotNLSgtfAcCdj/KzZlZoC3BzBl71kosx9eMZJ878ciwshP03X
	ZzJt8kvCpqcL+lIiLG4goUL7KSrsLWwsIn3pV+XHqG4gyaKfAfaK2aa2Dvv2z8opCxsKj0I27QS1S
	MggzxAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGp8n-0000000EOjl-43oX;
	Wed, 14 Oct 2026 02:54:54 +0000
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGp8d-0000000EOeM-0cq0;
	Wed, 14 Oct 2026 02:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791946478; bh=SlaBJZtNavmX6zCqmUviGf9ic7El5j7ShsoZ2FR8fJQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KNZ5/3MOiDTg+1Mpnm0y3eB4YHNu8lHUe2grCMxXq7sPHxeYU7p3oMOPEodLaGvi4
	 DC4rneJoy0zwgwYyXz/M3dTyd1lena9zqssATe4bipnnvwROPa7ABehUfTKxiT6X63
	 oK+FDLNlCr4aASLV5MvR4eKKPvOpOrlGazcNbS9E=
Received: from ubuntu2204.localdomain ([2409:8d20:7f:35d:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id D9F194D5; Wed, 14 Oct 2026 10:54:31 +0800
X-QQ-mid: xmsmtpt1791946475t0lby78zb
Message-ID: <tencent_1A4427E01591CB0FA02998E6444633016705@qq.com>
X-QQ-XMAILINFO: MUl6Z5IrFzo7vV377QRRxDj1H2eZN9VpYU5KY/su5UDqE03n4ei5n6d+3zQgSX
	 /7iiIrkOt8lr0WSb0kxz0k8zN9ipX6D1ZcmhKIe08yoN0W9Bx+6KKggl+nWGljEpNtWzV+AwIXsC
	 T7mD0CcASAzgl/O3AQ07bdSf0dLgbjcVGQufZHl7bpM/uBZu3RfZonYWOKj5ckyTyrfSZ5Ez2hje
	 +lNvuJuh7g6WxcZudsaC7yAgKvfUdIM9JDl4Aa/EYZcCtHdJxjdtpBQqN8qJ+ba9vLeXTXBojXIz
	 MTzz0aAR1XMGMnS8AM6BsPj8DwG+3MnzvE82fyYiMQMIDJn1BTYFKNO02BWo61uodZ3sBkTPgA2V
	 0WbpH0eK+Qhrb5OnOe0soszLV6fgl28Syz0oPJo9t1wNup6RLYk65OHCspxb851HtYpDLNEb8KKh
	 uFjKZPv4+StV2vYisu//b2/Pg7oYTphvKWXTF2MPUurwOryg/4znOQT8D/BjsEWAevttzgR0s4S0
	 Yl4MC228cE+K8STx8Qm2moGfnemeNEEjdPiwPtK/DZZ4dJFBKCQLN5ixmqGLcjfrLmi6Vzgp1ZVc
	 MVq5Z1I5uQNYFqDLsV3AxR8/qtdb352o4qtNEdVSOnicNxklInpFTBpaHQFWMR/r5jYM5KvMa+Ub
	 ls+sNHc3t55r4ViP/2B3ZQIbqloOlg5o5nylfRZQtjFyDsqw8lVC5AhraOiBtaNXbz8KosWLEuHE
	 qRj2NI7AnIWGD8NSR53HDSEfWo7YuPVFsjGBM+Ldrw2Juxtq4+fgyLAd6MkQxHOMuMhdV2/aZ6+X
	 Zjv72C2z9h0/26VAqVvHXqJ9F1nFOA9JOFceFzSQlXr92IDkHSdPs2RTo59Sw2wKZsqisgKf20oQ
	 svdPVIQKgb1Nv/6PUvHGCN0V3wOoiyupqRG02G8tcgzTSiq9xQ4xomIN3cX+1vH61WF8j+QL087D
	 7VVZ0oW1bvGdnb6BZ8qNe5watUbOjWQuEYZ4jJSxWVx5SG6OWAiXgELxmOyi+qlRZX0385POda4i
	 5GFw4c2GrIhXAKHPTCxg2gb3Oq0yTWMMebyBrPzM4VTN46C2p9ZVZH+M+d6H+5szQfuBgN7WFMnw
	 OJ6+z2m4VqXdU/ZLL9TexVyO275TzdvVzk+TY+Unh8DbMPX40480spxdVInwu/nrCKEvQLBeIJMk
	 oPmJpYSUf+8lCcwRTroK7mhumv
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Cunhao Lu <1579567540@qq.com>
Date: Wed, 14 Oct 2026 10:54:23 +0800
Subject: [PATCH net v2 2/3] can: dev: add
 close_candev_cancel_restart_sync()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20261014-rockchip-canfd-restart-close-v2-2-c8fbdfad1803@qq.com>
References: <20261014-rockchip-canfd-restart-close-v2-0-c8fbdfad1803@qq.com>
In-Reply-To: <20261014-rockchip-canfd-restart-close-v2-0-c8fbdfad1803@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Wolfgang Grandegger <wg@grandegger.com>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, kernel@pengutronix.de
Cc: linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_195444_520126_CA4CF155 
X-CRM114-Status: GOOD (  11.79  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

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

Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 drivers/net/can/dev/dev.c |  4 +---
 include/linux/can/dev.h   | 12 ++++++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/dev/dev.c b/drivers/net/can/dev/dev.c
index 92492c503446e..52e8c4854ae0d 100644
--- a/drivers/net/can/dev/dev.c
+++ b/drivers/net/can/dev/dev.c
@@ -534,9 +534,7 @@ EXPORT_SYMBOL_GPL(of_can_transceiver);
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
index 6d0710d6f571d..a277d12332f15 100644
--- a/include/linux/can/dev.h
+++ b/include/linux/can/dev.h
@@ -22,6 +22,7 @@
 #include <linux/can/skb.h>
 #include <linux/ethtool.h>
 #include <linux/netdevice.h>
+#include <linux/workqueue.h>
 
 /*
  * CAN mode
@@ -115,6 +116,17 @@ struct can_priv *safe_candev_priv(struct net_device *dev);
 
 int open_candev(struct net_device *dev);
 void close_candev(struct net_device *dev);
+
+/* Cancel bus-off restart before tearing down resources used by the restart
+ * callback. The driver must still call close_candev() for the final cleanup.
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


