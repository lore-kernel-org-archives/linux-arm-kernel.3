Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8E6ECD9A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRPya6AIFwDaMGiHsseB8k3Ge2ToLgr+LbHZKiorHIg=; b=E5X5/NXXHgYrnuQfsNIddonmc4
	NciG/BGZyVVi3eKBzOOcTDvxn+74dHpGNx9kYji3FQJW4vhfELnVuD7dxaWm6Y34humxPwuG/pUlW
	NVaKzkNmsOmEZNeNoTiucJdRVIxSnEUTNIQA3TAY2iUhrm8p0vBSwxkk1mkYFkwu70poXxMpYHrAx
	18zslQWnpgCWDpWTTyZ9k17KzCQ3XC5FQPL/hnWtkpi11lDjLrOiSP0BIVeP09gBVfGkywD3RnBbV
	cEXIJr1cDye39O+Q9gGbXA3mhAZfWX/dCGqqsvGMxjEMhJLVLGbAG4X41wcJXcv0LDXrBLxRj0+oG
	KZ5blRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6pk-0000000AVrI-35RH;
	Thu, 05 Feb 2026 21:24:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6pf-0000000AVno-0Ygz;
	Thu, 05 Feb 2026 21:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=WRPya6AIFwDaMGiHsseB8k3Ge2ToLgr+LbHZKiorHIg=; b=D3ZZlSqC/V8jGbUYAe/9aTMTok
	5dPOQSyFo7SoiefracTnJHYvnbe2WapAnhcNCudSRqSh9pwL4sG7jJ1WU3Nl5qy+n6SsHnzmFpXf+
	NO0+H1h7chE5OjauXcUYwK3fthUDC2DND2bCK5ujILnxZJwjp3xOUeZuV01NrKSmLCL+ynlKrrSB4
	6vPfmOUO66zijmms6b+6unOadVdSM+nHxf/fBt2xjwYvay+UF6332JC8cEsLSse1DTRhyJRKjiQQ0
	Wfjop5RafwGNimx7K31lEObm7Uu+CgYOzNdTSy/rwhzAZXsHULNELVaqlTtGrVwT/zWjxXgeJIsjb
	p2DOJsAw==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vo6pc-007GK0-Ma; Thu, 05 Feb 2026 22:24:09 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kever.yang@rock-chips.com,
	finley.xiao@rock-chips.com,
	w@1wt.eu,
	jonas@kwiboo.se
Subject: [PATCH 2/3] arm64: dts: rockchip: Enable OTP controller for RK356x
Date: Thu,  5 Feb 2026 22:23:46 +0100
Message-ID: <20260205212347.490636-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260205212347.490636-1-heiko@sntech.de>
References: <20260205212347.490636-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_132411_190979_51434CA5 
X-CRM114-Status: GOOD (  10.70  )
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

Enable the One Time Programmable Controller (OTPC) in RK356x and add
an initial nvmem fixed layout.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 8893b7b6cc9f..72c98337f359 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1104,6 +1104,52 @@ rng: rng@fe388000 {
 		status = "disabled";
 	};
 
+	otp: otp@fe38c000 {
+		compatible = "rockchip,rk3568-otp";
+		reg = <0x0 0xfe38c000 0x0 0x4000>;
+		clocks = <&cru CLK_OTPC_NS_USR>, <&cru PCLK_OTPC_NS>,
+			 <&cru PCLK_OTPPHY>, <&cru CLK_OTPC_NS_SBPI>;
+		clock-names = "otp", "apb_pclk", "phy", "sbpi";
+		resets = <&cru SRST_OTPC_NS_USR>, <&cru SRST_P_OTPC_NS>,
+			 <&cru SRST_OTPPHY>, <&cru SRST_OTPC_NS_SBPI>;
+		reset-names = "otp", "apb", "phy", "sbpi";
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			cpu_code: cpu-code@2 {
+				reg = <0x02 0x2>;
+			};
+
+			otp_cpu_version: cpu-version@8 {
+				reg = <0x08 0x1>;
+				bits = <3 3>;
+			};
+
+			otp_id: id@a {
+				reg = <0x0a 0x10>;
+			};
+
+			cpu_leakage: cpu-leakage@1a {
+				reg = <0x1a 0x1>;
+			};
+
+			log_leakage: log-leakage@1b {
+				reg = <0x1b 0x1>;
+			};
+
+			npu_leakage: npu-leakage@1c {
+				reg = <0x1c 0x1>;
+			};
+
+			gpu_leakage: gpu-leakage@1d {
+				reg = <0x1d 0x1>;
+			};
+		};
+	};
+
 	i2s0_8ch: i2s@fe400000 {
 		compatible = "rockchip,rk3568-i2s-tdm";
 		reg = <0x0 0xfe400000 0x0 0x1000>;
-- 
2.47.2


