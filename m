Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4738F106ACEE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 21:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnKpV5HENvc+AyhAXA4SEjE+pZWBIukJfE82CHrZr5s=; b=H7JZRzpbe2gnNQmynk6XEGALyZ
	oG457T+5RylvO8iX/SWgdUFaGTP3FKn05n70xQMDjZiCHTdZnlB8zURI3Q6xcHCPk7JYHTPSN7Oi7
	AOFD9mH2+9pEgzk9uQjtv8H9FLORZo/1PjKPN1nYy+z3Jh8hT0e/6R1LchntKUpVyMF8ULFtEjGxw
	04nDI0HZEdqrG5Dlko+NM51cfEMV8zycZ5uk/X5JW2ZSKBeOMBqik/gKSIhXLTbvpwY0hAsHECUx/
	tiq6S3/2OeSvBlbjzL6OIXTSuAa1s5PC12rvpxx7XFjPQqOeDsOZP0STxp4OssU2n+3oE9rygZj8J
	tk0jcK8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0nc8-0000000FTLA-0vEz;
	Thu, 12 Mar 2026 21:30:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0nc5-0000000FTJB-1O6T;
	Thu, 12 Mar 2026 21:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=QnKpV5HENvc+AyhAXA4SEjE+pZWBIukJfE82CHrZr5s=; b=RM48uL0K3EVMGFP7B4DRRJC9HE
	9AWaD579Z2W9zuoObuxZKNstwbMefGdhXyi859koYAfuujkERVOq6EPjC0nOEdm/uNO9SXUXS7cCH
	NT9cknZSROgcKopcx/oPc+9EdiapZ/6nxY8f5p07KIMhMe2FHm/tfC1+zFqZXKShHbgNYS3EIwQji
	laVXQUZlqfz+SpEngD0GRc9bjLMKIfzgDD2kgpQe6c7WmY4dDBTfeWbC2+hlcDBxujKU5/18xj0JY
	HY5WWJIYcd89X69X++1Tor96Gp8NCJ8hoCVA4fj48o2lSb1XPM72UZNeVPE2oeRAjNdw3ef4PiVn1
	3yIi+Vfw==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kever.yang@rock-chips.com,
	finley.xiao@rock-chips.com,
	w@1wt.eu,
	jonas@kwiboo.se
Subject: [PATCH v2 2/3] arm64: dts: rockchip: Enable OTP controller for RK356x
Date: Thu, 12 Mar 2026 22:30:18 +0100
Message-ID: <20260312213019.13965-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312213019.13965-1-heiko@sntech.de>
References: <20260312213019.13965-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_143037_460761_3E733E0A 
X-CRM114-Status: UNSURE (   9.34  )
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

Enable the One Time Programmable Controller (OTPC) in RK356x and add
an initial nvmem fixed layout.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 68b48606f601..c8321af7de7d 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1123,6 +1123,52 @@ rng: rng@fe388000 {
 		status = "disabled";
 	};
 
+	otp: efuse@fe38c000 {
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
2.47.3


