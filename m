Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12061C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 10:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASLg/A5fi+W/LA+IOM+ZsHtSzRzn5LVIqH4St0CX4uE=; b=BuLXyjCr/mC24C4hGLRTE9OgAI
	mJ3wfJIjcnATmnECjX/p/n6AYIbblGXop5ArIa7DmzZXNsJoQkcWhPuVrSIagBENJU1NMeD1bMGrw
	vnCTiShRdeNnzK7NqM08hpgAsl4RidbK+iw9GuB6yaRIIpQ5OPemlFGa4wlhbLZhL7EviAKEHr2Ne
	GqcZAHZRKFuNLDtZXWjvQeMWG/yarnldgghG/ysvLD0Ed95Xw12NOfWzObEbtkwHhVK3vYibPbQuT
	Gu5vwxTzXhlHEtL1T+WximRkeOGlu3/Zs1Lj1lZ1jM59pGbSl1DKylwgyhyICDi6vYY0XmlVFCfh6
	8hqjreAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlkQ-0000000DA6Y-3Tcn;
	Wed, 04 Jun 2025 10:53:30 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMleJ-0000000D9SU-2BTf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 10:47:12 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 554Al0iU772444;
	Wed, 4 Jun 2025 05:47:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749034020;
	bh=ASLg/A5fi+W/LA+IOM+ZsHtSzRzn5LVIqH4St0CX4uE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SjlOuvRl5xdH1RKUkllJe+gqteEuQ4vJQldUSAn9paJwNBOgQbRQlRS4MsBihKhoF
	 7ZfA7h/RdfZlAC+v5crpqOCJiUDpOydiTWQRChCiQNKXMPSw7PIWEvQoK6lo82X6v7
	 Q/xt+9Egr5XClt7lq4FWJNPM4/fnvx40uCq9UmYo=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 554Al0Ij091644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 4 Jun 2025 05:47:00 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Jun 2025 05:46:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Jun 2025 05:46:59 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 554AkwXX1917892;
	Wed, 4 Jun 2025 05:46:59 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <r-donadkar@ti.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH 1/3] arm64: dts: ti: k3-j721s2-main: Add McASP nodes
Date: Wed, 4 Jun 2025 16:16:54 +0530
Message-ID: <20250604104656.38752-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604104656.38752-1-j-choudhary@ti.com>
References: <20250604104656.38752-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_034711_646134_FAB1A3D8 
X-CRM114-Status: UNSURE (   9.80  )
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

Add McASP 0-4 instances and keep them disabled because several
required properties are missing as they are board specific.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 605f753d3258..6dee0c573980 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -2066,4 +2066,94 @@ gpu: gpu@4e20000000 {
 		power-domain-names = "a", "b";
 		dma-coherent;
 	};
+
+	mcasp0: mcasp@2b00000 {
+		compatible = "ti,am33xx-mcasp-audio";
+		reg = <0x00 0x02b00000 0x00 0x2000>,
+		      <0x00 0x02b08000 0x00 0x1000>;
+		reg-names = "mpu","dat";
+		interrupts = <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 545 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tx", "rx";
+		dmas = <&main_udmap 0xc400>, <&main_udmap 0x4400>;
+		dma-names = "tx", "rx";
+		clocks = <&k3_clks 209 0>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 209 0>;
+		assigned-clock-parents = <&k3_clks 209 1>;
+		power-domains = <&k3_pds 209 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+	};
+
+	mcasp1: mcasp@2b10000 {
+		compatible = "ti,am33xx-mcasp-audio";
+		reg = <0x00 0x02b10000 0x00 0x2000>,
+		      <0x00 0x02b18000 0x00 0x1000>;
+		reg-names = "mpu","dat";
+		interrupts = <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 547 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tx", "rx";
+		dmas = <&main_udmap 0xc401>, <&main_udmap 0x4401>;
+		dma-names = "tx", "rx";
+		clocks = <&k3_clks 210 0>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 210 0>;
+		assigned-clock-parents = <&k3_clks 210 1>;
+		power-domains = <&k3_pds 210 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+	};
+
+	mcasp2: mcasp@2b20000 {
+		compatible = "ti,am33xx-mcasp-audio";
+		reg = <0x00 0x02b20000 0x00 0x2000>,
+		      <0x00 0x02b28000 0x00 0x1000>;
+		reg-names = "mpu","dat";
+		interrupts = <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 549 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tx", "rx";
+		dmas = <&main_udmap 0xc402>, <&main_udmap 0x4402>;
+		dma-names = "tx", "rx";
+		clocks = <&k3_clks 211 0>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 211 0>;
+		assigned-clock-parents = <&k3_clks 211 1>;
+		power-domains = <&k3_pds 211 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+	};
+
+	mcasp3: mcasp@2b30000 {
+		compatible = "ti,am33xx-mcasp-audio";
+		reg = <0x00 0x02b30000 0x00 0x2000>,
+		      <0x00 0x02b38000 0x00 0x1000>;
+		reg-names = "mpu","dat";
+		interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tx", "rx";
+		dmas = <&main_udmap 0xc403>, <&main_udmap 0x4403>;
+		dma-names = "tx", "rx";
+		clocks = <&k3_clks 212 0>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 212 0>;
+		assigned-clock-parents = <&k3_clks 212 1>;
+		power-domains = <&k3_pds 212 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+	};
+
+	mcasp4: mcasp@2b40000 {
+		compatible = "ti,am33xx-mcasp-audio";
+		reg = <0x00 0x02b40000 0x00 0x2000>,
+		      <0x00 0x02b48000 0x00 0x1000>;
+		reg-names = "mpu","dat";
+		interrupts = <GIC_SPI 552 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 553 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tx", "rx";
+		dmas = <&main_udmap 0xc404>, <&main_udmap 0x4404>;
+		dma-names = "tx", "rx";
+		clocks = <&k3_clks 213 0>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 213 0>;
+		assigned-clock-parents = <&k3_clks 213 1>;
+		power-domains = <&k3_pds 213 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+	};
 };
-- 
2.34.1


