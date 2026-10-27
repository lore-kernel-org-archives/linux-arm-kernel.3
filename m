Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443E0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 18:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WuH3uWQI;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=qW5JV1G0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=spM3KcIMCTj+Sev7DLll6n6wD3ZIu3g46O7rzTg5psQ=; b=WuH3uWQIL+FEfJchgHpP1NP4h+
	u0FhLT6GTIR/UfHgJphxqyZW6cy0O4uxd9KBGeiKQFVUucoQKU3JG3u7YpOe90trdF6pzKweCFwYR
	gGtRSxMZg7xqPCLh8KbHa/UeAj5c5TZduu7WZhV5SmqwUIClYwDAGp/IgXV+xQEmEoHGkOiB2vwXc
	jZSngZFImrKVu0utU4GFIW+SL2ds94yBXRAb54Mwx3aXMmNuN+Hp9lygbD4GmFyovrQVOYbM4/5YJ
	C/mfBy0x0FhANVJmDxoIUaZKtw9+9PAFOPXHpsY282NhP19sZRlWnGA9L/9zJxFn5cCXafDtLeMQv
	UbvWNIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlTt-00000005WaF-39WN;
	Tue, 27 Oct 2026 18:01:05 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlTp-00000005WY9-3wvB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 18:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1793124051;
	bh=spM3KcIMCTj+Sev7DLll6n6wD3ZIu3g46O7rzTg5psQ=;
	h=From:To:Cc:Subject:Date;
	b=qW5JV1G0NwjaH8K2vvXH9SaH2apLWuFgqoN72y4/ij8hebgmpAyiCUnPgyl9CS2Oe
	 EulW/NBiap5CVhNdzfogKXbjhg0LUzjt9xs7mjuZuxmGFR6r5T9r3h0Kp9JBNjCm/Q
	 DN/5uju3KPgE8O7UPBLWFVZxLNZQcOEYc7Md4C1c=
Received: from LAPTOP-TKBJAGN4.localdomain ([27.38.201.62])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 3013632; Wed, 28 Oct 2026 02:00:48 +0800
X-QQ-mid: xmsmtpt1793124048t1hi43pfb
Message-ID: <tencent_877C99956190215D644EB959DF1663542A0A@qq.com>
X-QQ-XMAILINFO: N6IfSeM/PG+tdCz5Cj1vhLmiuKazt8ArHwWiFVGNcpvZ35kcBBkkbT142hdYXb
	 EwNVr9Toq0fjfi5FlkZBig7el4RHfpoBiUf8ha4CMdmo763I5EUJs2h2k6LkoK8URenxUj++4Ne0
	 C83Snqx65b/nQdrLw7/snnIRj/2H3xIXAYseTejahOVm+o8fMNLhu8FaAxXOiJxr8pb8iJrycmWM
	 f0cNcynccpVQEw5XNYH0PskUTwGiPxpJfMbcwWJttKumYlXtyx6uoRWbTE/e4OkV2BtR1rlRJ954
	 dCLWXiTZ3y0bwHq4X4IejGyFALnc2+mF8dZizgzf4rON7QhaKQ5nT9OqLrb8Y3uYtSpIrxAu5nVw
	 RpDji+FXBM2PeDY7dJY6JtpCxEz8XCWCacOnw9/AgMOeggSDVjkiO8eFSBpEFq0OGkgFfQr+3cqd
	 XaAExW1nNfDisb61TngEmxk0v3j2m00VdvE574xY8Q5MdtJocsQDUI5LOabK6DnLcPWfg9exMbsI
	 tO6/9NDQD+Gr1O54jRXnP3MX2ZhNLyg5JiGVWkl0ey7qBy53gB7Sk7Z4mKopr/UwbpfMKH0obLZQ
	 2iKbY0x/oGpk0upeIxsL0P4rw4qXNDP7rvKdznRgPYnCFO16W171WT2kjbMSvevuquaFMUfZ2RT+
	 eSgnmC8UcwxBagdfJG+r+TXvyCn+rgV+EwSQSJRTuoFMn118ycZDCXzHEavug5uLUtjDXjVNNv/X
	 sYmrNr2+qznl18QQzow3faBjRIVBXTv6tvZIPoBiy9SbwvBa8L248VP/Wsu6zIfVfhgaYUGMSVtZ
	 W/hl0K1AfY/fDdBwywZQCG/X710Ee3T11fA2lyMEJS+cee3R+yvFKfPBBB9jEF0Z1s8iWbx8X19N
	 Gm3sstgB+ZJPpoPYv1O3LxbbbXsLiRoZQmwTHHv3f9i0NW6/xGic1wNcSlJHCxFlx+2GkvOpVUfO
	 o7zn/UaJwGQIaYpb330ke20sroOgG00WiJ/vhHVycFx1kUDfp73AZ/NDVo1C3G7IIW9NNtA2RzLY
	 au3nOddP9JVoNZFxky6yqWyRSXmtbp/W3Cy/sfd3+9/upNqv4mcPzJqGIoSMw/RAqvK/DG02AWQc
	 NRbgX9S11aqJpHhAu727n3A754nd3m+CzHmxAHRMmjux3+moLX40wjaOBWFrkcmKM7Hb5em6+Lo/
	 8hTEnPo+E0Ox9VqDebhzfsKOXrdaj/S2dDaxm7CSn+kJW3LQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
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
Subject: [PATCH v4] i2c: imx: honour I2C_M_IGNORE_NAK
Date: Wed, 28 Oct 2026 02:00:44 +0800
X-OQ-MSGID: <20261027180044.21532-1-lemonoutput@foxmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_110102_546524_D4871DAD 
X-CRM114-Status: GOOD (  15.10  )
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I2C_M_IGNORE_NAK is removed from the flags rejected by
i2c_imx_check_msgs(), so the flag is honoured as documented.
I2C_M_STOP stays unhandled: the controller emits a STOP after the
final message and repeated STARTs between messages, so rejecting it
would only break the existing ov2659/SCCB use case. I2C_M_NO_RD_ACK
stays rejected: the controller always clocks the ninth acknowledge
bit, so it cannot be implemented.

This applies on top of Vincent Jardin's I2C_M_REV_DIR_ADDR and
I2C_M_NOSTART support [1], merged as c2867bb0fa1d ("i2c: imx: add
I2C_M_REV_DIR_ADDR and I2C_M_NOSTART").

Tested on an ALIENTEK i.MX6ULL mini board (v6.6.44, equivalent
backport) with a logic analyzer: with the flag, a 3-byte write to an
unpopulated address clocks out every byte (each NAK'd) and returns 0;
without the flag it aborts with -ENXIO after the address byte. A
4-byte read with the flag completes and returns 0 as well. Waveforms
and test logs: https://github.com/JHB11Hinson/i2c-imx-ignore-nak-test

Note: part of the code was generated with the assistance
of a generative AI tool (GLM 5.3) from the author's description of
the problem, then reviewed and verified by the author.

Link: https://patch.msgid.link/20261023-for-upstream-i2c-imx-lx2160-reverse-v3-1-a07b249df381@free.fr # [1]
Link: https://lore.kernel.org/linux-i2c/tencent_342A87BFCECA70C9982E68A79AAD878B6909@qq.com/ # [2]

Signed-off-by: Haobin Jiang <lemonoutput@foxmail.com>

---
v3 -> v4:
	- Rebase onto i2c/i2c after Vincent Jardin's I2C_M_REV_DIR_ADDR
	  and I2C_M_NOSTART series was merged as c2867bb0fa1d [1].
	- Previous version: [2].
	- No functional change from v3.
---
 drivers/i2c/busses/i2c-imx.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63..8e422b45d 100644
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
@@ -1712,6 +1721,10 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
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
-- 
2.34.1


