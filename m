Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E03BF357C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ioP1qSExwiStIhsPUWCvZVeGtY9ld3ywuq6BtEqmxw0=; b=Ju2wL/NGCAh/t+5xfttnHsZY9I
	dFyQMhNYWJbZbHH1F9kOu0tSfkdYp3ARlqtr9ZDi1WaV2M+9/2+bJDZjGdRM5TpeC+MMLFzCYUUUH
	4SQj9gidK45w8S6uslJqVWgTUmj/nsyiMIApJT0hNQHBc6iABkn2D42mtc6lNXs9YgbasyWww0kNK
	GLf10FnzGBvXMcFU84hp9/wrpXCdjSmu59yZ0xmryyksG+VF9oI/WHuFSZs6vCYDmnc5L7RtkqV3J
	jZIsPyNvTz2JZ1VXT6vyVpZk+q6CF6GzdRB2ww9yBTKsDxr1fCMRERhiBlDDL/+kEtE9fI5eKeIaN
	Qx7fe21g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvrM-00000002Rfk-2bL4;
	Tue, 24 Feb 2026 17:06:08 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvrK-00000002Rel-0j7a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:06:07 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1771952753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ioP1qSExwiStIhsPUWCvZVeGtY9ld3ywuq6BtEqmxw0=;
	b=jXmls00HBdKEZ+Fi1Uq7rydjBUkhrg3zkIhggJ9VifP2kNFuEDi9xIrxO/0u9Vn3Zr+sKh
	aqT7m7CgcLhqTrh+cjTxvvpxs5uX87STnWNUCi4jcJC0v6s1zYXYRaaG2frAFHwHCHX/qH
	TM/JUWBjCq5H8pM0WVJ3piE2RBn2Cnbjqaz76t6wLpkqxw5XqJOmP69OO/B1WHcPS5fFhe
	6OkskUOWnBOitcNzLn+jFvNbC5brEIlx9VteO9ia3gHfq/I9DeiYhT1nLSJ0HcAvsh7+OH
	IIaQQsQqoguvTXuCLpR6jyeqIzm2UatvC9dmnz1dz4Q00U4rZFWZcw991vF4zQ==
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Samuel Holland <samuel@sholland.org>,
	Maximilian Weigand <mweigand@mweigand.net>,
	Andreas Kemnade <andreas@kemnade.info>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hrdl <git@hrdl.eu>,
	phantomas <phantomas@phantomas.xyz>,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH] arm64: dts: rockchip: Add battery and charger on rk3566-pinenote
Date: Tue, 24 Feb 2026 18:04:51 +0100
Message-ID: <20260224170531.516392-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_090606_374583_EE4FCFBD 
X-CRM114-Status: UNSURE (   8.10  )
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

From: Samuel Holland <samuel@sholland.org>

The PineNote has a single cell 4000mAh battery which can be charged via
the rk817 PMIC.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Co-developed-by: Maximilian Weigand <mweigand@mweigand.net>
Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>
Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 .../boot/dts/rockchip/rk3566-pinenote.dtsi    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
index 791719acb9dd..551d551a113b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
@@ -40,6 +40,25 @@ spk_amp: audio-amplifier {
 		sound-name-prefix = "Speaker Amp";
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <4000000>;
+		charge-term-current-microamp = <300000>;
+		constant-charge-current-max-microamp = <2000000>;
+		constant-charge-voltage-max-microvolt = <4200000>;
+		factory-internal-resistance-micro-ohms = <96000>;
+		voltage-max-design-microvolt = <4200000>;
+		voltage-min-design-microvolt = <3500000>;
+
+		ocv-capacity-celsius = <20>;
+		ocv-capacity-table-0 = <4168000 100>, <4109000 95>, <4066000 90>, <4023000 85>,
+					<3985000 80>, <3954000 75>, <3924000 70>, <3897000 65>,
+					<3866000 60>, <3826000 55>, <3804000 50>, <3789000 45>,
+					<3777000 40>, <3770000 35>, <3763000 30>, <3750000 25>,
+					<3732000 20>, <3710000 15>, <3680000 10>, <3670000  5>,
+					<3500000  0>;
+	};
+
 	dmic_codec: dmic-codec {
 		compatible = "dmic-codec";
 		num-channels = <6>;
@@ -260,6 +279,13 @@ rk817: pmic@20 {
 		vcc8-supply = <&vcc_sys>;
 		vcc9-supply = <&dcdc_boost>;
 
+		charger {
+			monitored-battery = <&battery>;
+			rockchip,resistor-sense-micro-ohms = <10000>;
+			rockchip,sleep-enter-current-microamp = <150000>;
+			rockchip,sleep-filter-current-microamp = <100000>;
+		};
+
 		regulators {
 			vdd_logic: DCDC_REG1 {
 				regulator-name = "vdd_logic";
-- 
2.51.0


