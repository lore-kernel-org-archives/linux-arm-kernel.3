Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308A0C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 04:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/BKbhuL0vKp+y2KpfAqEHa8O7EtSQwyOm6GZvSm+1w=; b=1alH20UICiwXgwPRZS51XAkm5d
	mMXGDZYRNUzHaKKnpG1cttO3BgVn7A9l3OxowUJ8dSM/oCM3Au4BlD59B1iAD/OOWDIbGnUetLJHk
	qOSuXMxUZtB423PQlfwN09ch1cwOiGAKAiyOJelHYC4Yx4mHnA48S452RmA7uxulGVDRPMO7npVbr
	KZKDy/pcHZ6Zb/0OyscHkTvZ6hgeUdW1NE7aIwE2kAXkWbdeM0/c4bxYx0I4wFRnPny4OcG/m2Vnb
	b4DbFMIviY/g1AbYj4f8DaSNuN9yUezXlDVlFr6j6fxyLtjXspzjxILBQrsxCvMmKqGgaSC1wEH0d
	9DYVkJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQof-00000003y63-07ZE;
	Wed, 23 Jul 2025 04:10:53 +0000
Received: from mta-64-226.siemens.flowmailer.net ([185.136.64.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQQo-00000003vno-3G3z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 03:46:16 +0000
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250723034611a53b66df05a6d9c56a
        for <linux-arm-kernel@lists.infradead.org>;
        Wed, 23 Jul 2025 05:46:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=q/BKbhuL0vKp+y2KpfAqEHa8O7EtSQwyOm6GZvSm+1w=;
 b=nOQK70L0wurZhAnvK5iaoQ+5hpiOKwaLW3s34lsI/Xu6qMM7VcehDgsu8NixfNe9/eEKFR
 PPAlSJFX9MEhm5iOi+XYpbMCu6C5MsHnYT1tSHB6Y5YxhFogbBOfFIidbaoobRIb9EcCO7Jr
 KjbUj/N8P9YEztbFH9hRgGXr2QN0qHNR5mjbG8DlReW0O0WCRys9ftrYbt212RcXnPlBiVzC
 8eo3/hDbISciIL/NUeUc5ym4zRVKCJYMcv8zPV+2e/I93sDqYpx1m0Zg2NrZfz4DsqHZ9XOi
 vIfxxYcZ44lX0bco/SCFR7o+Xtv96sbhX1j6cRnO1CLE0FEgdauA67Dw==;
From: huaqian.li@siemens.com
To: christophe.jaillet@wanadoo.fr
Cc: baocheng.su@siemens.com,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	diogo.ivo@siemens.com,
	helgaas@kernel.org,
	huaqian.li@siemens.com,
	jan.kiszka@siemens.com,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	nm@ti.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	ssantosh@kernel.org,
	vigneshr@ti.com
Subject: [PATCH v11 5/7] arm64: dts: ti: k3-am65-main: Add PVU nodes
Date: Wed, 23 Jul 2025 11:45:19 +0800
Message-Id: <20250723034521.138695-6-huaqian.li@siemens.com>
In-Reply-To: <20250723034521.138695-1-huaqian.li@siemens.com>
References: <20250723034521.138695-1-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_204614_943331_EDB9DDF0 
X-CRM114-Status: UNSURE (   7.93  )
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Add nodes for the two PVUs of the AM65. Keep them disabled, though,
because the board has to additionally define DMA pools and the devices
to be isolated.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index b085e7361116..be65e6aa7b80 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -843,6 +843,26 @@ main_cpts_mux: refclk-mux {
 				assigned-clock-parents = <&k3_clks 118 5>;
 			};
 		};
+
+		ti_pvu0: iommu@30f80000 {
+			compatible = "ti,am654-pvu";
+			reg = <0 0x30f80000 0 0x1000>,
+			<0 0x36000000 0 0x100000>;
+			reg-names = "cfg", "tlbif";
+			interrupts-extended = <&intr_main_navss 390>;
+			interrupt-names = "pvu";
+			status = "disabled";
+		};
+
+		ti_pvu1: iommu@30f81000 {
+			compatible = "ti,am654-pvu";
+			reg = <0 0x30f81000 0 0x1000>,
+			<0 0x36100000 0 0x100000>;
+			reg-names = "cfg", "tlbif";
+			interrupts-extended = <&intr_main_navss 389>;
+			interrupt-names = "pvu";
+			status = "disabled";
+		};
 	};
 
 	main_gpio0: gpio@600000 {
-- 
2.34.1


