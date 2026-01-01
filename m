Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A460EEE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 06:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZX/dZjtI+F19LaYU8udICG3jzC2LKrcizLtuHAcnNI=; b=KW907stIZfMOVPFN7+foQ6BLet
	qIgl/rg9CmPXZ5pPxPKT8v9bAFiQhqUscyuC4+Cphxfk6eLLIv6LOKJkXeNlz9v3JWTov6rCiYJ1K
	wgrIb04sAAGJhX04N0fVOoDxuKYif1DZWbsvg+6NhMwja+QIvTYRp8UvIbu9kB1dlRa6IrInKhN5J
	Z5cyyUz62qh1L+331wFRJBZSr172/S2IWHgdt0j9G356y6XMgS0bR+J4vxSZ4vVQu9IAld73L1HUx
	duPluSjfmoWIwhJN2W6BXGf1kpZ+ZHEVPo25oyH2NRmeR4yv1wXlBq1LdC8EnURyG8XKjP6zeEz3y
	IIzxCDPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbCPY-00000006eal-2zEn;
	Thu, 01 Jan 2026 06:43:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbCPW-00000006eZg-1bvZ;
	Thu, 01 Jan 2026 06:43:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D07C360054;
	Thu,  1 Jan 2026 06:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41EC7C19422;
	Thu,  1 Jan 2026 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767249827;
	bh=ip9zrZpjsUv5RAPXj+UMAq++aMcleYwwYvHtDmgnJNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dQ4n8ON2tSvDvYCsuBmQ1D0RxEIwp0t2MuL9rF3ucNwhBQZ4CwOGfoObn69df6rVx
	 /EGfwFdKx8dOhAOwgpGK0Ot7UBDrSuLJG9GWNXP85RsWiKiVtAbC8m9oxJzR5ZVZYD
	 nVcvYD/sPuT3VhuJ1UTSYvL0vBcuFE3YFwKS3dTIogStlbKk8eb6mH1piaQ/SMJD2H
	 df8CIytSiVtfobVTfjBo9HX5vtp8Ro5faUhBwavNixuIQTM671xKWa9v3EhWlGKaRh
	 zzAR1pcuGsNUy26rZ/p/AJT/7+d6grw3v3Y868lRkwxkZJpEYQfG647zvApPhVpzGT
	 BC2wD4dwe9ByQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35142EEB57C;
	Thu,  1 Jan 2026 06:43:47 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Thu, 01 Jan 2026 07:43:10 +0100
Subject: [PATCH v2 2/3] arm64: dts: rockchip: Enable the NPU on
 FriendlyElec CM3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-arm64-dts-rockchip-rk3588-npu-enablements-v2-2-013cf5d5c39d@pardini.net>
References: <20260101-arm64-dts-rockchip-rk3588-npu-enablements-v2-0-013cf5d5c39d@pardini.net>
In-Reply-To: <20260101-arm64-dts-rockchip-rk3588-npu-enablements-v2-0-013cf5d5c39d@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jimmy Hon <honyuenkwun@gmail.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1738;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=/oDfWXpDVXmpYIy9Sg0dUU5JsZFn82Eu22Dm+M4KcYk=;
 b=owEBbQGS/pANAwAIATteP+Oex+3pAcsmYgBpVheh6Ix5kMNtCOZEa8p5wxVW4TXI1nDb4wTxR
 eVy/gjRLBSJATMEAAEIAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCaVYXoQAKCRA7Xj/jnsft
 6Rw2B/9cyLpVG+UBbhSTB1cTyTqKi+MrY1YtRWkV5VIfAqlzqYg2sVUHh9AekDM/m/e3ElbrYLI
 5D4Ti5xAjF8R3gwRhn8vAjLJ5i6aYsRaiiFz6Sc2bnDGCTEhLLuKU15bH20l/YUzXkV1MZ0a9tx
 ur5I5yevDj2mt/MSxLjawDvI1PPtWq7ejCXnhjOCcQHTjI1uBRSOLA14tmzNucSgbDgMMnPUWML
 vgIEtjjeLoYx5mwhoX68+SGNnpuR3ybXTyLg27CaZuXjBhTrB1dhSifNSoVwu41mHVFVpjSMvfv
 7ltO5HSriyc0h6hGC/cOhRbVtJ0UQ9MV3YeOaugSyN20f2W0
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ricardo Pardini <ricardo@pardini.net>

Enable the NPU on FriendlyElec CM3588.
The regulator vdd_npu_s0 was already in place; since
the NPU power domain supply is now described, remove the
regulator's always-on.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 .../dts/rockchip/rk3588-friendlyelec-cm3588.dtsi   | 35 +++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
index af431fdcbea7a..49cf4b85c4e96 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
@@ -182,7 +182,6 @@ vdd_npu_s0: regulator@42 {
 		reg = <0x42>;
 		fcs,suspend-voltage-selector = <1>;
 		regulator-name = "vdd_npu_s0";
-		regulator-always-on;
 		regulator-boot-on;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
@@ -264,6 +263,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	gpio-leds {
 		led_sys_pin: led-sys-pin {
@@ -294,6 +297,36 @@ sd_s0_pwr: sd-s0-pwr {
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
 	vref-supply = <&avcc_1v8_s0>;
 	status = "okay";

-- 
2.52.0



