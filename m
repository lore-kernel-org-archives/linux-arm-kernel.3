Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1233CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhfkWSdpuaORvEfamLdOOBI/0zxYWDPspeDCfhDyiM4=; b=hXB1x1UVw/mjwm5thACB8x5bu7
	gbfVPc/xHAVn70RF645u3VUuV4gRBB8zfFYe0FVPR62Sb0o71SpLR676wYrhqL95jz301YynhvdAv
	SJBkoDLBYNp/Im7Hr0k22wjDgHwcaMIcRP7GShowNX328XTnfJud8o7uxbhJ3+q63s9FAXrTx5q+X
	qpDZjWPhxV3su7UmaSEagV+em5sZewQOKKWlcNLlLXF5WfLWnNfaBDTBezauL/rAooDLjSQZmhwxZ
	Ye/jIoyQmNwEKbvUq3ojSIxrEMIql3WLDloljQdt7mDsS75fvkU7VydAy2Y4zlbgr1bzY4klCYFx6
	pRHklVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8n3-000000064FG-0A48;
	Sun, 24 Aug 2025 11:21:37 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8UF-000000062NW-0SFM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 11:02:13 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1756033287; x=1757333287;
	bh=xhfkWSdpuaORvEfamLdOOBI/0zxYWDPspeDCfhDyiM4=; h=From;
	b=V+PMLf4ry8qDzhAXsqp7htREfZF24+btAdwzStn3LGtwQmKj0XHRMmxP3KelEfWva
	 OrFm4Rf6fvJzmXFUmmYtJZ6mn0QJQi0kfRPLQDlN9PVzoRjskXrspN9GwNgHoWTmfe
	 0Y/8nMmPqcF9KTC9HuVvZJR8tmZwcxDPpwlR9jaE2LfBdp037itF/3uKjWoiHqw1IC
	 OTSIoEybKwGGdnL71ahR3svdvbXEKDVdQE63gR/sQIajunB93oZXSqH7INEOXmDCbk
	 fw+M2N3IC2njcSoyCiUZ4X9FkBxmVTXNEsBkHW9vMh4bNjJB+saj18E4fdmkSv0HUb
	 M2xePA29RfIVQ==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 57OB1PQ2083640
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 24 Aug 2025 13:01:27 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: linux-mmc@vger.kernel.org, ulf.hansson@linaro.org,
        =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Karel Balej <balejk@matfyz.cz>
Subject: [PATCH mmc/next 3/3] arm64: dts: samsung,coreprimevelte: add SDIO
Date: Sun, 24 Aug 2025 12:53:45 +0200
Message-ID: <20250824110039.28258-4-balejk@matfyz.cz>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250824110039.28258-1-balejk@matfyz.cz>
References: <20250824110039.28258-1-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_040211_716085_0AA18AAF 
X-CRM114-Status: GOOD (  11.84  )
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

Set some basic properties of the SDIO card of the samsung,coreprimevelte
smartphone.

The SDIO is used as an interface for WiFi, Bluetooth and FM radio
serviced by the Marvell 88W8777 (SD8777) chipset. Support for this
chipset is currently not in-tree because the firmware is not available
in linux-firmware, however it is possible to trivially run it
out-of-tree using the mwifiex and Marvell Bluetooth drivers with some
caveats.

Link: https://lore.kernel.org/r/20231029111807.19261-1-balejk@matfyz.cz/
Signed-off-by: Karel Balej <balejk@matfyz.cz>
---
 .../mmp/pxa1908-samsung-coreprimevelte.dts    | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 834b2cf1a204..53f62cbdb7e0 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -10,6 +10,7 @@ / {
 	aliases {
 		mmc0 = &sdh2; /* eMMC */
 		mmc1 = &sdh0; /* SD card */
+		mmc2 = &sdh1; /* SDIO */
 		serial0 = &uart0;
 	};
 
@@ -286,6 +287,142 @@ sdh0_pins_2: sdh0-pins-2 {
 		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
 		pinctrl-single,low-power-mode = <0x208 0x388>;
 	};
+
+	sdh1_pins_0: sdh1-pins-0 {
+		pinctrl-single,pins = <
+			0x170 1
+			0x174 1
+			0x178 1
+			0x17c 1
+			0x180 1>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	sdh1_pins_1: sdh1-pins-1 {
+		pinctrl-single,pins = <0x184 1>;
+		pinctrl-single,drive-strength = <0 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0x208 0x388>;
+	};
+
+	sdh1_pins_2: sdh1-pins-2 {
+		pinctrl-single,pins = <0xec 0>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0x8000 0x8000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0x8000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	sdh1_fast_pins_0: sdh1-fast-pins-0 {
+		pinctrl-single,pins = <
+			0x170 1
+			0x174 1
+			0x178 1
+			0x17c 1
+			0x180 1
+		>;
+		pinctrl-single,drive-strength = <0x1800 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	sdh1_fast_pins_1: sdh1-fast-pins-1 {
+		pinctrl-single,pins = <
+			0x184 1
+		>;
+		pinctrl-single,drive-strength = <0x1800 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0x208 0x388>;
+	};
+
+	sdh2_pins_0: sdh2-pins-0 {
+		pinctrl-single,pins = <
+			0x24 1
+			0x28 1
+			0x2c 1
+			0x30 1
+			0x34 1
+			0x38 1
+			0x3c 1
+			0x40 1
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	sdh2_pins_1: sdh2-pins-1 {
+		pinctrl-single,pins = <0x64 1>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0x208 0x388>;
+	};
+
+	sdh2_pins_2: sdh2-pins-2 {
+		pinctrl-single,pins = <0x5c 1>;
+		pinctrl-single,bias-pullup = <0xc000 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0xa000 0x8000 0xa000>;
+		pinctrl-single,low-power-mode = <0x288 0x388>;
+	};
+
+	sdh2_fast_pins_0: sdh2-fast-pins-0 {
+		pinctrl-single,pins = <
+			0x24 1
+			0x28 1
+			0x2c 1
+			0x30 1
+			0x34 1
+			0x38 1
+			0x3c 1
+			0x40 1
+		>;
+		pinctrl-single,drive-strength = <0x1800 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	sdh2_fast_pins_1: sdh2-fast-pins-1 {
+		pinctrl-single,pins = <0x64 1>;
+		pinctrl-single,drive-strength = <0x1800 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0x208 0x388>;
+	};
+
+	sdh2_fast_pins_2: sdh2-fast-pins-2 {
+		pinctrl-single,pins = <0x5c 1>;
+		pinctrl-single,drive-strength = <0x1800 0x1800>;
+		pinctrl-single,bias-pullup = <0xc000 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0xa000 0x8000 0xa000>;
+		pinctrl-single,low-power-mode = <0x288 0x388>;
+	};
 };
 
 &uart0 {
@@ -368,3 +505,12 @@ &sdh0 {
 	vmmc-supply = <&ldo14>;
 	vqmmc-supply = <&ldo6>;
 };
+
+&sdh1 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&sdh1_pins_0 &sdh1_pins_1 &sdh1_pins_2>;
+	pinctrl-1 = <&sdh1_fast_pins_0 &sdh1_fast_pins_1 &sdh1_pins_2>;
+	bus-width = <4>;
+	broken-cd;
+	non-removable;
+};
-- 
2.50.1


