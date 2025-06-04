Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8701CC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 22:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Swzgs4fEZbULBfG6f9FFY0OBqD5WfWZgNz9e178/o4=; b=2G1jYuAvQqJaJIC8ohzAJDXZYR
	iLrZIaXXIf+phdqTPBJt0khsPPVThGrhQPhGbeg7Gtbk/duFt5Ds0RoOKpSbPSLxEgZCjnjVk5T8Z
	TUzWSR/x2rBWDdODkgnlq0V2JHVpr6hfCrYtJK590fnlnSD5OBxkpsl/kf8uIfKtzwNkTiMe3zkUR
	hcnUU2QWIKtHjr0fKTOaFMP3RLdmC7+NjgT0JJVYPqnktcH8S71BwlVdnuMq/0Cczjbeu8mOL8YJ+
	ac9RzeZo4ckLsy/nfiE8GzCbzbacJgdKpmFZcu/NK2qUiWxArrlHZBg5/vxhz8g98pDOCBrkvJfsA
	e/4ELm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMwyN-0000000EL4e-16YX;
	Wed, 04 Jun 2025 22:52:39 +0000
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMwwG-0000000EKtQ-0H7v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 22:50:29 +0000
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1uMwwC-007Xnc-DK;
	Wed, 04 Jun 2025 22:50:24 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH] arm64: dts: imx8mp-venice-gw74xx: update name of M2SKT_WDIS2# gpio
Date: Wed,  4 Jun 2025 15:50:22 -0700
Message-Id: <20250604225022.1429093-1-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_155028_106680_D8A43915 
X-CRM114-Status: GOOD (  10.23  )
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

The GW74xx D revision has added a M2SKT_WDIS2# GPIO which routes to the
W_DISABLE2# pin of the M.2 socket. Update the gpio name for consistency.

Fixes: 6a5d95b06d93 ("arm64: dts: imx8mp-venice-gw74xx: add M2SKT_GPIO10 gpio configuration")
Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
v2: update commit log to clarify we are just renaming a gpio
---
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
index 6daa2313f879..f00099f0cd4e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
@@ -301,7 +301,7 @@ &gpio2 {
 &gpio3 {
 	gpio-line-names =
 		"", "", "", "", "", "", "m2_rst", "",
-		"", "", "", "", "", "", "m2_gpio10", "",
+		"", "", "", "", "", "", "m2_wdis2#", "",
 		"", "", "", "", "", "", "", "",
 		"", "", "", "", "", "", "", "";
 };
@@ -310,7 +310,7 @@ &gpio4 {
 	gpio-line-names =
 		"", "", "m2_off#", "", "", "", "", "",
 		"", "", "", "", "", "", "", "",
-		"", "", "m2_wdis#", "", "", "", "", "",
+		"", "", "m2_wdis1#", "", "", "", "", "",
 		"", "", "", "", "", "", "", "rs485_en";
 };
 
@@ -811,14 +811,14 @@ pinctrl_hog: hoggrp {
 			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09	0x40000040 /* DIO0 */
 			MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11	0x40000040 /* DIO1 */
 			MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02	0x40000040 /* M2SKT_OFF# */
-			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18	0x40000150 /* M2SKT_WDIS# */
+			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18	0x40000150 /* M2SKT_WDIS1# */
 			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x40000040 /* M2SKT_PIN20 */
 			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x40000040 /* M2SKT_PIN22 */
 			MX8MP_IOMUXC_SD2_CLK__GPIO2_IO13	0x40000150 /* PCIE1_WDIS# */
 			MX8MP_IOMUXC_SD2_CMD__GPIO2_IO14	0x40000150 /* PCIE3_WDIS# */
 			MX8MP_IOMUXC_SD2_DATA3__GPIO2_IO18	0x40000150 /* PCIE2_WDIS# */
 			MX8MP_IOMUXC_NAND_DATA00__GPIO3_IO06	0x40000040 /* M2SKT_RST# */
-			MX8MP_IOMUXC_NAND_DQS__GPIO3_IO14	0x40000040 /* M2SKT_GPIO10 */
+			MX8MP_IOMUXC_NAND_DQS__GPIO3_IO14	0x40000150 /* M2KST_WDIS2# */
 			MX8MP_IOMUXC_SAI3_TXD__GPIO5_IO01	0x40000104 /* UART_TERM */
 			MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31	0x40000104 /* UART_RS485 */
 			MX8MP_IOMUXC_SAI3_TXC__GPIO5_IO00	0x40000104 /* UART_HALF */
-- 
2.25.1


