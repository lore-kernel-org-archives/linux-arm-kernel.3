Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACBD103E166
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ddV1Y2JFO294bsw/tWTjQ2fw+3OQrn/h1nPZsDOLes=; b=MOrcZsWBer5obSsYl9rmVhMGve
	hfQU5+eCJ9MQ4623FIleNUzqzl8wkSRd3HeR1+r4pTrLMszUweAFVt5tYe0iut/Nhg6UHT6lZByiQ
	co6UAZBnJO3Vt3AZZ0xUjlSRbp3nTAO7PYdzx/cR+A4J465UzaqkNgZmZcDaT2S8D4kSgSAqX9neZ
	jNU0LjXOAq5AeMskDziGcbdGL1X96Me3jIKPcT9SNWef6pc1g8AjZZqVCMD06Ac2NuL0SxH2uMWkt
	l4dKNPVTuuQM2OEKNGb4kWIlamKngYZIU1HodoJr6Os6PKCNVHB8XihiI21Kz+COlCbBztl4d8ODF
	h3Icbw2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pRx-00000008LRL-222D;
	Wed, 18 Mar 2026 11:52:33 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pRv-00000008LQA-0NEG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:52:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=4ddV1Y2JFO294bsw/tWTjQ2fw+3OQrn/h1nPZsDOLes=; b=lVo0O16IuuSO6bHHveg+5DIWyH
	irEZM/NiuAu8Q0Ri07g5nMF7AobtVEpo9cNlMfgxQKapT1MpJCyrSeJz7W2k8Y2KX+bMiKE+yMV3+
	5wj1j7SHA6QF9EUk6BT6r9SXF9HR5nASKaBW4US8UNDLxbqe3X9UXzDrHn5SpFD7jUo1rvhVQ1HQB
	5ZBfnb59YxCigknwRVJn0h6C+Sm9oRShyrMB87fCtQStY6qV9Kg7r+57vtaZH1cDZSxLGIpJjy4gU
	GvEOfZ1SVqkqJcBY/BbyfLnz+O/wamBxxs7b39+ucbqDfCP2PzqxARHQszyCgxgDHMQmoQ32Aeykd
	xEEDwImg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2pRm-0006Sv-30;
	Wed, 18 Mar 2026 12:52:22 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2pRn-000OYd-05;
	Wed, 18 Mar 2026 12:52:22 +0100
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH] arm64: dts: ti: k3-j722s: add I2C4 node and range
Date: Wed, 18 Mar 2026 12:51:44 +0100
Message-ID: <20260318115144.7702-1-nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27944/Wed Mar 18 07:24:13 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_045231_233084_8A0AB709 
X-CRM114-Status: GOOD (  11.11  )
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

I2C 0..3 are common to the AM62P and J722S, and are thus defined in
k3-am62p-j722s-common-main.dtsi. The J722S has an additional I2C
controller I2C4 that does not exist on AM62P; add it to
k3-j722s-main.dtsi.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---

Prerequisite for one of the RPi-compatible MIPI-CSI camera interfaces
found on the TQ-Systems MBa67xx baseboard for the TQMa67xx SoM (will be
submitted separately once the other prerequisites for the board have
been accepted).

 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi      |  1 +
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index be7e533e6c38a..aad2169bff75c 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -154,6 +154,19 @@ usb1: usb@31200000 {
 		};
 	};
 
+	main_i2c4: i2c@fe80000 {
+		compatible = "ti,am64-i2c", "ti,omap4-i2c";
+		reg = <0x00 0x0fe80000 0x00 0x100>;
+		interrupt-parent = <&main_gpio_intr>;
+		interrupts = <178>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&k3_pds 257 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 257 2>;
+		clock-names = "fck";
+		status = "disabled";
+	};
+
 	ti_csi2rx1: ticsi2rx@30122000 {
 		compatible = "ti,j721e-csi2rx-shim";
 		reg = <0x00 0x30122000 0x00 0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index 059c65ece183f..1e8f9cb5558f8 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -160,6 +160,7 @@ cbass_main: bus@f0000 {
 			 <0x00 0x0fd80000 0x00 0x0fd80000 0x00 0x00080000>, /* GPU */
 			 <0x00 0x0fd20000 0x00 0x0fd20000 0x00 0x00000100>, /* JPEGENC0_CORE */
 			 <0x00 0x0fd20200 0x00 0x0fd20200 0x00 0x00000200>, /* JPEGENC0_CORE_MMU */
+			 <0x00 0x0fe80000 0x00 0x0fe80000 0x00 0x00000100>, /* I2C4 */
 			 <0x00 0x20000000 0x00 0x20000000 0x00 0x0a008000>, /* Third peripheral window */
 			 <0x00 0x30040000 0x00 0x30040000 0x00 0x00080000>, /* PRUSS-M */
 			 <0x00 0x301c0000 0x00 0x301c0000 0x00 0x00001000>, /* DPHY-TX */
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


