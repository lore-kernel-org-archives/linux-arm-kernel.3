Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA6DFD0058
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 16:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AGKfJIOqCfJn6YyVIORFGSHEpFhevr6E05nHroftI9I=; b=4RodaUHZnxkcViqmAUBQRzjdoR
	fu67Gz7JcRZd+so2C3Ykfi6wrCA03RkQmLbG+xQDla4dF7XNontVdmUTWLwgVWw/PAanUKUiaRo0o
	z4GgZMv4IPOHr1G7QOPKDTnXZ45Nzh6yHT75z9lNncHwldkAg4+F8h/IcfMFczy2n+aaHXnOl3TSE
	iJJAk9ddrAGSJl99fUZbzxBOKIgAEaRlMBOZR1rVQyg7ZmtK+Y60cg3S9g/tk6qIgLq88WqZwkXtc
	+Ky/UmrkoLirKIlqPhLpz53uM/5UWtQkJWOwUXMpb4dzcvkfotULn+M3qw/l7NI0KAjrj8Ys3yBw7
	S0aelSKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwk5b-0000000BgjI-3Xqa;
	Sun, 01 Mar 2026 16:56:20 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwk5Y-0000000Bghv-2OXu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 16:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772384174; bh=AGKfJIOqCfJn6YyVIORFGSHEpFhevr6E05nHroftI9I=;
	h=From:To:Cc:Subject:Date;
	b=LLwC0pGXlKBbiN3pFw4OZTlUJBXHi29KQHqZY3lItWREZVj/F50C0UPK3bZ3/zlwr
	 2vqYJa1i/ULp6PvrlkN5DIpMpNcdqXMZzroopacrU8lMIOPv/uwQCuwP/l+OD3jHVw
	 5FY2dVrsBJpy5+ZA+aABX8QG9m9m7dAqD7VJhito=
Received: from admin.. ([2001:da8:205:20a0:6eeb:b6ff:fe15:94a7])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id E0B9685E; Mon, 02 Mar 2026 00:56:11 +0800
X-QQ-mid: xmsmtpt1772384171t52bk8rnn
Message-ID: <tencent_358DF7F3BD49A6407C17B7B26307A3B0AC0A@qq.com>
X-QQ-XMAILINFO: MapnONytPuziie/+Dl/eU+NaMa7Ov1VVOtdJZl7fE9/JhdMXvasAF32pW0V8Dz
	 Q8ltQwfKM4YJOWNtOmWydYTmGXfPTcL0lSBCGgSrd83aa0FL3lEWFQTTxx/jyPhXm76TALBy3tgP
	 JGhSNt4ZVJuHrmU2ACAgsVnLACZ2M00bajpkEBbaybibUZ9N44vopSD1eobMWFKcY6OHOhWUR0tT
	 OECmoreJr08pooEEYXItby7VgMGfebO961cTpT60RYmq7aCjYr9JPk9u5Waezw8OL0j8DFmbOW1g
	 02JtnkPpZIMiHhF044Zv68k8sa0+YJcGUmlcbx32Asa7lBi8iJGFzRHm9fWu5fgbZz0nhb4ddL0O
	 lAb91mILBArmLxzEynN02rea02vFyeX0f3crp+A/KXboZN17e9eo1EHOLmyY6UZx9h0GSaqbyVT9
	 PITUs+TdrJliiRx2iWed0hmM/Zz8RsFc1ePESArwy/j7Rs2N2L9ilhlWCY9CJD7MN8nPZvw7S3gm
	 KoqC7dEaBZULgQjPraizOsPBUbQzG3na5A2cM812Y8ln74tZ2nCa4xodAXkxMXS5KSi7jfDvRXoU
	 H1jG4Q77aUvnxI3Zb4TBHJZSnjBfySVRCWLICdOg4Pu1xlitUG+8F+4YmLGp+hT+TwNB7Al7L919
	 pcbR4RjIfX8j4Af7nb/TeLApYSTrCD8KZvpY0Z3Rg7YXQa/ud8Is6VNJAHUhJ62P/7V4Ph7yWiRD
	 a7BW1+0dMAwsceImHOHFmV2+DkX8eqlW4gTB3t0Qaxsskecwdt5wvskX9aayO+/SyfbRSTaYnPmt
	 myyGF0a+9PDWMn5pIhc7s/g53TFQ4RTDMKxsnO/aHezTCJo60f4Ub/6h7RNHaYXQmqgZvcSvdlub
	 ygXREhLsVn0QPczqnha9BeZruBf4+6GYbfUeJPyVDRCX+wUt/3XHyO31ckiTCWUMm5LSad9AxWsI
	 TEapmt/15zClNIA4/6v+ZUXMbtwHeSWwzLrJ6aJH2+iPm64gvVT58bAs1ZKjSsX9yKxL+7xG7DU8
	 JR12R/pOdIlcRj5ovgg6HC2IIINiQ32ARhhacN6chsee6r3PhuqU3wCtwfXwtCMDV8bYbCDcvzQV
	 3ls7k706MpgBoGjwk=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhaoyang Yu <2426767509@qq.com>
To: sergei.shtylyov@gmail.com,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	gregkh@linuxfoundation.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhaoyang Yu <2426767509@qq.com>
Subject: [PATCH] USB: pxa27x_udc: check return value of clk_enable
Date: Sun,  1 Mar 2026 16:55:53 +0000
X-OQ-MSGID: <20260301165553.270546-1-2426767509@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_085617_328748_8BD4A638 
X-CRM114-Status: GOOD (  10.27  )
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
Previously, udc_enable() ignored its return value.
This patch checks the return value and logs an error
without continuing initialization if clk_enable fails.

Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 897f53601b5b..006d6d0a5f9a 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -1693,10 +1693,16 @@ static void udc_init_data(struct pxa_udc *dev)
  */
 static void udc_enable(struct pxa_udc *udc)
 {
+	int ret;
+
 	if (udc->enabled)
 		return;
 
-	clk_enable(udc->clk);
+	ret = clk_enable(udc->clk);
+	if (ret) {
+		dev_err(udc->dev, "clk_enable failed: %d\n", ret);
+		return;
+	}
 	udc_writel(udc, UDCICR0, 0);
 	udc_writel(udc, UDCICR1, 0);
 	udc_clear_mask_UDCCR(udc, UDCCR_UDE);
-- 
2.34.1


