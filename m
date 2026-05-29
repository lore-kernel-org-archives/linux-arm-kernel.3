Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69394CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbk0LhHU3FI6TwZ60a2NlsxM8sxLDgATpkmtk/XCjCc=; b=uB2wohd/jI0q1PPws8c+RJrSzu
	ftFPUWY4Jux9SKf7Ve5PvEHfbYvaqWu/scgKhae7l+TnvynKLKzzgOvKiSzQ9eMEdNzb6Pemie3n5
	lCR+vkPLt/VhniOH0XorzLl6ZHkNlnQSur5ATLzZ6Tf561sHTSSD4+kAzJyl+tYu9e1cXq7qFAUNf
	vKjr09RT7fcPWs+gUfRQYnNHvXYDVYzfZwPz9pur2mIPUbxwQre4dYrTWuIlszGWkvQx2nqm1r8sy
	+co7fqy7TFe/z0RK0jpCcSLtuyXBqh0tvb3swlmyeVwGy0J6BGK3nIbYR55XDTZo+Tk1IrKUxeyBi
	WOSQj7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzeP-00000007oSz-1ZL4;
	Fri, 29 May 2026 16:01:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzeG-00000007oNg-3CQh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:01:26 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780070481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbk0LhHU3FI6TwZ60a2NlsxM8sxLDgATpkmtk/XCjCc=;
	b=3QBQkZiWrZUR0d1OhlOregdwwb+MHKjNIFd74ioC4x4rlO6RatRWUMx46n1crVTnFZhP2i
	tx0CUtSQHMhtgkSZyBzOHm+LugfmM6ZsPnek8ttu1K8BuqCN8E4xWDob25swQU2On7EBcg
	4Y63OE29m3jv/Ao8lX0nRzg0vGDgunLLIRn8a+02/Ouaa1WIVjgBD4/RsMwGvYtPDlbGjK
	cbe30JyNoLpvXRT+WUgdHqWcn7PQ/tpIDVXOc4TR3eznXPhusnnxoCOdz8fU9o1yb/z7PV
	tWsB5FOOxjCltAyxIyV/FvNHEEGXXQidfsiop5nq0leAXr4grKRSBS1ShhNmPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780070481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbk0LhHU3FI6TwZ60a2NlsxM8sxLDgATpkmtk/XCjCc=;
	b=GgoSB/eF/C4HZQeFpznvzh1NLr0RSGn7iGoCwRGr6s23AO9OTBk2zKLry2CA2WT45m1Y5b
	YI1r/z2Z+eUpUNDA==
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
Subject: [PATCH 3/5] mailbox: imx: Move the RXDB part of the mailbox into the threaded handler
Date: Fri, 29 May 2026 18:01:05 +0200
Message-ID: <20260529-imx_mbox_rproc-v1-3-b8ffc36e11e5@linutronix.de>
In-Reply-To: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_090124_953916_B07F6563 
X-CRM114-Status: GOOD (  10.84  )
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
the RX side except that we unmask it unconditionally in threaded
handler.

Move RXDB callback handling into the threaded handler.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 30a52c609e56b..9bf6484af45ed 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -528,6 +528,12 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
 			imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->=
idx), 0);
 		return IRQ_HANDLED;
=20
+	case IMX_MU_TYPE_RXDB:
+		cp->pending =3D 0;
+		priv->dcfg->rxdb(priv, cp);
+		imx_mu_xcr_rmw(priv, IMX_MU_GIER, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->=
idx), 0);
+		return IRQ_HANDLED;
+
 	default:
 		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
 				     cp->type);
@@ -585,7 +591,9 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_GIPn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RXDB)) {
-		priv->dcfg->rxdb(priv, cp);
+		cp->pending =3D 1;
+		imx_mu_xcr_rmw(priv, IMX_MU_GIER, 0, IMX_MU_xCR_GIEn(priv->dcfg->type, c=
p->idx));
+		ret =3D IRQ_WAKE_THREAD;
 	} else {
 		dev_warn_ratelimited(priv->dev, "Not handled interrupt\n");
 		return IRQ_NONE;

--=20
2.53.0


