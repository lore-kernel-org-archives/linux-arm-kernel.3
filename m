Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD53BCD6E6F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUrx0WQ2t1MaZcUsq14gpCwZ9IGi87ebAm9MbfGcKCk=; b=jBzDJKsq9n7eSiLgIvvBSx56xz
	qWwjyYml5RKIEzGiEmu+UlOdFwzFPIjWU+j/usS0KYFbKDYOoUgICCcpoERt1XWomrFkfoIhEwAbe
	pPuQt/ddsHkKgHmmGAFtZYlB+9me+L6NUe49yTXpCkkpbq7VWCoBBqE/KpyKWLNaOTzYqWQQiTAd1
	cFdbV4KOEfSKPK6hUBfJHaCbmT+brBcDRtq/sH/mLXhrJvAhokRbB3NTY4h2SF+m+SizbHdZKj6ky
	iR10LErRiuhy1+PMZ7HUuK2ECg8g75Pt/wzHo/YVurBNq2UGHSrJlHwNv75e4arIwQV7oRElnex7C
	gnGajt3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHl-0000000F7LB-3CuS;
	Wed, 03 Jun 2026 13:05:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHi-0000000F7F6-0uUO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:05:28 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780491922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hUrx0WQ2t1MaZcUsq14gpCwZ9IGi87ebAm9MbfGcKCk=;
	b=zWM5R/8fIknuyuyYycP5CBUsNVSWf/DrkdJ2KBUl1FRwA6AxWz764VLUnOxdVMuMQ2XEv6
	jUH8KdSKaQ0IjX6LBPB7eEBbQjOrWRuBuiwaB/PoL00Tp6uLJunFMkcV1Ih74NJ90BEW2w
	sE2FcbKcBdwuS6+N3XIJqVeNOzGrdKagVkv1k9vhxwo89fZO2U97AmVSU3+s6s+z90KFVq
	sBMI5Iw2whWMnOfhuzATmLCMvwHT9/T3pfRSSEiUWAjcgBhSEuGiqUm6Ky3bNK7oHNQ6Mz
	98V/GG2fFOGKicVEB+NVmoexvG2Bny5J/X7ZXZOpJWsjGkBWKitSxYtE/1+fgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780491922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hUrx0WQ2t1MaZcUsq14gpCwZ9IGi87ebAm9MbfGcKCk=;
	b=hv5eVAbngf3l5mQkTK0BjMSUJ1qdqwZ8o/r7sk3qO/SewV8uZ2kMb43s1dxk/gEl2Pc5oj
	r0qcgZivq2+RXmAA==
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
Subject: [PATCH v2 8/9] mailbox: imx: Don't force-thread the primary handler
Date: Wed,  3 Jun 2026 15:05:11 +0200
Message-ID: <20260603-imx_mbox_rproc-v2-8-a0059dc3b69a@linutronix.de>
In-Reply-To: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_060526_544969_6022BC65 
X-CRM114-Status: GOOD (  12.57  )
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

The primary interrupt handler (imx_mu_isr()) no longer invokes any
callbacks it only masks the interrupt source and returns. In a
forced-threaded environment the IRQ-core will force-thread the primary
handler which can be avoided.

The primary handler uses a spinlock_t to protect the RMW operation in
imx_mu_xcr_rmw() - nothing that may introduce long latencies.

The lock can be turned into a raw_spinlock_t and then the primary
handler can run in hardirq context even on PREEMPT_RT skipping one
thread.

Make struct imx_mu_priv::xcr_lock a raw_spinlock_t and skip
force-threading the primrary handler by marking it IRQF_NO_THREAD.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index f0a14449652f1..f3de47908e00f 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -88,7 +88,7 @@ struct imx_mu_priv {
 	struct device		*dev;
 	void __iomem		*base;
 	void			*msg;
-	spinlock_t		xcr_lock; /* control register lock */
+	raw_spinlock_t		xcr_lock; /* control register lock */
=20
 	struct mbox_controller	mbox;
 	struct mbox_chan	mbox_chans[IMX_MU_CHANS];
@@ -208,15 +208,14 @@ static int imx_mu_rx_waiting_read(struct imx_mu_priv =
*priv, u32 *val, u32 idx)
=20
 static u32 imx_mu_xcr_rmw(struct imx_mu_priv *priv, enum imx_mu_xcr type, =
u32 set, u32 clr)
 {
-	unsigned long flags;
 	u32 val;
=20
-	spin_lock_irqsave(&priv->xcr_lock, flags);
+	guard(raw_spinlock_irqsave)(&priv->xcr_lock);
+
 	val =3D imx_mu_read(priv, priv->dcfg->xCR[type]);
 	val &=3D ~clr;
 	val |=3D set;
 	imx_mu_write(priv, val, priv->dcfg->xCR[type]);
-	spin_unlock_irqrestore(&priv->xcr_lock, flags);
=20
 	return val;
 }
@@ -224,31 +223,27 @@ static u32 imx_mu_xcr_rmw(struct imx_mu_priv *priv, e=
num imx_mu_xcr type, u32 se
 static void imx_mu_xcr_clr_shut(struct imx_mu_priv *priv, struct imx_mu_co=
n_priv *cp,
 				enum imx_mu_xcr type, u32 clr)
 {
-	unsigned long flags;
 	u32 val;
=20
-	spin_lock_irqsave(&priv->xcr_lock, flags);
+	guard(raw_spinlock_irqsave)(&priv->xcr_lock);
 	cp->shutdown =3D true;
=20
 	val =3D imx_mu_read(priv, priv->dcfg->xCR[type]);
 	val &=3D ~clr;
 	imx_mu_write(priv, val, priv->dcfg->xCR[type]);
-	spin_unlock_irqrestore(&priv->xcr_lock, flags);
 }
=20
 static void imx_mu_xcr_set_act(struct imx_mu_priv *priv, struct imx_mu_con=
_priv *cp,
 			       enum imx_mu_xcr type, u32 set)
 {
-	unsigned long flags;
 	u32 val;
=20
-	spin_lock_irqsave(&priv->xcr_lock, flags);
+	guard(raw_spinlock_irqsave)(&priv->xcr_lock);
 	if (!cp->shutdown) {
 		val =3D imx_mu_read(priv, priv->dcfg->xCR[type]);
 		val |=3D set;
 		imx_mu_write(priv, val, priv->dcfg->xCR[type]);
 	}
-	spin_unlock_irqrestore(&priv->xcr_lock, flags);
 }
=20
 static int imx_mu_generic_tx(struct imx_mu_priv *priv,
@@ -649,7 +644,7 @@ static int imx_mu_startup(struct mbox_chan *chan)
 {
 	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
 	struct imx_mu_con_priv *cp =3D chan->con_priv;
-	unsigned long irq_flag =3D 0;
+	unsigned long irq_flag =3D IRQF_NO_THREAD;
 	int ret;
=20
 	pm_runtime_get_sync(priv->dev);
@@ -997,7 +992,7 @@ static int imx_mu_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
=20
-	spin_lock_init(&priv->xcr_lock);
+	raw_spin_lock_init(&priv->xcr_lock);
=20
 	priv->mbox.dev =3D dev;
 	priv->mbox.ops =3D &imx_mu_ops;

--=20
2.53.0


