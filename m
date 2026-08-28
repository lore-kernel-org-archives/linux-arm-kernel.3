Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6807EC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 11:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PPyQ5gaLLDVvQk1HPPh/VvvLE6TGfU2Ht/YV8lSszI=; b=aUej2c1+Yb75udmnoYpwrabnSv
	PQkFUWiLw62Czez6TSrfEtVTknzKzawwNuK6zyNmW44PK6GkvrESluk/Ebp2RVFYlds2+a8tdm1UT
	iNicabIYj394P9udo1tmjgXDCbKO3T+3ztHq55XD7dLk26q9anDcUyi6mJQjv11SYID+SXo75CeNE
	M5aZS1a7jQKhQjDl2aWEcMZ2EM21DxXS8xYj+Tw5IGFu7nz597igeX72MlvMFU1jzGN6HQtyc08IA
	m4f16xLw7f+sSbiGQmFVzxoEx/8Xi2Apiy2EYmHDOik5pCAFKLYwqrVcYl64buRsLuORbsFde3x/s
	EQe8zt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzv1s-00000005fY1-2sxx;
	Fri, 28 Aug 2026 11:45:52 +0000
Received: from out-107.mta1.migadu.com ([2001:41d0:203:375::6b] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzv1p-00000005fWm-1q2p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 11:45:51 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=hKt0OBC9Ziec3JNJiQiTOs4ZiRMVpV+jL5aTojBkpS0=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787917545; v=1; x=1788522345;
 b=YASbBN6ffCYeHsbLBb1EFd0w22zEj7Ri0P0PlL8/ptGrs/weZNb5TxH2mzXlyYQWsNYRDY+2
 XWTiIdEtFVPX3MqCP9L38hiRouV75PcBkPnXE3W80sBLLNsQQOQBEwLksSi1ks2pciG2XBQ7fxo
 8fcrjcnl9IN5xNvigJvrRvLno0yvdg8gZhhpLGvF4I0+Am8sOCOsPKkUwFzhsNvxvTByGr99WI9
 DHMenQN1XdIkY0HNuC3FNFFglRxRF8MQB8P7SUR4n1G7APTAwhU3INSSD8xpvH8xOiK7wmHpGYV
 OoAjTLNmMxZd1t0st5065rLoME8jWYAgy7/hb+aG/NqiQ==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 269a0ce062d2b6cf;
	Fri, 28 Aug 2026 11:45:45 +0000
X-Mizu-Trace-ID: 269a0ce062d2b6cf
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 1/7] arm64: dts: rockchip: Remove unneeded vcc_3v3_pcie20 on NanoPC-T6
Date: Fri, 28 Aug 2026 13:43:01 +0200
Message-ID: <20260828114530.1315798-2-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828114530.1315798-1-diederik@cknow-tech.com>
References: <20260828114530.1315798-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_044550_034915_0064690C 
X-CRM114-Status: UNSURE (   9.78  )
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

The ``vcc_3v3_pcie20`` regulator, identified in the schematic with
``VDD3V3_25GLAN[_B]`` is only separated from ``VCC_3V3_S3`` with a ferrite
bead. So there's no need to define a separate regulator for that.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index cfdb5c13f860..fc49b927ef73 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -167,16 +167,6 @@ vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
 		vin-supply = <&vcc4v0_sys>;
 	};
 
-	vcc_3v3_pcie20: regulator-vcc3v3-pcie20 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_3v3_pcie20";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_3v3_s3>;
-	};
-
 	vbus5v0_typec: regulator-vbus5v0-typec {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -640,7 +630,7 @@ map1 {
 
 &pcie2x1l0 {
 	reset-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc_3v3_pcie20>;
+	vpcie3v3-supply = <&vcc_3v3_s3>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_0_rst>;
 	status = "okay";
@@ -656,7 +646,7 @@ &pcie2x1l1 {
 
 &pcie2x1l2 {
 	reset-gpios = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc_3v3_pcie20>;
+	vpcie3v3-supply = <&vcc_3v3_s3>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_2_rst>;
 	status = "okay";
-- 
2.55.0


