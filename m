Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A84CC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 13:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzpCYHMBGWPG5CoyUq/UfW7/LHtFazkA2XZqLCyJ6Fs=; b=CDwPB1gueICpURBhpYngWl4V9e
	HzF35S9vV8THzaPItES8kNN5RiSPehT3TaQZWP5S7kQPQRarqTAAhh8qJKO/nCVjvjmyfo6YK7Y5N
	yaM5nJXJxwp/zlOqCbohknMqgUMa62Q5FbF1q10iS5NyI4p8CnFZ93lCzvE4YmdPOQWuIJhUW1Tt6
	ddlnLc29rA3gUs7RNiIjvDhecMpDocXfkJQA9PB3THq2HKp15c8f/cpDEpTdsyta9Bl3GD1HByVMM
	TwEeTJSLxIcoacjDgQQgl56tE/h36VrnxlaUkmkTggPPKzPQnRevuyEXC8ZrW1kctgj1Y8pMSmInt
	AcXsM+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tclJK-00000004vQ9-1JH2;
	Tue, 28 Jan 2025 13:07:22 +0000
Received: from smtp-42a9.mail.infomaniak.ch ([84.16.66.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tclGf-00000004v3M-3yWI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 13:04:40 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Yj58x45VtzYZg;
	Tue, 28 Jan 2025 14:04:33 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Yj58w6chyzd4h;
	Tue, 28 Jan 2025 14:04:32 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 28 Jan 2025 14:04:13 +0100
Subject: [PATCH v3 1/4] arm64: dts: rockchip: add overlay test for
 Wolfvision PF5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-pre-ict-jaguar-v3-1-7be2f09d390a@cherry.de>
References: <20250128-pre-ict-jaguar-v3-0-7be2f09d390a@cherry.de>
In-Reply-To: <20250128-pre-ict-jaguar-v3-0-7be2f09d390a@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, 
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_050438_128634_2BFB06A2 
X-CRM114-Status: GOOD (  10.03  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The Wolfvision PF5 can have a PF5 Visualizer display and IO Expander
board connected to it. Therefore, let's generate an overlay test so the
application of the two overlays are validated against the base DTB.

Suggested-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index def1222c1907eb16b23cff6d540174a4e897abc9..bba9b2f1c761040545bea561878e9b63f8c29488 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -128,8 +128,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-roc-pc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3a.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5.dtb
-dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
-dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
@@ -170,3 +168,18 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5a.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
+
+# Overlays
+## To build one or more overlays, overlay application tests must be added below.
+##
+## dtb-$(CONFIG_ARCH_ROCKCHIP) += <name of overlay application test>.dtb
+## <name of overlay application test>-dtbs := <base>.dtb <overlay-1>.dtbo [<overlay-2>.dtbo ...]
+##
+## This will generate each individual DTBO listed as a dependency of
+## <name of overlay application test>.dtb **AND** make <base>.dtb keep its
+## symbols (like when DTC_FLAGS has -@ passed).
+
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
+rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
+	rk3568-wolfvision-pf5-display-vz.dtbo \
+	rk3568-wolfvision-pf5-io-expander.dtbo

-- 
2.48.1


