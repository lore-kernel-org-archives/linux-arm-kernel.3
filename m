Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73225606D80F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yPRsXwJS;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=Q3pU2m0z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GvZBAEU8dxyAwu/EctxNWLT4xXzkZ6n1H29EGANwqog=; b=yPRsXwJSUmT7zGEGQYeuW5ecGc
	6ALotfqyCqdWsciF5p8Wwv1K6MakkOx8NY/q0QxSNmEQPP4XcCmQ1o8DsYeiRCUpvXQkJhgvdqBdJ
	/is9lM4+nzz2a8NTgmXNcypjv7foP5uiM9mwAmbfMpdGOI/er0e1YGpRomUWOoC4fu+QbT1DG1Q+2
	UaG0NZvC051+58xT/SL1VwE/F4GUzpVWlO0E3WsqDiP+mi84YOAR+tWljv6gl+Xgf9CFwglvFfjpf
	sLk7+YeZKFOQAVUcc5682iGCa0ZaIR7iMjo4XzmXh0UctMIZ4n1q47yPzeivJ8BxlZvC07dxFoIN7
	Uloc/WuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPG8J-0000000BgYm-2xpl;
	Fri, 06 Nov 2026 09:21:15 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPG8F-0000000BgXi-3ERf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 09:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1793956867;
	bh=GvZBAEU8dxyAwu/EctxNWLT4xXzkZ6n1H29EGANwqog=;
	h=From:To:Cc:Subject:Date;
	b=Q3pU2m0zVs2GZcAwN99ypsUbtIDQ7t8CZmoHzrovDoqsfl3GcejxUgoNO/r03bh6N
	 DVFnTHYjlcC+FAFIqiQ0B7mt4M1y62HeyQCHf3b8SIkldwumAUsc6A/mKCMyPeEKjd
	 wxSU6gLlci/Y5+W3IgQuq8+zcXknCepVcrqD04/E=
Received: from LAPTOP-TKBJAGN4.localdomain ([27.38.177.45])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 542216C5; Fri, 06 Nov 2026 17:21:02 +0800
X-QQ-mid: xmsmtpt1793956862t3gymxzx9
Message-ID: <tencent_D0E2628A4AA62FB8B265B2A28BBFA9566B07@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9X0IZDcDm4iVakmb6joYjsPsfTRE7OaZgQkREcxV9ZjKTDK00Hnm
	 hUBgYvwsAcqgahNYVoGUN5rrbpBNdmeqUM3FTNkDBi2KC7N5km64977NdtCmPILdqWc6nooP6btY
	 CivS+6lSDtGK9ezJIziIjfwiZSpXX9S+b8fQ+7YfAbvRQ5M0nYArCxdN2Wo79dl3rmtFRCRFY/j+
	 tfY98g1CIi7L0E34fO8jh11ByxLJPFNAR6DE3Ufq9IWKXEbYlHoxx+ALZiZhGUoOoSHMqHXJ4FRg
	 Pc5hk7UjXtvWdbdXa/f585Tq92Zh5BkdVg6QcjaUHqQsInior5KSRALTlfb0KCf6DSI0TditDp+S
	 lMrOookH7OKE7MNBHSk8BwgTYv1tOqE+exqyyq6JN5m8Lglk8gGITK2vuFoDwRfuXoUwwjutz3D6
	 vg+arRzZpQfNfQPHcRHRtUk1Nsu4szO44f9+qxozisg+2DKO5GkP2ecyJ6cqZLI1MXP+w8gv9S1C
	 7TlyMcPGoUTjFFvGoPGrxQQ77YFkpamLJKHDIyuKTmUcIcAhof1r8XQoq9aBjCZyJUhgmG4yCfTt
	 hPfMA/g3pySbH/i/tpadJaJkYZYcbbnOhDWlVY3Ae5yEE8Epe7L4jmuO1GwkU/k5IP4g2XcM97Kk
	 kDWcy1OBhmISosN/cZsFTMieZIyUFT8ZXE1O7uFaZ7KYNxfLDH5DznVdpOAMSrAvjp/IYxIhzNWo
	 TI2nnc6dou2jxm1ouL/T/dJP34qXMiOKopYh7Feyw1XUqm5DN9iw5XDP8l0LLs4ZnWiDE06EdqvC
	 GWrEiesFuITSgFHbw4YhFTPJ3uzT26ZbkTxKLAbeGGDiQYvwnkU2avYA3SE/EI6d0GeuKFnbJ6mR
	 WR7sOZ5iO+EHsmH/8kS6L2Hsr+UJxsRVB+0H5V6UxVDExjZmzpwExf2BDUoXbyBiyBuY1D3RNFio
	 ivUkIkotXXd6/MVIlVs8LQr1FQAqM0ARvaicO762Z7GaMw8NWmX/zn0AYq48tjPgSCB0cNI2bnf6
	 NOFgCeEIj+pW2wQ1NoaXJzvakC9qwDnSQ9XA2QLjpLkr1bD+O+1dGxKPwG3GI=
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
Subject: [PATCH v6] i2c: imx: honour I2C_M_IGNORE_NAK
Date: Fri,  6 Nov 2026 17:20:36 +0800
X-OQ-MSGID: <20261106092036.4509-1-lemonoutput@foxmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_012112_138374_978F7D73 
X-CRM114-Status: GOOD (  18.96  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The driver rejects I2C_M_IGNORE_NAK with -EOPNOTSUPP, preventing
NAK-tolerant wake-token and SCCB transfers. Honour the flag in PIO
ACK checks and force flagged messages to PIO to avoid DMA stalls.

Restore acceptance of I2C_M_STOP for ov2659/SCCB compatibility [1],
without implementing STOP between messages.

Following Sashiko's report [2], reject flagged zero-length reads before
START with -EOPNOTSUPP to avoid an existing receive-path overrun.
Unflagged zero-length reads are unchanged.

Tested on ALIENTEK i.MX6ULL mini with this patch on f7813d226107,
using /dev/i2c-0 at 100 kHz and unpopulated address 0x60. The test
kernel reports 7.3.0-gf7813d226107-dirty (patch applied but not
committed). Logic analyzer CH0=SCL, CH1=SDA, sampled at 2 MHz.

On the same patched kernel, an unflagged 3-byte write returns -ENXIO
after the address NAK (9 clocks); with the flag it completes (36
clocks). A flagged 4-byte read returns ff ff ff ff (45 clocks), and a
flagged zero-length read returns -EOPNOTSUPP before START. Captures
and serial logs are in [3].

AI assistance: GLM 5.3 assisted with driver code from the author's
problem description; GPT-6.1Sol/Codex assisted with the test harness
from my test plan and polished the submission text. I have reviewed
the content.

Link: https://lore.kernel.org/linux-i2c/392c76a6-1ba5-4bc1-bfba-524025359042@oss.nxp.com/ # [1]
Link: https://lore.kernel.org/imx/sashiko-outbox-187010@kernel.org/ # [2]
Link: https://github.com/JHB11Hinson/i2c-imx-ignore-nak-test # [3]

Signed-off-by: Haobin Jiang <lemonoutput@foxmail.com>
---
Changes in v6:
- Clarify the I2C_M_STOP comment; no functional change from v5.
- Rebase onto f7813d226107; the base driver is unchanged from
  123cffeca4a3.
- Rework the commit message and review history following Carlos Song's
  feedback, and document AI assistance.
- Retest on an ALIENTEK i.MX6ULL mini board on the new base.
- Link to v5: https://lore.kernel.org/linux-i2c/tencent_E6D69775D91AD9FE45C994B3755CB1452506@qq.com/

Changes in v5:
- Reject zero-length reads carrying I2C_M_IGNORE_NAK before START,
  following Sashiko's review of v4.
- Link to v4: https://lore.kernel.org/linux-i2c/tencent_877C99956190215D644EB959DF1663542A0A@qq.com/

Changes in v4:
- Rebase onto i2c/i2c after Vincent Jardin's series was merged as
  c2867bb0fa1d ("i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART").
- No functional change from v3.
- Link to v3: https://lore.kernel.org/linux-i2c/tencent_342A87BFCECA70C9982E68A79AAD878B6909@qq.com/

Changes in v3:
- Rebase onto Vincent Jardin's I2C_M_REV_DIR_ADDR and I2C_M_NOSTART
  series; move flag checks to i2c_imx_check_msgs().
- Keep ignore_nak=false in the DMA write ACK check and leave
  I2C_M_STOP unhandled for compatibility, as agreed during review.
- Fix spacing, disclose AI assistance and record v6.6.44 backport tests.
- Link to v2: https://lore.kernel.org/linux-i2c/tencent_E6A52FBBB25132C90B8E296FEB96E2C8CA07@qq.com/

Changes in v2:
- Honour I2C_M_IGNORE_NAK on reads and force flagged messages to PIO.
- Reject I2C_M_NO_RD_ACK; leave I2C_M_STOP unhandled for ov2659/SCCB.
- Link to v1: https://lore.kernel.org/linux-i2c/tencent_0D2E46A782AC418BC52A1BBF04CA1AC98E09@qq.com/

 drivers/i2c/busses/i2c-imx.c | 37 +++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63..623503dda 100644
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
 
+/* I2C_M_STOP is not implemented between messages; leave it unhandled. */
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
 

base-commit: f7813d226107618bac34f311bd613b658215f2c6
-- 
2.34.1


