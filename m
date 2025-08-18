Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7419CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 23:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4jPEbs/Dkx4mCoGvrHrlOgkDFu9dYBlYPYjZABcXJU=; b=EQLVtI+Ck/68PvVLeGlgjXl8Sy
	sAZXHN8Jl+W9m8uu28B6tBQTCRuHSvVz7YH+pdNZWlLXjhWVTEHyvL+AVTdpJA/Ox2g++YCddOHoj
	UqeiyNCH6mOIxi77DOI83TC9/WG5NDb011AYcmBUZcwVoRuAanlHQDoUs9hao1N4QU43+ezwCWVFx
	k8/yi8l284LO43QdEGNz/5cHcwQWEk0Ba02Obt95W/iAlGPFOSMWB9EC+Z9WcYrKyu4+gQ0AIbiro
	nN1Q0Z+pMfvulBrA5aaGbBPgBZQrc9BsoC23mhwYLgaANgw7Cxt8oxu103TZYUOAS22P5390Ud584
	XrDL6pLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo9Dt-00000008uQm-0cMf;
	Mon, 18 Aug 2025 23:25:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo93i-00000008tSN-2iHy;
	Mon, 18 Aug 2025 23:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 082E74608A;
	Mon, 18 Aug 2025 23:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEBACC4AF19;
	Mon, 18 Aug 2025 23:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755558873;
	bh=6N/4T5zMknKadHJccmk9Zy/KfZIVY8DWPUQJ3bADBcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ykykut11hCYLxcecCjSEgjYfV0bzMlPINgiCfSL6b6R4UafIDKiSza6LdgT/qxnwZ
	 6dH0avBo2+co+cw6pCg9EC7k30G19INd9oLljqT3VLgDSU6wwS4LyYu+tIn5jI7116
	 YQ3/2ln5xhS9LY2wqqEuQhRzkOGhBhproRRuKZOokg58Ym+gMaGCiFZsvDy8kaR5fq
	 PGLZ15RFjYCIUvhys/DT/fjxBCm4Y8wx+zeTuSBlZQ4aJ+OSskrb8eMzSKPh8lmcgQ
	 TUqrb/Z6q/K6R7vN603wtYYfjB6PILjkdrCsqhaURofh9oryRANwTK5gudkRNW7m0l
	 iZbNCAOm0dncw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71D0CA0EE4;
	Mon, 18 Aug 2025 23:14:33 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 19 Aug 2025 01:00:41 +0200
Subject: [PATCH v2 7/7] arm64: dts: rockchip: add mipi csi-2 dphy nodes to
 rk3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v2-7-7a94f079b712@collabora.com>
References: <20250616-rk3588-csi-dphy-v2-0-7a94f079b712@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v2-0-7a94f079b712@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755558041; l=1931;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=6HJuYpXttybyTSrCNqhc1jbMr3cQPoLfqzHZNqsOuiw=;
 b=dThNvGwBMkmXKG+AhU7ciXQUVnux6gzGpI59Dpjh9kbcJ23Uwp6Ns9rovVkFIyVg0Wg+AHiVa
 N4K8WTKXYigDlb4fcIfOsq0rVvxWv5H0RKfv/AvzcRYzo7LShqpnc+N
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_161434_736147_78B2B081 
X-CRM114-Status: UNSURE (   9.10  )
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
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 70f03e68ba55..eedf93247e9c 100644
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
@@ -3052,6 +3062,29 @@ mipidcphy1: phy@fedb0000 {
 			 <&cru SRST_S_MIPI_DCPHY1>;
 		reset-names = "m_phy", "apb", "grf", "s_phy";
 		#phy-cells = <1>;
+	};
+
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
 		status = "disabled";
 	};
 

-- 
2.39.5



