Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF034CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ggQaVDDpNPR76lGbN7CL357TIsvbBMdEKCYYXYIjGU=; b=amQxMBV4CDuxXmcb/eS5f8HDSM
	dWk3GravuBV7QJN4vdwKmrHB7rw2HksYbBSiqzCF05mwZzlCXNd5F7XZ6eAQwEvcFmul6yF6h04tz
	2idN9BIxH1VpSQbRlSG8cKFqqbAh/m/7udbjg3t164BKf9q9Gq7iZXyxsEHOSQseXsnAhgGxyJhZ9
	mcyYzZlDNW6X9miJsMDTQouMhgIhCVH/ucZmasoQI4SfKyLPvXTguSIzYyoYLBoy2fUDTfWFg4P0+
	R7Rv5pePiOdF2WIwHZO8j59BSFxPf0gpTal/WMY9zgfh8ooXXIpNEaUx6VszaVWIG3QHTeIGmM22F
	rVaPjKjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBq-0000000Gkp0-2J0I;
	Wed, 17 Jun 2026 06:55:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBk-0000000GkiH-2RnK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:55:53 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ggQaVDDpNPR76lGbN7CL357TIsvbBMdEKCYYXYIjGU=;
	b=DelXLfp3kfloaK+YSgdSzpPMc5DyLSgjvlIW9utWc76N/QCvGfL+S2Jbxf9Gm0qAfrK+EJ
	TyxTec26djsAOCmACRknjvRfjpcB4GWVtGKN31GJrxvG/HIGKtiQLtYBYc72BJEJWCIpNI
	fCh7XmA+BN3kuhIC8Vgs9taunqcxoEVhIqK4wyyPWU6sPJfXgzNcw0JROY6OlfqvG+nROV
	AWGantbfffzX4sbMvkkf/nS1174ln3cWGgdE/rY1BaKOiKmTJQPyh2JjkScGspiGInH55u
	9hbnZm/XXEd465f2+noSpzLCcOko1NUqjEnqQHdG6pCv8Gifk3tLCAmEX4pkaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ggQaVDDpNPR76lGbN7CL357TIsvbBMdEKCYYXYIjGU=;
	b=uJkjEdkXKWqGh63YQXU/mmj3dGrKUjbefNJEGL32b2QHPhGuLeglqqPHlPprkWIPHkqT+0
	AXccafA4WVUYmDDQ==
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
Subject: [PATCH v3 06/10] mailbox: imx: Start splitting the IRQ handler in primary and threaded handler
Date: Wed, 17 Jun 2026 08:55:31 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-6-77948112defc@linutronix.de>
In-Reply-To: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_235552_766617_B2A5FE25 
X-CRM114-Status: GOOD (  11.82  )
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
a threaded handler (imx_mu_isr_th()). The primary handler masks the
interrupt event so the threaded handler can run without raising the
interrupt again.

The goal here is to invoke the mailbox core functions (such as
mbox_chan_received_data(), mbox_chan_txdone()) in preemptible context which=
 is
made possible by using an threaded interrupt handler. This in turn means th=
at
mailbox's client callbacks are invoked in preemptible context, too. This th=
en
allows the mailbox client callback to skip an indirection via a workqueue if
it requries preemptible callback.

As a first step, prepare the logic and move TX handling part.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 408cd083c64ee..87acc43cb99c4 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -540,11 +540,31 @@ static void imx_mu_txdb_work(struct work_struct *t)
 	mbox_chan_txdone(cp->chan, 0);
 }
=20
+static irqreturn_t imx_mu_isr_th(int irq, void *p)
+{
+	struct mbox_chan *chan =3D p;
+	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
+	struct imx_mu_con_priv *cp =3D chan->con_priv;
+
+	switch (cp->type) {
+	case IMX_MU_TYPE_TX:
+		mbox_chan_txdone(chan, 0);
+		break;
+
+	default:
+		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
+				     cp->type);
+		return IRQ_NONE;
+	}
+	return IRQ_HANDLED;
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
@@ -580,7 +600,7 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 	if ((val =3D=3D IMX_MU_xSR_TEn(priv->dcfg->type, cp->idx)) &&
 	    (cp->type =3D=3D IMX_MU_TYPE_TX)) {
 		imx_mu_xcr_rmw(priv, IMX_MU_TCR, 0, IMX_MU_xCR_TIEn(priv->dcfg->type, cp=
->idx));
-		mbox_chan_txdone(chan, 0);
+		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_RFn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RX)) {
 		priv->dcfg->rx(priv, cp);
@@ -595,7 +615,7 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 	if (priv->suspend)
 		pm_system_wakeup();
=20
-	return IRQ_HANDLED;
+	return ret;
 }
=20
 static int imx_mu_send_data(struct mbox_chan *chan, void *data)
@@ -630,7 +650,8 @@ static int imx_mu_startup(struct mbox_chan *chan)
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


