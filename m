Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CBFC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 19:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WR9Z16OsFy07IJ2Wpoq4QgAb7JQ3vEcoxCQ2ViU+9wE=; b=YHPAa9RLO2IDAqID2wj2GuAPKH
	01weyENkuM6SldcShL008eTTxgM/c9pwa0Fa6EacfDvngcNs5igP1UEliuqlgGKzQyBp8BkBI4uej
	hS07eiT7xd4CFhrPwn68+guVWl6ErzFyyNB8nZdFelQY29Y65s6nKjAV1YYPiVVcWFehdmNcpsJBi
	LAawl7wKu7thec6iJ0aAY/VULepoTc2wVz6by81SAjy5fLy4jDDkHhoIjqIJQ+spG/Lwh520yRXmK
	bD+q93z2DWA5vRfraxlOgfoScxnUwXTeJ/AQpUG1IWMnBpBUoTr8Miqg0qAbl4M5UsMgX5N0BkRY2
	H+slplFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Q8o-00000009jMW-0OUI;
	Thu, 03 Apr 2025 19:22:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Pwq-00000009f8i-38PP;
	Thu, 03 Apr 2025 19:09:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 10FAE5C6360;
	Thu,  3 Apr 2025 19:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB07C4CEE3;
	Thu,  3 Apr 2025 19:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707395;
	bh=k3JtT1044L+E/0ZKJrYQfqsGEng/GOGW9/OU9mKWewI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lNtf7aUWq8T/N8thtUa1ulR4nwkpFRQ/q8AJBMPtinMp/+jxhofEQ6DXlrL9yASxH
	 Sjm4yN8wP6tAKvtD4vEgG3QyuzeoDJuLG4IetxIeOR0M91iPmnY1+zeUbK7XXSc4Of
	 vk2YC9QLBGDKolP9uTXWHsEZ3YXj1XnCLU1WUrwZgEdSCJRivwUqEgJR+bm938G193
	 gsg9chavbyQZ2qxig6zuvcegoE0Yig0H0xUdzeghomI3Ej1Ri8ql2rpiebh21QWxV3
	 t003KI06k47fA9gjYo1ZHENFRNVsUFUecZkjqTI9sSLIyPjOaLmoLnZqm28wlvY4yo
	 ZzuxEb2iATXkg==
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
Subject: [PATCH AUTOSEL 5.15 13/16] wifi: mt76: mt76x2u: add TP-Link TL-WDN6200 ID to device table
Date: Thu,  3 Apr 2025 15:09:21 -0400
Message-Id: <20250403190924.2678291-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403190924.2678291-1-sashal@kernel.org>
References: <20250403190924.2678291-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.179
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_120956_840939_1E5C94E0 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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
index 2575369e44e20..9369515f36a3a 100644
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


