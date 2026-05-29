Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7784CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgbq601Vyxjzmop4iCKNkx+ZohBqivTKPAGyNBI2MX0=; b=lbrvFOUXjv1YuLLB82QGrkBfnQ
	07YC6zL9JMiUBxhI/3iBmj/wuGDuqrVYmbl+pkmmq2uSdjDaGYa4n1LFhW7UTYdip/KQmpA2XCwG/
	p4nkFmQRIx4XvLY1ZZ6e/wpb3FKH0A8C+KNoLjiUXU0jEIZAdBF54CQ8AMbEDunOR5RvFDf6f0EW9
	5lMPdXUGn/h5Oro8rCCMwQKG1u/I9rSZiig4Up2SfwVFXrK1kPhtRSaCWyUehVfQZcWYcxdJnWvCa
	Q2BWl3Bj73WruvZjT96L4OeXAzgdZRfLMME0sTUkChX4uedhyjeC7NQm098BAhrDcGnXGIS4r2/K6
	8JYnQuCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzeP-00000007oTU-2RVV;
	Fri, 29 May 2026 16:01:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzeG-00000007oNc-3Bm7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:01:27 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780070479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgbq601Vyxjzmop4iCKNkx+ZohBqivTKPAGyNBI2MX0=;
	b=VljFyF0cp5ti8DcWCTfH1OI3+fs6mUI0RX1cd8j+vwNIf1aRHnPgpDOifVzT7T5lAIqO6C
	c2JDEj4FzvtUPJ9CDcO/h6OWMSz1KEWxajhM6gLhnRD3cw5xUrErb73LHLNReb3rkpwgg4
	QLvfkWL4SDoPDp3T3M2QVs0CDZzTBS6FFgA4biKf+t9Jjdpv1V4wDpCFRQeXZAZnH2E28Z
	q1QlLTSGTcvbCo+/i3NM59T7Tm18dpDm3ABX51ewjmLE1FNirg3zmqM8WpRDwwmeumNsb6
	TU2eZ39qNVkwpgbpARd08r5zSwi7o285iFe2gEp9hIX3+3dYDvft/7DiwtJeeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780070479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgbq601Vyxjzmop4iCKNkx+ZohBqivTKPAGyNBI2MX0=;
	b=lXf18RGdD5cb4wZ8HXesHQ4wWvfZw+t1SYuZP0+14y5Iuut/T30Im81ailBovvU8nX9X2p
	MIhgfs+dkMM9SCDQ==
To: linux-rt-devel@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 1/5] mailbox: imx: Start splitting the IRQ handler in primary and threaded handler
Date: Fri, 29 May 2026 18:01:03 +0200
Message-ID: <20260529-imx_mbox_rproc-v1-1-b8ffc36e11e5@linutronix.de>
In-Reply-To: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_090124_957647_9F8E84FF 
X-CRM114-Status: GOOD (  13.32  )
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

Split the mailbox irq handling into a primary handler (imx_mu_isr()) and
a threaded handler (imx_mu_isr_th()). The primary handler unmasks the
interrupt so the threaded handler can run without raising the interrupt
again. The threaded handler can invoke the actuall callback in
preemtible context.

As a first step, prepare the logic and move TX handling part.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 246a9a9e39520..2809965677bd7 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -80,6 +80,7 @@ struct imx_mu_con_priv {
 	enum imx_mu_chan_type	type;
 	struct mbox_chan	*chan;
 	struct work_struct 	txdb_work;
+	unsigned int		pending;
 };
=20
 struct imx_mu_priv {
@@ -508,11 +509,34 @@ static void imx_mu_txdb_work(struct work_struct *t)
 	mbox_chan_txdone(cp->chan, 0);
 }
=20
+static irqreturn_t imx_mu_isr_th(int irq, void *p)
+{
+	struct mbox_chan *chan =3D p;
+	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
+	struct imx_mu_con_priv *cp =3D chan->con_priv;
+
+	if (!cp->pending)
+		return IRQ_NONE;
+
+	switch (cp->type) {
+	case IMX_MU_TYPE_TX:
+		cp->pending =3D 0;
+		mbox_chan_txdone(chan, 0);
+		return IRQ_HANDLED;
+
+	default:
+		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
+				     cp->type);
+		return IRQ_NONE;
+	}
+}
+
 static irqreturn_t imx_mu_isr(int irq, void *p)
 {
 	struct mbox_chan *chan =3D p;
 	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
 	struct imx_mu_con_priv *cp =3D chan->con_priv;
+	irqreturn_t ret =3D IRQ_HANDLED;
 	u32 val, ctrl;
=20
 	switch (cp->type) {
@@ -548,7 +572,8 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 	if ((val =3D=3D IMX_MU_xSR_TEn(priv->dcfg->type, cp->idx)) &&
 	    (cp->type =3D=3D IMX_MU_TYPE_TX)) {
 		imx_mu_xcr_rmw(priv, IMX_MU_TCR, 0, IMX_MU_xCR_TIEn(priv->dcfg->type, cp=
->idx));
-		mbox_chan_txdone(chan, 0);
+		cp->pending =3D 1;
+		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_RFn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RX)) {
 		priv->dcfg->rx(priv, cp);
@@ -563,7 +588,7 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 	if (priv->suspend)
 		pm_system_wakeup();
=20
-	return IRQ_HANDLED;
+	return ret;
 }
=20
 static int imx_mu_send_data(struct mbox_chan *chan, void *data)
@@ -598,7 +623,8 @@ static int imx_mu_startup(struct mbox_chan *chan)
 	if (!(priv->dcfg->type & IMX_MU_V2_IRQ))
 		irq_flag |=3D IRQF_SHARED;
=20
-	ret =3D request_irq(priv->irq[cp->type], imx_mu_isr, irq_flag, cp->irq_de=
sc, chan);
+	ret =3D request_threaded_irq(priv->irq[cp->type], imx_mu_isr, imx_mu_isr_=
th,
+				   irq_flag, cp->irq_desc, chan);
 	if (ret) {
 		dev_err(priv->dev, "Unable to acquire IRQ %d\n", priv->irq[cp->type]);
 		return ret;

--=20
2.53.0


