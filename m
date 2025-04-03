Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EC0C36014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 19:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NV5Keu7PobIj1Vs9zR4FhOKfU5f9HhtMky13/A51/JY=; b=zn0YIDnTzE3p2KmqWYbrRGLjsr
	jTILMoK0kZkeK/HZl7OXCXZhRpp5CE9AF4QuCHrfDeOMXpq1W+1hJZGBqlazK53MGZ+9yi5CqhLj6
	M6JiBLDmvTq0B6HVbhiyLRfSVhx2F1T2lcHukz5HOU3mKJm/W1w4/i86Ei/2Fq66lvuHZLZb8tmOL
	cwb8/VhxJGT4SZtbSF5S3LAUvyhjlkYVlNhJXQQkGMO+4qGhJYsg7fcqzTh2q3CG8lB1yd4ilcV82
	ocdWTQetVt9ampTTC53c5jZ2Cj8ePc8p+Nwtj87e1aHUvHu8K8OlLyKTct7OIW95W5HC8e9MPFflg
	jPcptMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0QCM-00000009k2S-0Lpj;
	Thu, 03 Apr 2025 19:25:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Pxv-00000009fL2-4C13;
	Thu, 03 Apr 2025 19:11:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72DF6614B3;
	Thu,  3 Apr 2025 19:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3234C4CEE3;
	Thu,  3 Apr 2025 19:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707463;
	bh=p0tKKu06Y829F+DUE1Ct7xBxdEYR3/AUxIgzVvJ3Lyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=osoQnYQkpnINrA2CaWCLL5cG7z/TKM10yEBblFUqLTLLW9w4lP2Tb63pu9/qqHG6j
	 Uh7Q9b8wVdxkTc5IRfRpDYc+DqLnVp3vbdzJAaAqFkokDdSpw01jHtXTXYB5RcXtFW
	 QtX/4kcFG3+cODEMiTGsxxAvKKRTng6voP64QUrIOf39jRSS6IRG3EwOL0YQ7Vi0n8
	 hQArBsUBbUMwoGpXwlfLkRebkmbHx+6kHSB9BT/66FY0o0Qr65ECJ0jp+la2UyMcN+
	 VX9GOdgUFHxTKU0Iy3WX104n/FlHgL6NxtWimsZRYjOJhqv9Xk5YdFBR2k+O4k6HiY
	 678SbobnicPTA==
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
Subject: [PATCH AUTOSEL 5.4 11/14] wifi: mt76: mt76x2u: add TP-Link TL-WDN6200 ID to device table
Date: Thu,  3 Apr 2025 15:10:33 -0400
Message-Id: <20250403191036.2678799-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191036.2678799-1-sashal@kernel.org>
References: <20250403191036.2678799-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.291
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
index 96a2b7ba6764b..8c392d55d59ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
@@ -19,6 +19,7 @@ static const struct usb_device_id mt76x2u_device_table[] = {
 	{ USB_DEVICE(0x0846, 0x9053) },	/* Netgear A6210 */
 	{ USB_DEVICE(0x045e, 0x02e6) },	/* XBox One Wireless Adapter */
 	{ USB_DEVICE(0x045e, 0x02fe) },	/* XBox One Wireless Adapter */
+	{ USB_DEVICE(0x2357, 0x0137) },	/* TP-Link TL-WDN6200 */
 	{ },
 };
 
-- 
2.39.5


