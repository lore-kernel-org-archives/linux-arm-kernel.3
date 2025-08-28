Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1718CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vepzPBjYXSUFrYqzyS7A/BpKb61T6nS2eQf0DEUW5nM=; b=eHWFW2lmXklMJVbmXLO12VZdJI
	JCuL4c8SesHR0UWYNd1DuHBQRwPCWPEnx/FnVI5DTZjiirFw00ITBRULOztp376fBXwdUaW4XZlcr
	9WE4MC1srIO8SYkrNR6R6hJj02K66K8DEFDS91XPmSVjkaNuIM+W4TLMsc+osFQgapaz9de0YdvUt
	d9tyx2M2iGJbLe5iUT8WP8LCXbOjwfSBBahxsDi/ms+/xh0R5mgjSUtkSXOXTkt+X3RbtziWQ8nWT
	aNJDxTDMNwxioBBFlyWc+jKrJjzLX6CQIxib97JzBFrlWn6qAIzcOJpTc11CW1axgxsM3wMNMCgFy
	0XkwgYCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraKo-00000001FC1-22qX;
	Thu, 28 Aug 2025 10:58:26 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZI8-000000012Jr-24ZT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:51:40 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1756374655; x=1757674655;
	bh=vepzPBjYXSUFrYqzyS7A/BpKb61T6nS2eQf0DEUW5nM=; h=From;
	b=MUVDZN2iNt1PiRmodgpTFDAbxAKL1QrEsMFcxjJ7epGCyeqYpCkPiSbtFbgdBwzZq
	 2AkNMtp4SNHshqGaIay29Fi6/6NMqXPK7qF4sc9wvFtoyzRgvb3tbMV/Qzr0Opghdo
	 JCo/4KPGQK33BmMov+OPJ90Qy0dBRebBKPHLuWdH9JVmB0pd7zt+7PwvvvXAN5CFiV
	 avdNQg6njbH+roGFommiwaHRUaRq1y/z174WHdeeumf9VLU6xrt0LAAm6G4P+m7/fD
	 WCu9Li6PfOY2sB9XfnyM8XRfmtFo+Y1TT08Qi9bBhEg6ttaieo4iWpo2fkgJAZaJHj
	 L3ndID46aW0SQ==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 57S9osTn046282
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 11:50:55 +0200 (CEST)
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
Subject: [PATCH v2 3/3] arm64: dts: samsung,coreprimevelte: add SDIO
Date: Thu, 28 Aug 2025 11:49:04 +0200
Message-ID: <20250828095028.24503-4-balejk@matfyz.cz>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828095028.24503-1-balejk@matfyz.cz>
References: <20250828095028.24503-1-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_025137_274263_5921F4DF 
X-CRM114-Status: GOOD (  12.91  )
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

Notes:
    v2:
    - Drop the sdh2 pinctrl configuration which was originally included by
      accident.
    - Drop broken-cd on the node as it's ignored with non-removable (thank
      you to Duje for pointing this out).

 .../mmp/pxa1908-samsung-coreprimevelte.dts    | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 0ac1a24dc410..81806f655c88 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -10,6 +10,7 @@ / {
 	aliases {
 		mmc0 = &sdh2; /* eMMC */
 		mmc1 = &sdh0; /* SD card */
+		mmc2 = &sdh1; /* SDIO */
 		serial0 = &uart0;
 	};
 
@@ -286,6 +287,69 @@ sdh0_pins_2: sdh0-pins-2 {
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
 };
 
 &uart0 {
@@ -367,3 +431,11 @@ &sdh0 {
 	vmmc-supply = <&ldo14>;
 	vqmmc-supply = <&ldo6>;
 };
+
+&sdh1 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&sdh1_pins_0 &sdh1_pins_1 &sdh1_pins_2>;
+	pinctrl-1 = <&sdh1_fast_pins_0 &sdh1_fast_pins_1 &sdh1_pins_2>;
+	bus-width = <4>;
+	non-removable;
+};
-- 
2.51.0


