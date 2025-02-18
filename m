Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E9EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Jvh89liHhUVcIJNDlMRNoA1LMbikBB/ETpicfHeCzw=; b=oEZoLYUiZ7XhiDliHdmOWhbRph
	2FTnAmlO2lXzIOpjUo5ukaxyilrh8vBBd9OQQAZiCK36U7c4PBv9YaAf6RN2S7F20GXlbsUJCttyp
	LZpPuuJ4zFyozgAmFl4bu1oH9SyJjDFyQ7zWa2py1jpOLWN4OUUOvr5HPp2PLpWrLJXKpjZ4QTJ4h
	E1HTf5v/yShlyJoyq5cQsMb9nc2x1v1CalVuxf14S/YO84fuO7SRkQuhaXOx9I/SCS6ln6z9t9M1o
	VgBbrfiaTaemZeva7EBMPb77Lh5Xxo59VSDklXG7hZL0dmXy/HxlK9u7LK43diDT/chfmZDzSRBZL
	oNw+RCig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJBP-00000007KfR-1yuu;
	Tue, 18 Feb 2025 08:42:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJ8V-00000007K2p-1eO4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 08:39:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 59858A41DC3;
	Tue, 18 Feb 2025 08:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93CD7C4CEE8;
	Tue, 18 Feb 2025 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739867961;
	bh=Gy9nsuCf3htO82U+zSkGjYn4dRyosjBjhXa5Aa13C6w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ePsMIOC80/SK1zxGxx4G6UXRkb4O/zWbk4sznSjOUveHiqD4SKY60DtHbPQuZpFt2
	 F8H/nCXk9uNFpaEIQfTtAz53Yag/c8xO6BTgPj5BvO2wMujTt44o6N9jW1sNudip1J
	 cALJ48SVQZfsqmhqLWrGgJKNJqK3aW3h7i5+Qd5KDSPnM930+p/LpB0A7fh5wV8KQt
	 3FKVw9Ip7zEJSVhbCQZaaq97CBpWxtwilkwtYNqdqTkhjMtd3eeoWHl2GmN7ZFBj4K
	 agBbpnmNCKbmcXr7+Y/74yUqonRmEHnEuyWjeRs4RphXvHRKsZ8YwgiXsGyqmsugB/
	 gByhKbLttaC+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD96C021AD;
	Tue, 18 Feb 2025 08:39:21 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 18 Feb 2025 09:39:16 +0100
Subject: [PATCH v2 1/2] arm64: dts: imx8mm: Add pinctrl config definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-pinctrl_defines-v2-1-c554cad0e1d2@gocontroll.com>
References: <20250218-pinctrl_defines-v2-0-c554cad0e1d2@gocontroll.com>
In-Reply-To: <20250218-pinctrl_defines-v2-0-c554cad0e1d2@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739867960; l=1515;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=yjNbAWHLu3XXaI0KgZJRRyT6zjDPbGIjjNo7caofJsc=;
 b=oHxxo9a6aS+p0LMiv1qxKq7p8JB5DEv7d8Inj/qw+mIItQ0kBzViKPDU+v0MQd48tJir8l24B
 Q4U67GyWY59DIbtNqH2f52twxZCESPgvlWZM0H2WMOJxQtZCpQ3ZuGD
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_003923_567857_22488303 
X-CRM114-Status: UNSURE (   9.51  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

Currently to configure each IOMUXC_SW_PAD_CTL_PAD the raw value of this
register is written in the dts, these values are not obvious. Add defines
which describe the fields of this register which can be or-ed together to
produce readable settings.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
index b1f11098d248ed5fc8ac42daed808beebe3bf7bc..127fed81bafdd1baee57a02e5be2deb2462e01a2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
+++ b/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
@@ -6,6 +6,33 @@
 #ifndef __DTS_IMX8MM_PINFUNC_H
 #define __DTS_IMX8MM_PINFUNC_H
 
+//Drive Strength
+#define MX8MM_DSE_X1 0x0
+#define MX8MM_DSE_X2 0x4
+#define MX8MM_DSE_X4 0x2
+#define MX8MM_DSE_X6 0x6
+
+//Slew Rate
+#define MX8MM_FSEL_FAST 0x10
+#define MX8MM_FSEL_SLOW 0x0
+
+//Open Drain
+#define MX8MM_ODE_ENABLE 0x20
+#define MX8MM_ODE_DISABLE 0x0
+
+#define MX8MM_PULL_DOWN 0x0
+#define MX8MM_PULL_UP 0x40
+
+//Hysteresis
+#define MX8MM_HYS_CMOS 0x0
+#define MX8MM_HYS_SCHMITT 0x80
+
+#define MX8MM_PULL_ENABLE 0x100
+#define MX8MM_PULL_DISABLE 0x0
+
+//SION force input mode
+#define MX8MM_SION 0x40000000
+
 /*
  * The pin function ID is a tuple of
  * <mux_reg conf_reg input_reg mux_mode input_val>

-- 
2.48.1



