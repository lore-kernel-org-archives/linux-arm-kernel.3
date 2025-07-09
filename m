Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB235C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 08:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53mmWhWTBcWWhTmzkcxS1iBXeRIgZB0MRCCtHtk+9xs=; b=PDahqNAWTdIjYS3w97zHTdQgcv
	MDYUnwTAeYLY58TdjPVBTvVpZT/gU5+cBN4qhlLaYbv6mpIRO413PH3g9GElgt6+VGvWp/4fFRCzE
	1lMlEPAcNC/gHAF2+/ads1fXRQwU+O/CnAvEK2PmcpxZQIrUzilBhHdVH1duarl4E6vDh1R9UTa1t
	vkC2WAUsgk7PTyXrCIiLroCUqKEqiMZ/t9UfdFu7oaj68OeJxQf3bBQ/s4dH7R0sD8vqEdNPuhK+7
	Lmj12sLI3iZpE/kX5co1yxkupTQW9YKWBbf20oQUmdqB33JWayG5t09/HdOVMjVduv2ykyik6S5Dj
	rPgKH5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQFv-00000007yzg-2h6C;
	Wed, 09 Jul 2025 08:34:19 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZP2f-00000007mox-3Swh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:16:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7BEBC74CE;
	Wed,  9 Jul 2025 09:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752045392; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=53mmWhWTBcWWhTmzkcxS1iBXeRIgZB0MRCCtHtk+9xs=;
	b=HqDS+lIrVuhhhvL68VSssy6wxt+Q2sfqX4C7tZqOYipGltc7cMqzfGhGHidapDFH/dqpO0
	OJpsNy2hvrp6FxPY1JRCt9HPri7fYoCWUYlWP428AIpa6K0rVdDgngcZG0by7wvifDv6lb
	fCwMDpDSuKnDYqZVton8R31IKmNvir5+8SruaDObyR9HuafaZ7pW38eyqOdwVF2Y7+3A60
	+yw8IF1InqBar/5RG7LG9Tho65XIuQxEAfACWPPz97hy5nYM+MVXqYLH++P6xRa6BOoFxZ
	obPmjkHoYMX/LOgRnA6zpdSWs8FuKoWHLZxrPcFUG0uPxJuC9HsV249HO/7g0w==
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
	Frank Li <Frank.Li@nxp.com>,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 2/2] ARM: dts: imx6ul-kontron-sl-common: Fix QSPI NAND node name
Date: Wed,  9 Jul 2025 09:15:55 +0200
Message-ID: <20250709071557.20602-2-frieder@fris.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709071557.20602-1-frieder@fris.de>
References: <20250709071557.20602-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_001634_084919_A7E0FAB7 
X-CRM114-Status: UNSURE (   9.73  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Rename QSPI NAND node to 'flash@0' in order to fix the following
dt-schema warning:

spi-flash@0 (spi-nand): $nodename:0: 'spi-flash@0' does not match '^(flash|.*sram|nand)(@.*)?$'

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes for v3:
* Add Frank's R-b tag (thanks!)
Changes for v2:
* None
---
 arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
index 779723b04575a..4c0ac4d4df686 100644
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


