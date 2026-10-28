Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACB7606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 06:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QXpvwsG6;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=gtvc8xLO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vQof/cj2rfQzelHAPjIhcxdxd60z5aCplNluzkoFJ+o=; b=QXpvwsG66OS3iGdllM5YSNoYkY
	HQBTh34WQtYcTl9Tl939+uvgR5ROAqa9XLOjSdapxIXFuv2sxWhM5EPo9OVzlSvN2ghJaBNzLwz8W
	ps1ENDeEVfEp01BHELKefzIug4cXfVLE2LqFBtG5diH6U6NtlIUlgbP6ZgSBn8Zsww9tSxVx5of/z
	N94tuBXdJ/tg2CDv6lmk8zL0fWh3j22FKfwXKIGtce9L755nV7QdbsMUgeS/wwG7/9cUvS0Y6dXK5
	H1vouhdFTzL4mwHi9VlMblUEStWMedbmqduQtIt0xsEQJ8KjBHRww2YeY/72Jigd55Z6TTfqe8EgP
	kIL9GSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLxEu-00000006PwM-3hhf;
	Wed, 28 Oct 2026 06:34:24 +0000
Received: from out203-205-221-210.mail.qq.com ([203.205.221.210])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLxEr-00000006Pvz-1r4M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 06:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1793169255;
	bh=vQof/cj2rfQzelHAPjIhcxdxd60z5aCplNluzkoFJ+o=;
	h=From:To:Cc:Subject:Date;
	b=gtvc8xLO7ZPjwXBX2FUduGPYhQKtTAFfpPAKtDZzGDWhCwIpmJ6bteIrgVRHO8G2L
	 XxGO5AscHPjKao0PxRe7Fy942q1YOLxv/pp3YAfuhTXRxNRam90k6JPQWcwnWKCXCA
	 Xmds0w2YWiJhPBElSa0bmjJ137HvNi2yX9rR9zzo=
Received: from LAPTOP-TKBJAGN4.localdomain ([27.38.201.62])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 87A2BC36; Wed, 28 Oct 2026 14:33:58 +0800
X-QQ-mid: xmsmtpt1793169238t2xcorkks
Message-ID: <tencent_E6D69775D91AD9FE45C994B3755CB1452506@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3Juz8BRtUTIynhC7xXOfHjjR0NWlufK1lc8NauVMKx5cGNn+stB5Y
	 g78ip6EvWmYmz1jfKCNsytbtwYz3nCGwMHrW3ISNHhI59rEjHExvEjGU97Boo2OM7hJxDRFyTZqQ
	 +hJdOyhfVaG2DJX1OVnWV5pgGUMumk6i/KH4vBK/FDXx8vfuvgd5xZg/AVjW/DvvXHqgbalHb1RD
	 9z4cFYyu7Ordh/NjSgPsqpsJVOH2a3LngM4vAWSshyQIfysVNaQNCY/kQWb5zLLIjXfXfiBAGK6L
	 Bgg9IM5ISSFDfb5oJ9mejV7EK+Sf56iIKDZfRz0wAL+a1FBMOXmbOH77tG1UFY6ntIliUa5x7m8q
	 w1RHyna+RYF96hJR7tgaNzGNhpzR1orME4DXPEetDMfA0k7JAa/ruCmxSVbwoi+CLaQ47xMRPyC3
	 r87qt7tI2okiJq0J7W1mWe4P0KMzyo/veznRIq9a8V0DuKlCKreFMeGT0DE4neaUVkN5dJ21V0lV
	 uzD9dARAb/YsLYA1sfZwZ2utQMT/P14wFmaxA07jNW2eThpn5bV2DZeCY7c1PVyLpBBR8l76Unt+
	 chnU0tChMvy8q1VNUQFEu8Yyq6XsLMINDqnRY6l47CMxMB8dxlDa3XnzgLULpDtrWwCP2JBrlC11
	 1NavXBCGaDNzR/pngkBlIgxLvTw5SZqBw1Kj7LeyvJuTovUDzQ0J+EQ4t3hlnR7+vfspBLOrcGsV
	 zVBPcT+ot29s0SfZBGNJx0hqmqC9k90dswwmVADoYBi3wziJJN5EpZpZvpa37F0h66PNWkOKmtFL
	 /tfJX91lYDFyqCaIzziMYv87Hduh0T88uGgiDyZSlTpvv19vhT1MW2v6c4AiHfPNRBGclXOslZre
	 /fQQTg4ANrbj2aP+BONSjE3uNojDo9UgBLZXdPde3WQcZ7A3DkfzW1GcYLNqC0exKDDPBMO/vhKP
	 ILpkTeRbQdkILV6mu3C+UIqxW2KAnldrzD9c1W+rXcsiv9S/eXI1gJ7rGwFo3YEVg8JkENwA9UHh
	 KOKtBFuFzQ0bG/TmxgSlH9jO21ihL1L6XO4aP0V5JTdnnabF/wR7IAYPdlmXr7KKTN+0NJ48ZWps
	 Ie79+l290bRm6QmpqmvaaNTmZx+X6RL9SzgF1q
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Haobin Jiang <lemonoutput@foxmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-i2c@vger.kernel.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Carlos Song <carlos.song@oss.nxp.com>,
	Vincent Jardin <vjardin@free.fr>,
	dillon.minfei@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haobin Jiang <lemonoutput@foxmail.com>
Subject: [PATCH v5] i2c: imx: honour I2C_M_IGNORE_NAK
Date: Wed, 28 Oct 2026 14:33:34 +0800
X-OQ-MSGID: <20261028063334.24845-1-lemonoutput@foxmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_233421_815324_FF912F56 
X-CRM114-Status: GOOD (  14.21  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Honour I2C_M_IGNORE_NAK for supported PIO transfers and keep flagged
messages out of DMA.

Following Sashiko's review, reject zero-length reads carrying
I2C_M_IGNORE_NAK before START. This prevents the newly supported flag
from exposing an existing receive-path bug, without changing unflagged
zero-length reads.

Link: https://lore.kernel.org/linux-i2c/tencent_877C99956190215D644EB959DF1663542A0A@qq.com/ # [1]

Signed-off-by: Haobin Jiang <lemonoutput@foxmail.com>

---
v4 -> v5:
	- Add a scoped zero-length read guard following Sashiko's review.
	- Previous version: [1].
---
 drivers/i2c/busses/i2c-imx.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151f25581dd3059ee874b606d0dc94c..1e2fd699f4fc658f4a9298cd1852455966018e37 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -612,9 +612,12 @@ static int i2c_imx_trx_complete(struct imx_i2c_struct *i2c_imx, bool atomic)
 	return 0;
 }
 
-static int i2c_imx_acked(struct imx_i2c_struct *i2c_imx)
+static int i2c_imx_acked(struct imx_i2c_struct *i2c_imx, bool ignore_nak)
 {
 	if (imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR) & I2SR_RXAK) {
+		if (ignore_nak)
+			return 0;
+
 		dev_dbg(&i2c_imx->adapter.dev, "<%s> No ACK\n", __func__);
 		return -ENXIO;  /* No ACK */
 	}
@@ -971,11 +974,15 @@ static int i2c_imx_unreg_slave(struct i2c_client *client)
 	return ret;
 }
 
-static inline int i2c_imx_isr_acked(struct imx_i2c_struct *i2c_imx)
+static inline int i2c_imx_isr_acked(struct imx_i2c_struct *i2c_imx,
+				    bool ignore_nak)
 {
 	i2c_imx->isr_result = 0;
 
 	if (imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR) & I2SR_RXAK) {
+		if (ignore_nak)
+			return 0;
+
 		i2c_imx->state = IMX_I2C_STATE_FAILED;
 		i2c_imx->isr_result = -ENXIO;
 		wake_up(&i2c_imx->queue);
@@ -988,7 +995,7 @@ static inline int i2c_imx_isr_write(struct imx_i2c_struct *i2c_imx)
 {
 	int result;
 
-	result = i2c_imx_isr_acked(i2c_imx);
+	result = i2c_imx_isr_acked(i2c_imx, i2c_imx->msg->flags & I2C_M_IGNORE_NAK);
 	if (result)
 		return result;
 
@@ -1017,7 +1024,7 @@ static inline int i2c_imx_isr_read(struct imx_i2c_struct *i2c_imx)
 {
 	int result;
 
-	result = i2c_imx_isr_acked(i2c_imx);
+	result = i2c_imx_isr_acked(i2c_imx, i2c_imx->msg->flags & I2C_M_IGNORE_NAK);
 	if (result)
 		return result;
 
@@ -1249,7 +1256,8 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 	if (result)
 		return result;
 
-	return i2c_imx_acked(i2c_imx);
+	/* I2C_M_IGNORE_NAK messages never take the DMA path. */
+	return i2c_imx_acked(i2c_imx, false);
 }
 
 static int i2c_imx_prepare_read(struct imx_i2c_struct *i2c_imx,
@@ -1268,7 +1276,7 @@ static int i2c_imx_prepare_read(struct imx_i2c_struct *i2c_imx,
 		result = i2c_imx_trx_complete(i2c_imx, !use_dma);
 		if (result)
 			return result;
-		result = i2c_imx_acked(i2c_imx);
+		result = i2c_imx_acked(i2c_imx, msgs->flags & I2C_M_IGNORE_NAK);
 		if (result)
 			return result;
 	}
@@ -1401,7 +1409,7 @@ static int i2c_imx_atomic_write(struct imx_i2c_struct *i2c_imx,
 		result = i2c_imx_trx_complete(i2c_imx, true);
 		if (result)
 			return result;
-		result = i2c_imx_acked(i2c_imx);
+		result = i2c_imx_acked(i2c_imx, msgs->flags & I2C_M_IGNORE_NAK);
 		if (result)
 			return result;
 	}
@@ -1416,7 +1424,7 @@ static int i2c_imx_atomic_write(struct imx_i2c_struct *i2c_imx,
 		result = i2c_imx_trx_complete(i2c_imx, true);
 		if (result)
 			return result;
-		result = i2c_imx_acked(i2c_imx);
+		result = i2c_imx_acked(i2c_imx, msgs->flags & I2C_M_IGNORE_NAK);
 		if (result)
 			return result;
 	}
@@ -1613,8 +1621,9 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 	return ret;
 }
 
+/* I2C_M_STOP is the controller's native behaviour; don't reject it. */
 #define I2C_IMX_UNSUPPORTED_PROTOCOL_MANGLING_FLAGS \
-	(I2C_M_IGNORE_NAK | I2C_M_NO_RD_ACK | I2C_M_STOP)
+	I2C_M_NO_RD_ACK
 
 static int i2c_imx_check_msgs(struct i2c_msg *msgs, int num)
 {
@@ -1625,6 +1634,12 @@ static int i2c_imx_check_msgs(struct i2c_msg *msgs, int num)
 		if (msgs[i].flags & I2C_IMX_UNSUPPORTED_PROTOCOL_MANGLING_FLAGS)
 			return -EOPNOTSUPP;
 
+		/* The receive path cannot handle zero-length reads. */
+		if ((msgs[i].flags & I2C_M_RD) &&
+		    (msgs[i].flags & I2C_M_IGNORE_NAK) &&
+		    msgs[i].len == 0)
+			return -EOPNOTSUPP;
+
 		if (msgs[i].flags & I2C_M_NOSTART) {
 			/*
 			 * NOSTART continues an already open frame. The first
@@ -1712,6 +1727,10 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 		use_dma = i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD &&
 			msgs[i].flags & I2C_M_DMA_SAFE &&
 			!(msgs[i].flags & I2C_M_NOSTART);
+
+		/* A NAK'd byte may not generate a further DMA request. */
+		if (msgs[i].flags & I2C_M_IGNORE_NAK)
+			use_dma = false;
 		if (msgs[i].flags & I2C_M_RD) {
 			int block_data = msgs->flags & I2C_M_RECV_LEN;
 

base-commit: 123cffeca4a33d770c29ff8d3f22453a5fd59c32


