Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95F3C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 13:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msbCU+F3wW1lAcU0MCNXjxoR6ouG8+m7lSEx0taLstY=; b=wUpSpZa+E9is57rnl2J/gmdzgq
	M/odWs+wICNRd6yab5eOjc2DcsBOQOCqqcxzfl08TOxyn0US0GLrubLbFJXlEZQ+WL4ZAmDAYMl6u
	XpQ9bmESJleimRfuPE/AGp+GFyioNPF+WFxx3mcqD9KGwqUglv5oxkNPwNugei9pWTlL3TmcYlpUo
	TwihNPPHkiyC25VcbbzNub2d14URiwBU5q5H2b9wfReAOMa+RisJQFdARosfwXh8B92Ptyl/RzFhr
	uPUcYAojblVTXA36KvYNk8xK0jUBcZYLBRjb4tUCw0LHDlg3VfksirQ0buwyNdolbLQmYCbccfuPO
	AV8/wviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7zq-00000005McL-3Or0;
	Tue, 08 Jul 2025 13:04:30 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7sD-00000005LR4-3zNB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 12:56:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 074BFC74CA;
	Tue,  8 Jul 2025 14:56:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1751979396; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=msbCU+F3wW1lAcU0MCNXjxoR6ouG8+m7lSEx0taLstY=;
	b=brPIysX3H5PCcmlveuaC/lc2v/0osIjezY1brbzDRooVlgdzMqes3uLDidM4i5yJemhulu
	09Q1Q5Aw6GRzv48jq2f/qknbLITL0s+arSb2i5+NyGPwujFbi9MhCjGV4YHYm9LnuCcigw
	TPuJLEmrNSkv6+RWzYayNqsXBGGZbrBv0HtjVw+Pf8ZCr734ADAkrSC5qZSHY5LMrAPhAQ
	Wn7n59J6dhqS2hIRwLB0+B7PRJ0I7/3aON2WLnXn6+LX6P52Y9+0Vr4FoofB1JXWhO2KOC
	wtEPHcUe4rTnl6/B+1mDspyeJLajrUg9sN7Sj8wcB/0oGQKPupoO0QTIQQiQ0w==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 2/2] ARM: dts: imx6ul-kontron-sl-common: Fix QSPI NAND node name
Date: Tue,  8 Jul 2025 14:56:05 +0200
Message-ID: <20250708125607.66113-2-frieder@fris.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708125607.66113-1-frieder@fris.de>
References: <20250708125607.66113-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_055638_136353_86B5979F 
X-CRM114-Status: GOOD (  10.47  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Rename QSPI NAND node to 'flash@0' in order to fix the following
dt-schema warning:

spi-flash@0 (spi-nand): $nodename:0: 'spi-flash@0' does not match '^(flash|.*sram|nand)(@.*)?$'

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* None
---
 arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
index ab149c40a9cc1..793c95d44c7d0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
@@ -82,7 +82,7 @@ &qspi {
 	pinctrl-0 = <&pinctrl_qspi>;
 	status = "okay";
 
-	spi-flash@0 {
+	flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "spi-nand";
-- 
2.50.0


