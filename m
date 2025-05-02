Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3380C3ABBB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36Kf5XVejWF+uquKt22aS/Ci0ZPLGS0PETWsE7ZHJ78=; b=UxUz04qFCnv7N5A5a5eRsmMSHl
	2DvLS79dGkSa2e9s7/LNXLinkGvAYjCcherAuuwzT+EuX446gaRfhbALMFmr/xN/KuzdfY5gkpnTe
	kNoiyf0EV+k2vLSDuwETfTfqi3s4kS5hMOX7VXQAaq9dM/XN4qtGgW4mIJbDecXLN7u0wBRKHh77X
	sSfmdww0xeEa6/Vm2zSUs14OFjZ9Ew/g7qqKm4jBg9LZfSzp9W3a3VoypMTOEHRVg+MlJ6/S6WuRh
	KvMNM1FwdhAwTdS8QM2zbd9/aCoWql7F8nHZaxeQWaxRqs72RyWxcp6/SI9f3JaOiaf2Bl6BC1KR4
	78eIkptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6I-00000002dog-1ZLt;
	Fri, 02 May 2025 17:23:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtDQ-00000002VOV-1eiK
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 May 2025 16:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=36Kf5XVejWF+uquKt22aS/Ci0ZPLGS0PETWsE7ZHJ78=; b=TGjuJPGjwBkZeLO9wU7T5aGdio
	dXZjftCMP4iP1y4XjvExBn6gkTjl1PngClq+gN8kymfwhoLqhQEk45fOMUsByYQ+XNU5GKLrSdNEW
	0N5CgkfJItmsFBPCAYz+7vI/M984r9aKPwcaoTbYnUvNFBV6+i0jLE8Z6DLr5zzMm1ZQckXrPDsB0
	Qo+HF9OgI2H6MCngpGoNx7/TB+ERN9uarVp9Um3TFzV7PBKJ42f7AsCeJwlKiJcl/Y2FrLarvtwyq
	oiWCKWRy5pqw9r1qarJttMRNFSvS73oT84TOhAGIPbTKoulcxi5JV02zuU3/8OcrWxlGfywQMaueH
	Ku2JK5yg==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAtDK-0000000F3uh-2nWN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:26:18 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542GPu7m268300
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746203156;
	bh=36Kf5XVejWF+uquKt22aS/Ci0ZPLGS0PETWsE7ZHJ78=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=J8P9NANCBqGGLQlkpqzyu6W9XUJkIKUF3tYS7r7w0TIgvtA93heBpFW9eXKseXYLF
	 bWyDhuA95TrSHYamEmsE7J9b8PEnZGSc0sFn7wIENp+uz+Lra4SnfmqVPd7U+Zaa2c
	 3ATCg2ivfKINWztVQQGbZUPKlvBvvGZmVXhX9d0M=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542GPus6118985
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 11:25:56 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 11:25:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 11:25:56 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542GPex8028994;
	Fri, 2 May 2025 11:25:51 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <r-donadkar@ti.com>
Subject: [PATCH v2 2/4] arm64: dts: ti: k3-am62x: Add required voltage supplies for IMX219
Date: Fri, 2 May 2025 21:55:37 +0530
Message-ID: <20250502162539.322091-3-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502162539.322091-1-r-donadkar@ti.com>
References: <20250502162539.322091-1-r-donadkar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_172615_223812_5617C39C 
X-CRM114-Status: GOOD (  10.33  )
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

The device tree overlay for the IMX219 sensor requires three voltage
supplies to be defined: VANA (analog), VDIG (digital core), and VDDL
(digital I/O) [1].

Add the corresponding voltage supply definitions in the overlay so
that the same topography as dt-bindings is present in the DT overlay.

Link: https://datasheets.raspberrypi.com/camera/camera-module-2-schematics.pdf [1]
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso  | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
index dd090813a32d6..149c59c071823 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
@@ -15,6 +15,33 @@ clk_imx219_fixed: imx219-xclk {
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
 	};
+
+	reg_2p8v: regulator-2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vcc_3v3_sys>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3_sys>;
+		regulator-always-on;
+	};
+
+	reg_1p2v: regulator-1p2v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P2V";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vcc_3v3_sys>;
+		regulator-always-on;
+	};
 };
 
 &main_i2c2 {
@@ -40,6 +67,10 @@ ov5640: camera@10 {
 
 				clocks = <&clk_imx219_fixed>;
 
+				VANA-supply = <&reg_2p8v>;
+				VDIG-supply = <&reg_1p8v>;
+				VDDL-supply = <&reg_1p2v>;
+
 				reset-gpios = <&exp1 13 GPIO_ACTIVE_HIGH>;
 
 				port {
-- 
2.34.1


