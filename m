Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFB7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sby6K+ve5df1JcK2uSujo141CXU60jNzNVyeLbJ276U=; b=OkHU1X+34J0TKwBWRPLo7u2U7/
	TMZheQ1MpNRv7o48bgNTc/WYh4ZW2FxU+JVHM/+MM71e4nPGhGnZIK8oGAn1R+ref3FEkaXPCUDGv
	5hv3kuZXxUrg89Eox3rRB/DJAE/ISZh23FR2arL4OclqCkkWbA1lmQQeJMLks/rFhKeQVRwTIjDDU
	yGngXo063AmEqrqHxBdv8551MPOEiW0KOtWsdZyCvvS2f6T/npRcs6oaaDxE4qSc2YL0FUgzFU1ji
	MbZAy4RppgA7I+DqR25l+f9WNCE/nEiwm9KJkHVoNWZGAAImdExYLe7BsrPGN3Qs2ZoNnTr97B9ll
	K/wzwrew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJCq-00000007L2d-0Zi8;
	Tue, 18 Feb 2025 08:43:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJ8V-00000007K2q-1egH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 08:39:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D14BA41DDB;
	Tue, 18 Feb 2025 08:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0B82C4CEEB;
	Tue, 18 Feb 2025 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739867961;
	bh=CkqtmZB5KHiM8Aan+wuXyPLm1TSBQV9Yte8CU6LzQw4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OkrPfXlbrZHvT4fnEvEjo1f03AypPIA2NnTQb0rNTS0esw5/ouJr5FX0zohyg+mM8
	 dPJXagt/PEf1FbEii+djO8ASfkH943vlvnWMc/oFEw0j+2jsAKEob2z/kGAjQsAKgu
	 atJBOalnb0nEwrwZq3Mvt1daWlq+dBq4JtF85wD7tuUTtmGTiPl4ne6xq1H8GoTPM/
	 fZ9bd9SZ2zw3R9CxkqtnYLlkGP8Oyn5fTtuvxGL54ijS6q/N+RxY8j8ZVR9K9b4x22
	 9hXt8sM0rslksxeej3srcNFy/mgrrMcRQPRJAz7MH0wlZDKcY8TsErvC5IyhzHcWGh
	 nkDtOSsjzh3YA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928ABC021AE;
	Tue, 18 Feb 2025 08:39:21 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 18 Feb 2025 09:39:17 +0100
Subject: [PATCH v2 2/2] arm64: dts: imx8mp: Add pinctrl config definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-pinctrl_defines-v2-2-c554cad0e1d2@gocontroll.com>
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
 bh=5o/01a3GvB0utNsHA+384AEa62ZGgZhPhm6w4ssVfvg=;
 b=5S7R4X0KQnDtwEkwv2tZ3clrwtU9FdxQ4JwYBH20UV2i00v7wYXCOZdmDXULpIgWrH+A8Anzf
 JISjWyIH07dD+70RNDJRsyHlVq6Ha/KUrmF8KAoAoCo0aH+bTX9HyEj
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_003923_573409_64771078 
X-CRM114-Status: UNSURE (   9.41  )
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
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
index 0fef066471ba607be02d0ab15da5a048a8a213a7..0927ed11ec687d5b273c4a4a6455e8d81468f676 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
+++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
@@ -6,6 +6,33 @@
 #ifndef __DTS_IMX8MP_PINFUNC_H
 #define __DTS_IMX8MP_PINFUNC_H
 
+//Drive Strength
+#define MX8MP_DSE_X1 0x0
+#define MX8MP_DSE_X2 0x4
+#define MX8MP_DSE_X4 0x2
+#define MX8MP_DSE_X6 0x6
+
+//Slew Rate
+#define MX8MP_FSEL_FAST 0x10
+#define MX8MP_FSEL_SLOW 0x0
+
+//Open Drain
+#define MX8MP_ODE_ENABLE 0x20
+#define MX8MP_ODE_DISABLE 0x0
+
+#define MX8MP_PULL_DOWN 0x0
+#define MX8MP_PULL_UP 0x40
+
+//Hysteresis
+#define MX8MP_HYS_CMOS 0x0
+#define MX8MP_HYS_SCHMITT 0x80
+
+#define MX8MP_PULL_ENABLE 0x100
+#define MX8MP_PULL_DISABLE 0x0
+
+//SION force input mode
+#define MX8MP_SION 0x40000000
+
 /*
  * The pin function ID is a tuple of
  * <mux_reg conf_reg input_reg mux_mode input_val>

-- 
2.48.1



