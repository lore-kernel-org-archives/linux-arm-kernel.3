Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF57CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9c+IJqqXc5Um/JnqM9Fs6W5B34mNQPyzW5r2N0OJlp0=; b=hLNZWnseOPZjYHezNWslwd2Azr
	LPuxIbCixg0GJ30LzmUspDK7WnHeRyQHCaI4+U5HWF5sVLLmoP43kDfL3qW22jx/HS9NnmMnry/Tl
	5nJnUA4mL76N8HSdBuyVqQe5NyGdpirzDFNyd6JALDSCZI0ryX/87o2217HqOD2K3La0ktqeIKenq
	MeYTfAp4elXrXS7OmZQbTEdotT4w5EJBb3Slakdh1l8n5coEhF4s4/OjOlZMLyA1SHonl2IpUSFqZ
	zNvRyb7Zw0bS52oGMqQ/9iV/C67qgWdwwrBrbfV4wUgwHXe0wdiLmqISO2vQ/tBQL4Hxc5KrNPjdr
	6pkUkt8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHk-0000000F7Hz-2ZPI;
	Wed, 03 Jun 2026 13:05:28 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHf-0000000F7Cq-3XIh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:05:26 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780491919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9c+IJqqXc5Um/JnqM9Fs6W5B34mNQPyzW5r2N0OJlp0=;
	b=nmG0UQZ3uRRN421PZnIKKsQ/6CUuMSXFdXHRToidgzlX6MbhOua4omBZxgwYrJ+9EIDwNa
	VOLxH4eon4lO0Q5Tr0PUuxKGLJ11rP0slhUuGDDPVtpbT5X+4AqDZfLTAyKh6slnqyn5gK
	+niXF+JR4Px1NC1KXEjDQerjPG1mN3zsm8lJggu6d79WndRE1uWLfIHXXhN2HI0Hl/STHY
	FBlvoaXiZRN4sniNzsrpGjFKi/6OqVhQo3NQvWBrPlac1fzoSy0LB1m1t9sqmyHCCGzjFa
	dlNCQc1OfxXEk1El0mcdDTPxLhyPSN1dVycTRObLqJfHCdhrCHZt1ooA7m1Zcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780491919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9c+IJqqXc5Um/JnqM9Fs6W5B34mNQPyzW5r2N0OJlp0=;
	b=s2TKqXuf2rV/21XHS+15u8efIO2Hw6iOXn8HyAluV9CkNUkjgbXX2FmbpkcMU+7h19BJpl
	IsOqMLnf6sGAASBQ==
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
Subject: [PATCH v2 2/9] mailbox: imx: Use devm_pm_runtime_enable()
Date: Wed,  3 Jun 2026 15:05:05 +0200
Message-ID: <20260603-imx_mbox_rproc-v2-2-a0059dc3b69a@linutronix.de>
In-Reply-To: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_060524_024696_FCE3533A 
X-CRM114-Status: GOOD (  14.06  )
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

sashiko complained about early usage of the device while probe isn't
completed. This can be mitigated by delaying the pm_runtime_enable()
into the removal path instead doing it early. This ensures that in an
error case the device is removed (and imx_mu_shutdown()) before
pm_runtime_disable() so we don't have to do this manually.

For the order to work, lets move devm_mbox_controller_register() until
after the pm-runtime part. So the reverse order will be mbox-controller
removal followed by disabling pm runtime.

Use devm_pm_runtime_enable(), remove manual pm_runtime_disable()
invocations and move the pm_runtime handling in probe before
devm_mbox_controller_register().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 34edc2f31dcb5..24cf704b4f9bd 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -965,28 +965,28 @@ static int imx_mu_probe(struct platform_device *pdev)
=20
 	platform_set_drvdata(pdev, priv);
=20
+	ret =3D devm_pm_runtime_enable(dev);
+	if (ret < 0)
+		goto disable_clk;
+
+	ret =3D pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		goto disable_clk;
+
+	ret =3D pm_runtime_put_sync(dev);
+	if (ret < 0)
+		goto disable_clk;
+
+	clk_disable_unprepare(priv->clk);
+
 	ret =3D devm_mbox_controller_register(dev, &priv->mbox);
 	if (ret)
 		goto disable_clk;
=20
 	of_platform_populate(dev->of_node, NULL, NULL, dev);
=20
-	pm_runtime_enable(dev);
-
-	ret =3D pm_runtime_resume_and_get(dev);
-	if (ret < 0)
-		goto disable_runtime_pm;
-
-	ret =3D pm_runtime_put_sync(dev);
-	if (ret < 0)
-		goto disable_runtime_pm;
-
-	clk_disable_unprepare(priv->clk);
-
 	return 0;
=20
-disable_runtime_pm:
-	pm_runtime_disable(dev);
 disable_clk:
 	clk_disable_unprepare(priv->clk);
 	return ret;
@@ -994,9 +994,6 @@ static int imx_mu_probe(struct platform_device *pdev)
=20
 static void imx_mu_remove(struct platform_device *pdev)
 {
-	struct imx_mu_priv *priv =3D platform_get_drvdata(pdev);
-
-	pm_runtime_disable(priv->dev);
 }
=20
 static const struct imx_mu_dcfg imx_mu_cfg_imx6sx =3D {

--=20
2.53.0


