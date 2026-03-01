Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DBCFD006D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mS8E0TrCr1YxiKgMwotf52407XP0k3WZtbN83DURWvE=; b=vmpkocsQG8qTS6C9eWIO3/ersv
	4L/K140ftGn2jPgkTKhUVs9NIkmsca3dGollXeW3RxKcr16vLiu2Ox+BvCqwBr+6mT+ZRVRwE+mNO
	NT9j660KxDjVxxEQkFgLxhzdtVX0W/VGBqahEHHvKoHoxSW64+cXoqs7nNMHz1jeGmXOuNYBk8cgR
	IbakJdJ6wpcC/RZJPr/GUY0TTy/c1DaxXyGJ4+OVbqyHqYJu0/bUYIqVtGB+a7qQuEvgP0kwRolRf
	R9/Y2GCVvCb0ojdkRW2GXssg/g4mJ6HMCVlmS82o7YKZhE601j39NGz5nFCaxwKfMqubwjdVbWEhz
	do4vri0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwjaK-0000000Befu-2bqD;
	Sun, 01 Mar 2026 16:24:00 +0000
Received: from out203-205-221-236.mail.qq.com ([203.205.221.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwjaH-0000000Beel-0uwb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 16:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772382231; bh=mS8E0TrCr1YxiKgMwotf52407XP0k3WZtbN83DURWvE=;
	h=From:To:Cc:Subject:Date;
	b=tgzNRw+Ag04+Go7Q4AxRgSEB3Y5lWeMfHq8NjXT8mzg0m6yE9AT0lzLLOriZr4t/3
	 kGOn4PZCZFsI4EaUbF/QQpgeQia83ScXRU2SLvtb0W6XfLbzdjL0Uc2jmtzYuuFd0K
	 +aivWLceuH4VdztuGbost4WT8dZ6boBFnuBVzlfk=
Received: from admin.. ([2001:da8:205:20a0:6eeb:b6ff:fe15:94a7])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 5F08CAA5; Mon, 02 Mar 2026 00:23:48 +0800
X-QQ-mid: xmsmtpt1772382228twxwc02up
Message-ID: <tencent_05D6B6FBD5DE2A537EBE395A85B021506009@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XFpEWwej/shdZIhqlksRx6yYziZ/NTIMyDQDLbBghwo0MY1jq0z
	 CUGTvy+X9YKDk4silcSc5J9DbEq4Cfg28JUGAm6J962ir60Y6yjF6M9VG9X9WoMlyA6gG56jaehq
	 XarMa08hLKyVrkgd7s2r/LrF+n7xPV2Xz45LmWGWlShzObVzIeHTSmhtwtHRcaVlbZsDzyF2puwJ
	 FSp9Q4Mfb7YXvn4wvBlIzWICqumEQ/5OLUQPN4qhueAFWBt5PT+j0/+z4ebghCrfLWq5WpUaGrNH
	 9P0SWdwueTed3tAOb+Zow6cLyVq+nVwBkQ/KO5PY9irptlimhXZwOD366DKC2+mH3ZTKyyLtXcO8
	 FlFdTbt4zbvArSKU8q88Zlf2PMpHsBCwIeGeTfZ1Zq0j0KiVv1SH6FXuhbJAF1b2rkbCqH5/vuwi
	 QQGxPnA9ic2tQEsWN/ok9hyUd01v6lEoAu7NYYDlZonzkB/KWG02vVxi6jnaoGOpi/lCBBdJM8b3
	 hfyzZ+CipeO1eqzJNHXKQjl/wHKmI6a+P8QsMzUjW8IBVF53+ws7+d09a4Q9Tisb5xYe4J5c+JSP
	 LxjL9Ym2spexbLEbhSTVpgBWfxEQ3ssHkDvpJQYkt3nw4vPcOXr/Ha/hJv/wg56YxzQv7u1btldJ
	 t3raV4xm8Oi4OO7YE8Bmij8w3cmtJbY4BhrX/fGY722AezT1zj2gnsdl4v86G0RHONk6GNN1CvzS
	 SIk43nVLn/fE6i96DsVbPCJ1ZnnODMQOzuexxVnSORtx/Ij9nw8q1bbc98lu1Cuu7s7BM+EgdCUy
	 84RBW2JOL1iiKNRzhqo3zaVLWAhvAtZEazhM2ijDD8YQ/7MtkwDjkMnSnwJP4diq0ElQrXbAls2W
	 8ZPOe4iUZqzE8Q5XWvv9lzqlBpfHWnuuAV3I1pDVxvsl6gYy3svD+6NUciKnTj9uOmJdwrcqWkgm
	 7f09TL9umSJCmD7d5WdVIXAgHa45KJRwdsw8x9abkNP5RJp0fZC2fToaV5noyB2osrb9Y73SK5nR
	 3emiaU3np0Xu3wSBywRWF1YnSZ8ApH7SooI/DwTEkOmdKsu6OlgO8fLnsfAP9yjPcK32D5Tg5eQ6
	 bao3xW
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhaoyang Yu <2426767509@qq.com>
To: daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	gregkh@linuxfoundation.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhaoyang Yu <2426767509@qq.com>
Subject: [PATCH] USB: pxa27x_udc: check return value of clk_enable
Date: Sun,  1 Mar 2026 16:23:47 +0000
X-OQ-MSGID: <20260301162347.267365-1-2426767509@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_082357_716284_A278832F 
X-CRM114-Status: GOOD (  10.21  )
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
index 897f53601b5b..69fcecaf6061 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -1696,7 +1696,13 @@ static void udc_enable(struct pxa_udc *udc)
 	if (udc->enabled)
 		return;
 
-	clk_enable(udc->clk);
+	int ret;
+
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


