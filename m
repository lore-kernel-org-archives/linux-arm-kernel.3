Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D97CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 09:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGC99cUllWULH7plsw7d/pU+etreDNb5nBX+EUEAGV8=; b=yo18wbi79S8V2TuCNbPUuRZb18
	kNPuBLeyjlGQg5yET0Mvjzw/MxdRxenTayp7qcmKlWWSYhY6Tc9ucPy7nuJXDdqiMxmxjTfjUrNFP
	qi1tTrZ/XHeDeT7h1I9G8wSdmbBwaKcvx3oj4ORR7SUxwGVys3OEXAMboVbwYnNXR2GmWz+thm/DF
	q5Ou0ZDfd71SeycxuiIddRiOoVpKrFkGQbeKQtIdQ60eHjWJZ0lZyEyC5RjMVXSqgU3p2YNK4GZTW
	LL27dRIuzIL0mFP0nsRCs9e3cAdCE5zWf1o+q24HWe7oHQB4tEopoMYRhm9p3nKXDIpYIrSBkPtzv
	bDuycbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WoN-00000004qbe-03qU;
	Tue, 30 Sep 2025 09:38:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wne-00000004q2N-17C5;
	Tue, 30 Sep 2025 09:37:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00AC844595;
	Tue, 30 Sep 2025 09:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3BA9C116C6;
	Tue, 30 Sep 2025 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759225051;
	bh=m3tcUPTeAy9N3b8of7vcp0PLY10EBp4gFZGLnaPlv6M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OPEjn6X1XzS8pl7W7CUbHiZrYdFOCC4R6XhFwkqMewH7hocoFtKiH1NZSQqv6NFdO
	 tt/Ixu07a+VxwGCZgRh7aDxrYjZT5iHbxRK4mP40EN1lEru7Hm99LhlniHBMwB/J5I
	 ehEOxkXCJHGE4jBGjXiHiFxUJ8VWi1vqcnAc9hoX4C5JifJNZZtX3F1O3kWmeSC966
	 lBhKnxm/eA0QgIiy/QtdLJucUT7WekNPfRSeEdJ5CdL6Fg+ZLxwT2qL4mqEfKuzrxC
	 FAUyGaOIog3Q6fWWmVnqg3RWWt6IkyuaSBEc6sgmPru9L0huhJMq+um6DbKoQeLYXF
	 1iSuKkyW2PwNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74A6CCA470;
	Tue, 30 Sep 2025 09:37:31 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 30 Sep 2025 17:37:22 +0800
Subject: [PATCH 09/19] arm64: dts: amlogic: A4: Add scmi-clk node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-a4_a5_add_clock_driver-v1-9-a9acf7951589@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759225047; l=1181;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=+Iyb8ucZxc+f5S3pcp3snpI9+yN2dfYAfr8oIOUIHcQ=;
 b=lcBDqboM/iymoRmBzRwcVori330OjmwhgepC7924uxxFr8NPhQ3vWlz/SUAhF46VD/1UJca2J
 X4tLUGHjoR8B5T7MHj0vHgNS+dSMKktQ8J6H0QpvswRFRb53ARknA05
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_023734_344070_10659A91 
X-CRM114-Status: UNSURE (   8.33  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add scmi-clk device node information for the Amlogic A4 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index 563bc2e662fa..75a87f093d8d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -49,6 +49,34 @@ pwrc: power-controller {
 			#power-domain-cells = <1>;
 		};
 	};
+
+	sram0: sram@f7033000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0xf7033000 0x0 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x0 0xf7033000 0x100>;
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
 };
 
 &apb {

-- 
2.42.0



