Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354D0CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 11:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4aN/1amNQxJNk4c7N2lTGAkvvrYpTHFVDkBhjGRCG4=; b=Rxii+GiDJagMJiSoPHMKta/ITT
	V8zIUP+edRq8RW2Krtr773omLDQs/hcbdCAvuOc+3SxmlbnCvT7uO8cTvdcuRmuh8WOdr+Mu+BheQ
	hhzCuz0i6ktlMBNMnDCaONq4tM3VvC7MPiFryeJi9rR3GabDBxNRZGnl27HgV/5gM35Q0rpoYHmf6
	eVjb1TDopke2XAxQ5lKZRiCkVd827j109LWmKI6w/78y5VLSNHP7dyVIi5QNQXiMDx/Tk82hi4pmd
	mHpjnUOlYGVEcWgyRMG7nVXqlzSg7Fgn4Q/xihymeh4pgY1IrWW80VeJrK1aWdB18PbyX7GxN2nKU
	jX6svhWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb36-0000000CkdN-0LMr;
	Tue, 13 Oct 2026 11:52:04 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb32-0000000CkZK-111h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 11:52:02 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791892305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4aN/1amNQxJNk4c7N2lTGAkvvrYpTHFVDkBhjGRCG4=;
	b=Wt1eExD+TPoERBQDGbN+XBQvFfuMr528XovX906cDMkynjhsvXbGVxhMG02zQylbXhPQCP
	Hv0QnuClUCLUMgd69kHzWEBJlm5HMc1dItAQKnJbbQswwvGfZsGl9LW4VuFRwdV+jUOjeZ
	ko72Zv7UGMTzCH6DcMfm2yZR/wym/Xul1vusxo7LUMc+wUP4BOEXRYKZ4iC5aVea+KWk37
	QRBeYYoqpNtu976UohHatZTarX5R4L+R4283F5044xHn6FMKvuHYbDyCJNKt7+vFYivVP2
	y+f4Cxc2xYwuPLC+2UWbaI+j17o47xifyej9sDmpn+GZOoWJL4posszw0hcIjg==
Date: Tue, 13 Oct 2026 13:51:10 +0200
Subject: [PATCH v2 5/9] arm64: dts: imx8mm-kontron: Fix wrong label for
 SPI_A_SDI_(IO0) pad
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v2-5-d464ca652c91@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1266;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=jzjRSZBC4S/DaUSvV4n8aM/sXC+EPXR9oQqPjvOEE/c=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuctN/tpfJWG0SqzJYlTt73P57njaj4s+PO3JxPtSe8y
 lmlvDumo5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCJ3pjEy9LHcWvt99Vr2qh05
 SyQjDLTmb/0ZWXToc32kdUd80fLMZkaGLnaOPUUfbm1TM/7oKi+89M0B6UvVGoqM708Y3G9UZP/
 CDAA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_045200_502258_F22BEAF2 
X-CRM114-Status: UNSURE (   9.31  )
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

From: Eberhard Stoll <eberhard.stoll@kontron.de>

The OSM-S pad SPI_A_SDI_(IO0) is incorrectly named as SPI_A_SCK.
Therefore SPI_A_SDI(IO0) is missing and the label SPI_A_SCK is
duplicated. Fix this.

Fixes: 6f5e6d7306c0 ("arm64: dts: imx8mm-kontron: Refactor devicetree for OSM-S module and board")
Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
index 4fb13d8ecfd45..35b76cd02b1df 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
@@ -230,7 +230,7 @@ &gpio5 {
 	gpio-line-names = "UART_B_TX", "SDIO_B_PWR_EN", "SDIO_B_WP", "PWM_2",
 			  "PWM_1", "PWM_0", "", "",
 			  "", "", "SPI_A_SCK", "SPI_A_SDO_(IO1)",
-			  "SPI_A_SCK", "SPI_A_CS0#", "", "",
+			  "SPI_A_SDI_(IO0)", "SPI_A_CS0#", "", "",
 			  "I2C_A_SCL", "I2C_A_SDA", "I2C_B_SCL", "I2C_B_SDA",
 			  "PCIe_SMCLK", "PCIe_SMDAT", "SPI_B_SCK", "SPI_B_SDO",
 			  "SPI_B_SDI", "SPI_B_CS0#", "UART_CON_RX", "UART_CON_TX",

-- 
2.55.0


