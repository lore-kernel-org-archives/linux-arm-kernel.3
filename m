Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504B8CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3pwpRlS/z22YoHkLrfQQIUXLQg6hhbTC7fKDUVYHXY=; b=s/fqCCJpsg8yKpLcYfsv2NZG14
	rRFdCdfNc4akwk13deRlLSVAqX5F90OHA8Ypd7qtX9QlSI80pyeBdjuKnhrnu6wtdAbvJdJTyqi/b
	0kQpYFECVnDZtPUG/iI3WQZqjxrwNhWGoe00EP/km5r7nNkUYtyQLqlP8Ks6fFAfIbArMByiEgLH8
	u7gzH0icgl4iLc/1d6ZKiKbpWhP51Vc/eFS43oC6XwTUG0VLNCTzGBiGBlxxeaYAq43idKIOVuVHS
	yofP8uEzY1INn9jNlUZ4Ek1sF98mo8TeWUn1LHlDw0JiSjzdooYg6CODeY+czKEqckrr7vpqLNMHV
	+SJMtoJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzeP-00000007oUD-3oMH;
	Fri, 29 May 2026 16:01:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzeG-00000007oNh-3CKZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:01:28 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780070482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g3pwpRlS/z22YoHkLrfQQIUXLQg6hhbTC7fKDUVYHXY=;
	b=LfZhU8YXwzipNcrkic5SEMfrGEbSE2o0IJfbKlctYroXzzlwgwpwmvwE89LIpX+0b6ySKy
	Pw0vGaOP8Bg1XZYt5Gyk5vIbgi71IMnDsxfkKvjY/8u7YteI6F+LOnXIa5iIA6WIucxZs+
	BNCUjXWG6rFNCxFCIrSytFfl2snnWOb89PjfpEjda4xhHdKPZu8Wsz/hoZ+KXvyxPYqUao
	vx4RbRqQTl2UmC2BS/354au3Go5vumFvIQJxXdRGnGN7iuEUMWqIIqYSp13IjUGl2Qmmca
	+9xBFNbRTKOCmnp/TtQso+AldrpzrIc+CdClc7PwWWRp6V/fJ9sKCOsV7q082g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780070482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g3pwpRlS/z22YoHkLrfQQIUXLQg6hhbTC7fKDUVYHXY=;
	b=Ho0nU9om8K+S3FNetbcHadnUM7bMDescUmeHyJBfv0YaFnkMt0lXDm/jOZjI92VwhZV0+n
	bsZ1qqRcR2DaxSDQ==
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
Subject: [PATCH 4/5] mailbox: imx: Don't force-thread the primary handler
Date: Fri, 29 May 2026 18:01:06 +0200
Message-ID: <20260529-imx_mbox_rproc-v1-4-b8ffc36e11e5@linutronix.de>
In-Reply-To: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_090124_981437_BC13BF12 
X-CRM114-Status: GOOD (  12.17  )
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
 drivers/mailbox/imx-mailbox.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 9bf6484af45ed..0a710316d791b 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -87,7 +87,7 @@ struct imx_mu_priv {
 	struct device		*dev;
 	void __iomem		*base;
 	void			*msg;
-	spinlock_t		xcr_lock; /* control register lock */
+	raw_spinlock_t		xcr_lock; /* control register lock */
=20
 	struct mbox_controller	mbox;
 	struct mbox_chan	mbox_chans[IMX_MU_CHANS];
@@ -207,15 +207,14 @@ static int imx_mu_rx_waiting_read(struct imx_mu_priv =
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
@@ -617,7 +616,7 @@ static int imx_mu_startup(struct mbox_chan *chan)
 {
 	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
 	struct imx_mu_con_priv *cp =3D chan->con_priv;
-	unsigned long irq_flag =3D 0;
+	unsigned long irq_flag =3D IRQF_NO_THREAD;
 	int ret;
=20
 	pm_runtime_get_sync(priv->dev);
@@ -964,7 +963,7 @@ static int imx_mu_probe(struct platform_device *pdev)
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


