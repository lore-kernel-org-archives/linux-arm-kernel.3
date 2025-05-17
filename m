Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551D4C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 15:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Odg0oPjU6QonvEOEPzZtFOtrpR6K6gujH0PIf0xkiw=; b=t+c2gfOgPA+kX5EXyR/06tsBnH
	jxT82az2gbzYRR+aGpNYdlFQHcp3PMgrPfdvVqSuMiyshn33Z8TVjHltqv2wssKFa/WuaCi1OCr/t
	OTiKuP7C4gU78ADlrhvAROrmA3gYnecNVqOcLbR//ao2wEr5V47SYgT8O+9tjK8vL4HRWP7jpcc3i
	hpraq8vAAr6Qjwf/hujQkqEqaVUBJNf6+GaMH2ZZ6zRAjPnaF85j4MPb98vmIQsoVUUf87TTjxICm
	TaWSAks3yfZUE9YEdNrZ9QcoVn6L97l5RtycFx9NUSaVitOTOg+xhhir+u1Bd0v4v9tgNFHgFXZwC
	0lv4G9aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGJQf-00000005u0u-1xz1;
	Sat, 17 May 2025 15:26:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGJKn-00000005tY0-2YNE;
	Sat, 17 May 2025 15:20:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DDFB440DC;
	Sat, 17 May 2025 15:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93AAC4CEE3;
	Sat, 17 May 2025 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747495221;
	bh=9OovZadwvQUpiBdXMA657+3VfaXk1nLOa0c43PgX6XE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pimsiu6ejuLcqI04VsJ121ontA61T7iiabdHVjZ4+zzwUhek2DNVEtXOExtwsMk87
	 QsqncCLdPbDlZVfUeHvFYz1jN7FxpsEGZAE9KCCE7YV5I4QmN49Sfxu3xRxZG89nXy
	 EqT/T3RAd6YGNCR+9+SrtJHDsznNEandcdnBVfHPcX4xrtlIx2/PQLYVYD5ra1dOrk
	 sIQq5u2LAUyeaYDW4OsR8bTVrQK8VHGYlik2Lysrue11IyUDJgCyGqM7FUqCoN0khr
	 uuccutFL7ULl3m9RTS6Ey1LRCp5l3EHRTnZSDVS7tCQNbJND/Ih0YHoYi/4qs1mSvQ
	 2g2LTCpohv5kA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 17 May 2025 17:19:44 +0200
Subject: [PATCH 2/2] arm64: dts: airoha: en7581: Add PCIe nodes to EN7581
 SoC evaluation board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-en7581-evb-pcie-v1-2-97297eb063bb@kernel.org>
References: <20250517-en7581-evb-pcie-v1-0-97297eb063bb@kernel.org>
In-Reply-To: <20250517-en7581-evb-pcie-v1-0-97297eb063bb@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_082021_994295_FE76FE18 
X-CRM114-Status: UNSURE (   9.13  )
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

Introduce PCIe controller nodes to EN7581 SoC and EN7581 evaluation
board.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts |  26 ++++++++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 105 ++++++++++++++++++++++++++++++
 2 files changed, 131 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index a8f8a9f0b807a2ee4fd11f8418b8e810a6945d73..99d2c4f1fc5a9638f551c6d725eeea568943cc68 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -67,6 +67,32 @@ reserved_bmt@7e00000 {
 
 &en7581_pinctrl {
 	gpio-ranges = <&en7581_pinctrl 0 13 47>;
+
+	pcie0_rst_pins: pcie0-rst-pins {
+		conf {
+			pins = "pcie_reset0";
+			drive-open-drain = <1>;
+		};
+	};
+
+	pcie1_rst_pins: pcie1-rst-pins {
+		conf {
+			pins = "pcie_reset1";
+			drive-open-drain = <1>;
+		};
+	};
+};
+
+&pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_rst_pins>;
+	status = "okay";
+};
+
+&pcie1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_rst_pins>;
+	status = "okay";
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 26b13694091735da7af977e42f8f546d7d5cb078..536ece69b935add88fb73ca6bd3f1ecd842cad7a 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -180,6 +180,111 @@ scuclk: clock-controller@1fb00000 {
 			#reset-cells = <1>;
 		};
 
+		pbus_csr: syscon@1fbe3400 {
+			compatible = "airoha,en7581-pbus-csr", "syscon";
+			reg = <0x0 0x1fbe3400 0x0 0xff>;
+		};
+
+		pciephy: phy@1fa5a000 {
+			compatible = "airoha,en7581-pcie-phy";
+			reg = <0x0 0x1fa5a000 0x0 0xfff>,
+			      <0x0 0x1fa5b000 0x0 0xfff>,
+			      <0x0 0x1fa5c000 0x0 0xfff>,
+			      <0x0 0x1fc10044 0x0 0x4>,
+			      <0x0 0x1fc30044 0x0 0x4>,
+			      <0x0 0x1fc15030 0x0 0x104>;
+			reg-names = "csr-2l", "pma0", "pma1",
+				    "p0-xr-dtime", "p1-xr-dtime",
+				    "rx-aeq";
+			#phy-cells = <0>;
+		};
+
+		pcie0: pcie@1fc00000 {
+			compatible = "airoha,en7581-pcie";
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			reg = <0x0 0x1fc00000 0x0 0x1670>;
+			reg-names = "pcie-mac";
+
+			clocks = <&scuclk EN7523_CLK_PCIE>;
+			clock-names = "sys-ck";
+
+			phys = <&pciephy>;
+			phy-names = "pcie-phy";
+
+			ranges = <0x02000000 0 0x20000000 0x0 0x20000000 0 0x4000000>;
+
+			resets = <&scuclk EN7581_PCIE0_RST>,
+				 <&scuclk EN7581_PCIE1_RST>,
+				 <&scuclk EN7581_PCIE2_RST>;
+			reset-names = "phy-lane0", "phy-lane1", "phy-lane2";
+
+			mediatek,pbus-csr = <&pbus_csr 0x0 0x4>;
+
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			bus-range = <0x00 0xff>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+					<0 0 0 2 &pcie_intc0 1>,
+					<0 0 0 3 &pcie_intc0 2>,
+					<0 0 0 4 &pcie_intc0 3>;
+
+			status = "disabled";
+
+			pcie_intc0: interrupt-controller {
+				interrupt-controller;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		pcie1: pcie@1fc20000 {
+			compatible = "airoha,en7581-pcie";
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			reg = <0x0 0x1fc20000 0x0 0x1670>;
+			reg-names = "pcie-mac";
+
+			clocks = <&scuclk EN7523_CLK_PCIE>;
+			clock-names = "sys-ck";
+
+			phys = <&pciephy>;
+			phy-names = "pcie-phy";
+
+			ranges = <0x02000000 0 0x24000000 0x0 0x24000000 0 0x4000000>;
+
+			resets = <&scuclk EN7581_PCIE0_RST>,
+				 <&scuclk EN7581_PCIE1_RST>,
+				 <&scuclk EN7581_PCIE2_RST>;
+			reset-names = "phy-lane0", "phy-lane1", "phy-lane2";
+
+			mediatek,pbus-csr = <&pbus_csr 0x8 0xc>;
+
+			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			bus-range = <0x00 0xff>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+					<0 0 0 2 &pcie_intc1 1>,
+					<0 0 0 3 &pcie_intc1 2>,
+					<0 0 0 4 &pcie_intc1 3>;
+
+			status = "disabled";
+
+			pcie_intc1: interrupt-controller {
+				interrupt-controller;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+			};
+		};
+
 		uart1: serial@1fbf0000 {
 			compatible = "ns16550";
 			reg = <0x0 0x1fbf0000 0x0 0x30>;

-- 
2.49.0


