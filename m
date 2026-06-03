Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EE6CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVrQgH307p2rx62VD32KF6aFAEvmCWdX4MSBe18SAfM=; b=GyjTUec+hQv0Bbzwh60aIh+6h1
	qdzZQB0SZ7O0vH3Ppn0mXE8EsiFIb/F2/R5C5Ig5TMtWfVDa5skZM1cyWpi4AsVgSnjfZA0lL9VMY
	RIFLqxkYC1UbkBo5yZGsY71+2DSO6KDboYJY/5LJkvVxMrPyUltFSstcCkWwZTdGjzfsKTX5XVMTA
	L49D20/io/igp0P5BPpVV/aen9/LMtP8Ymy2L32XgANqDynmTP4lBX1LY4+tXvmYs3NFHKvZUf5vS
	y7UrogUwxVWlqkM6ukcrfAZUUD3Nx8izMH4heAHt4c4a9SgrOo1DdtorT8V35t6dpG8pzUsE3Qrmh
	qUVk57uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHl-0000000F7Jh-0yUo;
	Wed, 03 Jun 2026 13:05:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHi-0000000F7F5-0uNg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:05:27 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780491921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wVrQgH307p2rx62VD32KF6aFAEvmCWdX4MSBe18SAfM=;
	b=wI2jUlzb8ILVRCLjA2FboDh8h3YpRarNz0Kd9mme46WiQFy39clzl6/RhVJLY2FiTXUalx
	ZDyhXisKCQZnIA0mumgW5DQu/fvCM82tna5U7p47JkUfdeJbNp46asqGQcbzbGkdHzm6ZB
	BisMSSOQHC6rx3K9ghktMRmuyxhdrQB2DohacbR2T0GTotFyO/sAq/QYntfQrHHG5CPLhl
	JAMkIE7g39M5iO3o4Y3bAses158jubYVVsEhdWVkwHewZolu38DKaF8hTJSrLv1o8slABf
	9VeBB/4p/7zMzB8hDCwM3rRgmrY8rmqZjWKUO6M7zeNpmP6Exh9y6ILlZCvVpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780491921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wVrQgH307p2rx62VD32KF6aFAEvmCWdX4MSBe18SAfM=;
	b=PtDBb86+MufClB2Givo/ph5u3yuVMJSdhbUdE+JC6gje8EJ1jwcGPgzBd29HZoa2H3R6VX
	X4HGzmoN9uILQ6Ag==
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
Subject: [PATCH v2 7/9] mailbox: imx: Move the RXDB part of the mailbox into the threaded handler
Date: Wed,  3 Jun 2026 15:05:10 +0200
Message-ID: <20260603-imx_mbox_rproc-v2-7-a0059dc3b69a@linutronix.de>
In-Reply-To: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_060526_424891_D473F019 
X-CRM114-Status: GOOD (  10.93  )
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
index 6fe202593592f..f0a14449652f1 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -559,6 +559,12 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
 			imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->ty=
pe, cp->idx));
 		break;
=20
+	case IMX_MU_TYPE_RXDB:
+		cp->pending =3D false;
+		priv->dcfg->rxdb(priv, cp);
+		imx_mu_xcr_set_act(priv, cp, IMX_MU_GIER, IMX_MU_xCR_GIEn(priv->dcfg->ty=
pe, cp->idx));
+		break;
+
 	default:
 		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
 				     cp->type);
@@ -617,7 +623,9 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_GIPn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RXDB)) {
-		priv->dcfg->rxdb(priv, cp);
+		cp->pending =3D true;
+		imx_mu_xcr_rmw(priv, IMX_MU_GIER, 0, IMX_MU_xCR_GIEn(priv->dcfg->type, c=
p->idx));
+		ret =3D IRQ_WAKE_THREAD;
 	} else {
 		dev_warn_ratelimited(priv->dev, "Not handled interrupt\n");
 		return IRQ_NONE;

--=20
2.53.0


