Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E46C55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONkuWJoYMXmzmFJOtrPO+o4lB8RdG1erITb6YI05sIM=; b=V9YAlBTMDHHYElqJh3o48k6GPh
	mBcmGm69DxzVfH8+G7OmbXwEpoQIIhdyBtYXwTtAQOzApM6dVxlGNGSXswely9fwdP52i5Wf/6xM/
	FN5VGIWmWQKJsnN8IT3r+5q1TniCQGMu9xoKbuhUE3m/h7CC5b2mFOzVOerdo+n2UVq6bgXMmO27S
	siDb4Fzuidey2NM98SNkGr6Kgh5q5QL3yaH5keZPROv+iAHSYs72YaHcSsdVr4vJLGbH9y4uyTxlJ
	bTd9sGYIWAuoXjKRWVuv5B4f+U5SSLQ/QLbkfRwjbRQlvIs2IVA2D1tdz/HKmBWYwCkfbag39iCK4
	r4rT/t0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpR8F-0000000AelT-27Zt;
	Thu, 30 Jul 2026 13:49:07 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpR7x-0000000AeYf-3rLW;
	Thu, 30 Jul 2026 13:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785419325; bh=ONkuWJoYMXmzmFJOtrPO+o4lB8RdG1erITb6YI05sIM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NqXebNFcyyU5ukb9jads+SS+btZs7q87p+gJUtJLmWAYGZ4hZnFucEtVqo/81ted3
	 9ZnvQ1iInRIEuOvdzRrd5V21DpH4fpaQJfcHzS3xAwXoQoedvfAyzZIvH3Mi6dDHZA
	 sASjS7Bgnvg0NAQaqllQWlf66QTOt5DjytVTjI3k=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id C291AE95; Thu, 30 Jul 2026 21:48:41 +0800
X-QQ-mid: xmsmtpt1785419323tlvq9mxgv
Message-ID: <tencent_1BD50002C4093F92A6181A5D99D004949107@qq.com>
X-QQ-XMAILINFO: N0owoQ1W9Lqu7rauOP5KjS7qg7ZYuIQgECUvBh5vZ2ytWR9/1SDokP6+VmvA1v
	 1qzLG1EId5lEGrpokE7Sptc2BeVO3P3mC9C6ZNn5qQVFTOFoGZ2Kdh/Bdedw8+HCiEI4/Zu8df9J
	 BuLPirMYY4Qi/3hNjcKrM+kbLyDYo6UOtVosDpRTiZJvMll80fp7j27uEOs/Aia1DJoA+MeYzuy3
	 mDoDxXmMJ5gNx8K88Cg7YHrJMJwrhwz906Bi60cghzlZGgfTMoiNRA8LdYj7xHPMjFcQistqDuCY
	 IfWAkZoY6mTxFi/4mJ0vkVvqpCvxGzyvpc1lk/cBSsE/Fl8u3eWmIoNI30s5FUfRqcuOl2vqrfJU
	 booUUByL0/4w6qeBUPb4Tl/QaQNoNFQf1VLej3w29Rb75MDpr1kqjNbThiqJuMvOmccubr0L8475
	 GsTwryTnCcLk0ovDUhb6YLIbnU1ukg+JchHVYP38Fz9327mDJr0AmK4Q25b+uZJAJ7839ZEMD5vm
	 8oeIHJoTq2cur004oL/V5aKNeMw36u33phGI5zqHJi7neXtiL6grN/4yYBT4NIltQATpZcgya0gw
	 0LdTOApDECmidNzAE336Jx4v8HOyUxL5yr8uJgZjTreJNFeHWbiTfAvNtR2tfjL4AsZdN8To6dgh
	 jglSXz4+1OQkJhA3x3GIVdCT1PKxW+/gSGoaMkbCposXQSytPxg2v3OjzVSMwB/aTtNGBL4nwjvA
	 hhqsgnPKFEOteXvQefczUP3oUEl7c9HCz98xG0vKIFMZIFAiwgidKGVjKl07oJ+NY5Opu5aHoLW4
	 +ledtZnNokQKHJoTRITdJyuQj4V9fpdxa+HkzDw//m5xcCPPVWK53pprGazwcvSA4QUQIPPsAQGi
	 iKzI08ug0BxqlxVIQbeFKBGmXbYDmOYjYbTvbRB5a9nkucuyCujQKcu0Mjj6uUdCT464IOBxTT4k
	 w1rtRcvRAaqgLK8c2HDHuiuwtomaUbXRJausmr1hmA5KdYs1+MN3fFkYtHrXhsRZw8Hh8fuce5fm
	 kbNEoAiRzkXZTU1MUweD7RkIybK6Z+FACqy8EtYm5Tse4PDQJXRNzDr27fqphOJdNP4Mxzjvo4iA
	 HHYqcgA2k7iErO1fAqtq+1VZY9Ox9AWi8wtvTDZht06MyGqmWXPvO35LfMJkC9nDi2cZ5XQV/2oS
	 53QukszZYJ0ohVRuTnPSlUsIUka5K8UQf1maY=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Cunhao Lu <1579567540@qq.com>
Date: Thu, 30 Jul 2026 21:48:38 +0800
Subject: [PATCH v3 1/3] can: rockchip_canfd: prevent TX stall on echo skb
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260730-master-v3-1-91cf030c337d@qq.com>
References: <20260730-master-v3-0-91cf030c337d@qq.com>
In-Reply-To: <20260730-master-v3-0-91cf030c337d@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, kernel@pengutronix.de, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_064850_301833_2B4059EE 
X-CRM114-Status: GOOD (  12.69  )
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
installed, and account the frame as dropped. Make can_put_echo_skb()
consume the skb on its remaining -EINVAL error path so that callers have
consistent skb ownership after an error.

Fixes: b6661d73290c ("can: rockchip_canfd: add TX PATH")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>

---
Changes in v3:
- Move the -EINVAL skb free into can_put_echo_skb().
- Drop the redundant error message from rkcanfd_start_xmit().
---
 drivers/net/can/dev/skb.c                    | 1 +
 drivers/net/can/rockchip/rockchip_canfd-tx.c | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/dev/skb.c b/drivers/net/can/dev/skb.c
index 95fcdc1026f8..44ebeba99837 100644
--- a/drivers/net/can/dev/skb.c
+++ b/drivers/net/can/dev/skb.c
@@ -54,6 +54,7 @@ int can_put_echo_skb(struct sk_buff *skb, struct net_device *dev,
 	if (idx >= priv->echo_skb_max) {
 		netdev_err(dev, "%s: BUG! Trying to access can_priv::echo_skb out of bounds (%u/max %u)\n",
 			   __func__, idx, priv->echo_skb_max);
+		kfree_skb(skb);
 		return -EINVAL;
 	}
 
diff --git a/drivers/net/can/rockchip/rockchip_canfd-tx.c b/drivers/net/can/rockchip/rockchip_canfd-tx.c
index 12200dcfd338..b1954b72560c 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-tx.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-tx.c
@@ -125,8 +125,11 @@ netdev_tx_t rkcanfd_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 
 	frame_len = can_skb_get_frame_len(skb);
 	err = can_put_echo_skb(skb, ndev, tx_head, frame_len);
-	if (!err)
-		netdev_sent_queue(priv->ndev, frame_len);
+	if (err) {
+		ndev->stats.tx_dropped++;
+		return NETDEV_TX_OK;
+	}
+	netdev_sent_queue(priv->ndev, frame_len);
 
 	WRITE_ONCE(priv->tx_head, priv->tx_head + 1);
 

-- 
2.34.1


