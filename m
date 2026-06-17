Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03415CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DjHQpJo0DpxApXO7REZGRiNP5Ze/KHB1Lmpc4X8mS8=; b=mhLGcRMrpuNvXGz8CQcT7VAs+J
	/jOhkp9MqFFpkhC9jCOPGr5DyqYY66fIkaEWV/QeDIFwjf9R68i3a0iMO8jPB77xAOsRJH5y8Vbwj
	fCa6UHifhuQml7/Dmb1rYwVaMLXdTjQeTHLjXVqC+CoQrjZwaHKowR03HonBw5CEZSBXosBNF45hc
	cpQznC2WBq9aTjgFvSCJ4MQGwwNG0Jqsef6dhNsglsSeMST9qlMwqdZf4QVjpUI/1AvE7Ysc3VOkU
	Po96J3abqqiwu3SDxy3xSQPgHWeowp9s34KOlL4H5j9ZqDLOayoeNV/mM26CbDP7i3M+5tmbA5xDZ
	f798w9VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBq-0000000GkpQ-2z84;
	Wed, 17 Jun 2026 06:55:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBk-0000000GkiG-2Gmb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:55:54 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3DjHQpJo0DpxApXO7REZGRiNP5Ze/KHB1Lmpc4X8mS8=;
	b=a2XJfXoWgi2YkUquJH82ZjYh8FiqBl388XK6Cx0cBy/SX1E/4DIYqlXGukYANZqlc2y6rj
	1/rCuUC2uyNl8XPcyKHEzFS+MvWavVhf0p1o7CH7EaA+0B+D7GuafWp6wSsGG1cEfXmg66
	wm18Kd0se8HswFFAzp4XPrbou89GttRMXZeQZfLLOizMy44MVXlfmxVZERWPk9sgIJ5rcJ
	SBhexWoJk4uYyFxg186uMxMqameNpODx8hf/BzGiZytRWT1SMCmOi16MOD6aa6yjV1Du7R
	0M0gswMEv1MSEPs85jUDcMAHb2cOk5oQ3snfA3KrlSezBARcbdvqLTklIt4PSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3DjHQpJo0DpxApXO7REZGRiNP5Ze/KHB1Lmpc4X8mS8=;
	b=LlsaMY8oNWaK1mMFy5QqvMRjCgOuN96pEXong7qjJohUCjHYad5OFNKqItD+qKgOpQ4Qh8
	EPTME9V9YgdB2aCQ==
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
Subject: [PATCH v3 05/10] mailbox: imx: Use channel index instead of zero in imx_mu_specific_rx()
Date: Wed, 17 Jun 2026 08:55:30 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-5-77948112defc@linutronix.de>
In-Reply-To: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_235552_732435_F0A051E1 
X-CRM114-Status: GOOD (  12.26  )
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

imx_mu_specific_rx() masks channel 0 and unmasks it again at the end of
the function. Given that at startup the channel index got unmasked it
should do the right job.

This here either unmasks the actual channel or another one but should
have no impact given that it reverses its doing at the end.

Peng Fan commented here:
| For specific rx channel, whether it is i.MX8 SCU or i.MX ELE, actually th=
ere is
| only 1 channel as of now, but it seems better to use cp->idx in case more
| channels in future.

Use the channel index instead of zero.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index a8d4e970fb786..408cd083c64ee 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -381,7 +381,7 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
 struct imx_mu_con_priv *
=20
 	data =3D (u32 *)priv->msg;
=20
-	imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, 0));
+	imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp-=
>idx));
 	*data++ =3D imx_mu_read(priv, priv->dcfg->xRR);
=20
 	if (priv->dcfg->type & IMX_MU_V2_S4) {
@@ -408,7 +408,7 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
 struct imx_mu_con_priv *
 		*data++ =3D imx_mu_read(priv, priv->dcfg->xRR + (i % num_rr) * 4);
 	}
=20
-	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type=
, 0));
+	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type=
, cp->idx));
 	mbox_chan_received_data(cp->chan, (void *)priv->msg);
=20
 	return 0;

--=20
2.53.0


