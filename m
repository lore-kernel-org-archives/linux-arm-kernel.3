Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55E4CD98FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 18:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DoqaLVawP8gRNWNHoPVDweofVpWaIvLGSYin3Jpa68=; b=LMHMZCG2e1pfWX6OfYOBE8uejk
	GoQmmd0HjGWp+2j+Iz9yCsdanlQh7XBs2xXI/lR2M8bFMJ0vcZQSCMj/tqQR+QI1tEM+Xim6ZK3j1
	n4McRagb3rwSYOeRBPhVbEPJ2QuHPcySsozdzJpRND6haesqEq434CaeQo0jv7IMnXp+f1jD5j3i3
	MHUekqaJA4qX6QO7iOQXzOh3SnMDoHiFDVY2mlxRqGMVPlh95f+mspTK4agParwFmBswOEcaDtvBz
	HaEWujwbHkSrlQ3R9cUJ0iFUIic2ip6wgHjC5zpV5fzNJHSyGAl2stxPAGV7td2QB5ij+z2A9u+Ml
	bUqcB8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvN2-00000000CcS-2mNe;
	Wed, 17 Jun 2026 18:52:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvMt-00000000CMO-3Vhc;
	Wed, 17 Jun 2026 18:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781722325;
	bh=+zMBc9cvNd9kN7V+U1U6o2kMwD6S1HsWu+emdfG6GtE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fTTDpCI0S6IuZnP5O7AF58qW5BWea8gyzki9trM4Qfrkonwc9O5CxyhaXb9Qb5LmD
	 mUf7OO8LU32m/fGh1A4SEZ6qJWsFhtZH+mNIW16GUmZb6el+5/rnMNULpn6ntyvThg
	 mVnp9VWDaoxq8xb7STmO4BsT9mnKXshMLeTVuTpgV2DMfaGKJSZyV3S80aMv082reb
	 kriYrGVLaI5pa0Pkd06dPy+9BJSXSpengWo/MfDySt0WkOTJdghQIIriZ8dOKiBfyI
	 6Es6Qyuuh2DJApuDjk9oqsuyMUw3SlMnlkVo+BiZpUZTScTeMu+T6vxkZtGFJLjA10
	 oaviC2DLeQI/w==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9167217E14FA;
	Wed, 17 Jun 2026 20:52:05 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 17 Jun 2026 21:52:02 +0300
Subject: [PATCH 9/9] arm64: dts: rockchip: Add RK3588 VOP2 resets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-dw-hdmi-qp-yuv-v1-9-a665cfd06d7d@collabora.com>
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
In-Reply-To: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_115208_065121_84F83796 
X-CRM114-Status: UNSURE (   7.56  )
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

Add the missing reset properties to VOP2 on RK3588.

Co-developed-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 4fb8888c281c..1404cd7ecf02 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1453,6 +1453,18 @@ vop: vop@fdd90000 {
 			      "pll_hdmiphy0";
 		iommus = <&vop_mmu>;
 		power-domains = <&power RK3588_PD_VOP>;
+		resets = <&cru SRST_A_VOP>,
+			 <&cru SRST_H_VOP>,
+			 <&cru SRST_D_VOP0>,
+			 <&cru SRST_D_VOP1>,
+			 <&cru SRST_D_VOP2>,
+			 <&cru SRST_D_VOP3>;
+		reset-names = "axi",
+			      "ahb",
+			      "dclk_vp0",
+			      "dclk_vp1",
+			      "dclk_vp2",
+			      "dclk_vp3";
 		rockchip,grf = <&sys_grf>;
 		rockchip,vop-grf = <&vop_grf>;
 		rockchip,vo1-grf = <&vo1_grf>;

-- 
2.54.0


