Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F0EC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 01:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVZ2GnN/QVVpAxEkpNiaalagYLj2uX/1bMTExIzVImM=; b=OUPPHgMgV6Hf+b324ldSYGeXYV
	DzIDFHfDAsHrFQFQx/1RbJdbGVIQanlofLKmU589hArk4AijkLxWLjNC+7vsCwGJpEcpDNaEyUJA7
	ippPm/Cnj9lKPGSPsbj8yd1Gn+XmxgcR/ytYAm3GzA3q+zYKfkLqtdm3hpl/dYqLGusP8FgjMzxCa
	uS5ylYrfC4+aX081Abzxh77M2mSH3MNfKeBCmn69+P5sQC3FhMLUvkmUvz4dEPDvNQtHAXpWx+hEH
	6WqohLdNQb6nhGgNVqAX/TVhGIL9EosxrgSfNuIZsYcMVqtUE9zuUHE3NQ2ipHHIacMirscWjk+3c
	FJx4MIWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6Xf-0000000GgBZ-0DL1;
	Sat, 15 Feb 2025 01:00:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6TO-0000000Gf2T-0JBr;
	Sat, 15 Feb 2025 00:55:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739580956;
	bh=MLcedUWBkgkxVWzbTDCOp0QOw7S68POvgln+Xwcmv1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DXg2dQg3MG/904U+ETV8QkQ6q5k5cPYok47HVEkyQkeKso7F7pLb3cCAQ2klpxkG/
	 daW5nCLdXVmjqD1om9qxWTPcwhzJsRjHvHeruTji6ExRJcjlmUTfnKjjz8/4RrdjG4
	 7l3qXsctRvkD/hNMihjXYCE7pu6LeNXuSoHJPSHNl8iT/5zeVz+N2qNGVDgmioRhMC
	 Qo5XpGoQKsjPGRhPbDNCcndIn8V1c97bgc8nTfcQM331pg+DxZ0VqboiiKcF31Kf+/
	 vUmRzlbNzcxfmacJ8LENhyOM+ynNHrxmAS6iBfbp8AomyYo0o6dKgozVbM0HZptpHN
	 MMzty5Y97z8Iw==
Received: from localhost (144.232.221.87.dynamic.jazztel.es [87.221.232.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 2D35017E0FBA;
	Sat, 15 Feb 2025 01:55:56 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 15 Feb 2025 02:55:38 +0200
Subject: [PATCH 2/4] arm64: dts: rockchip: Enable HDMI1 PHY clk provider on
 RK3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-vop2-hdmi1-disp-modes-v1-2-81962a7151d6@collabora.com>
References: <20250215-vop2-hdmi1-disp-modes-v1-0-81962a7151d6@collabora.com>
In-Reply-To: <20250215-vop2-hdmi1-disp-modes-v1-0-81962a7151d6@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_165558_297299_7DA80B6B 
X-CRM114-Status: UNSURE (   8.87  )
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

Since commit c4b09c562086 ("phy: phy-rockchip-samsung-hdptx: Add clock
provider support"), the HDMI PHY PLL can be used as an alternative and
more accurate pixel clock source for VOP2 to improve display modes
handling on RK3588 SoC.

Add the missing #clock-cells property to allow using the clock provider
functionality of HDMI1 PHY.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index 9bc5287bb6469138c2d9e2fcfec7984c830c2ce5..97e55990e0524ed447d182cef416190822bf67be 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -479,6 +479,7 @@ hdptxphy1: phy@fed70000 {
 		reg = <0x0 0xfed70000 0x0 0x2000>;
 		clocks = <&cru CLK_USB2PHY_HDPTXRXPHY_REF>, <&cru PCLK_HDPTX1>;
 		clock-names = "ref", "apb";
+		#clock-cells = <0>;
 		#phy-cells = <0>;
 		resets = <&cru SRST_HDPTX1>, <&cru SRST_P_HDPTX1>,
 			 <&cru SRST_HDPTX1_INIT>, <&cru SRST_HDPTX1_CMN>,

-- 
2.48.1


