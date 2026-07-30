Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDBFC55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6u/mJ1eHhtcpBfaCK5wQm5H38V9X2M73NOfbAlKBO2s=; b=vwkh6/WmI2UWJRhpiCGcBcESWc
	SG6YMZTmj5yCUW5PWm1b6RRjDVOH/BCHaPiU1Ab4qY/UJQni32mGWzBOZ3egBkHt9Xfx9ZeZHl1Wv
	PtTOEL0fwEs0AZm+4DKyuJjeCf2qKfULlcziQBc4H6UNoSY7vPFhiUE83Lj+Vn75bT1+9jWXyRB4u
	iYvb6YKQsiyMskyMEk6KqqZ9gi0YhK0O3RgLO2OkaX85fr/r6qd+7qSN/42ir+PcQgb7+xWEo3L92
	OQN4VnGfetLtxoM5LZ44Y0O4Thasjtg6kYZGp5r/uLH+45JPr7RtWEGzi2hIuw4fomvsjCOkU4EB0
	vJVQljUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNkE-0000000A9HW-3pTP;
	Thu, 30 Jul 2026 10:12:06 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNkB-0000000A9GU-472A;
	Thu, 30 Jul 2026 10:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785406321; bh=6u/mJ1eHhtcpBfaCK5wQm5H38V9X2M73NOfbAlKBO2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=wpifDs9fiALLmaZ3TOoltWT7FNrduusmZfFq/um49qsxm/8FiyUJwXBtjZUHY0YK1
	 2TYLFAB1D9O2QW51uRyqfxRAfVrw0JQ+VAMJal2MXFQZhNHdzy6X1hUbA/DrGvxNH8
	 6Jk/LaaUb4ahNFT5cOp09JgQWppdferNVwCdtq1Y=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 2F88CE83; Thu, 30 Jul 2026 18:11:56 +0800
X-QQ-mid: xmsmtpt1785406318td0ibiusl
Message-ID: <tencent_5E44473FC626379A34998A84DF11E6000807@qq.com>
X-QQ-XMAILINFO: MUl6Z5IrFzo7cvYTPQmep32758Pqrx6xuzT5e+ZVJgC2qfDUG0/jobNOP6ufZ9
	 Shs9z5TOddb7ODPyiq73Lj8ntxQDWfsT7Ebwc7YR6UQHZNJmh0MBsnGv1xvPpxvtTUxWXV/ch/py
	 0pI1h9KFlXKekKZUT/d19DV2CNNh28uFpQGDwwMWfGMwHANt+6yxBZGH+QjZXi626vI5VVOSCdG/
	 mE7EmMgWWFCkSUZRCJpCfEDWKK/Q20134/aeSeelF4oH1JCSLVc+UURZwhn7SSQ9bqe4P2MVs6pc
	 kyexliKwTyhNGP7sejYxZUOEAAuGWY5xLIsmlRJlMXOj2RJLWepcZow+8SVeSSDdeJp48KCKgvs3
	 ux8aBXEd3jPR0iKmzdt3bgbJSzz1Fnw3265XMlZiZPmVbT/cj2Cq2PNY+h/bcsR7HxdV9H6R+K8D
	 zKcRimk7SYEOAgWIM6mfhRVCXTZYj4w0UxHGiT8NJ145qvDfn+ULlAieJ23OWaKtPUhgEi/1CCCo
	 KQFCgfB28h75ZaUXbHDPV5A6JGmByw8LpQG3uUXeR0RcoDRzIHLYYwozS4HorvXcmx0zDC5mEos3
	 oUsKe7x8LUuH3uMIJ98PN1AtsPir7PpucpmDrUL8jEGKAobO9tl3v4wppDyn/Dd3XBv9d+MmEG7H
	 fORkjRgGq4ooZrkx81flxQ6b53IgYjTRV6aZ9RDCnMDNQyhN5sDij73DadCTrP+fBd0Bu7sk4e1x
	 BAj+jfPbAujVCfgkiemMtG1pSOFqQngP70JS89hYyMjtHb7K1bvmPdEXUI7UrhEDUMdi/rBmgA8S
	 KKYNWMeVakBwdMiTLwQgbniwdwx6oQeazwJvmYA7cQ14tXCiWLvA8AomYVtxEPS9nbbq1Yg1R5aw
	 dvhcawDuotWrjyZVV+lTNFpgKlfXqalpN29RAd50BSgyXwxeVcWSQF9RZTMQDWJeqaUF2CQr4KFx
	 t4UM3thDIW+mSw3Ah83nj79RCzp9WEvs8yy0tK1vJwGBF/HNM9cnuIPc4uyz5fQRYIQzHD2qf2Yg
	 OBNxWWImr+BHsZyD6k2pTC2Xk/TwaFXcSrsrXsj0iLEWqiXPoQmwsVVzcvMPst38WyuvNcZ7a5vu
	 SWtV1CGFc0+Fk0QYNNOXqEGgxmEPPhw/FPLSIalncZYqgMF66rNf7sPT/qOj3jSZdemX5ul0GiVl
	 TtflIXiPyqgHmBtzqv/m4PiV6JEMxAvtyRBPG/f5NE5R3VPg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Cunhao Lu <1579567540@qq.com>
Date: Thu, 30 Jul 2026 18:11:46 +0800
Subject: [PATCH v2 1/3] can: rockchip_canfd: prevent TX stall on echo skb
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260730-master-v2-1-572974052400@qq.com>
References: <20260730-master-v2-0-572974052400@qq.com>
In-Reply-To: <20260730-master-v2-0-572974052400@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_031204_336104_B499FBA7 
X-CRM114-Status: GOOD (  11.19  )
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

rkcanfd_start_xmit() advances tx_head and requests transmission even when
can_put_echo_skb() fails. This creates a pending TX entry without the echo
skb that the RXSTX completion path needs to match the self-received frame.
The entry cannot be completed, and the netdev TX queue can remain stopped
after the two-entry software FIFO fills.

Do not advance tx_head or request transmission if the echo skb cannot be
installed. Account the frame as dropped and report the error. The
-ENOMEM and -EBUSY paths have already consumed the skb; explicitly free
it on -EINVAL, where ownership remains with the caller.

Fixes: b6661d73290c ("can: rockchip_canfd: add TX PATH")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 drivers/net/can/rockchip/rockchip_canfd-tx.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-tx.c b/drivers/net/can/rockchip/rockchip_canfd-tx.c
index 12200dcfd338..d2cbe25c46d6 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-tx.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-tx.c
@@ -125,8 +125,18 @@ netdev_tx_t rkcanfd_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 
 	frame_len = can_skb_get_frame_len(skb);
 	err = can_put_echo_skb(skb, ndev, tx_head, frame_len);
-	if (!err)
-		netdev_sent_queue(priv->ndev, frame_len);
+	if (err) {
+		if (err == -EINVAL)
+			dev_kfree_skb_any(skb);
+
+		ndev->stats.tx_dropped++;
+		if (net_ratelimit())
+			netdev_err(ndev, "%s: failed to put echo skb: %pe\n",
+				   __func__, ERR_PTR(err));
+
+		return NETDEV_TX_OK;
+	}
+	netdev_sent_queue(priv->ndev, frame_len);
 
 	WRITE_ONCE(priv->tx_head, priv->tx_head + 1);
 

-- 
2.34.1


