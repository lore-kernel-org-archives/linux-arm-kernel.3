Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0970CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0N0BBvuo9ePWk6ya2lxmME68+ADxan6K3KwijThJf8=; b=jdhHDpSbqENdL1bbRWzdHKONjV
	NedB6wgT57SCbUgc3z/fTixDct3CzNcOb3kYBfCQPqVOW0xgbngHnKaxJlXWE3+FMCKizYREqEAhW
	2Pa/8gby18EB2uClfxweCclaEkwb4/1PxYF06GGfgadej8T+glxR5pWk2Vzt1B82tvE0BgXJuZODu
	7aIY4PQ7/ivGGUV04mrycgtACmYSsg9f6XyVdDp7qkhbmk7WYYrZmzkoet3qikjmfn2ocFTYYBUMV
	AdiEk/TLqbNUG4RaqA+TVqL2iVxofDcwG9exWvNw3wanO3a8mAZzujGwyWENYK1iZudQJyGIDe5rV
	tbElIVoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utusB-00000007eAV-453F;
	Wed, 03 Sep 2025 21:18:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utr8c-00000007AfY-3BMj;
	Wed, 03 Sep 2025 17:19:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EAE5344C4A;
	Wed,  3 Sep 2025 17:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAA4AC16AAE;
	Wed,  3 Sep 2025 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756919953;
	bh=f7pzs19WsSpPk7IiGwL4pkOX5YtpLd+7ruT/bjmFUoI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nXQdb4f8dPzmftqDcYw0+e4hSLMrxXdatiKT+z/a1AG/rt6LSGP3rEvrr6dg0Hy8S
	 4yt7G049FnK77P/8QPNBduEPwgntEzuSV6F/x3gvNAXwFnwdb8m0dwwXm/B0ZDFIF8
	 3quOYij2GwhFNBx3a6qn8uaSfYv/zk+638aPPp4CaoaLBYnbfmd1UWoc1lnP5h3FBj
	 An8QutbE7BMGbBu6hZy2CxsKcLpLtMCJzBa2B78I6hNmhcbjROducnMIO8kFGgMQfw
	 Z4gL4uxXbjsZCEMs5hqepw3DkKWX9qcqgr76ALhJp/Pxmcv74kwF5qlShTM1ppET+R
	 nH8R2dULw9TRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A151BCA1015;
	Wed,  3 Sep 2025 17:19:13 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 03 Sep 2025 19:04:55 +0200
Subject: [PATCH v4 7/7] arm64: dts: rockchip: add mipi csi-2 dphy nodes to
 rk3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v4-7-a4f340a7f0cf@collabora.com>
References: <20250616-rk3588-csi-dphy-v4-0-a4f340a7f0cf@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v4-0-a4f340a7f0cf@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Diederik de Haas <didi.debian@cknow.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756919100; l=1971;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=EOeNg7P2XmUPLOzLBrcxGPzX6tkgiFkIQtNnjJusr/w=;
 b=Tmen4hPVQ8EHstuJqdsTDkixieFXQyEUDYNYXsTEOdpGe3owz93Y94SPBObYOtj3lz5pZzdyz
 CzI7aEQr8tRA+RdzaY+Qv2gxoD0LCowf7kQjFilyAkgjgwTOh/YamsN
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_101914_884994_B8BB7B2D 
X-CRM114-Status: UNSURE (   9.48  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip RK3588 features two MIPI CSI-2 DPHYs. Add the device
tree nodes for them.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 34 +++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 70f03e68ba55..72a0022d1b74 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -621,6 +621,16 @@ php_grf: syscon@fd5b0000 {
 		reg = <0x0 0xfd5b0000 0x0 0x1000>;
 	};
 
+	csidphy0_grf: syscon@fd5b4000 {
+		compatible = "rockchip,rk3588-csidphy-grf", "syscon";
+		reg = <0x0 0xfd5b4000 0x0 0x1000>;
+	};
+
+	csidphy1_grf: syscon@fd5b5000 {
+		compatible = "rockchip,rk3588-csidphy-grf", "syscon";
+		reg = <0x0 0xfd5b5000 0x0 0x1000>;
+	};
+
 	pipe_phy0_grf: syscon@fd5bc000 {
 		compatible = "rockchip,rk3588-pipe-phy-grf", "syscon";
 		reg = <0x0 0xfd5bc000 0x0 0x100>;
@@ -3055,6 +3065,30 @@ mipidcphy1: phy@fedb0000 {
 		status = "disabled";
 	};
 
+	csi_dphy0: phy@fedc0000 {
+		compatible = "rockchip,rk3588-csi-dphy";
+		reg = <0x0 0xfedc0000 0x0 0x8000>;
+		clocks = <&cru PCLK_CSIPHY0>;
+		clock-names = "pclk";
+		#phy-cells = <0>;
+		resets = <&cru SRST_P_CSIPHY0>, <&cru SRST_CSIPHY0>;
+		reset-names = "apb", "phy";
+		rockchip,grf = <&csidphy0_grf>;
+		status = "disabled";
+	};
+
+	csi_dphy1: phy@fedc8000 {
+		compatible = "rockchip,rk3588-csi-dphy";
+		reg = <0x0 0xfedc8000 0x0 0x8000>;
+		clocks = <&cru PCLK_CSIPHY1>;
+		clock-names = "pclk";
+		#phy-cells = <0>;
+		resets = <&cru SRST_P_CSIPHY1>, <&cru SRST_CSIPHY1>;
+		reset-names = "apb", "phy";
+		rockchip,grf = <&csidphy1_grf>;
+		status = "disabled";
+	};
+
 	combphy0_ps: phy@fee00000 {
 		compatible = "rockchip,rk3588-naneng-combphy";
 		reg = <0x0 0xfee00000 0x0 0x100>;

-- 
2.39.5



