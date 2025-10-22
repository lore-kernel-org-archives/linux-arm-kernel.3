Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47339CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLU1sJpU04CMJpLRsJ5+2Cqp9pWUpyoQq/8uTVoGm40=; b=RWBMeLy+TGh/Sw0AIq6iojzyWx
	C6HewqdblRvbH51frfZZvVKl3IPFJMPAynKz7Lzl56RTDX06SKELIeAWq0x/X1uSKxhvA+1PwIrPv
	iyIZ+dxR26/DzAL23LD2CHuSIRxZo9UIoAwvzJujZlbmpWdpYvYru/BaA0ycBVClZ8Cvulb/64uml
	Yq5lxVBE78DHdPHmxz8JFyrtIrgRQ7MBLElqaxJQ6c5zypzesy1Sm+3cdLlsF9iO77oy4OvKFuxRP
	4ClT8+nDF9ATXCayoZjix8uHi50NaLXEeXXgB3GpJZBHxgf65eKLQLYPfwxuRiABoiiZrOhSLWCR0
	Kyfcpy5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTBN-00000001qft-1Ffa;
	Wed, 22 Oct 2025 07:22:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTBG-00000001qbA-0CPz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 07:22:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FD504920B;
	Wed, 22 Oct 2025 07:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06DC7C113D0;
	Wed, 22 Oct 2025 07:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761117765;
	bh=CmWK4fJmVX8IaTujrM08YK63Ey1qc0r+ulHra9KViWo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=luuPPl89iV8ur2DsP5Zl40zEhuNqABek+hFLBHg3QaN8Famcfmvf7VmEEb/9hbMll
	 xkt562gDtuhqfEFZXh+MRS+ehWhna4NbpgKsUFGeSpzMEFiKNkm8Fywg2TYMU9fdym
	 oKNOPXPGBBVpSntpqnjtM8rateR24jvIQWSpYMw2nvlG3e2YyQGUSmoxWCrcnbH7Ap
	 WMZAs7HV9ahx9Ov+UJz6n7xKjhrBj8Gy3FRFqOTGjGIJXiteku6iJ6TNm9DrJXbV8B
	 BBqYfb0LZ0tpe2ktj0Ti5lx3VsrD8rNEO/Lk8yNhsqNJC2D2IJMJkcusxYYE0kgUTp
	 q1wBXDryeLSJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7A4CCD1BF;
	Wed, 22 Oct 2025 07:22:44 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 22 Oct 2025 09:22:38 +0200
Subject: [PATCH v2 2/5] arm64: dts: imx8mm: Add pinctrl config definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-mini_iv-v2-2-20af8f9aac14@gocontroll.com>
References: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
In-Reply-To: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761117763; l=1757;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=JmEWqGUWAm/M/SlP5EM+uK720mvqe2xVpNZjIRE7vtM=;
 b=KcOk1QdNKdpyVilRNWsrCQhzPrWs8ZYzeaDzPW/NYI+5sz/nsqt2oWKJoB1JhNWvJstFQe1MG
 XrvCQEeFeQfB0F6l69Rk8gd/etH10nhrz6rGc6C2D4MGfwcFKumFB4b
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_002246_320415_1459E2A6 
X-CRM114-Status: GOOD (  10.03  )
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
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
index b1f11098d248e..31557b7b9ccc1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
+++ b/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
@@ -6,6 +6,39 @@
 #ifndef __DTS_IMX8MM_PINFUNC_H
 #define __DTS_IMX8MM_PINFUNC_H
 
+/* Drive Strength */
+#define MX8MM_DSE_X1		0x0
+#define MX8MM_DSE_X2		0x4
+#define MX8MM_DSE_X4		0x2
+#define MX8MM_DSE_X6		0x6
+
+/* Slew Rate */
+#define MX8MM_FSEL_FAST		0x10
+#define MX8MM_FSEL_SLOW		0x0
+
+/* Open Drain */
+#define MX8MM_ODE_ENABLE	0x20
+#define MX8MM_ODE_DISABLE	0x0
+
+#define MX8MM_PULL_DOWN		0x0
+#define MX8MM_PULL_UP		0x40
+
+/* Hysteresis */
+#define MX8MM_HYS_CMOS		0x0
+#define MX8MM_HYS_SCHMITT	0x80
+
+#define MX8MM_PULL_ENABLE	0x100
+#define MX8MM_PULL_DISABLE	0x0
+
+/* SION force input mode */
+#define MX8MM_SION		0x40000000
+
+/* long defaults */
+#define MX8MM_USDHC_DATA_DEFAULT (MX8MM_FSEL_FAST | MX8MM_PULL_UP | \
+				  MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
+#define MX8MM_I2C_DEFAULT (MX8MM_DSE_X6 | MX8MM_PULL_UP | MX8MM_HYS_SCHMITT | \
+			   MX8MM_PULL_ENABLE | MX8MM_SION)
+
 /*
  * The pin function ID is a tuple of
  * <mux_reg conf_reg input_reg mux_mode input_val>

-- 
2.51.1



