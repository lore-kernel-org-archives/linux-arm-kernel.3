Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC79CD98F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfpZwCg0u8EXGbePq2dXyBkiOQd+rMzCgxtnb63zw4Q=; b=nMIAbaiVW/co48dLFknURLzEgd
	9uH70mJ0C9aPjIV7jw3RLNhJ8KNsUA+VpszONR19G8Cf+ZXqq9N8gw4hS5RUc0g79x/mcwr85LwQx
	PFuk7KUTztaBzyD8W6X9eI8y5Ym0M/5w8kHFbcWXZ1XOF6cR93mZC5zXbYJEGJ104NBCLgIA3lT9i
	KzC1dwx/hzKe7/RSfYX/nSXR8JfMdKYb87gzKYbR4DLsiabpQlKnyursJWGlisiiS6pgERbUrgYEH
	sCJajeXTQtogn+fblL5zNDruR/xJnLSbOh2Y72MuR8vK+0l4Cv1ia+EVLBnUsxFYdH879Bp3f8ULT
	FCdY2Bfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBr-0000000Gkq9-0BdC;
	Wed, 17 Jun 2026 06:55:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBl-0000000GkiW-016r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:55:55 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XfpZwCg0u8EXGbePq2dXyBkiOQd+rMzCgxtnb63zw4Q=;
	b=4197dqZO4E0vEx+lbAySGiYIXBQp8v/En4/APLfBoRnzar5WKQUWC6Z3mjD4Udb1Y/dsWg
	LQdiiTXnWz1S/YaYQte2CoSiznAdMOWq5Ym532Am/ZQ1Ex0KpznZ4yKuJTDH9PcBYXo+4Z
	/AcADq3Wl8TEKIasmWN5WzePhwEla9GhyeSVZG7f2f9RF3Ct1U4Bu0FTOXgi1X0f+hKlol
	4l9fZhg2azZlFGvcsOJ3oqxzoPSqcAQWxJXaCFLBDFXeCngjsTO+MUjVsDVdqR3iymRm6D
	4a7lij8KUrbz/VHLCnSDg0FVBvNzD94FK1vfKWHefpd7w1N6cKGP7RBi3fszKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XfpZwCg0u8EXGbePq2dXyBkiOQd+rMzCgxtnb63zw4Q=;
	b=gsHonUWZxVol++wYr+zwgcvF9YrlMryZLh+vqM7zn2gjNPeWObezot9Sw2eZoceolLONjq
	INmhqyk4C+V9yjBQ==
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
Subject: [PATCH v3 07/10] mailbox: imx: Move the RX part of the mailbox into the threaded handler
Date: Wed, 17 Jun 2026 08:55:32 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-7-77948112defc@linutronix.de>
In-Reply-To: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_235553_231836_7A3A45C1 
X-CRM114-Status: GOOD (  11.92  )
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

Move RX callback handling into the threaded handler. This is similar to
the TX side except that we explicitly mask the source interrupt in the
primary handler and unmask it in the threaded handler again after
success. This was done automatically in the TX part.

The masking/ unmasking can be removed from imx_mu_specific_rx() since it
already happens in the primary/ threaded handler before invoking the
channel specific callback.

Move RX channel handling into threaded handler.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 87acc43cb99c4..1219c35b116e4 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -381,7 +381,6 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
 struct imx_mu_con_priv *
=20
 	data =3D (u32 *)priv->msg;
=20
-	imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp-=
>idx));
 	*data++ =3D imx_mu_read(priv, priv->dcfg->xRR);
=20
 	if (priv->dcfg->type & IMX_MU_V2_S4) {
@@ -408,7 +407,6 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
 struct imx_mu_con_priv *
 		*data++ =3D imx_mu_read(priv, priv->dcfg->xRR + (i % num_rr) * 4);
 	}
=20
-	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type=
, cp->idx));
 	mbox_chan_received_data(cp->chan, (void *)priv->msg);
=20
 	return 0;
@@ -551,6 +549,11 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
 		mbox_chan_txdone(chan, 0);
 		break;
=20
+	case IMX_MU_TYPE_RX:
+		if (!priv->dcfg->rx(priv, cp))
+			imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->ty=
pe, cp->idx));
+		break;
+
 	default:
 		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
 				     cp->type);
@@ -603,7 +606,8 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_RFn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RX)) {
-		priv->dcfg->rx(priv, cp);
+		imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp=
->idx));
+		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_GIPn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RXDB)) {
 		priv->dcfg->rxdb(priv, cp);

--=20
2.53.0


