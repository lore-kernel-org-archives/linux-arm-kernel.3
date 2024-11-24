Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02447E668AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 13:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjDpsF8wjG9tmK6+KtUoiWT9TQ0r6XAVjRpwr624nMo=; b=hcKD5xb/mHRHWOqDPms9xOa+FD
	U5plyCNxu/EiAhsrVRfR1yUhunGsB8Ts56Ihsuwy/Esldv2gYCOJOgtgZiymULeZSz5H/OJmazsAU
	V0yxPxpp34R650kJ//5GFhWjz6PBMaSrvTn8rQQInN97WGXAkbLBMvsMu3PtG9OeKPhyoBBVduHAN
	hhI2Uzn8UT/Py00RZSGcHByYGJNDREAgLmnTuIUm2wqHzUM1pSUCndbYeG0JVlC8zpLvqfJs3Fgdt
	ZhbjMhn/t9bDzllRHskYSkMDZ9IJlu6pljZe1fYRU5r+JlpBYl1Kay+xGT3kC3xRpe2NnvXdOcuUV
	BN3yc8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFCrm-00000005xoM-3Zmk;
	Sun, 24 Nov 2024 13:41:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFCpA-00000005x48-2gcy;
	Sun, 24 Nov 2024 13:38:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 892B55C5613;
	Sun, 24 Nov 2024 13:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DECC4CED1;
	Sun, 24 Nov 2024 13:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732455531;
	bh=jEb8q9faF808HFMBLN4NJXQ6d+H5TT+1yF2sXcH8ztY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mnpdYw/vIHlq6mTYQW4otconACqrdsBterYppG98AwtxEtyifl+D19A4O14DCHmPL
	 iLMBY3/e8nz0jKJc7UXoIPpO2o8FFPyL0YPd5lXefV6Dx4/DtFVHvYBBblYCm8N3hK
	 fCDOHC3e+2Ol7CMVZqqcMhjs0bHA59S9ZCmr3kA8ec95XHaWcRHlPobtAyoI9hyBzR
	 uu8jz1tMcqvcrl94uV4mjcxCu6aA3IXqnxNfnlgKMkBu1ER4sb/eYQxtnPIHUo0Wpg
	 ky9xbp/HOQU8fh0asNfx3POpP9SMjaaV6CfSAOSwbBkrS/VB3slXJCMHtOucPLoqBF
	 qtdkDz7l7IZxQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jiande Lu <jiande.lu@mediatek.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 103/107] Bluetooth: btusb: Add 3 HWIDs for MT7925
Date: Sun, 24 Nov 2024 08:30:03 -0500
Message-ID: <20241124133301.3341829-103-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_053852_720358_1E0537F8 
X-CRM114-Status: UNSURE (   8.85  )
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

From: Jiande Lu <jiande.lu@mediatek.com>

[ Upstream commit de7dcf9d1df4b0009735756d0a2adff09c3f21d4 ]

Add below HWIDs for MediaTek MT7925 USB Bluetooth chip.
VID 0x0489, PID 0xe14f
VID 0x0489, PID 0xe150
VID 0x0489, PID 0xe151

Patch has been tested successfully and controller is recognized
device pair successfully.

MT7925 module bring up message as below.
Bluetooth: Core ver 2.22
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
Bluetooth: L2CAP socket layer initialized
Bluetooth: SCO socket layer initialized
Bluetooth: hci0: HW/SW Version: 0x00000000, Build Time: 20240816133202
Bluetooth: hci0: Device setup in 286558 usecs
Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.
Bluetooth: hci0: AOSP extensions version v1.00
Bluetooth: BNEP (Ethernet Emulation) ver 1.3
Bluetooth: BNEP filters: protocol multicast
Bluetooth: BNEP socket layer initialized
Bluetooth: MGMT ver 1.22
Bluetooth: RFCOMM TTY layer initialized
Bluetooth: RFCOMM socket layer initialized
Bluetooth: RFCOMM ver 1.11

Signed-off-by: Jiande Lu <jiande.lu@mediatek.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/bluetooth/btusb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 2a90033c014b7..0dad2ac5914f4 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -654,6 +654,12 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe139), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x0489, 0xe14f), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x0489, 0xe150), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x0489, 0xe151), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3602), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3603), .driver_info = BTUSB_MEDIATEK |
-- 
2.43.0


