Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E08C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 12:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROBugoCgtg8KTg0qSPqwqigBv5vvES5FsJmkjJRkVMo=; b=zCM0HtMi6Yw5wFsG3Uvol1V2tO
	JZHEADzay0TOIuRNoOS8VEvqW7x7AaOwrDmKzA6NR98avUf+eKN5w7AQrFtizgr57DU4zihPxLFDf
	3I6wIj6vzpLKen4HffsLPVG5HdaBpaXSpFldhCSB+aPUf0VqPsPAi3gwiz3JvdX7yWeqbGO7Ev27S
	uw3bN/VpN3LJkhg4GbCZRYtNW5GLZ55egP9yyHDIHlgIilYDegGiYY8ZYWlDtOlyty2MAyfbZvUdj
	Q2ulW5/qVDO1eE5rL0gk/hGveUe1FujCrijXs5NAad13W5+VXpfxpUQebMqAeWUU6bz47IAOWkzwG
	+PAmpX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7vG-00000005LyQ-2Adw;
	Tue, 08 Jul 2025 12:59:46 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7oU-00000005L1X-2vES
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 12:52:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C329BC74CA;
	Tue,  8 Jul 2025 14:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1751979165; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ROBugoCgtg8KTg0qSPqwqigBv5vvES5FsJmkjJRkVMo=;
	b=kDD3+HrYHWGZygMBWqUAUb6qKiNytx5CbulCNjt99ED3r+vQShaIoYR7r6g5sa9gPdTVwX
	sN0HMeT3xmK4MK1yDErxen7E3QRFo4FxrbOY0wn7iBu0eCaLI5qKfJnKjnrZDT3Z5qa+M6
	zgv51ymH+LJ+WIEpKOczqzpA7vCmJ+YfLRyYaymirjvzdLz+3byj4S2Wb9DRVmo7b+ssUf
	5kZee/N6ReqHjXriOaDIQHZJ3uFC6wtm7v3+/7Y3u7PwGWOUdCSDmsLrCiv81IsS17ePAl
	2VBX5n8+FUmtGmvzx1FX2GzItTgfLfkd4Rs3DDgiv4W4yiQSdgjHf5k5p950lA==
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
Subject: [PATCH 2/2] ARM: dts: imx6ul-kontron-sl-common: Fix QSPI NAND node name
Date: Tue,  8 Jul 2025 14:52:17 +0200
Message-ID: <20250708125219.63813-2-frieder@fris.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708125219.63813-1-frieder@fris.de>
References: <20250708125219.63813-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_055246_875153_5CCEABF2 
X-CRM114-Status: GOOD (  10.32  )
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


