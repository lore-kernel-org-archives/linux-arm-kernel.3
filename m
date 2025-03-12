Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3133DC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 10:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qjp9rM3rKs/6Qv8yCCbCK02pbv+0ERB6DYIOcn1yZ+g=; b=WAbIo+jYCDkLVjj9O5aj+IGdmE
	VFax6nNxOJ0Gw9eEccPkJjHySOVD4zpKwWnpHlV5CT/sIvsK36/1FHAQzfLK5JwiVmVpy1yZJhlZB
	wRSeAE6brI8qYLBnkvkrWiOkgTNAaLfsS3CjkTw6GhFjpkYL+Ja/bAw4auyzj4w32MaNpVCSCTLzO
	mT98pYkIoPE7jXL3gm527fp+QuFwV0ENJmtypzoxct12FHNu70GDUPKq0jh0pfpdJgR3Cas98AxIx
	AapvNmPf/6oParSAPJj12sgymVU+b7cla+XUnT3q7fuwtQsMRndzFPR6hjwtY1Ysrub8xpL771EoU
	+o43hJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJcw-000000089kD-126B;
	Wed, 12 Mar 2025 10:47:54 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJY1-000000088PB-48Rn;
	Wed, 12 Mar 2025 10:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=Qjp9r
	M3rKs/6Qv8yCCbCK02pbv+0ERB6DYIOcn1yZ+g=; b=EVl0hhQob5D0oBE/6q6w6
	YyTwuavGUrDXHrWJ5DDv5zMDKpxESLhLuRuhMP0tTnzVx5pwB2bnfYv0FU0dc2cu
	5yAa84LANa+KvJRbaFYOEmeL+TfMO1bbjlRTlM5/LKTIipaaSqrrXg3Fy8CMoZIa
	jvU2YGkDsshJssvMCmLH34=
Received: from ProDesk.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgAHUvcHZdFnEN_+Kg--.14177S6;
	Wed, 12 Mar 2025 18:42:25 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	lumag@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 4/7] arm64: dts: rockchip: Add DP0 for rk3588
Date: Wed, 12 Mar 2025 18:42:05 +0800
Message-ID: <20250312104214.525242-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312104214.525242-1-andyshrk@163.com>
References: <20250312104214.525242-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgAHUvcHZdFnEN_+Kg--.14177S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFyxJryUuw45Cr4rKr1fXrb_yoW8Xw45p3
	ZrCrZ3Xry8uF42q39xKr1ktrZ0yan5CFZ3Krn7Gryjkr1Sqr9FkryfKrnxA34DXr47XwsF
	vFs3try0kF4qyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URHqxUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBkOXmfRYalQgwAAsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034250_359694_475F6E46 
X-CRM114-Status: UNSURE (   8.01  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The DP0 is compliant with the DisplayPort Specification
Version 1.4, and share the USBDP combo PHY0 with USB 3.1
HOST0 controller.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 000b119d50f4..675aebe4e8ff 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1371,6 +1371,36 @@ i2s9_8ch: i2s@fddfc000 {
 		status = "disabled";
 	};
 
+	dp0: dp@fde50000 {
+		compatible = "rockchip,rk3588-dp";
+		reg = <0x0 0xfde50000 0x0 0x4000>;
+		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru PCLK_DP0>, <&cru CLK_AUX16M_0>,
+			 <&cru CLK_DP0>, <&cru MCLK_I2S4_8CH_TX>,
+			 <&cru MCLK_SPDIF2_DP0>;
+		clock-names = "apb", "aux", "hdcp", "i2s", "spdif";
+		assigned-clocks = <&cru CLK_AUX16M_0>;
+		assigned-clock-rates = <16000000>;
+		resets = <&cru SRST_DP0>;
+		phys = <&usbdp_phy0 PHY_TYPE_DP>;
+		power-domains = <&power RK3588_PD_VO0>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dp0_in: port@0 {
+				reg = <0>;
+			};
+
+			dp0_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	hdmi0: hdmi@fde80000 {
 		compatible = "rockchip,rk3588-dw-hdmi-qp";
 		reg = <0x0 0xfde80000 0x0 0x20000>;
-- 
2.34.1


