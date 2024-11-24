Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A449BE668AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 13:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dafp6xCgf0myKtVXwQDcYquK3JCNUMXi3nyhR4aXIYI=; b=ClbI1jjdpEErPq1/XVS0na+3n+
	2Qfwu+d3/fJ9shwZNq8D4zWB8tYb5Jh8Bp9mXOs6kBeBZtWHonR7QPdPwAna4ER8S0aEd4kOolEYN
	vT7Y/0ZVSpPcRGylSZd6ytG3wCr+siI9CI2wKIwE7eC8oKOwUMbDGg3SZFVPUIvpbiuZ7gHBKLiQG
	WZpWrVoWLVMFEmQqZ7OH1+Rc00aiROe1rVCOphPrS8iHr48AQhMX88XyqD/+Q5gTUBf5w0wqvhRuN
	lazGrkWPol0VUD7Q9opj0acd4D+lkqg5ivgz3tVJ826+UrWQLJzRQuTnQcR4CjTEbEPdgKMyhmjgZ
	arqGH4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFCpv-00000005xDM-3XhF;
	Sun, 24 Nov 2024 13:39:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFCoy-00000005x14-08Tt;
	Sun, 24 Nov 2024 13:38:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14E43A40B63;
	Sun, 24 Nov 2024 13:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CEEC4CED1;
	Sun, 24 Nov 2024 13:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732455518;
	bh=hzfJxm0Gdbrm19hITQJD9qGLt0ytvs+9WFMKYbj6Y3Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OMTWkp2pTDLNOM2vzatJEFWxphcJKn4VsKdB3Ix3juJlLrqopwW6JG5D5YPVbRYnG
	 mMjcK6yfvqK+YAj10NW8SiEMvmy99W344kvLksJ/HMcjteNgQeUhq0d53bIensZkSM
	 MqYA1N92oCUgrX53g7bNJRaYuu4eY9FGcotDRwZQ7k8zbKjfvHMb+mFc0r2hltdW9M
	 p3eB2d+Z0stc9cH8a2hsxlj87i1ux3m9RCtTw5UYHoDmxszVcvQFxDLcmV98HY7/kO
	 JK7J/XoNzi2we0dZgmnNBzRPXOlxNfsrwKZA7clkl1hNd+BJ1c4CldAJzt1vPLGez9
	 jqBa/JndD551Q==
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
Subject: [PATCH AUTOSEL 6.12 095/107] Bluetooth: btusb: Add USB HW IDs for MT7920/MT7925
Date: Sun, 24 Nov 2024 08:29:55 -0500
Message-ID: <20241124133301.3341829-95-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_053840_209844_1E5ED8B7 
X-CRM114-Status: GOOD (  10.17  )
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

[ Upstream commit a94bc93a305bdcb20cc62978c334cace932b1be0 ]

Add HW IDs for wireless module. These HW IDs are extracted from
Windows driver inf file and the test for card bring up successful.
MT7920 HW IDs test with below patch.
https://patchwork.kernel.org/project/bluetooth/
patch/20240930081257.23975-1-chris.lu@mediatek.com/

Patch has been tested successfully and controller is recognized
devices pair successfully.

MT7920 module bring up message as below.
Bluetooth: Core ver 2.22
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
Bluetooth: L2CAP socket layer initialized
Bluetooth: SCO socket layer initialized
Bluetooth: hci0: HW/SW Version: 0x008a008a, Build Time: 20240930111457
Bluetooth: hci0: Device setup in 143004 usecs
Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection
command is advertised, but not supported.
Bluetooth: hci0: AOSP extensions version v1.00
Bluetooth: hci0: AOSP quality report is supported
Bluetooth: BNEP (Ethernet Emulation) ver 1.3
Bluetooth: BNEP filters: protocol multicast
Bluetooth: BNEP socket layer initialized
Bluetooth: MGMT ver 1.22
Bluetooth: RFCOMM TTY layer initialized
Bluetooth: RFCOMM socket layer initialized
Bluetooth: RFCOMM ver 1.11

MT7925 module bring up message as below.
Bluetooth: Core ver 2.22
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
Bluetooth: L2CAP socket layer initialized
Bluetooth: SCO socket layer initialized
Bluetooth: hci0: HW/SW Version: 0x00000000, Build Time: 20240816133202
Bluetooth: hci0: Device setup in 286558 usecs
Bluetooth: hci0: HCI Enhanced Setup Synchronous
Connection command is advertised, but not supported.
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
 drivers/bluetooth/btusb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 93dd98674682d..343f535a81789 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -565,6 +565,16 @@ static const struct usb_device_id quirks_table[] = {
 	{ USB_DEVICE(0x043e, 0x3109), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 
+	/* Additional MediaTek MT7920 Bluetooth devices */
+	{ USB_DEVICE(0x0489, 0xe134), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3620), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3621), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3622), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+
 	/* Additional MediaTek MT7921 Bluetooth devices */
 	{ USB_DEVICE(0x0489, 0xe0c8), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
@@ -638,6 +648,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe11e), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x0489, 0xe139), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3602), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3603), .driver_info = BTUSB_MEDIATEK |
-- 
2.43.0


