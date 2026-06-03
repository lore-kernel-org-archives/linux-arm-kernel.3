Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A239CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxginL0VzWoH90KNXApA+NxBaJrkO5Ug7aBj3PGDxKY=; b=2vGu4wAeB4/UJrdIWDaoe4Uxnu
	JrRlHHVJiQiXfS/YqXBaT8jNX/gGG13FSZQTHMpDAQodP8CjkFAt4FAfVp+KfvunF3+gLLwD1sng7
	EErOWt4jUp2XuOPm6jxpOpd02B4K4jSMfIsUudzsiscZW1Yv1ZGT4PBk/+9pNA5d5mIaw2zSL5B7f
	ilebG0TVZSEdequgo9VLsOgfYRSlaznC1ULSnbJCEC95flFZKdh/Gz2zDY48NVexMcD42InNsJ2KA
	FYKlnZX5lMyZ/7NtC+6VrKSEaIyDII/LRk2JYE4mpfScKTADVIM+tbfGiGGDfSO/+poGbmQVeKlMW
	O8xWAa1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHl-0000000F7K6-1lQh;
	Wed, 03 Jun 2026 13:05:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHh-0000000F7Ew-3soj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:05:27 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780491921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SxginL0VzWoH90KNXApA+NxBaJrkO5Ug7aBj3PGDxKY=;
	b=FGIOtHH+62eyiSPpX1ym5EYBO9137G89yAPMrXPVLhD3z5HMhbxxE5KQtAJF/uCpyxO5Vf
	fc/w0YzLSrrO+BoP8631TRTB7Vuii8eSkczhdQ/n2BtAR4k0ryCNd5TIow9RFx/+AwfOs2
	HkDNyHN5zU/ZPO4ELyTiqyngLf8L2zqOIYxkLcpPX+gwv60wxRlK7/IVnwV3eWmL9+xVAM
	zy6rhORzJJDvEHtgZt8Z4PrBLcHyboHGhUYJuP7stx8ssK3DzkSZycifJInKJifFClRdD8
	LVH5++gcTdlCRf3hOPBIR/PDlut1o7FX9xnVwLvsu7Ui+SsFrvN4acIBCRrR0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780491921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SxginL0VzWoH90KNXApA+NxBaJrkO5Ug7aBj3PGDxKY=;
	b=rW6SgbHdNWEVjfOlEyKRS9oveGSHkYhxj7WNjLXocZY+P6Hg7LdIssf2Y2y8GyUSZbKXMB
	BN/6m9UtaQynhODQ==
To: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
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
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 6/9] mailbox: imx: Move the RX part of the mailbox into the threaded handler
Date: Wed,  3 Jun 2026 15:05:09 +0200
Message-ID: <20260603-imx_mbox_rproc-v2-6-a0059dc3b69a@linutronix.de>
In-Reply-To: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_060526_429775_80BFF1E7 
X-CRM114-Status: GOOD (  12.51  )
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

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 006aa76b74b62..6fe202593592f 100644
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
@@ -555,6 +553,12 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
 		mbox_chan_txdone(chan, 0);
 		break;
=20
+	case IMX_MU_TYPE_RX:
+		cp->pending =3D false;
+		if (!priv->dcfg->rx(priv, cp))
+			imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->ty=
pe, cp->idx));
+		break;
+
 	default:
 		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
 				     cp->type);
@@ -608,7 +612,9 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_RFn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RX)) {
-		priv->dcfg->rx(priv, cp);
+		cp->pending =3D true;
+		imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp=
->idx));
+		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_GIPn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RXDB)) {
 		priv->dcfg->rxdb(priv, cp);

--=20
2.53.0


