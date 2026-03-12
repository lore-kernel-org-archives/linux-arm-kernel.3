Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2934106ACEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 21:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ndxK5vZOqleTR6mNTO46jmD+gZjjkUpfKpUFMPP7ZI=; b=PB4k2pTIQBTCqzYkIlEr9Yxw+x
	X5tfLf599fpMKEQgLOrqFyvLmcA9bfva9opZlz/SH7pZ0FWF6zmiDtVfVaWPnN7MjIMP2B36eK+SI
	BWSVgnT8wAAJZ2vVndDNWZqeFcXG9YPYFtdE6jhEnAjuOpN25ikniucqOhGF9tWSzepHrsgB0q1r7
	bb6A5cs66oArNVOgAEKID35ZqxXTnsjp8uLgCuM31U9BfkUJaNeDPYQMsOIvTxCJo5zgzESYcNf5Y
	dS/o/24uIuCo2b6JO59He3V5p69G/9AbH/jUw7IqeNfffS+Iuyl8PMMRBzDzh6auAQQAG9ng2b1yp
	+drLGCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0nc7-0000000FTL2-3wWD;
	Thu, 12 Mar 2026 21:30:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0nc5-0000000FTJD-1Q6K;
	Thu, 12 Mar 2026 21:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=+ndxK5vZOqleTR6mNTO46jmD+gZjjkUpfKpUFMPP7ZI=; b=sde9qGNdMZMGE4/E7Q2HX8XM2w
	2kyhOVVFHPKG4nazzdezNhm3V8LllGSAw1ZVjO2mpomse8nuMH6sL4RJflp8g/luEVjJJkU0JI+hX
	N0Iln/DpezslarLqMM8ibwZHRorDgkc2e0bm1uoacYsLxENAZIbUz0U56zrXxvL9Ed4CFROOcEQGX
	4q5Noo12aZvdzpxfeLtMdbyAZNHZiSgqpfv8Xn/cKfw28X1Y6Hj8CFTsCtLHI8jgIkNKv0j/Kac4h
	mNKvO+I5ieqp/t6ZAawF1EZs7SiLN1N+G/XmEUkTpK3KyijtDrKFatbnfmGtF+8Mvm3fWwlQAc89E
	s9T1S3+A==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kever.yang@rock-chips.com,
	finley.xiao@rock-chips.com,
	w@1wt.eu,
	jonas@kwiboo.se
Subject: [PATCH v2 3/3] arm64: dts: rockchip: Enable OTP controller for RK3528
Date: Thu, 12 Mar 2026 22:30:19 +0100
Message-ID: <20260312213019.13965-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312213019.13965-1-heiko@sntech.de>
References: <20260312213019.13965-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_143037_461311_3446DDF5 
X-CRM114-Status: UNSURE (   9.70  )
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

From: Jonas Karlman <jonas@kwiboo.se>

Enable the One Time Programmable Controller (OTPC) in RK3528 and add
an initial nvmem fixed layout.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index d402f2828814..806b8109f67d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -1190,6 +1190,53 @@ sdmmc: mmc@ffc30000 {
 			status = "disabled";
 		};
 
+		otp: efuse@ffce0000 {
+			compatible = "rockchip,rk3528-otp";
+			reg = <0x0 0xffce0000 0x0 0x4000>;
+			clocks = <&cru CLK_USER_OTPC_NS>, <&cru PCLK_OTPC_NS>,
+				 <&cru CLK_SBPI_OTPC_NS>;
+			clock-names = "otp", "apb_pclk", "sbpi";
+			resets = <&cru SRST_USER_OTPC_NS>, <&cru SRST_P_OTPC_NS>,
+				 <&cru SRST_SBPI_OTPC_NS>;
+			reset-names = "otp", "apb", "sbpi";
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				cpu_code: cpu-code@2 {
+					reg = <0x02 0x2>;
+				};
+
+				otp_cpu_version: cpu-version@8 {
+					reg = <0x08 0x1>;
+					bits = <3 3>;
+				};
+
+				otp_id: id@a {
+					reg = <0x0a 0x10>;
+				};
+
+				cpu_leakage: cpu-leakage@1a {
+					reg = <0x1a 0x1>;
+				};
+
+				logic_leakage: logic-leakage@1b {
+					reg = <0x1b 0x1>;
+				};
+
+				gpu_leakage: gpu-leakage@1c {
+					reg = <0x1c 0x1>;
+				};
+
+				tsadc_trim: tsadc-trim@44 {
+					reg = <0x44 0x2>;
+					bits = <0 10>;
+				};
+			};
+		};
+
 		dmac: dma-controller@ffd60000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x0 0xffd60000 0x0 0x4000>;
-- 
2.47.3


