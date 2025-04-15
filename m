Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7BEC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 15:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hIuj4zkeDKIgdNnFtL2t0Ld2CGaXw/cfH70lhT1NzU=; b=Gm2QvoNbDxmi3rfli3gQl+xUpt
	nMt5oQG6UwMNDXwTGPJSOEIsHwkG9wwtc79h5af7+jamxn/GD7LePXWKU5JrDerotp6Jw+g/oxqqj
	9fS4HLq5wacfx6KBH+rEGdRR+bzGwPRDFcCjRdoAkJqbyzJhqSoIrtl71vwIfulEYQC/5Wk6mck37
	eAsAGqhUn9+iCDuxcQSjHPpgoCjqFmhOqwHMSCoq4EPJ4ASprDg73xuNIope7U6eI5CP1u/c7eiXM
	0vVISC8Pir/vzAv7AAZ68s4YtYsuX7rSvHkhfrHmzkdRUdSEsvCEk2RCWK3jotVyInY6ZsaEgHiei
	DRpneSLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ic4-00000006KKD-3DlH;
	Tue, 15 Apr 2025 15:54:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iGf-00000006Fhl-1M7v
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Apr 2025 15:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6hIuj4zkeDKIgdNnFtL2t0Ld2CGaXw/cfH70lhT1NzU=; b=Y75zmiiYSNotx4wgJOHs3eGTSw
	12A6IDb3RmgCihWCdIFIwNBDw8f4bJm7vbitJPRjN8C3X9etbZfT+8q6PdqYeF2c4xvvTO9lBy0ow
	nhl6mi+gVne+Q3EmG1km3HxwkqYVUswhackmP+S328l33So8RlTnmOHAc8jS1iZAvFp+rwHSCtLT4
	o6N2Jrj+YK4ri5ZMilexdLf4eAwq+QbyXsfuothXAy4fwfuBtvdFtmhAyhV5yhewix3Gx9Dn7ThVK
	ZXf3BSMN7/rZkqSeaXrowVF4N0sMi3oyGPMUFeOZHTmmGnNhrp//oo8PQyWFeTQ+2YlSkyU7QE1b9
	uyLZRlPg==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4iGb-00000009upd-2Wit
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:32:07 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53FFVmC82394451
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 10:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744731108;
	bh=6hIuj4zkeDKIgdNnFtL2t0Ld2CGaXw/cfH70lhT1NzU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fDSRq0xxbtt1rna3JCkb7UFBlNrJ+8ygSHex+9p09GbLRzanhsLw30QteMluR4gRd
	 nsZ3e0WgdkjGVItqLlaKAy/yUQyMOdvYvzOtu2C7aODAniaAUJ9FrGnCrnLkZey+9Z
	 6ENZOcwzqfFQPGoLikLp/Szui1Dn5QP2iE+xXNkE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53FFVm65109508
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 10:31:48 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 10:31:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 10:31:48 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53FFVla0109804;
	Tue, 15 Apr 2025 10:31:48 -0500
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Prasad <b-padhi@ti.com>, Andrew Davis <afd@ti.com>,
        Markus Schneider-Pargmann
	<msp@baylibre.com>,
        Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>
Subject: [PATCH v7 08/11] arm64: dts: ti: k3-am62x-sk-common: Enable IPC with remote processors
Date: Tue, 15 Apr 2025 10:31:44 -0500
Message-ID: <20250415153147.1844076-9-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415153147.1844076-1-jm@ti.com>
References: <20250415153147.1844076-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_163206_082602_BBB2874A 
X-CRM114-Status: GOOD (  12.38  )
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

From: Hari Nagalla <hnagalla@ti.com>

For each remote proc, reserve memory for IPC and bind the mailbox
assignments. Two memory regions are reserved for each remote processor.
The first region of 1MB of memory is used for Vring shared buffers
and the second region is used as external memory to the remote processor
for the resource table and for tracebuffer allocations.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 34 ++++++++++++++++---
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index d52cb2a5a589a..364b2ba6af958 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -70,6 +70,18 @@ mcu_m4fss_memory_region: m4f-memory@9cc00000 {
 			no-map;
 		};
 
+		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9da00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9da00000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: r5f-memory@9db00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9db00000 0x00 0xc00000>;
+			no-map;
+		};
+
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
@@ -82,11 +94,6 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9db00000 0x00 0xc00000>;
-			no-map;
-		};
 	};
 
 	leds {
@@ -476,10 +483,17 @@ cpsw3g_phy0: ethernet-phy@0 {
 };
 
 &mailbox0_cluster0 {
+	status = "okay";
+
 	mbox_m4_0: mbox-m4-0 {
 		ti,mbox-rx = <0 0 0>;
 		ti,mbox-tx = <1 0 0>;
 	};
+
+	mbox_r5_0: mbox-r5-0 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
 };
 
 &mcu_m4fss {
@@ -489,6 +503,16 @@ &mcu_m4fss {
 	status = "okay";
 };
 
+&wkup_r5fss0 {
+	status = "okay";
+};
+
+&wkup_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_memory_region>;
+};
+
 &usbss0 {
 	bootph-all;
 	status = "okay";
-- 
2.49.0


