Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90596CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DA7RFIZiSnKNZ2k3BWck+8a7YzqJ9Q64kifK8VCw4h0=; b=mpbHKHbBvwdmRJEPP1ynWq3eQL
	nXu93ibgPOaBUrDgrZibpGBeqKwCnb1aTWnWv/kmEBD3ByoIssfL4BzBSzhRQwiaIpZJwwLpBwOPb
	aWMjgohZuCbJMbbaulZvwxsPwlJjskFGJ5Psto/Khp68azg+kFF0uQ/0Mw5KcMz4rNR+p6Wbwkgxi
	aZ9RdBAx6+g4UJ77AGI31UKwlMfATy9ocNUyB9dwMKMr5xEtzN3Lmn/h90IUzL+2P7W68mmtisqzP
	pmPSrcQ+UuqGikS0c9WG5bGUKj/TrbxxVhhOJwn01p8yV77D6ghUzGBUIPZ/xzt3DKbZY+uj2vlA1
	JgOKLfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXadK-00000008zUt-1G3L;
	Thu, 11 Jun 2026 08:19:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXadI-00000008zTd-0CvQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:19:25 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wXadC-0008Vx-Es; Thu, 11 Jun 2026 10:19:18 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 11 Jun 2026 10:18:59 +0200
Subject: [PATCH] arm64: dts: imx8mp-frdm: Add missing HDMI DDC pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-imx8mp-frdm-hdmi-ddc-v1-1-b4e4c9bb0729@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAHJvKmoC/yXMTQqEMAxA4atI1hOoir9XGVzUJtUIVWlVBPHu1
 pnlt3jvgsBeOECbXOD5kCDLHJF+EjCjngdGoWjIVFaqUjUo7qzditaTw5GcIJHBKi10bqjQjbU
 Q09WzlfO3/XZ/h72f2GzvC+77ARIyDax4AAAA
X-Change-ID: 20260609-imx8mp-frdm-hdmi-ddc-715a3cd5a9ff
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_011924_114473_635A752A 
X-CRM114-Status: UNSURE (   8.15  )
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

Configure HDMI DDC SCL/SDA pins to support reading EDID.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
index 5fb9714215bf..f43330d1ff8b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
@@ -562,6 +562,8 @@ MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02		0x10
 
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x1c2
 			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x10
 		>;
 	};

---
base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
change-id: 20260609-imx8mp-frdm-hdmi-ddc-715a3cd5a9ff

Best regards,
--  
Philipp Zabel <p.zabel@pengutronix.de>


