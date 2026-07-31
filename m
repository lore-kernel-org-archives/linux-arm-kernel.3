Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DA7C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 10:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBDU/YtjvhaZ72VaLs77dEfEt1kLZuVD3FCxqe1mOLI=; b=mcPN8+r38aYTGxtKs/9i9T7CzG
	s6NiiPcyxU1iXohdyLMQR7x5IW1X5s5UE5p5sCVa9HnIkGI2vuKKJfD6icE+FBzxPSyWPKTx+V7Mt
	phOER/PL5M95M4H7k7ov+cEQo3iU8YqyIBQZCeUYF7Q/8KXoq6fnkmd1WGVtFAhmKD0Cz7mEZA3bB
	FKV064xmfP2ZCCE1PMHsiUOYi8lhtDeSL+qiUyBUlCJJKixP0CmYkWRIFy+grnSrUv1mY5He7ECmt
	p53br98q3/zS+QLTx5L8yfrCHGZRVWHWqkiRkek+GTii86nEWF6rLOu8mmU1LMsqkyuYGJ0SQZIDH
	9qm2vQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkeI-0000000CL8D-2xfA;
	Fri, 31 Jul 2026 10:39:30 +0000
Received: from out162-62-57-137.mail.qq.com ([162.62.57.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpke9-0000000CL0Z-0Daq;
	Fri, 31 Jul 2026 10:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785494356; bh=oBDU/YtjvhaZ72VaLs77dEfEt1kLZuVD3FCxqe1mOLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eGUycrc/aX1L/RY4O3zh5BxrLUqAlPv1730T51XbgU1Fl3XI+ZmK3OxAG6it6Ub9a
	 J1l0oANL8z18iy24S9ePUrX3hERW0xDgU0GKgEnIr9oRhi3rlyFjVlRRSpmDVApslY
	 8Dy7eTewacsS8pR8wqBU+ag04djS9+qFZjVeTT/k=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 9C92DE69; Fri, 31 Jul 2026 18:39:09 +0800
X-QQ-mid: xmsmtpt1785494353t27rq4q8b
Message-ID: <tencent_2CCE005FC440BF8026599A6999EC04BE1107@qq.com>
X-QQ-XMAILINFO: MVuDTlnnQDnqiN+DIdj/H5VA6Hiln6C8xQjKq1d/daSxtzSNLORWBWrP09X4FS
	 uv4Gz/d+BtLR93RIIThQEYgZ2rc7TqMz5M/gXYygOYA1vLLRavOFhEAXjvzUsSnbheh0ELnlVCdL
	 /5PzUA4+zL8+Jy+ESCP4mU6KpVvO3uIxM3gnWsi1kNUt/DOcTFjFoJGTe3BgfF9CFtmiBA0350gT
	 5vzYMwUMDzM+if/6AatR6ZvZCpVyUx0WIxFCmk0Fwu0O70O9ZGE00b8FcbSoInumd4nIxtELFJYi
	 h1knfXYbZtISKdRUMcgTjiAq2MT5vAJo6V6knvxKd3czKJzWQCVAt9NPUZiTInw9T0t80a/x60Bp
	 qI/e/LXjGDvQRi3jgV7xMO/LK1w9idsglNViUNc6icxpXts5PGW0xbOIFP5FD02O4aTCDafUL6D0
	 oqw/a3yR+Ecbwyldp/S7LH5KhN/xG9O7WY725TyiO55R5h0MXqeBV1SZVcOoPEHm+/L/6Gv4kqrL
	 e4bZEyDD+r0f+Bz6BgLPJM18eod0Lo8HkR6JPkadsQDlcjBDOOdO+6u5vO1HmnNP4LwzFkINUKMi
	 mf6z2rG56Qc5P53yshhZazYho/NifSF5mEkScaM9oXx9cTVWD3xtLmrtdeLjuAZvTYJqUk5UXWJX
	 nmGyidchDlmTUeMDdVawrNQe2JAd2myWDQdXKEeH852fNYNKf0W43ycMIji71UZJtEM0dLLhhPtN
	 18o3Yv12xS6lH9+SdriUZHwNUftfZoo7G0pA3XXRGNYqadXeAH6IvUmdGcAX1Z/0nktjaFb2vsLW
	 bwpBPGjXzFvxBt6NFVaXaky4flgAsiUWwZxmiCu3SjHxWDMr5wyGv9TkSnCc4EaXOBAgTZR60eGW
	 wQ19XEyvlFMYbfV/ha9t2oqiw1gD7SmG+d7BRLFYcCT8qQ7mqdBD411H7yAi/r2xOJaeAjRcKM92
	 wtoJUAvF8MsxugoKLcNX44ANcgqLido3ch2Es5V+ZqFnyvefBFtULEEIkgLfsbgRYefrtpFy2amq
	 Q+LJ2slFkZCNzNRZVkpc2slDZDzNxYgc6QwepAgBAVJV3KPoZsade1mfaMXS2tnS/Zdu2RkQ==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Cunhao Lu <1579567540@qq.com>
Date: Fri, 31 Jul 2026 18:39:04 +0800
Subject: [PATCH v5 2/3] can: rockchip_canfd: retry the outstanding TX
 buffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260731-master-v5-2-5b27029dee20@qq.com>
References: <20260731-master-v5-0-5b27029dee20@qq.com>
In-Reply-To: <20260731-master-v5-0-5b27029dee20@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, kernel@pengutronix.de, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Cunhao Lu <1579567540@qq.com>, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_033921_652010_F5FC4DD3 
X-CRM114-Status: GOOD (  11.31  )
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

rkcanfd_xmit_retry() originally operated with a TX FIFO depth of one. At
that depth, the masked head and tail indices both select buffer 0, so using
tx_head happened to select the correct buffer.

After the FIFO depth was increased to two, tx_head instead identifies the
next free buffer when one frame is outstanding. The erratum 6 workaround
therefore requests transmission from the wrong buffer, leaving the
outstanding echo entry incomplete and the netdev TX queue stopped.

Use tx_tail to select the outstanding buffer for retransmission.

Fixes: a5605d61c7dd ("can: rockchip_canfd: enable full TX-FIFO depth of 2")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 drivers/net/can/rockchip/rockchip_canfd-tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-tx.c b/drivers/net/can/rockchip/rockchip_canfd-tx.c
index 86fa8f2e1c8b..fc338ea865fe 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-tx.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-tx.c
@@ -57,8 +57,8 @@ static void rkcanfd_start_xmit_write_cmd(const struct rkcanfd_priv *priv,
 
 void rkcanfd_xmit_retry(struct rkcanfd_priv *priv)
 {
-	const unsigned int tx_head = rkcanfd_get_tx_head(priv);
-	const u32 reg_cmd = RKCANFD_REG_CMD_TX_REQ(tx_head);
+	const unsigned int tx_tail = rkcanfd_get_tx_tail(priv);
+	const u32 reg_cmd = RKCANFD_REG_CMD_TX_REQ(tx_tail);
 
 	rkcanfd_start_xmit_write_cmd(priv, reg_cmd);
 }

-- 
2.34.1


