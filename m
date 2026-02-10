Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540FDEA3F2B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 08:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdvASPrASSe8sDx49yPbT/k+GowUq6H/XSVPlz7t1Fo=; b=UZZP9qzXBTzRFc5m1kGU8LYuQV
	NXCampYmIcA40bqtwLBK9Yr7LEXactUQTH5FdSCS6T/IPIMIb8/RS3K09FVRaX25sSaOcZOz7307G
	YAOPasmJ1ODigq0wZhdY7eJqugrCel2v7kncUdzjouf3GoOXhpm2AiUQd9ePhEBOHcZqFSXUoH0dV
	xA3I3LFMl2er6puKtBjtDR6srWJd7XsYnOF7Vc7WhfGSQEx2M1TBs2V+0xnXpGqS2j6C9pfTkqL8m
	RVn9I7x5XX7ZxHuttRmalmWkZ2Utl+ZoMHYw7wVycEN4Ijrs8mjT7WR51/5qwRabrDoGEmMSFNmih
	oKjfJbgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpjNW-0000000GhXy-2Y7v;
	Tue, 10 Feb 2026 08:45:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpjNS-0000000GhVY-159W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 08:45:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E5B9F4449A;
	Tue, 10 Feb 2026 08:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3B75C2BCB0;
	Tue, 10 Feb 2026 08:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770713144;
	bh=tLpExwpEhurY6voXzq0qndE7d/dtoLm/tbWhcRdS4og=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BUVpZaE7x58iVxp516OAjGTTxMO+aLIjy6VDCY32HMyCgQm4gdcMv93TqEn/J4hS+
	 qdCxkJFMkRQvBUJ0DIlXTMrPVX+4qQxmSxGZw6adyqomndCcS6SpsTfc0i62TAYW+q
	 0ZOMKHGqql31xY9RvMiqMCEqVOxMq710IMqoz34L73pVjc8Bxse+GU+wXc0NVR2j9u
	 phbD1bHcXyUcYmGmGWi+AcVh4cdJD+HZogc9nqMONEeOLrzJjRh5Ftq1vRZ257II2P
	 ApG8rgHYKThZWpmB2g2+ueFZ2n+EWPV4cSlI+1FoPv+gw+7myRy0iveF15taYNgVL9
	 HIqwF9ETYmKJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52B6EA3F2B;
	Tue, 10 Feb 2026 08:45:44 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 10 Feb 2026 09:45:40 +0100
Subject: [PATCH v7 2/5] arm64: dts: imx8mm: Add pinctrl config definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-mini_iv-v7-2-a3ad8e7ddf0d@gocontroll.com>
References: <20260210-mini_iv-v7-0-a3ad8e7ddf0d@gocontroll.com>
In-Reply-To: <20260210-mini_iv-v7-0-a3ad8e7ddf0d@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770713143; l=1797;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=lvUqpRh7n9YkRtJZVSUOA/YxY3527H7NJn4HwdOrJFg=;
 b=APRpif8J8ASdJITa96V9YCY67fdIDSH/9lqI7hUvoYMWg3s7Olfh0iQKiBvE2Km0iuBL70Rf9
 qnWB5fX17T9A8i9I2XT7Agj8+C826ZrdT/4hqGk6beiHpjdLedhEgBM
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_004546_340267_5023962B 
X-CRM114-Status: UNSURE (   9.96  )
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
index b1f11098d248..31557b7b9ccc 100644
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
2.53.0



