Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97227C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 15:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PHCFlOVYT5AkdAAS5RinGtErzFxHqclGA9MbwMBhMg=; b=PDAQY9B60Y228DeTPlKU1gTt74
	3pPGgSJv9N2aAFKZ6hC1+g83qnbq+3flpXBFdxiP541XMR7Yz77he4he5mNlBkBl6ryvnz2sj5sS3
	sI3+mOlz7umRK6oamdqTi2W4s7XpPiP4h+3CvvmSWrrXRB2Ds9Z+IRSy2AVb6XpZjuRn1g2TL74IE
	+EYyfF88OqK4xGaF/RDBj1tGWm7vcrI4epGROxDfPTHF/ysB/d6JP4OcwNQgOY6y29n6LR/rXyDTL
	TojAgiRqj0K7t//JC+Mz846KwAVPpLfwWkEdQs7sgxIJMqrYah/qZulAMJgwGIlxRfmYKrdwzHV5b
	Xg03p4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpT8F-0000000Atds-2DSm;
	Thu, 30 Jul 2026 15:57:15 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpT8C-0000000Atcj-0kGe;
	Thu, 30 Jul 2026 15:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785427028; bh=3PHCFlOVYT5AkdAAS5RinGtErzFxHqclGA9MbwMBhMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=atIJEyIFwnCG80Vd5d+S9tell50iKk846xc2+5mFikGGJ1YXeRRmydFGS3J2JGLmq
	 zH8Yxfz/S4kjjwleS0gLf0ohr1vD9hDjAfAF4KSbB/AEhcQvMuBsYMMWhC72PsrbTX
	 1J8s6LN4UBINuMeLukGuu0gUCv/RejP15shbxI3Y=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id E4428204; Thu, 30 Jul 2026 23:57:04 +0800
X-QQ-mid: xmsmtpt1785427026tu83fufjn
Message-ID: <tencent_BFFE7E8E4D7E349F32F509B7233D01FB8808@qq.com>
X-QQ-XMAILINFO: MqyaMAvTBNK5cFtZqOJ2p1BVoXf/6YYa4PkdIMjqWrSIk7CVkp5J40GDx7HbDf
	 UAbTVsJRsZLEi27padVS4q1rAUQoyRMYtBZd5E2oXLVYKq/7cuyLz4LrddCxufVSlMb3c2RpseFS
	 ylt1UMHhZhAEu8Ebd56now7Jtx97aVGucSpq7kKX6KbbrQe5KNRZcklo0JrKUNRBBuG8i3KcXNQk
	 bRUrTAaEV7NSdhz0JoQjdxhVO2zIlQPZmDrLnycLlvGvTGQJzCPIJh6jD4LRqb2PEB7nTNocRYOk
	 szD9THfEa2oczgpBpYWLneUzijcCicH025bfa6njKSqbbQYbUBlvqr2Vcky3ydZq8lR6C2H8G0Wk
	 DnEgRBEF/ikXfKdy/X3a6/6D1lI73GVzdU2yAuufAGLZuZfIRoXvST4w3yNetaUVcPJqjE8uZ3B0
	 bsaYFuByHpdxl97AQC5LFutbsIVcrnvE5oAzz1pnsHs8wuddD3nyZUoRRZsHK+ZVh8P9b4Fe6G1Z
	 qXb4YCBxZeSDWYTuCe7O32yq5zvq5ABUC2LYQuYzPb9X3XFbO+94luF3t0ih7O3KmiKpk/ik1Inz
	 VSmCO16ozZ7mdV3E8vqg9MVGFspvOeLM41qB1vUHerezisT5LVntf+ubB7KRV530OVLxVm82aMQx
	 u3gLiW2W10K4VqDGzeSiR5LH7fQyqAXEQgpqjMNCJYXKfDgLBS/Oc59kllryQ0x+SNrPFLBUxQ8o
	 IitXNOqayAd2kv/IVConsANgQr+1m9O6Mx1ibJEOsecXihAEedbyZMUKrUKw1xOf3IMEwzoXZzLC
	 PRcdSs9SxAh3qRccG3deV/eatdRH9Cigzej8ZDAFvhTd2bwlV1DSbz283nRKsu5LqMQ7SCwiZzQR
	 IsjJO85QV9SfMIwo9SQDs3FgPryK1DqQgrDOXvRwLWKmGtSljWSkxnRUPFe6kr3ywdsnHcRtby7u
	 KMXDEjgsgwChTiMe2Hzr+rEk2e1bTYxG6le1Js8XA/Hxl19dnSCINWXz5OJdMEI8Op4wga/dK7PD
	 KUutjNtIEuPD+qSWbr17xHV4PVM1gC8ReaYSiB9ohTyol4J4H7st1x57xLCS4/xoPhqIQsiE38tr
	 CfeJ4d5l9QPSoVAA1/QtnOUpw0lXHAa+ARiTyJjYqEoGjjL+X6fsDwl4vPVumoesaRiHp0FgBAqs
	 wHQIqOkoTqz1248jI4WDOy/7ukWjwriY9xITRCgtzcFf3leXp5z2PsREqAN0Bz8Ap0HKodN3mSLo
	 5cDQ==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Cunhao Lu <1579567540@qq.com>
Date: Thu, 30 Jul 2026 23:50:41 +0800
Subject: [PATCH v4 1/3] can: rockchip_canfd: prevent TX stall on echo skb
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260730-master-v4-1-07f7952f761d@qq.com>
References: <20260730-master-v4-0-07f7952f761d@qq.com>
In-Reply-To: <20260730-master-v4-0-07f7952f761d@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, kernel@pengutronix.de, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_085712_536656_299859DF 
X-CRM114-Status: GOOD (  12.25  )
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
installed, and account the frame as dropped.

This depends on the standalone can_put_echo_skb() ownership fix. It makes
the remaining -EINVAL path consume the skb and was posted at:

Link: https://lore.kernel.org/linux-can/tencent_944DADCC4B42C8484EC01DA2B15F42132906@qq.com
Fixes: b6661d73290c ("can: rockchip_canfd: add TX PATH")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
Changes in v4:
- Split the can_put_echo_skb() ownership fix into a standalone patch.
- Rely on the standalone patch for error-path skb ownership.
- Drop the redundant error message from rkcanfd_start_xmit().
---
 drivers/net/can/rockchip/rockchip_canfd-tx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

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


