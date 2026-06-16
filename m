Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02CCCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 11:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qph6fZPp83f1sbs5oxI4xqT47tWglnS8YBVXxfJa43c=; b=ljKtz0ZtlPxDDFp4E9p5hD+wN5
	qk6ccg47eCoBLDSuLRncizZTMEoPgHO64lv0qwgbU4RyEbWyVFS2/7qq/GbI4QGfqLvTy8ksOdSyB
	YfbCfZnQh4MlK20yBbjVYzmoGSNqJYDUu8cSQrtTf5oYFHjNUX7etVMSMvxPETCsnW48DzJfjfoFs
	5yh9eOjJf6XeMnYBPM2Dtmw+qZ7+eu1x9jqOGUrNqJMgNrL9hFvBtIsa6qDR5w3Qd4roUuhmtyKw0
	ctsMpJcy7MHJoyfVMivHNNAUcgDKYRcYoEzFeuqaDig/de2PgkystpAO/NuIymIvcHpJrZ+bEt5G5
	MdHL5DlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSNA-0000000Fhtz-2nuJ;
	Tue, 16 Jun 2026 11:54:28 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSMo-0000000FhcJ-3A8k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 11:54:10 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1781610841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qph6fZPp83f1sbs5oxI4xqT47tWglnS8YBVXxfJa43c=;
	b=C0BFpcUX5KYPwDmHzUcKuQ5MLzYxTsSZ6F8bOFqYWkML8xjGwEPYmmgBLa+VdpYstgGA23
	sox2mbkgjikmSoyFCbxdk6uOsBYKz6oXCFLbJ6jQRCrp/sdzVZqPKF3yME6oEgw4BoqrIW
	BsUnRAO9wldhj8XPpQW1a0PMWrSGORwW90p7UIycuj5ui8V4mxq+cxQf2crWKMFTX9x2Tu
	+7i4ceyfuBZ6Js2RP706OzFVkV+gnrEm+taMzqMFg8hdLyDuyN3XiGdl3NS5vm6aQW83lz
	NpbjSgCn62fjzNbLWsIZjbmYDawSFcT2zit4J0ZXCPO/t7XZv7c+5zDderghJg==
Date: Tue, 16 Jun 2026 13:52:24 +0200
Subject: [PATCH 9/9] arm64: dts: imx93-kontron: Enable ELE firmware driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-9-cb7f3698c3e6@kontron.de>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
In-Reply-To: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=bsVi7wbNH1vPEz1HqDAKSx2afoxcj6Bu6jRCJWSKcoY=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIcvQMjSV76PimaeBKVbiXxYx7ExdUD8h0M82/ntF1s6LA
 byN/D0dpSwMYlwMsmKKLFL8Fq9tzWJ95I9VR8HMYWUCGcLAxSkAE1m3jOG/j9+Lmym2AZ/rE+o/
 Z8q/cOLf/KEjkGWiTf7/PQofrnGeYPgrUXLF+8Wzvp9rGN1vrbBjNJmzZT2LisXKFUrq31nPu0a
 yAAA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_045407_027779_8BB19406 
X-CRM114-Status: UNSURE (   8.80  )
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

Add the ELE firmware API node and pass its handle to the OCOTP
driver. This allows us to gain read/write access to the OTP fuses.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index c79b1df339db..c1da4b52c878 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -24,6 +24,15 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	firmware {
+		hsm0: secure-enclave {
+			compatible = "fsl,imx93-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			memory-region = <&ele_memory>;
+		};
+	};
+
 	reg_usdhc2_vcc: regulator-usdhc2-vcc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -57,6 +66,19 @@ regulator-state-disk {
 			regulator-off-in-suspend;
 		};
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_memory: ele-memory {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x40000000>;
+			size = <0 0x100000>;
+			no-map;
+		};
+	};
 };
 
 &flexcan1 { /* OSM-S CAN_A */
@@ -253,6 +275,10 @@ &lpuart7 { /* OSM-S UART_A */
 	pinctrl-0 = <&pinctrl_lpuart7>;
 };
 
+&ocotp {
+	secure-enclave = <&hsm0>;
+};
+
 &tpm3 { /* OSM-S PWM_0 */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_tpm3>;

-- 
2.54.0


