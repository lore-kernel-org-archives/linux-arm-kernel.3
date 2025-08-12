Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5E0CA0EDA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mniuYZ7bBHdBuajGekijW6bAhy+sCr+Xt0s66tPT/I=; b=TnV3vDN2TFIYSgQcRQ7GPF5kmF
	sxnfk52tNHeVpydjAqFq/e0wVS5EAxeZYvHGJCQmNVHiqojtDVIgY5Qo11pA/Atcu6ijUFBo0cfBm
	zFTYV6QhX13lc4EFke7ksZNAm50xKqyJzeZv4PLXR1KwjwHf97MoqU1ioEPTl8Wr29QmzlBOURhT2
	LuQEJS4290ViNvKVg84K8YD9YJPYQuWFgQXfc+7jnW7t3WZANTTx+dXzdQ23DoxMpPPLUWr7zdU2p
	EaijihJ4VgmTM6xqTl3VZNcqC0rQ9ivAvdP3BfAT//MzHvQT1ylr7tTtMF01+d7mW/tKdYGWOiVOF
	jZstKqfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHp-0000000AlqI-3JJg;
	Tue, 12 Aug 2025 12:39:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkmx-0000000AJCG-2ngv;
	Tue, 12 Aug 2025 08:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=3mniuYZ7bBHdBuajGekijW6bAhy+sCr+Xt0s66tPT/I=; b=DuApqncV5Cb7vwaFa2ud3fC3JT
	iCQsRKDndDbvKFIOqdllVHzvnPxHpjfQl6jVj10CBqAt2IlF/NcBheags6e1IHVeTOKBj+PP0SClj
	OMRmKsOC7RARj/wnBxGcoLf9SdHbY2lcIhOOds/WT9dCpAmZmWWwN5eMSZtKInRpPkcv7OjVlZspO
	nP41LuxrvKunN0MV/ZwdCxmqGF2Ud+FbO6nE4csIhO4TrbTCoQFn48S2XtwbmyzbuojBHgQO1d3yo
	dqgatnzkiSOOb5Eq7sVxED/jdqZyPPdL5MQWP3qNt7nc61vnHz1LKPvEV2yhEh88w2d+ApFa+e+DL
	zebyHemA==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ulkmw-000228-D3; Tue, 12 Aug 2025 10:55:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 2/2] arm64: dts: rockchip: enable NPU on rk3588-jaguar
Date: Tue, 12 Aug 2025 10:52:13 +0200
Message-ID: <20250812085213.1071106-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250812085213.1071106-1-heiko@sntech.de>
References: <20250812085213.1071106-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_015523_721216_976B25C0 
X-CRM114-Status: GOOD (  14.23  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Enable the NPU cores and their mmus and wire up the supply-regulator.
The regulator itself was already defined, but it does not need to be
always on - the npu can control it.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../arm64/boot/dts/rockchip/rk3588-jaguar.dts | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index bcd15c1c930b..6de2ffe7fb87 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -428,7 +428,6 @@ vdd_npu_s0: regulator@42 {
 		reg = <0x42>;
 		fcs,suspend-voltage-selector = <1>;
 		regulator-name = "vdd_npu_s0";
-		regulator-always-on;
 		regulator-boot-on;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
@@ -607,6 +606,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	emmc {
 		emmc_reset: emmc-reset {
@@ -661,6 +664,36 @@ typec1_sbu_dc_pins: typec1-sbu-dc-pins {
 	};
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";
-- 
2.47.2


