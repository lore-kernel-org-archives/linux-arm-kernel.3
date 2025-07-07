Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBDEC71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5JocKyr7mQoWxvg7c49KOKaCeM0cjCCuF/Xw82PoCQ=; b=YLiazmCwmWf+yqL5Z17adDxJ+l
	s0Wl+U/Vo0cS0VLBFHVBe0ECK1UAYYt0Gdm1ToqoxCVxBhamLuBbgd9HcjsAe9yWDCm25IgkMnM+R
	I5oSrabtv1G1sDztmKJiUwcDItdpKwCZu9kNXikcfz28Z+7VjgLMdWTb7tkKF/MBtiMtEDOixhOao
	fwdxNSZLo0mwmEE+pGQCPXWfDWDf9uzCtIJQw6nqH6ax/bm2O5KgW/Qs52BBXzhk3Mk6huZ/fVBGp
	w7iPjTQL5F9PeTQ/uTLxmb10xxln+mhA9Kt7n/DQ7ft7XZAzD/lIzjl4otg5pUbUPAWvGJDxkoPvf
	8pulwtPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqAL-00000003Ewj-1o2b;
	Mon, 07 Jul 2025 18:02:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp8k-000000035hd-1K6z;
	Mon, 07 Jul 2025 16:56:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=/5JocKyr7mQoWxvg7c49KOKaCeM0cjCCuF/Xw82PoCQ=; b=MFziBjin8bd3qnt4c18F6nXcA0
	7oyZ9OaMi3u9igX/SPXhSqHsh5Pv7CK9XleY7EYD5zoi71rLQEQWCiJ5wbssnRR2UVJ5e8N+JAAE2
	dW61LUsQa1EsYCJPTKkTUql87Uz8GPPamGDdogW6fMvs6TdRZ/4e5Aes0YtBFn2TO/1nhFrwIjko2
	uD+lF8TrwhNl42OopT3F2gIoKXtpuuFCE2I2YZq7BPomSIbBgt/4ijI7eAmUuhJ68axs0///sGB5W
	M9eQQ9fLK9k62XDBaUqrfPquKhFrHAGYt3pskwj3s4eAmyRwPGo2oKkD8vsHb5H106kuhIim5oh4K
	4EkWVYlg==;
Received: from i53875bf5.versanet.de ([83.135.91.245] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uYp1w-0004yl-55; Mon, 07 Jul 2025 18:49:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	andyshrk@163.com,
	nicolas.frattaroli@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 10/13] arm64: dts: rockchip: add mipi-dcphy to rk3576
Date: Mon,  7 Jul 2025 18:49:03 +0200
Message-ID: <20250707164906.1445288-11-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_095626_345401_D1A6703A 
X-CRM114-Status: GOOD (  12.39  )
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

Add the MIPI-DC-phy node to the RK3576, that will be used by the one
DSI2 controller and hopefully in some future also for camera input.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 8b2161b83059..87d518422a60 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -822,6 +822,12 @@ hdptxphy_grf: syscon@26032000 {
 			reg = <0x0 0x26032000 0x0 0x100>;
 		};
 
+		mipidcphy_grf: syscon@26034000 {
+			compatible = "rockchip,rk3576-dcphy-grf", "syscon";
+			reg = <0x0 0x26034000 0x0 0x2000>;
+			clocks = <&cru PCLK_PMUPHY_ROOT>;
+		};
+
 		vo1_grf: syscon@26036000 {
 			compatible = "rockchip,rk3576-vo1-grf", "syscon";
 			reg = <0x0 0x26036000 0x0 0x100>;
@@ -2538,6 +2544,22 @@ uart11: serial@2afd0000 {
 			status = "disabled";
 		};
 
+		mipidcphy: phy@2b020000 {
+			compatible = "rockchip,rk3576-mipi-dcphy";
+			reg = <0x0 0x2b020000 0x0 0x10000>;
+			clocks = <&cru PCLK_MIPI_DCPHY>,
+				 <&cru CLK_PHY_REF_SRC>;
+			clock-names = "pclk", "ref";
+			resets = <&cru SRST_M_MIPI_DCPHY>,
+				 <&cru SRST_P_MIPI_DCPHY>,
+				 <&cru SRST_P_DCPHY_GRF>,
+				 <&cru SRST_S_MIPI_DCPHY>;
+			reset-names = "m_phy", "apb", "grf", "s_phy";
+			rockchip,grf = <&mipidcphy_grf>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		combphy0_ps: phy@2b050000 {
 			compatible = "rockchip,rk3576-naneng-combphy";
 			reg = <0x0 0x2b050000 0x0 0x100>;
-- 
2.47.2


