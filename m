Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41E4606A322
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 10:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cU8J/044;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=P2P4M2Gl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iucrU4+p03FdCSZRLTlZqxKot7H9SPLlZsWdSw2qG/I=; b=cU8J/0443kxZSx
	OliU6tFdaA0wR7qsgMl1v1ZFzqr9Ut69ig414oas3XmBhfPsmu8U8nkzTX0lKW6AQKuXRunHRkmeL
	mF1kwKeyFhdbCzHIc+u5Hqfr9CqT/mDL+ub31DpJsf1WOZY16/hvuWjnGj6O10mW46O812BDz6rNc
	V+2Cg/AnEMMgcOx4BruaX2PS/C4eJMJK5oqXxfF/3VknJLr96nV/LDgoPOyLz3mf5emB+rUPtFfLk
	GseAZpnpw4uzDwBaFoK7oHe38R61sikgcwNyBTyhxvwKNuX9Wu0E43ogT1gRkWZhD2Bnnam+Px5D9
	izPfrZ4OSNlwqc2YsvVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6cY-0000000DECC-404Q;
	Sat, 31 Oct 2026 10:47:34 +0000
Received: from mail1.rojer.cloud ([88.99.92.76])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6cR-0000000DE7X-2a2u;
	Sat, 31 Oct 2026 10:47:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1793443645; bh=zziT8oTPD4AQbDCFBxBFdylEyOghbRAb6UI2zN+f59c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P2P4M2GlSWdaSPg6pGYMiB5IyL7goD5Ic+AQcYkTTBGyP7FRVCG2k7PMGWDxoVhs/
	 pBogQxOa7SAJpKIYKSnpCCpysr3j+DNe28o1Pg+OTLSd9yxKEvL3Aq/2ZKpKP46+XC
	 ZT2xJ8hMHy8cadJ2JpWcbUc/ntkvtxUB5cm6u5nkI6XfBqWwBheOSFH04XIS1qgX9H
	 iQnqR/VYl1z/5TFkQzOHp18xG2AuLeZqJ8DOT6FHay4NOrfs4C1riK9ZQyC30nApft
	 BowFsqx5fwBiJMoNqFvUzmWOuesora48+/t6ACv8txvMiA2bZZXSp62RFrYMomc5/j
	 UF1eJZEcR2lzw==
Received: from nbf.rojer.cloud (unknown [85.98.52.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id 10D8D2168D;
	Sat, 31 Oct 2026 10:47:23 +0000 (UTC)
From: Deomid rojer Ryabkov <rojer@rojer.me>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jin@mediatomb.cc,
	shawn.lin@rock-chips.com,
	jensenhuang@friendlyarm.com,
	Deomid rojer Ryabkov <rojer@rojer.me>
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S Plus
Date: Sat, 31 Oct 2026 13:47:14 +0300
Message-ID: <20261031104714.3271017-3-rojer@rojer.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031104714.3271017-1-rojer@rojer.me>
References: <20261031104714.3271017-1-rojer@rojer.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_034727_808731_28B0F364 
X-CRM114-Status: GOOD (  12.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The NanoPi R2S Plus has an M.2 E-key slot wired to the sdmmc_ext
controller in 4-bit SDIO mode, where FriendlyElec fit an optional
Fn-Link 6222B-SRC (Realtek RTL8822CS) module:

  - SDIO signalling at a fixed 1.8V (VCC_18)
  - WIFI_REG_ON on GPIO3_B0, 32kHz sleep clock from the RK805 CLKOUT2

Enable the controller and add the power sequence. The SDIO pins need
8mA drive strength for SDR104 tuning to succeed, as in the vendor
device tree [1]; with the SoC default of 4mA no sample phase works.

On boards without the module the controller gives up after about 0.2s
("mmc2: Failed to initialize a non-removable card"); nothing else is
affected.

With the mmc core change for the module's CMD11 handling at a fixed
1.8V [2], the module is tuned to SDR104 at 150 MHz and works with the
rtw88_8822cs driver; without it, it runs in high-speed mode at 50 MHz.

[1] https://github.com/friendlyarm/kernel-rockchip/blob/9238df9d21e835bba35c8ba5248784387936cb2e/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2-rev24.dts#L144-L172
[2] https://lore.kernel.org/linux-mmc/20261030142224.3183407-1-rojer@rojer.me/
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Deomid rojer Ryabkov <rojer@rojer.me>
---
 .../dts/rockchip/rk3328-nanopi-r2s-plus.dts   | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
index 6ba4a74cb1f..a25421f5851 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
@@ -17,6 +17,15 @@ / {
 	aliases {
 		mmc1 = &emmc;
 	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rk805 1>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_reg_on_h>;
+		reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &emmc {
@@ -34,3 +43,49 @@ &io_domains {
 	vccio4-supply = <&vcc_io_33>;
 	vccio6-supply = <&vcc_18>;
 };
+
+&pinctrl {
+	wifi {
+		wifi_reg_on_h: wifi-reg-on-h {
+			rockchip,pins = <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+/*
+ * SDR104 tuning fails with the default 4mA drive strength, use 8mA like the
+ * vendor device tree.
+ */
+&sdmmc0ext_bus4 {
+	rockchip,pins =
+		<3 RK_PA4 3 &pcfg_pull_up_8ma>,
+		<3 RK_PA5 3 &pcfg_pull_up_8ma>,
+		<3 RK_PA6 3 &pcfg_pull_up_8ma>,
+		<3 RK_PA7 3 &pcfg_pull_up_8ma>;
+};
+
+&sdmmc0ext_clk {
+	rockchip,pins = <3 RK_PA2 3 &pcfg_pull_none_8ma>;
+};
+
+&sdmmc0ext_cmd {
+	rockchip,pins = <3 RK_PA0 3 &pcfg_pull_up_8ma>;
+};
+
+/* Optional M.2 E-key SDIO Wi-Fi module (Fn-Link 6222B-SRC, RTL8822CS) */
+&sdmmc_ext {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-mmc;
+	no-sd;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc0ext_clk &sdmmc0ext_cmd &sdmmc0ext_bus4>;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_io_33>;
+	vqmmc-supply = <&vcc_18>;
+	status = "okay";
+};
-- 
2.53.0


