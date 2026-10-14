Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91440CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 02:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkxb/SSvWmoJe26HTtHwdhNk0MSZX0RLO3LLp8B2RzA=; b=njYH4ccKgnF57QAtw1K/ofrk+i
	CPiUAv2dDt2a1PF55i9oIF3BfMZmYMQ+AZ6FofmoLVBmr1+DmIHZboS/0Ug1hp/g5vImHwnvWPVz6
	yYOiy68mocUSW3eItSjn0qMwFPGuRZVG/tQ+fRcYMqKDXu6aDikXZQLoo5nLLBk5SyS+UNehoXAeQ
	Rz5bHXnaNr2Wm+1G26lqJq62m22pFQlR1r5eIa4Sc5U+bQtMgEOoONxCsDMKaXN9mbQLkGeb75SXs
	d05Fmwdoz78p5sTYjHALtjJiYqYwf4fOfzRiMHtAuCDlay74HCgztgdzLH9+nUiJEJpcfPZx9q1xl
	OXSAZ8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGp8r-0000000EOmn-1N8r;
	Wed, 14 Oct 2026 02:54:57 +0000
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGp8b-0000000EOe6-2ToR;
	Wed, 14 Oct 2026 02:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791946476; bh=bkxb/SSvWmoJe26HTtHwdhNk0MSZX0RLO3LLp8B2RzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KAVCdpnnmDhYevQxOc0Mow5176er9Wiy+bMzWBp5zLm8y4FMP+K4YgyE2cScY7rrZ
	 940RNd1HTiQWBjWxvGXhwoPUMhXEYsw8y/cDwt3rhyevvFUop4P0IKaf1CbJrh0sNh
	 yOYDWV0WDNmmYHEZ8SLu9kjarvVc5kFVw/d+5DvQ=
Received: from ubuntu2204.localdomain ([2409:8d20:7f:35d:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id D9F194D5; Wed, 14 Oct 2026 10:54:31 +0800
X-QQ-mid: xmsmtpt1791946473tjd2h8u74
Message-ID: <tencent_196A2433801631CD2FA42998465E26316105@qq.com>
X-QQ-XMAILINFO: OW/hvONf2Ob/Fv5PtXrSHO3o8leLMIOT/zbKLJ/ZSXvI26/6VVSH6VIIkOITCM
	 wfUEePpEWQfE55IMcuu4zToWE/qxBFV+Yd28b+4uOYxUV3FsXhkwLTxDwlOwhkSREjC7/00ZjFT9
	 mU+n5XpEbBymlsM24cCMOxLmgdM9F9Lz8O2hb1qSz2uC+D9z4eX6dXX5hRBYqhQZxcGY+AaAfkwx
	 cIU7oXoGQUEjToTAtiGDEemkD/WzXN5B655eZ/zRSFcE3JvdklQawptKNSpzZ4xZH8dumVC5uEZV
	 /vgM1kZKGcio8KUVwCNyOfF7awGzxLWD2sPL9UdNkEWDPTT2Aa6lLR480JIrpLBJejEQBjprxucS
	 kCosNiBBJL4HC7MB07p6YTYsZjBU4hQta/uVefNghRPd1fyPVBiOUAu432RKZ60fPInuDfeUMJAn
	 YymOtMTgv/Wc//KNi03yt/Bb1UiCZZu2RDQPzupn8yl+2aJja7gCV6ZYy7ce+nDagMnO0eVXVy4X
	 CRMk549afx7NHo+5uzhyx1qPulU74NSeV9Q41mRYiINKeB38btaalJrl37THto55EKNtqhozGnCg
	 peFyRhNgXbSEcur/ptLaYvRn5ASdZ8SzfaGYG+OMORvJScx5F62j3dVhe45Yl/v12OPWwEYhoe4O
	 8cld1rBKNI+gwLCdgdiBVCCsHWwiIPdJT3jZYxAVfapOBcY9zxzhaV7V6+K8HOlP605UiCgIQMsD
	 v1CWXM7wigTZJ/6MPPXR8oKEkqPQLi0tsaRph7zZtkoxtFoVfhaLoG5aCpzuskc/LUZMQ2xIeXd9
	 EhoK9RNKIdyY+BiAUGGi0zN1sYdh4yrAQzxShgBRLHrvTNqEQsGH2FFByTT2XnswQ2ugfuD5Moc3
	 sD4WYgPtSe/elyUpRl4WtS77byUDSuDneNP44JXvZol/7ONKDq9KX+4Y0vcVAws3P41QKSnJP8QQ
	 BaiuuK4EtN0C0CA8fESZOZgoaSHjuQ6CmDmeY8UaeXHYYH+Dc5vpc9tcM0YG/X0xeXNHQucd/UAC
	 rEh+83IV8gg3ky/ROx+vAoJdV/3F3nKIBh7iI87fBa8SMJ/pX6gHyvynSQ4LPqQqyQgMuPATZgS/
	 ZM6MW1Jy9DXa3SBoHLSO4Al5MoucXadTujNY026LxoICMI6CD7/BmuYDEs1FwdTVHU7NnpHSeoNJ
	 m8iEMHPqpwmNErKw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Cunhao Lu <1579567540@qq.com>
Date: Wed, 14 Oct 2026 10:54:22 +0800
Subject: [PATCH net v2 1/3] can: dev: prevent bus-off recovery when the
 interface is not running
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20261014-rockchip-canfd-restart-close-v2-1-c8fbdfad1803@qq.com>
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
X-CRM114-CacheID: sfid-20261013_195444_518718_BEF8EE7A 
X-CRM114-Status: GOOD (  14.11  )
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

The networking core clears __LINK_STATE_START before calling ndo_stop(),
but CAN bus-off recovery neither checks this state before queuing work
nor before calling the driver's restart callback. Recovery can therefore
be queued or started after the interface has begun closing, potentially
re-enabling hardware while the driver is tearing it down.

Check netif_running() in can_restart() before flushing echo skbs, sending
the restart notification or enabling the carrier. Keep the existing
unsupported-operation check first. In can_bus_off(), only schedule
recovery for a running interface and make the log message reflect that
decision. Keep reporting bus-off and disabling the carrier.

These checks do not wait for recovery that has already passed the check,
nor serialize the check with work submission. Drivers still need to
cancel restart work before tearing down resources and quiesce its
producers before their final cleanup.

Fixes: 39549eef3587 ("can: CAN Network device driver and Netlink interface")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 drivers/net/can/dev/dev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/dev/dev.c b/drivers/net/can/dev/dev.c
index 769745e22a3c7..92492c503446e 100644
--- a/drivers/net/can/dev/dev.c
+++ b/drivers/net/can/dev/dev.c
@@ -198,6 +198,9 @@ static int can_restart(struct net_device *dev)
 	if (!priv->do_set_mode)
 		return -EOPNOTSUPP;
 
+	if (!netif_running(dev))
+		return -ENETDOWN;
+
 	if (netif_carrier_ok(dev))
 		netdev_err(dev, "Attempt to restart for bus-off recovery, but carrier is OK?\n");
 
@@ -264,8 +267,9 @@ int can_restart_now(struct net_device *dev)
 void can_bus_off(struct net_device *dev)
 {
 	struct can_priv *priv = netdev_priv(dev);
+	const bool restart = priv->restart_ms && netif_running(dev);
 
-	if (priv->restart_ms)
+	if (restart)
 		netdev_info(dev, "bus-off, scheduling restart in %d ms\n",
 			    priv->restart_ms);
 	else
@@ -273,7 +277,7 @@ void can_bus_off(struct net_device *dev)
 
 	netif_carrier_off(dev);
 
-	if (priv->restart_ms)
+	if (restart)
 		schedule_delayed_work(&priv->restart_work,
 				      msecs_to_jiffies(priv->restart_ms));
 }

-- 
2.34.1


