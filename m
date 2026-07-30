Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE89C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSzfCjcKQBbYGMl/77NJGr8X/fP7WAcQkZ2m2AgNZks=; b=pMu6eq+IPJG3/A4AM+Z9aRtY2p
	MmxywNmF4Etw4hyU9sbI9gkGo1AWGNzMu/Gq8k4IFK8UfbNnUkUwBpHlq/cSNTh+Bnu1rBEyG9BXa
	Rra7VZUapRRbTXBk2i1q2/IHtlrAn2WElLBiz0NDDWMVpBIDEoQUZmOeZbwcAHrkPc6vlNamnFPLF
	vBaPLQJcZRpiKYXZqZRJLX8Z8z4dm2uPaHYF8EEadTSD0ZaAUYEerrG0CLAM+EVlEgJUn1WPMhOI8
	PaXBEuBgFI9Gn5ayftiu8sKYxp0IoBpkxChdFKEl4IdeXAJ+rFLkifaP615COgztdhuTnVUMntaYI
	THPbTnHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpR8W-0000000AexI-3meK;
	Thu, 30 Jul 2026 13:49:24 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpR7y-0000000AeYv-2sp7;
	Thu, 30 Jul 2026 13:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785419327; bh=hSzfCjcKQBbYGMl/77NJGr8X/fP7WAcQkZ2m2AgNZks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=rbp0N0iqC1nGruFAj7g1GYeCvY0l2MEg6WJ97hCqeu6u9YY8Tbv6RRPesqcXn9dbR
	 vXrE4E9C8OEcGLZIjeyciNi+VVF/uZMlxH+apgU/FRnIzVyil41WCZWqO5TwVFMQ8l
	 pGAo2fusJR+WSN2RUP3to5jx/qDdm3Zsau4kbWI0=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id C291AE95; Thu, 30 Jul 2026 21:48:41 +0800
X-QQ-mid: xmsmtpt1785419324t8zgq7sl9
Message-ID: <tencent_A7CBE824C48D68057C23BAF8E1355DD0BC0A@qq.com>
X-QQ-XMAILINFO: NQQUvflVuqBO4/3RjWmvbSZKNti16VzVsLzOSGSV+YgKEdsKDUG33QXv2iqv5a
	 G5VL0jBmGu4H9VJZ/iVeKyoJxVSJaSD87TzaZvxrOm2VvHowcPhkup4L+ezUdTv3JnO6zHGUVwSr
	 PJjrBn2J+CBShzLqdBcOwfhYmAC+38VX9pq/FgCt+kf39hJqT+1BWCf+0PrtisCvtn6tGYJSu7JN
	 aIaVankjutTTY7bcGRFQZiD53GlUq8QsBYm/FRHhC9shymJijNtESzh5Gqj9k5jpybsrdvjOYtxg
	 J4VH2CX2s0Lke+NmKTt6SsRk/WV1HLx+jBiHxLhMeekj+PBdh4BBWRbv4QwPqlL/K0zAH0qKLQ9Z
	 fdqiK2w1lmErK+j0h/wprXET+gKw7/fcJuANnyGSs1t1O5y7EGCLp+oqC7GlGspMWZdNAPnRFkqS
	 zEI49HY/PfpdibSrfivP8Nwm7Mp8EiIN9O19cKukakpBzXhloYSWyjY581Bns3SM8JKvqEGbl9bt
	 q+kkE5MfX90LZ2uAsMVinlXmCp8gm4DNhbvDciVOGHTeP4CFibcY33vRLtJQbkTujSMWDhe4x5ZD
	 BrBKA+oqOuNnzmIgufeJT2LWsBVgTQAvBqwMu2a9LMRy3Tb7XNrTSdLbPnXqzfn7ZD0nMwtHP/Py
	 SEV4KXANEZg4vbPLgH4jOwNNlerKUtbzJ8OXuy09XAb5wILyi4UQDAk0Jmq4EFT8gcyMVy+ja2WN
	 rKteHTQ5f0SY+/dKj7vBz0Ut1JOzTNWc7z/ycfKg0y0fluOeUHAv3BwRcObz6OhEa0P94s9+ecjw
	 RZ+TkOO6mpfUcxnNnnvpbYWOkI6XfovGVC+oYdz6yYGC7y6nOBu+Q7rPfvhBu9flPwqOaFknJYYe
	 2MNx2j8Dm0N9Xi7oRIJCdhmj58/ED4A6C1fbYzXRka6wz+R7BefRHQvG5uVuQw2OCLHi22Q5h29A
	 q0z+NVN37vNOc4WIio/Lzt47T1dYZBzMX53Nz4vlgdqrNOJ7VZE8QjpFQFDCUNhQlNaD0NusNwNE
	 6oRw2GXOGHfW1X6RH7RhqB0OIOLkc5ERbIZnLvccUCX+GwpyOiQS86XunUJu1BgM6yyTJhg7B402
	 cMxwhXCAoQyQsBsIsGmXyJzwjvXGm+F4ELnpxXj4LE5gkHCn8w9KFXphyM2ps2IKFhNoS0cNKHm8
	 U9HvPpS4jBU15ZT2AGmEsGFHVs5QYbgipNEsg=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Cunhao Lu <1579567540@qq.com>
Date: Thu, 30 Jul 2026 21:48:39 +0800
Subject: [PATCH v3 2/3] can: rockchip_canfd: retry the outstanding TX
 buffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260730-master-v3-2-91cf030c337d@qq.com>
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
X-CRM114-CacheID: sfid-20260730_064851_054509_942241CE 
X-CRM114-Status: GOOD (  11.45  )
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
index b1954b72560c..2b5cd6aab31b 100644
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


