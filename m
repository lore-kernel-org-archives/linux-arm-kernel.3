Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1763C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 06:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6u/mJ1eHhtcpBfaCK5wQm5H38V9X2M73NOfbAlKBO2s=; b=fCJY2q+UpH9xTu4Lt0uBvzDeE8
	/ztsrSO4KLRS/QtbwfK1GAxM8r1FHenLfY2V6CZyQmqVEQ2UFLhT5eNePHOTgs/vTOTKy8XMwKTbq
	F1eeaCoP4GO9t1njp34PCUBwmw0Lkcmg70Z4vtRFZavVi4Fr4B+nZw0G2UVoMSezl33lIGCOqchaJ
	qd68jmgCDNAo51VZZ8MPGQ9xsz5/F8tgCqR88whz3xN+spbP3xHoKhVNKYgA/Qdmv0PPpMjuwdhkA
	ZuPGJU4qNHhCMvL03aQWdPEqcpt/jsrdW3JZEM1j0kEfDXfPX+os5uq8VP9GxArN2Qr844o7eNTiy
	AVsRJFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpJzc-00000009a86-40VZ;
	Thu, 30 Jul 2026 06:11:44 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpJza-00000009a6J-1Eyo;
	Thu, 30 Jul 2026 06:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785391895; bh=6u/mJ1eHhtcpBfaCK5wQm5H38V9X2M73NOfbAlKBO2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=E/5YzZOlnYKYQhUb25D9rzbVBcC3ximQTnpVcFZ++ojv79K0Xqdva6S1ukIiq+t90
	 IGHylDJHv7SLxW0dFMzckw3wzqW65yLiS+NgXH/XrdXhNeXkJXoHsMWxF2hhXUS5Gb
	 GORfRCT0IS3Wueo0jfJKlhNQDmq2wnFeBcRX1Gc4=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 2DF15055; Thu, 30 Jul 2026 14:11:31 +0800
X-QQ-mid: xmsmtpt1785391893tsx1kpqqe
Message-ID: <tencent_D2D30ECD988C5C82D18863401362835F7606@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XFoMCSl6ZInb3+GuQ8gajxOb7Om5LsBNl3hBTktMJbHRntZirGy
	 WEbXlXZrp3uCNOWqNT9oDgKKu69NUPTwn1zHvTdfHFLNy9i3tRuYB5y6GckaW/hdsEr+XsDAFUuN
	 xNLN6kEItGD8z58/qMEWgwXpBqo470jXo8K7NblLlHKp/MhOhRD07phKbNAJSgNzvtmrmqH/8EUu
	 eTVeHeHWzVt3pnc3Ax/pJ1cs2F3aTD63yNe+eRig/XcKfoZB85RiDJtrb+Xdg8H8ySKvWF83MQy4
	 dr4PABrhorsb4NW5lSF2wE5cxb4GRGIHk/fcNHLmlO+pVr6gMjlvn4HeW0+yGoLlMzR5PdO1DTYY
	 9cn6jnn2MQOvxF5vO+fzb7qVcH1iDrEObmbdpmfJ5LUD3AsDLd3q5K4010ltjgn6oC+Nwtjc16xd
	 2+kJAzIi1aTy2gWJkOcXySui0uATnGaSnwMtTRMpSjXN/igNwQkgCB6Cv1EBJkrUEQWf+ATgyldL
	 8T1vKtZYJUYzZiKbjHc/+/JnG75lz54jokhV4VmdcgHBECiV420/DHmnwRZG9F8HnKBxZ80lHW1n
	 5uJImI8U9tevQMnNF0dSq0VtguHUM64+RX+iJcKQrK0C7OFAGYzARDHkPxfIKW9xym8rmcHir9Ps
	 zoHm0Ka1KnaZA1ENzu/0+25CdGl3D2ygNGtM+z+cVt+Krde1nJ9qgxmQrV7GjDGEndx+a3msRDQU
	 26ZER9fJitGMRqcdJr11fCQBeNDMSEkYMD9v2I5CvUcVBzzS3pW51o3WQ3XfBy1GEaAvz2+Yyvn1
	 sbGSScLejuqF27Rm+w6nWObX7cYRejdywBusiY/hqLr9uJFKQxeiv4PGepHOWCXJeLR92aMU9kfG
	 3O4RNTIVu47GPZ1llU3eSgHzJ5WKWBQ/59ljn2iwxFU6NcOov2uQGpPtCaMRNgylYOfONDNMN9vA
	 LD2z06wUdMfTVTEacet+hUPXX/cSw806QB+gRpp4ZkjWqC4wH3v0ab8JRKYlhu5FWlGunQzYfp4h
	 83Ps1S0C9sqfW/bXIkrwYELJxNKRvkyygvvrSIRCly7+Bm0O0CHeXj/+/u2iwcIZv7exifR4k9ZW
	 A7A0EeN+RWxg4rqgVPRxp4inWAK2O1+CzTszP2zvZ6yVgfHxY=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Cunhao Lu <1579567540@qq.com>
Date: Thu, 30 Jul 2026 14:11:22 +0800
Subject: [PATCH 1/3] can: rockchip_canfd: prevent TX stall on echo skb
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260730-master-v1-1-6945fdd4f0ff@qq.com>
References: <20260730-master-v1-0-6945fdd4f0ff@qq.com>
In-Reply-To: <20260730-master-v1-0-6945fdd4f0ff@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_231142_645300_07FA53E9 
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


