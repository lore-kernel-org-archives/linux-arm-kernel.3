Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2D3105A57B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 11:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=babh808/bLfW9pCcfRHkPcD2gr6yFtMevplaWl9pW7s=; b=Nsi1XR4RkSlwocBtcpIU2qmV3D
	ZeWb5APzyuIyLaaoG0MXHMEuVA7Hpr9Mra4CrvJoZlvdcLy5hNf1We86AGAPKSrTBydl7vvb6hp11
	+aRBumrMarrk0w0W2KclvLBPlILg7HTup99bYjbhikFBTUDqC0TAtoNV+UbxOCggzZMzr4XnnD2Hj
	bSXa2mdISD14eLSskJhbwi28YTjkiXbHjuOC6fKxsDcqPFfDsQSDIubqtw4udvIqY0MO/g1nGYws7
	dHoN9m80DHx3xH5UmplYPbOBATWEeQL5LwoYAvIJSheSnb6WFcKWcmhM4jb4umwWIhBUovIH3kYpr
	NeXL+Y+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dpd-0000000DuPX-37JI;
	Thu, 12 Mar 2026 11:03:57 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dpX-0000000DuP1-2S54
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 11:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773313427; bh=babh808/bLfW9pCcfRHkPcD2gr6yFtMevplaWl9pW7s=;
	h=From:To:Cc:Subject:Date;
	b=Jn03XKN3z9zlDlge1H58RRFA3DyGfJunKOhONRWkVTaORfTEDkbtYEyv3gRn7D0Q6
	 Dnbfemw0P9CoImN4yt+5JqGx2bObbZsbmnOupIG2/U4AlNqggnWTQlZMkpebmXgeod
	 zLkeS8oAu7EEekVtedLog2qwjQnbRFq3Uc9YXxDk=
Received: from admin.. ([2001:da8:205:20a0:6eeb:b6ff:fe15:94a7])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id EB8B0E1; Thu, 12 Mar 2026 19:03:43 +0800
X-QQ-mid: xmsmtpt1773313423tpnbllkza
Message-ID: <tencent_46693FE6DB434ACFB7412B16F6078AC01A06@qq.com>
X-QQ-XMAILINFO: Npb+f4q7yCDRhKv1OSG0j8dwLnXoh1juS7YZcb7RbBiDaCRs/wdF5LIk+iS36k
	 BxVLy+T7xQBgx0GErS5kQF1kqNXYsDB80ImEe6n4dW/pfVJcYW1Zs7RiMKril+VoDX1QC1SpQw8/
	 JXCJ+4JPC527iuB+RmuSw2uDpnf0/lkblQFRQlJOIUOKfiz358bpcHmEiqNT1lnEgGBr3nfljYXV
	 uIv8eIAWfwfGTBCVjcFn0Pkpcm1Ayzd5gJZ7MBxcZWiEEpJKAYUS+WR+pL8K0KHO1nbl58Z0XLf9
	 XEL6/DE3LMcBR32V9JZ4fajRYWkHajarSgST2AaeD9/rDy58/iJiLBKCjXhfj+FEF+b4I4gtWzMz
	 8y1pYxpuPP7H70+qtfb9vkPfGkOM8NK49PN/Pb1hVATzdAv05HYAH6BNnmrreQrm5qPzDOYT4/q/
	 QB291aKhDqQ1Kp8KeZE4LjDVwhGjIPSXdSiFieb19Vo+HaR3hqzCVIxInlLUot7F+Lycl1EiWAPX
	 Z5E+5xJ9NHrsxmTHkWxFhSSKH09Kc0RfI1ZxxVK72POkVwU5ABE5JuOy7FQtDxiBmYqYyEg0RMx9
	 Vhl/ZWo1L4Cg6ksYxU2xO/UNVodMKLUwvyzQlD2ZmzVy17p2uCipLFRtmRbMjY2gXr/CePa4jCVn
	 hMObTUiuDFLXQmKu7858nTQ1bvpiB++Z0z2NsfsW8ki4qR1mjHkVLtEkKDF1KYTBNK8oJ2DIUFBy
	 RHAP2aGIkEq+lR6cgpUjDOrtN76ttWCmq1s8TP9t0qYCiowfmy1CKtVe/v+jEa7Dt7fFl8PPQqi5
	 gijJXepl4tcXMunyFG8CjwwjlqOKJ+xzWWw2z8dS/fhKWs+GLPZu9OSrB7yG/GJCt6WaLnmNnVYi
	 bbo9qkCiNKXCjk4sRIRH8fLDgnv4wL1bJF5TBeq412riDZkkWirptdtTnb4IxOCsYlBD4Mo9P/OP
	 zV52dGZEOyKyMl9zFF2/QGyqW2QOOvymcEEPczRQtfh9ZfqFAgpv6Q44pZ+BP54xBTEGX5oBkuBI
	 h2fiQB+gm4k5W63VipbE3sxZYq+7C+ObeTGP/6fjJyUX7g62719jUujjkst3CnR49ODImOYDnoRp
	 8CLLpt
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Zhaoyang Yu <2426767509@qq.com>
To: gregkh@linuxfoundation.org
Cc: Markus.Elfring@web.de,
	sergei.shtylyov@gmail.com,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhaoyang Yu <2426767509@qq.com>
Subject: [PATCH v5] USB: pxa27x_udc: check return value of clk_enable
Date: Thu, 12 Mar 2026 11:03:29 +0000
X-OQ-MSGID: <20260312110329.287334-1-2426767509@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_040352_097651_F2324E39 
X-CRM114-Status: GOOD (  15.81  )
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
Changes in v5:
- Rewrote the commit message in the imperative mood and updated it to
  accurately reflect the error handling/rollback changes (Markus Elfring).

Changes in v4:
- Added missing state rollbacks in pxa_udc_pullup(), pxa_udc_vbus_session(),
  and pxa_udc_resume() when udc_enable() fails, per Greg KH's review.

Changes in v3:
- Changed udc_enable() return type from void to int.
- Propagated the error to all caller functions and added proper
  error handling/rollback per Greg KH's review.

Changes in v2:
- Fixed a formatting issue by moving the 'int ret' declaration to
  the beginning of the function block.

 drivers/usb/gadget/udc/pxa27x_udc.c | 66 +++++++++++++++++++++++------
 1 file changed, 52 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 897f53601b5b..348af4d29c4d 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -1462,7 +1462,7 @@ static int pxa_udc_wakeup(struct usb_gadget *_gadget)
 	return 0;
 }
 
-static void udc_enable(struct pxa_udc *udc);
+static int udc_enable(struct pxa_udc *udc);
 static void udc_disable(struct pxa_udc *udc);
 
 /**
@@ -1519,14 +1519,20 @@ static int should_disable_udc(struct pxa_udc *udc)
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
+		if (ret) {
+			dplus_pullup(udc, !is_active);
+			return ret;
+		}
+	}
 	if (should_disable_udc(udc))
 		udc_disable(udc);
 	return 0;
@@ -1545,10 +1551,16 @@ static int pxa_udc_pullup(struct usb_gadget *_gadget, int is_active)
 static int pxa_udc_vbus_session(struct usb_gadget *_gadget, int is_active)
 {
 	struct pxa_udc *udc = to_gadget_udc(_gadget);
+	int ret;
 
 	udc->vbus_sensed = is_active;
-	if (should_enable_udc(udc))
-		udc_enable(udc);
+	if (should_enable_udc(udc)) {
+		ret = udc_enable(udc);
+		if (ret) {
+			udc->vbus_sensed = !is_active;
+			return ret;
+		}
+	}
 	if (should_disable_udc(udc))
 		udc_disable(udc);
 
@@ -1691,12 +1703,18 @@ static void udc_init_data(struct pxa_udc *dev)
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
@@ -1726,6 +1744,8 @@ static void udc_enable(struct pxa_udc *udc)
 	pio_irq_enable(&udc->pxa_ep[0]);
 
 	udc->enabled = 1;
+
+	return 0;
 }
 
 /**
@@ -1761,10 +1781,16 @@ static int pxa27x_udc_start(struct usb_gadget *g,
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
@@ -2430,10 +2456,16 @@ static int pxa_udc_probe(struct platform_device *pdev)
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
@@ -2509,13 +2541,19 @@ static int pxa_udc_resume(struct platform_device *_dev)
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
+		if (ret) {
+			dplus_pullup(udc, !udc->pullup_resume);
+			return ret;
+		}
+	}
 	/*
 	 * We do not handle OTG yet.
 	 *
-- 
2.34.1


