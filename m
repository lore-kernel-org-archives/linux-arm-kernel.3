Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9A6C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=osfGB4V80VKvLfFCPsJwLjnIi4GjyoqwiUXnW25KK1E=; b=w8dPVz4N0HDcXWbQDFiZy67Wb8
	Ec69ZaUgrg+G9AvVUKYG7VfsEGbn990RQY6FqGnY5Ib4ItvAyAf6/kD9lfYyHD0M74E+8zCy/vBm1
	wXwm2ZJgqFz4UrWVdeUQWA43MD/UhAX2YJ4y1jbPUHN1vVpjTmgzEzPoT1g8JfPxf2TcvKwJEFF1H
	JYpuJRSrK4pwFrml25He6tEw3jsfRWMeo8OfyW3eQE6d57yTYAsxG/9QQZIc+ToR+VGm/iXzfXEsJ
	wHdIndbmzmbVisntCWbn+ZKTOYU9cv61+lFnbzCVFuD5JE1oSi+jf2My8L6TRz9scJ0DqIya+LYkn
	Ji4wcp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTMi-00000000XFD-1zV1;
	Thu, 13 Aug 2026 11:12:52 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTMe-00000000XEC-3T1P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 11:12:50 +0000
Received: from francesco-nb.. (2-224-16-253.ip168.fastwebnet.it [2.224.16.253])
	by mail11.truemail.it (Postfix) with ESMTPA id C8ADD1FB7C;
	Thu, 13 Aug 2026 13:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786619565;
	bh=osfGB4V80VKvLfFCPsJwLjnIi4GjyoqwiUXnW25KK1E=; h=From:To:Subject;
	b=OL8nQyU6eW1VGtokO9JM5dUzFbKSBDS1C/SwW8MmQ4Bd/LrJm1GBIwT5eD6aGdund
	 huWiC8qyL91088VySFQHFy7POlYeQvI9MTEQWz9ls9bpNMXgsCxkAc2Kp/NoqoOBqd
	 5UqugZTZNfVNNzDP3V8364a2TFBHkaLqSV6ICuvwI+1iKWeAP7HjMy2CvICaw5M29a
	 cUW3791+vdWpjAmflFf6f0n803Q6CoIzTP7UZalsP1QkFGetaIsAuHDEQwIEXJJga9
	 NYOENrbha24PkMuxB6sUgFKLiW3+C5/PVd5I0HNtPmraLCcs/VDhbRtJLzxD0tv9uf
	 PHdh19FCaTrjQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Judith Mendez <jm@ti.com>,
	Moteen Shah <m-shah@ti.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as OUTPUT
Date: Thu, 13 Aug 2026 13:12:36 +0200
Message-ID: <20260813111238.56892-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_041249_040498_89E44F75 
X-CRM114-Status: UNSURE (   8.12  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

Link: https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals [0]
Fixes: 316b80246b16 ("arm64: dts: ti: add verdin am62")
Cc: stable@vger.kernel.org
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index e97b2b047d10..895b1b7dcac7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -573,7 +573,7 @@ AM62X_IOPAD(0x15c, PIN_INPUT, 0)  /* (AB22) MDIO0_MDIO */ /* ETH_1_MDIO, SODIMM
 	pinctrl_sdhci0: main-mmc0-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x220, PIN_INPUT,        0) /*  (Y3) MMC0_CMD  */
-			AM62X_IOPAD(0x218, PIN_INPUT,        0) /* (AB1) MMC0_CLK  */
+			AM62X_IOPAD(0x218, PIN_OUTPUT,       0) /* (AB1) MMC0_CLK  */
 			AM62X_IOPAD(0x214, PIN_INPUT,        0) /* (AA2) MMC0_DAT0 */
 			AM62X_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
 			AM62X_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
@@ -589,7 +589,7 @@ AM62X_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AC2) MMC0_DAT7 */
 	pinctrl_sdhci1: main-mmc1-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x23c, PIN_INPUT,        0) /* (A21) MMC1_CMD  */ /* SODIMM 74 */
-			AM62X_IOPAD(0x234, PIN_INPUT,        0) /* (B22) MMC1_CLK  */ /* SODIMM 78 */
+			AM62X_IOPAD(0x234, PIN_OUTPUT,       0) /* (B22) MMC1_CLK  */ /* SODIMM 78 */
 			AM62X_IOPAD(0x230, PIN_INPUT,        0) /* (A22) MMC1_DAT0 */ /* SODIMM 80 */
 			AM62X_IOPAD(0x22c, PIN_INPUT,        0) /* (B21) MMC1_DAT1 */ /* SODIMM 82 */
 			AM62X_IOPAD(0x228, PIN_INPUT,        0) /* (C21) MMC1_DAT2 */ /* SODIMM 70 */
@@ -601,7 +601,7 @@ AM62X_IOPAD(0x224, PIN_INPUT,        0) /* (D22) MMC1_DAT3 */ /* SODIMM 72 */
 	pinctrl_sdhci2: main-mmc2-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x120, PIN_INPUT, 0) /* (C24) MMC2_CMD   */ /* WiFi_SDIO_CMD   */
-			AM62X_IOPAD(0x118, PIN_INPUT, 0) /* (D25) MMC2_CLK   */ /* WiFi_SDIO_CLK   */
+			AM62X_IOPAD(0x118, PIN_OUTPUT,0) /* (D25) MMC2_CLK   */ /* WiFi_SDIO_CLK   */
 			AM62X_IOPAD(0x114, PIN_INPUT, 0) /* (B24) MMC2_DAT0  */ /* WiFi_SDIO_DATA0 */
 			AM62X_IOPAD(0x110, PIN_INPUT, 0) /* (C25) MMC2_DAT1  */ /* WiFi_SDIO_DATA1 */
 			AM62X_IOPAD(0x10c, PIN_INPUT, 0) /* (E23) MMC2_DAT2  */ /* WiFi_SDIO_DATA2 */
-- 
2.47.3


