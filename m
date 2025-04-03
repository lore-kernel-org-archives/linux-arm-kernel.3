Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360E1C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 19:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWdLKGAnYLVYKNLEKoU2bBVM35N2T2bjMzPVcRFUn5s=; b=gPCfef/0/d/2g5wffHK2Uuxe8G
	T86mwUA06fEt03IXaHzYW2YjQkhYcg6iCllRJxUiW9RzR78/CZb4AEdUoM8zJ4JR4F42EbjhoOQuX
	2bfh2QKam4WnWGTaYdDtQ97E4lWj0Gl/A1IZNf9ARSbs70cj9n0WYSw0FEBwFo7MKuhDvcNV66fAA
	2KjXoK7a9169UMVOfY2LjYJB5EUmZETewW4sFlEYUke6K80JiaWr8bD9T0bmELkFa6oejQDy6WJiA
	VBR3YtOPOm5Qe2nD/ElYd87mrqf6TgwJlP6egVLXyKQm6+URNUHbK1yThl+voevyXxbvc0XVoSAGQ
	5kcAX4gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Q70-00000009ihV-3hIg;
	Thu, 03 Apr 2025 19:20:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PwE-00000009ezz-0Jj5;
	Thu, 03 Apr 2025 19:09:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8673E614B3;
	Thu,  3 Apr 2025 19:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9381C4CEE3;
	Thu,  3 Apr 2025 19:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707357;
	bh=GNHJfVzVNAlpwYr3o5Fo+VsNpqk3jsX89c60zyBrKwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mNtZH96SC7vejZoof6rb13cd2BmHITWz5AZ5zVhIMpl1nrI339vnsX3xu8Weky0fZ
	 YeZ80LunGjsW//mHlS+ItEoJf+aHO+I0iy056fTJQMb/Brv0Pv2bxwTozusVHt9rW2
	 O4Pl5T0CtmPe45VJ+FBK8ZJBEjP8gX0+w58nj1eSykCFqBhSzGHIeixdoHTr2f6Gac
	 8uDWHNiY8ghFY8Ql4uWQ7GXRz3c+bTWcSj50qYajSndhBod84xc2L85VXtvXfm2nEF
	 Kw70X1zdMGg4EHMMv2e3xBr7c95qFD/3ALyINWEaD2+ugEOB38zcbMidyemh91AMyd
	 zR1AlSzHzUUzg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 14/18] wifi: mt76: mt76x2u: add TP-Link TL-WDN6200 ID to device table
Date: Thu,  3 Apr 2025 15:08:40 -0400
Message-Id: <20250403190845.2678025-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403190845.2678025-1-sashal@kernel.org>
References: <20250403190845.2678025-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.132
Content-Transfer-Encoding: 8bit
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

From: Icenowy Zheng <uwu@icenowy.me>

[ Upstream commit 06cccc2ebbe6c8a20f714f3a0ff3ff489d3004bb ]

The TP-Link TL-WDN6200 "Driverless" version cards use a MT7612U chipset.

Add the USB ID to mt76x2u driver.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Link: https://patch.msgid.link/20250317102235.1421726-1-uwu@icenowy.me
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x2/usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
index 55068f3252ef3..d804309992196 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
@@ -21,6 +21,7 @@ static const struct usb_device_id mt76x2u_device_table[] = {
 	{ USB_DEVICE(0x0846, 0x9053) },	/* Netgear A6210 */
 	{ USB_DEVICE(0x045e, 0x02e6) },	/* XBox One Wireless Adapter */
 	{ USB_DEVICE(0x045e, 0x02fe) },	/* XBox One Wireless Adapter */
+	{ USB_DEVICE(0x2357, 0x0137) },	/* TP-Link TL-WDN6200 */
 	{ },
 };
 
-- 
2.39.5


