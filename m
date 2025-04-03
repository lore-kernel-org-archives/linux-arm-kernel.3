Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD186C36014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 19:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCiXATxaY6l/1ZlW9kfY8iPzIpuHBGnDJeYZ18LYQvM=; b=dNVG5lnyaBxSxRYJMxfZlmAJsx
	rM4XB77JyNXJfIyMQV4+IOO8RXqj5bCyDuBIkyZoA5teTJnFrxj/NpZHWkD9GRDdpR4U2L0PaqCWi
	G5NYpHUgYXcFNxYTehnvg85nqsL3M/E7UO/KSysJgSNBxBe6ABJ9Bza+fwYc8GaBKvLFXsBhLP/fo
	Q+bpkwfJ6t0fFbnoiGg/vh29GZewEfngZnl7on0fVh3k0FIjMCacOWooJsYs9+Z04LT9pZ3V3IfgD
	4XXVGvePzvtmshR3wgGZQ6UcF3ulu9WSnqAuAi4z4OrIQFlJGIB/JSNi/ghkXIUjS//ryz5XyIh2X
	M9AjtR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0QAa-00000009jbT-0QxE;
	Thu, 03 Apr 2025 19:24:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PxP-00000009fFU-0xK8;
	Thu, 03 Apr 2025 19:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F1FA614B5;
	Thu,  3 Apr 2025 19:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F71DC4CEE8;
	Thu,  3 Apr 2025 19:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707430;
	bh=NANuZcB+1Aam2VftjP5x9dhJ7SvyFJhCDE5Np6+DG1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sdThhI7ySQBkhSrHXaB/Ie7tHBlmTGMnyuEVtRULefQqzZWtCCMcHo+B+g8lRHQiV
	 TvH0vCuJyYMIHpvEqzDQ+ncbog5X99OXTptHZXJOGk8S2kK33dKZWU1s5mjaw4isN5
	 sD6kQAOxeVG4V8PZAsUc5HvAJrDxqFYB03cqYlYUVGZx6DGUfOWXXwCP+2flHVao4n
	 8hDgblPnlDiD5CCGmUbmxcJ8+P436iNJeEIdBS6yrXsJFCAZ09ZWddAf4OHNlvWocW
	 GL8bK1p+xGsX0+shMl3baEboM9oBDOhQ4LR5I9zVEReBhw6dMxZckeNT9pPYpcj+xA
	 0de59l6vID5hQ==
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
Subject: [PATCH AUTOSEL 5.10 12/15] wifi: mt76: mt76x2u: add TP-Link TL-WDN6200 ID to device table
Date: Thu,  3 Apr 2025 15:09:59 -0400
Message-Id: <20250403191002.2678588-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191002.2678588-1-sashal@kernel.org>
References: <20250403191002.2678588-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.235
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
index 4e003c7b62cf6..82a193aac09d7 100644
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


