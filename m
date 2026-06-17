Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48654CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UH7OkPFNLUXxg+rvsW/p0INRvMHLxAI9MeDfvHIaxZ8=; b=GpcwpaUSeir8d6DN+6M5ynySC0
	9oShytJUY2rdR++9u9xbdZ1hCXNkR1o2AolzCzSuc1YnXZ4cdTFmazsPbHOPA541r9boLh6txAF3e
	Yryg0rC2uSLYSpYKEObAUA0kbruhUL9uIoFgTsM5DkP7wN+6tDOZmal7cr61fnGD8nDLEE1fFZLCY
	uCPvkgl3GkAHOD4tZN3ZAyGB16vSQl3TCR4pyi3XoyNttaK8vpy/ey01/j56P1JPxkQcT+mBUN/+Z
	fYE2zvrVyQGSTb/yF9RTCrprhn0ypK4CiUBdOIDXjINJzGn6b+ndZsTCX8DxNjVjKK+ycPrgYGNgT
	CxnWMUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBq-0000000Gkpi-3bC2;
	Wed, 17 Jun 2026 06:55:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBk-0000000GkiV-3rnZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:55:55 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UH7OkPFNLUXxg+rvsW/p0INRvMHLxAI9MeDfvHIaxZ8=;
	b=HFjtLtoXmTv8KhN5phfZLC2w2QQaC2D2G6/Kn7M1a/L0sSR1Pf4Yf1wQX++H3SXqFwEpjQ
	94pyRnxL9atqgOSPyqrseH4CC++9QCbaCl28MBPVz/W1oaqmIg+5O7VBNASbNXcaTVvtcm
	mSwM/rSU+F5hxG5BNmfAH+FQyDSzsoe1da9VqEvq5veOb03Jhq3hg1cMBYCZnvtLn5uKUr
	K7eZhi5lwsO0UTIV8IR1Pm0TaXLmFDnY5AwmaByZHVYIdMbxc8cGW4JlZO8FQjunj+smFw
	M/xNO2BsWPw5I4vs2wIu+Z6PrLfHb2gkQjL/TfJyYwEkA1GVXMGS9w9BLtBqfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UH7OkPFNLUXxg+rvsW/p0INRvMHLxAI9MeDfvHIaxZ8=;
	b=6klIHgBD9VnAVSHINtDxVWg6vKoloqY7B4bGP9RHdmUMtcY1J/eMPlMnu4nPPf+mH+m/AT
	nKQTj4rYmeddWHCA==
To: linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 08/10] mailbox: imx: Move the RXDB part of the mailbox into the threaded handler
Date: Wed, 17 Jun 2026 08:55:33 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-8-77948112defc@linutronix.de>
In-Reply-To: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_235553_113769_D4ABA612 
X-CRM114-Status: GOOD (  10.47  )
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

Move RXDB callback handling into the threaded handler. This similar to
the RX side and since the imx_mu_dcfg::rxdb callback can return an error, t=
he
interrupt is only enabled on success.

Move RXDB callback handling into the threaded handler.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 1219c35b116e4..1bd434bdff87a 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -554,6 +554,11 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
 			imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->ty=
pe, cp->idx));
 		break;
=20
+	case IMX_MU_TYPE_RXDB:
+		if (!priv->dcfg->rxdb(priv, cp))
+			imx_mu_xcr_set_act(priv, cp, IMX_MU_GIER, IMX_MU_xCR_GIEn(priv->dcfg->t=
ype, cp->idx));
+		break;
+
 	default:
 		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
 				     cp->type);
@@ -610,7 +615,8 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_GIPn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RXDB)) {
-		priv->dcfg->rxdb(priv, cp);
+		imx_mu_xcr_rmw(priv, IMX_MU_GIER, 0, IMX_MU_xCR_GIEn(priv->dcfg->type, c=
p->idx));
+		ret =3D IRQ_WAKE_THREAD;
 	} else {
 		dev_warn_ratelimited(priv->dev, "Not handled interrupt\n");
 		return IRQ_NONE;

--=20
2.53.0


