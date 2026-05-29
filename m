Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69016CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLTwxN9bxgNZGLFYHSNaPrNrjGjq5zlWMOSTL/pjs+w=; b=4GculDkIkfL/pz9b14/6YXBCDq
	Z0NbK8a9xp+WGhAP9D840xG7s1AOH2GlIpGJEEWE7qfxuB3a73CLDgq5WCNvhTkreVgzjxabtn0n9
	rBoJ9bUTk1Cml5ENDds+g2Bs/m1K0rR1f2NwYfN7NiuosPNMZfY9+wacZlvYj9uAK7Pz28+sMs95I
	dC4RRLzpQ5NbBK6b0e9/Q8hubMNArLtvvD672EpesLy5vLTaoh9MhAhbfnRzxZgvOxRfmWrTXuS44
	xc/Fi9eeYXmpSkFNVJaGoMwqGntjVMCy11YjmbVYKqMqvEQjxMkrj/I2QesebRKfACWKWqYb/5PYI
	PlprOlNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuW2-00000007CVt-09CT;
	Fri, 29 May 2026 10:32:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuVM-00000007Bp9-0xpM;
	Fri, 29 May 2026 10:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E135F44D4D;
	Fri, 29 May 2026 10:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5D7AC2BCFA;
	Fri, 29 May 2026 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780050708;
	bh=ugw3M+UGdOLpcJlOIYx2uYla5lSbmSNk0T33tbmMLJ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SEA5FYq5NHHo4Z4tcNPAVtIVTI2c3CrENmp61wA2G11LUFctGsc1aEVNxYa4pZgHD
	 C3TL3Sa4mk9UhTrnKL1trDOi2UvDSwCzjcEIsuwJ71zzq73Or4XFXolPwHSt75Qo5S
	 NWvpYaTu9nwm1legu7eDUm4u1AZLual54EQMkYPBIZ8qhrzAeERsWv0Y4/f6kHkW8p
	 IHkvsGWQBMIVlYL2rjkYW/v4V3nxFoZxwxxgNlxTu9RNSCqk0jzrCbS9oeg81YDm0n
	 WmP8QitiszqxQWoUmtncCoUr1o64bXboamVE2+QfEWP3080IYHqhf+swCpTUq2j9q6
	 RzXE7N1pwnRlA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF545CD6E4A;
	Fri, 29 May 2026 10:31:48 +0000 (UTC)
From: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Date: Fri, 29 May 2026 18:31:50 +0800
Subject: [PATCH 11/11] net: wwan: t9xx: Add maintainers and documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-t9xx_driver_v1-v1-11-bdbfe2c01e57@compal.com>
References: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
In-Reply-To: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Jack Wu <jackbb_wu@compal.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, 
 Shi-Wei Yeh <shi-wei.yeh@mediatek.com>, 
 Minano Tseng <Minano.tseng@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780050705; l=3341;
 i=jackbb_wu@compal.com; s=20260526; h=from:subject:message-id;
 bh=gZ/Ej1LYBDfojFwAl08IAxUspPvBD4Ms/KxsQD2QGDY=;
 b=kngBuXKPlROTIHaDSxrYnkBefpd0CriRtU4rD4eRMfi6UiklYLZpHoraj7G+8IMsOfKLihMqZ
 mPsd53cbmeFCVJngDTeaMuDmGGGc8oKK6cEb/m/bez0EzQLL4rvhGgO
X-Developer-Key: i=jackbb_wu@compal.com; a=ed25519;
 pk=VH1prTWixNl8OEUPPSfII3p46MzJpQN8J3+ecE1tZXg=
X-Endpoint-Received: by B4 Relay for jackbb_wu@compal.com/20260526 with
 auth_id=793
X-Original-From: Jack Wu <jackbb_wu@compal.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_033152_332704_05D0FE69 
X-CRM114-Status: GOOD (  14.23  )
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
Reply-To: jackbb_wu@compal.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jack Wu <jackbb_wu@compal.com>

Adds maintainers and documentation for MediaTek T9XX 5G WWAN modem
device driver.

Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
 .../networking/device_drivers/wwan/t9xx.rst        | 48 ++++++++++++++++++++++
 MAINTAINERS                                        | 10 +++++
 2 files changed, 58 insertions(+)

diff --git a/Documentation/networking/device_drivers/wwan/t9xx.rst b/Documentation/networking/device_drivers/wwan/t9xx.rst
new file mode 100644
index 000000000000..eaba82f18c1b
--- /dev/null
+++ b/Documentation/networking/device_drivers/wwan/t9xx.rst
@@ -0,0 +1,48 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+.. Copyright (c) 2025, MediaTek Inc.
+
+.. _t9xx_driver_doc:
+
+====================================================
+T9XX driver for MTK PCIe based T-series 5G Modem
+====================================================
+The T9XX driver is a WWAN PCIe host driver developed
+for data exchange over PCIe interface between Host platform and MediaTek's
+T-series 5G modem. The driver exposes control plane and data plane interfaces
+to applications. The control plane provides device node interfaces for control
+data transactions. The data plane provides network link interfaces for IP data
+transactions.
+
+Control channel userspace ABI
+=============================
+/dev/wwan0at0 character device
+------------------------------
+The driver exposes an AT port by implementing AT WWAN Port.
+The userspace end of the control channel pipe is a /dev/wwan0at0 character
+device. Application shall use this interface to issue AT commands.
+
+/dev/wwan0mbim0 character device
+--------------------------------
+The driver exposes an MBIM interface to the MBIM function by implementing
+MBIM WWAN Port. The userspace end of the control channel pipe is a
+/dev/wwan0mbim0 character device. Applications shall use this interface
+for MBIM protocol communication.
+
+Data channel userspace ABI
+==========================
+wwan0-X network device
+----------------------
+The T9XX driver exposes IP link interfaces "wwan0-X" of type "wwan" for IP
+traffic. Iproute network utility is used for creating "wwan0-X" network
+interfaces and for associating it with the MBIM IP session.
+
+The userspace management application is responsible for creating a new IP link
+prior to establishing an MBIM IP session where the SessionId is greater than 0.
+
+For example, creating a new IP link for an MBIM IP session with SessionId 1:
+
+  ip link add dev wwan0-1 parentdev wwan0 type wwan linkid 1
+
+The driver will automatically map the "wwan0-1" network device to MBIM IP
+session 1.
diff --git a/MAINTAINERS b/MAINTAINERS
index 461a3eed6129..3fab2b47f531 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16494,6 +16494,16 @@ L:	netdev@vger.kernel.org
 S:	Supported
 F:	drivers/net/wwan/t7xx/
 
+MEDIATEK T9XX 5G WWAN MODEM DRIVER
+M:	Jack Wu <jackbb_wu@compal.com>
+R:	Wen-Zhi Huang <wen-zhi.huang@mediatek.com>
+R:	Shi-Wei Yeh <shi-wei.yeh@mediatek.com>
+R:	Minano Tseng <Minano.tseng@mediatek.com>
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	Documentation/networking/device_drivers/wwan/t9xx.rst
+F:	drivers/net/wwan/t9xx/
+
 MEDIATEK USB3 DRD IP DRIVER
 M:	Chunfeng Yun <chunfeng.yun@mediatek.com>
 L:	linux-usb@vger.kernel.org

-- 
2.34.1



