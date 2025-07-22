Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EB1C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 11:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gdlrd0m6qmMRniATbixY3CWNuvG25zrge2jtFo59cTM=; b=kCC11hwVB6XVNduzYqVKESiCy2
	gGr7Osgr4SP1KssAWGsAWTNofwnUgfOrW2ImSNITRvw8LVM/LGunR/rvHIRciQex14EkKZA357Boq
	DXYqD3apPiv+oxTc1EYv3w4vac5eN3NO50opCV2136A894ZpjDiwHCbmR7q4v4w2z0LkpapdpzGIM
	hgoNQc1LhHTDJbDlZ+vdSSBHE68d3rTNtr2q6dUpWBgk4cveNIP9BMd6zExZsQ0KhmXT/6VV+onm0
	LR38u5EBFBBIBqYboaRTGjyxdx5fJd5LrpFiB94GJycTHviyoFAJwwrsJNEnn2J+TPnVMI2GmkQ2l
	snlSRxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBOj-00000002K0o-0b4a;
	Tue, 22 Jul 2025 11:43:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueB8h-00000002HNq-0Onu;
	Tue, 22 Jul 2025 11:26:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 284755C5EC1;
	Tue, 22 Jul 2025 11:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC823C4CEF7;
	Tue, 22 Jul 2025 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753183589;
	bh=gpUTUqXOWbULFlsiYSGEN3jZoAtqx3OWjHms0p86oTg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nZ87M1xL6Yk0BG7E0SFkozay2PjlaXgqwer7C0N6jR664uq26o+naJBL59ZRez01w
	 4TE5jePrre9dRrcoC3Tj5u2CxZ+K8JrPsOZCeOMVmucV63ZNO+vFHJDlwqy0jbEVPi
	 6+IEqOHUMtEx4yEyFGYP4b8CnNMnFPLJFmLja2ahGXwQdHArBl1W6SOPwuvQiG7+9C
	 ZkhYyDqHK1RfRO6gCiDeTuK+2nfRPpDXEHsN+Tnav1D1pNrlbQ7hnbhaSv9JXqIWgr
	 dE4WiETx19O8cz3oKSUW85vNHjoTjj9OPwClFJ+85m2y9Hjy8KdvSOaqbKo92/xAJm
	 vfxRn+F7uVJYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FC1C87FC5;
	Tue, 22 Jul 2025 11:26:29 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 22 Jul 2025 19:26:29 +0800
Subject: [PATCH v2 3/3] arm64: dts: amlogic: c3: Add tempsensor controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-c3-thermal-v2-3-b2231b4be79e@amlogic.com>
References: <20250722-c3-thermal-v2-0-b2231b4be79e@amlogic.com>
In-Reply-To: <20250722-c3-thermal-v2-0-b2231b4be79e@amlogic.com>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Liming Xue <liming.xue@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753183587; l=1174;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=IoRBkt3TWKHWrtMJz187CwMxwu8yF7DTD3qyajQTJnE=;
 b=LmYFK1+8fHyOjr607kbVF4ATEFnyzGdngoasYURRQr2BWxwHZ8cPDjAMx45X65KAZp/FxwlMx
 Wbt4Q7TQ7uSApW4HfcfFSbzCQjIKrOLYrapEVKroqNXJs8E1KIBHOc7
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_042631_224545_4A5A5748 
X-CRM114-Status: UNSURE (   8.49  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the Tempsensor controller node for C3 SoC family.

Signed-off-by: Liming Xue <liming.xue@amlogic.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index cb9ea3ca6ee0..c853390eca6c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -727,6 +727,17 @@ clkc_pll: clock-controller@8000 {
 					      "fix";
 			};
 
+			temperature-sensor@20000 {
+				compatible = "amlogic,c3-cpu-thermal";
+				reg = <0x0 0x20000 0x0 0x50>;
+				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_TS>;
+				assigned-clocks = <&clkc_periphs CLKID_TS>;
+				assigned-clock-rates = <500000>;
+				amlogic,ao-secure = <&sec_ao>;
+				#thermal-sensor-cells = <0>;
+			};
+
 			eth_phy: mdio-multiplexer@28000 {
 				compatible = "amlogic,g12a-mdio-mux";
 				reg = <0x0 0x28000 0x0 0xa4>;

-- 
2.37.1



