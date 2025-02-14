Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B6BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 16:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fblWG6bptaG5oZEG9H68NWuWOVyzedngXL2QnLB9szg=; b=Y5OHex4NyyaXlN8BmqZr/OB3hQ
	5jNpgJH1VudYhGqwMa4sKF7oCYx0WTd4gUZpE7nq5xe+0VETAUOCEeApPWMchWnfroR7QvahJFSxp
	lnnnWckrJDqivuQkQuqIOlvYHoLIS38dnWFzIQjRsSOzIZPGM4+WVniSnjr7iZubuU52bB8xDnhZ0
	o4oMVgsYs9Sv1CG7uO54A1M/VIX1Uyzr9eA6QBOgJ2wd65ds3Tfg9WoLBcYS+XfbGU7K2iIxu0ULu
	F4s8pgdwqhvgyDDKHB/+i8MRgs3EBpY983Vfzgp0EyBT8hRX2Zmf6ZceM8wfjtP65yvbLy7rdQjBd
	udONBVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiy7P-0000000FQmb-236c;
	Fri, 14 Feb 2025 16:00:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiy4X-0000000FQD5-1sJE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:57:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2764F5C51A7;
	Fri, 14 Feb 2025 15:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15CF2C4CEDF;
	Fri, 14 Feb 2025 15:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739548664;
	bh=ouGwZqg89Trumuly9HFKbyX2Azi15niqMZRJjzo2/Bs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RDqtJGSPkrmeGflKtkQMo/zH7ZK0OYdGlEQRr5Uo5qW3B7nMjM3iSBVn1T8fONFtG
	 WUPseyY/S2OKmncvVotPcVH1gzek4Vmqo0dZAezu88RJuzRVB3/jooJJbmYspHZ/FG
	 UR+0Pey5UX8+nY8jyuEMprO+8Kma2p8J2Tw4v7NXewhxpD+4L5vwhwvIu7sT6UxqFR
	 k7+y0YZdKgEbwsUgMH4np0lxjeCJipshsZIJPrIXLQ5CHWloWQy5U43aG71ptilc47
	 r/TDicEvThmDLH/qNi++neVBLlqh5WoOvDob+jWq09fGesXO21TNPJVyPEoXw4b1ve
	 WXOWH8i4SLrNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA77C021A4;
	Fri, 14 Feb 2025 15:57:44 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 14 Feb 2025 16:57:42 +0100
Subject: [PATCH 1/2] arm64: dts: imx8mm: Add pinctrl config definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-pinctrl_defines-v1-1-fbc86a42ef3c@gocontroll.com>
References: <20250214-pinctrl_defines-v1-0-fbc86a42ef3c@gocontroll.com>
In-Reply-To: <20250214-pinctrl_defines-v1-0-fbc86a42ef3c@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739548663; l=1502;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=xlMEruvPgyFBPz+wMGaLrdnLbqgaiStmZr5qOyP3uC0=;
 b=61kNMtfKPg3m9bDu0G1jq+xNlQh5OuZTSq5FjcNSJ0ZR/3PFj4GclVsunSHeRBmuQn3E9tLV3
 aF89iBwbHtTBckycY2S0sHRFG81+G2hLWnLIuTKWLwEblWa53X601/5
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_075745_603715_A63FFDAF 
X-CRM114-Status: UNSURE (   9.11  )
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
index b1f11098d248ed5fc8ac42daed808beebe3bf7bc..b231d5968d07d1e135963b714c3fe80ddd8641ab 100644
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
+//?
+#define MX8MM_MYSTERY_BIT 0x40000000
+
 /*
  * The pin function ID is a tuple of
  * <mux_reg conf_reg input_reg mux_mode input_val>

-- 
2.48.1



