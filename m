Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1E5D148A3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 06:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDLW4VhSFFMcljmS6Qay8m+rBIpXePJpi+Rxa8moJs8=; b=0T5ilGXVCxoUeuNaRleTSMJ5+v
	nBZwImoqRSpUxZC0C7wrxn4hubzpwMVSFwlfswuifCNHHcBxInPhvJB2JebiSKrpPULpiDjnbUtyq
	lTo1f8OsMYwBOSc6ivz8MIGpA8Y/n1WDXt7IX6uZpoYXwZW15ScBDtr/6BHGFCc7KDYap2HLC0t+L
	4wB5/NaO7Jh7iu6hvvGUbb4NCnBFADJCmMFM0LUlv6CEgvk717RQLWK0TqiyAnb7GJrnukQeMD1RE
	iH8CRh+X8QSs/DFX4bdjU5kKeuoWC4/i4RnQ3UCtxfmMm3uIdmK4NbKBn4Mo4HAAIRl3FMkbMHddE
	LdsTQh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjCA-0000000Fylu-3srN;
	Thu, 08 Jan 2026 06:08:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjC7-0000000Fyi7-2D4C;
	Thu, 08 Jan 2026 06:08:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5524260053;
	Thu,  8 Jan 2026 06:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AC23C2BCB7;
	Thu,  8 Jan 2026 06:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767852506;
	bh=cqU+XTI3Ndty3aUBGJIBF2UDdBqJf3bOi+0Mrt4qwlg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qf3UFWm+OPP7X1ThL6eFqIAMA4bkHuVNH7YJR7LEuknIzvgjMdXT94TylGYPfbQlN
	 ZAMSbPuV6z87T0qzoaxO0u6gd2kFRBGagRqVN9eCAmVYqQ0Gm483xfF3p4cv7teaQn
	 12A+8LPMaQQMU2K0rgMWXAv3+uZZLXI+1PH0LwSK0C2D4sXXv4Tbj8FbJw+FF7Qqu0
	 PXY/AFLGbd9qx8DpkGhmyZeyROaSp15BDM92LKrGc1SoWyHKAI/47RebrdUfih1gTK
	 GcNlb0tY7OHQlIWTES68Sp2IcZDhIk2v9VNey9EzYLrlM4e27gnFYIBRI6XeLTxmuV
	 zPwel9a5VZLBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12222D148A6;
	Thu,  8 Jan 2026 06:08:26 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Thu, 08 Jan 2026 14:08:20 +0800
Subject: [PATCH v5 6/8] arm64: dts: amlogic: A5: Add scmi-clk node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-a5-clk-v5-6-9a69fc1ef00a@amlogic.com>
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
In-Reply-To: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767852503; l=1430;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=/Yr112v7w9bKoVucDd0LbqAxSPlWQH4QEG5NVVuwlK8=;
 b=7+nx8/5hLUldfRljyGSzDRYUkPBuZCnHtK7k2XBNgT4AsmPJ6CAa3GNHnMgptomNiApA1HBL3
 Uvu40iQZL+VDdtGG19zClmXyTjU9Slanu92YiOwf7n7ep3Clbs4sp7/
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
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index 2b12d8284594..a6625508893d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -7,6 +7,8 @@
 #include "amlogic-a5-reset.h"
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,a5-pwrc.h>
+#include <dt-bindings/clock/amlogic,a5-scmi-clkc.h>
+
 / {
 	cpus {
 		#address-cells = <2>;
@@ -49,6 +51,34 @@ pwrc: power-controller {
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
 };
 
 &apb {

-- 
2.42.0



