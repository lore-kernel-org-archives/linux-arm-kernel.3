Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473041125824
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 13:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aF2WmMKwRgaVIE/I3i48O1DlYAeIZM+SRboymF2C9J4=; b=lYUSpZBbCn7OxyYPhyGna8455I
	7+xEXXvIKUm+fnMbKiEd1Z+ihwmNiX3oZIl3xBeTIE3/EiOpUJPr1iGKQx14FTRNjzvVDRueJlB6H
	yW7cPg9+nPTW5BxkILCZWvLr0DWPZAny7kl5VxKHPk42Od7eACBKXghQknRUIoFi4iLf3lX58JF4N
	r8JJYaghSxT2OX+2T5jybGPf0tqiXyaackaFfoVNYHPnSE6VcveZ8Ryn6dexGgSEDUQBiezcAIg+x
	rj7HB050P4AO4a9cotVvVBhqhnDcMA3hUuGxt2N2ICZMlcVwh3m4AezFc2POHOaXULZyH8Aa5qXwk
	6Pmb4qVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0K39-0000000BfY9-2tdv;
	Wed, 11 Mar 2026 13:56:35 +0000
Received: from out203-205-221-210.mail.qq.com ([203.205.221.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0K36-0000000BfWl-3Qob
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 13:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773237380; bh=aF2WmMKwRgaVIE/I3i48O1DlYAeIZM+SRboymF2C9J4=;
	h=From:To:Cc:Subject:Date;
	b=uF0Lae1yjWFry3OkOnjEuU4MQ4x0HOKHif20md8u0zCkjrh4yDzlpjKw28wmhk/DP
	 bPyAr32FA/a60AQvncN96XXVjmlHRTQEuboBg+SkCy3dKldntTZq5bF3bi1w2clYJu
	 XYSnK59Sufo48r0sRilA8OntMKrLBmbCdVqXNeQE=
Received: from admin.. ([2001:da8:205:20a0:6eeb:b6ff:fe15:94a7])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id E111DE10; Wed, 11 Mar 2026 21:56:17 +0800
X-QQ-mid: xmsmtpt1773237377ty1o3sjo7
Message-ID: <tencent_648835A07EDBB7CA94B66FAF5662EC2F1407@qq.com>
X-QQ-XMAILINFO: OIJV+wUmQOUAP2RiU7AszV5h0akRExrROY4HWo3RaWpE+EdEdLqCeOv4CgAzpK
	 KmNPva4/tt+XkNcm45EhU93CDu/bSFtM5MazeyJijsIITdBULuWjKxefOruB/DpZGoay/efiMCC7
	 cjWwZNmc3n2VEQU3uQx1l/DcReyzTjZYvQ67JituoIM6UeTHZo7SAVXpEAJV2dkEme3DQJ/F1faH
	 n3TJW2skzcg/1kdUcBiZrRLIPgTZK2ofxWJSxNnZUDsFn4elcndNSkGJlPhMgUKxvu1w7FJp+f/P
	 7JgEqvpnuleaP6KTFLi6aW24lLJIml1ypz9QZXsahNzZKqcClbnhscXSooln5SJCY7Z5TTtar4KM
	 uI2S8rJn8/mZAG5Gpr1wMXjfdlDXwQwpK1qZqmB0cnB2v5oRUK/afAMfCQmdsafgxPgIFqe3D7yE
	 9ANCGf61M2VHHovgN2U37rdQFuVJKTsExVwCHdatr8GFXHeeR2n/9c4rq6CXc4wYTaO3EYiswO56
	 jL7guT6yZn9B1H3xfNZ8riHUj93EAYe652ear57WGY+GlpE2afWFth6xRn9Ro6aYNsqmUDFx9EcN
	 ehNSl4eTZd/pITf8YzidUqhQmDtASo1fLVDo0Cz4kG49jBdByvfXd+TvgRq1R8afO99lwKwpi6wH
	 HFZg9XK9IP/+GbayUtK9p5BDvFdt/JlOBlpL6dCOxkQhv2MbZ/+VLkGoFks7rR8SBilyBjq7Xk6j
	 OeXoWd8S+86FrYxTCdpmt5HjN6HysNyKuQYWG+I9hTZX/Kn2HtP4wOp0AjFgoqYA0wiUQSK9LM4E
	 H3Wy3oL6iD/L7anoMl9KrfRQS5wcqozIvftOGAm5ixj0Se0w/GaO8RrsZSt6/oOPBcOVKSlB0unF
	 aGOQuYIuCoh7J8c2njbNRkDv9MRNKy45JWnUyNcE+fUt0+2+D4hjMZuj5Muf2smkh5Nsb+DN9T7M
	 Tca/HlKS320nmcMlgIW0HuEVsJozd2H3OdbcbPBad+4rx8Vx9z0naNCG2nFUyeNzYHBVvG/EJQrw
	 UkWmPAacVzwwrZFQYVEjvW4k89CLpI5Z3x6mrt+/8yjDUgI/MRmuzUKZroxNw=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Zhaoyang Yu <2426767509@qq.com>
To: gregkh@linuxfoundation.org
Cc: sergei.shtylyov@gmail.com,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhaoyang Yu <2426767509@qq.com>
Subject: [PATCH v3] USB: pxa27x_udc: check return value of clk_enable
Date: Wed, 11 Mar 2026 13:56:14 +0000
X-OQ-MSGID: <20260311135614.283723-1-2426767509@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_065633_173441_3A598165 
X-CRM114-Status: GOOD (  14.50  )
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

clk_enable() may fail according to the API contract.
Previously, udc_enable() ignored its return value and returned void.

Modify udc_enable() to return the error code. Additionally, update
all of its callers (pxa_udc_pullup, pxa_udc_vbus_session,
pxa27x_udc_start, pxa_udc_probe, and pxa_udc_resume) to check
this return value and handle the failure properly with necessary
cleanups or rollbacks.

Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
---
Changes in v3:
- Changed udc_enable() return type from void to int.
- Propagated the error to all caller functions and added proper
  error handling/rollback per Greg KH's review.

Changes in v2:
- Fixed a formatting issue by moving the 'int ret' declaration to
  the beginning of the function block.

 drivers/usb/gadget/udc/pxa27x_udc.c | 60 ++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 897f53601b5b..0a5f05f8e73c 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -1462,7 +1462,7 @@ static int pxa_udc_wakeup(struct usb_gadget *_gadget)
 	return 0;
 }
 
-static void udc_enable(struct pxa_udc *udc);
+static int udc_enable(struct pxa_udc *udc);
 static void udc_disable(struct pxa_udc *udc);
 
 /**
@@ -1519,14 +1519,18 @@ static int should_disable_udc(struct pxa_udc *udc)
 static int pxa_udc_pullup(struct usb_gadget *_gadget, int is_active)
 {
 	struct pxa_udc *udc = to_gadget_udc(_gadget);
+	int ret;
 
 	if (!udc->gpiod && !udc->udc_command)
 		return -EOPNOTSUPP;
 
 	dplus_pullup(udc, is_active);
 
-	if (should_enable_udc(udc))
-		udc_enable(udc);
+	if (should_enable_udc(udc)) {
+		ret = udc_enable(udc);
+		if (ret)
+			return ret;
+	}
 	if (should_disable_udc(udc))
 		udc_disable(udc);
 	return 0;
@@ -1545,10 +1549,14 @@ static int pxa_udc_pullup(struct usb_gadget *_gadget, int is_active)
 static int pxa_udc_vbus_session(struct usb_gadget *_gadget, int is_active)
 {
 	struct pxa_udc *udc = to_gadget_udc(_gadget);
+	int ret;
 
 	udc->vbus_sensed = is_active;
-	if (should_enable_udc(udc))
-		udc_enable(udc);
+	if (should_enable_udc(udc)) {
+		ret = udc_enable(udc);
+		if (ret)
+			return ret;
+	}
 	if (should_disable_udc(udc))
 		udc_disable(udc);
 
@@ -1691,12 +1699,18 @@ static void udc_init_data(struct pxa_udc *dev)
  * Enables the udc device : enables clocks, udc interrupts, control endpoint
  * interrupts, sets usb as UDC client and setups endpoints.
  */
-static void udc_enable(struct pxa_udc *udc)
+static int udc_enable(struct pxa_udc *udc)
 {
+	int ret;
+
 	if (udc->enabled)
-		return;
+		return 0;
 
-	clk_enable(udc->clk);
+	ret = clk_enable(udc->clk);
+	if (ret) {
+		dev_err(udc->dev, "clk_enable failed: %d\n", ret);
+		return ret;
+	}
 	udc_writel(udc, UDCICR0, 0);
 	udc_writel(udc, UDCICR1, 0);
 	udc_clear_mask_UDCCR(udc, UDCCR_UDE);
@@ -1726,6 +1740,8 @@ static void udc_enable(struct pxa_udc *udc)
 	pio_irq_enable(&udc->pxa_ep[0]);
 
 	udc->enabled = 1;
+
+	return 0;
 }
 
 /**
@@ -1761,10 +1777,16 @@ static int pxa27x_udc_start(struct usb_gadget *g,
 		}
 	}
 
-	if (should_enable_udc(udc))
-		udc_enable(udc);
+	if (should_enable_udc(udc)) {
+		retval = udc_enable(udc);
+		if (retval)
+			goto fail_enable;
+	}
 	return 0;
 
+fail_enable:
+	if (!IS_ERR_OR_NULL(udc->transceiver))
+		otg_set_peripheral(udc->transceiver->otg, NULL);
 fail:
 	udc->driver = NULL;
 	return retval;
@@ -2430,10 +2452,16 @@ static int pxa_udc_probe(struct platform_device *pdev)
 		goto err_add_gadget;
 
 	pxa_init_debugfs(udc);
-	if (should_enable_udc(udc))
-		udc_enable(udc);
+	if (should_enable_udc(udc)) {
+		retval = udc_enable(udc);
+		if (retval)
+			goto err_enable;
+	}
 	return 0;
 
+err_enable:
+	usb_del_gadget_udc(&udc->gadget);
+	pxa_cleanup_debugfs(udc);
 err_add_gadget:
 	if (!IS_ERR_OR_NULL(udc->transceiver))
 		usb_unregister_notifier(udc->transceiver, &pxa27x_udc_phy);
@@ -2509,13 +2537,17 @@ static int pxa_udc_resume(struct platform_device *_dev)
 {
 	struct pxa_udc *udc = platform_get_drvdata(_dev);
 	struct pxa_ep *ep;
+	int ret;
 
 	ep = &udc->pxa_ep[0];
 	udc_ep_writel(ep, UDCCSR, udc->udccsr0 & (UDCCSR0_FST | UDCCSR0_DME));
 
 	dplus_pullup(udc, udc->pullup_resume);
-	if (should_enable_udc(udc))
-		udc_enable(udc);
+	if (should_enable_udc(udc)) {
+		ret = udc_enable(udc);
+		if (ret)
+			return ret;
+	}
 	/*
 	 * We do not handle OTG yet.
 	 *
-- 
2.34.1


