Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D96CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 09:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REcTvqQPt8vRsoIX4xDKJZUde89PdfL0W6zdFGCLweQ=; b=dvQOyDx3L5KZjpnwX6t3oi0iFs
	Np4ckpIVPwLS4rx69rhlrATSIRIBhpHYMUFBJr6Jdw9xqOyQIni4NO/LXGwDvr/sBMY/3ixGOxwx2
	bJ5GWoN23fGGDT4SIbuccqOyAqF2/ghp6kbZ0zz01XSYwfVQ6iIDffJfs7u+hPPoONrkO8g6gRqkv
	9qCtqwGmcpr/LVIzkFZNIt/O6ummbC5F+KfVlyPVMRnxnaAQJpxOc5Iv1krrYtcgokJb00SKZ9rt2
	/2Uy+wi2+xN5xfAZL1j48iDdqtjpFn/LXAHPFJ1+SV0yo/hPNVMEiQNXto/5fjNOinRFOtVfsVtH6
	XzPfS2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wnl-00000004qAH-2lKY;
	Tue, 30 Sep 2025 09:37:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wnd-00000004q1U-2uVu;
	Tue, 30 Sep 2025 09:37:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD26562779;
	Tue, 30 Sep 2025 09:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6363EC19422;
	Tue, 30 Sep 2025 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759225052;
	bh=usjXaJmrQBaOByOo0f9SIIGQaMPOLSk+orCRo+WCesE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pnLj+8csA698jLcbD0B62hmLfVWZ4vv3brRxWO4isPsHPWOcZ2AWBUlo3EhMxxOZ0
	 Ex3/ZulkIXvT6lvqK2xyE2xAhkysfhbM18VXzg4YpRPISpTYk9dMA53pZyZTB4Ncx4
	 5pNu/028/eLOz9blzV1xcdsVEzvr8FH3/vAIWKtGJ6DUvhunwVh6WLDUKWttiu43Vc
	 IJwXqAKFm1rUoC0I5NZH9e16Bhu34+YdejLGeVgkXOSC7EAPo+drnfM1T+ZttWu+Cq
	 dHdm1POQjPMHjJ7JS0cqAVMQLNp7A2qfhIBrXWVs3FoPpyqi7pnRuhDSTpSwvZ8RMk
	 y2pP3hh3yPilw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E52CCA471;
	Tue, 30 Sep 2025 09:37:32 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 30 Sep 2025 17:37:30 +0800
Subject: [PATCH 17/19] arm64: dts: amlogic: A5: Add scmi-clk node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-a4_a5_add_clock_driver-v1-17-a9acf7951589@amlogic.com>
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
In-Reply-To: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759225047; l=1185;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=ZspyBFWCUNiYBTdpBZ0EtAZp2GBczlcrxn+GjTrWL+k=;
 b=rG9NwK2T9qExtErn9VwTiBIYDzzQzUyyccAHrFcR2+2hwFvuiVrDYBIPujs3LrMfmhVAgVpdO
 9UaELmKxZU+BaxZOjeihIsDoZmQ6xX37P+MfarjJmq/cEuk+PFVP0LU
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add scmi-clk device node information for the Amlogic A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index b1da8cbaa25a..3b0e70211268 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -48,6 +48,35 @@ pwrc: power-controller {
 			#power-domain-cells = <1>;
 		};
 	};
+
+	sram0: sram@f702a000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0xf702a000 0x0 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x0 0xf702a000 0x100>;
+
+		scmi_buf0: scmi-sram-section@0 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x100>;
+		};
+	};
+
+	firmware {
+		scmi {
+			compatible = "arm,scmi-smc";
+			arm,smc-id = <0x820000C1>;
+			shmem = <&scmi_buf0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+		};
+	};
+
 };
 
 &apb {

-- 
2.42.0



