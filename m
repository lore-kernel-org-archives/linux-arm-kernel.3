Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FBBE7C6FC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 08:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzwM2ArMD64npYqUjIHiP47mOx5vlp8sCjNTdzEO+7c=; b=lEK4fQFv1eUENVVAcYdl7xIzMY
	6qQ+70HUfdT8u5xFPpDMalE/0EF33Ng4cQEXhJimqzJBWEaotqchh6baQWROxRFxOcdeYrJ51+kKx
	h324ON6lNBv2z54UJNx4wWOnmCvFofHwnMe/GEj+PGl/BqCsBL8nRrC91/DVKTVJxanXq668BhpWg
	po8vf/DtoRVIWjaE79TqRk4YKVoxJWkX97e0DTGxwlJlHfhUrlWEQqSzAn1SMz+l1T4u6k4VNJa0f
	HRNQwkdnnxJmlUOhbFhNuxmT5YgW0gHUYDpl5dt+aC2Pst3ZJuFbuhdwQepvi23GPoJ6dVGeFfkN2
	eCfshY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmScC-00000003Luh-38tl;
	Sun, 01 Feb 2026 08:15:28 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmScA-00000003Lrd-0PUA;
	Sun, 01 Feb 2026 08:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Wz
	wM2ArMD64npYqUjIHiP47mOx5vlp8sCjNTdzEO+7c=; b=YowDe72VbC0QRdtzls
	NIU16lU7EazsP1tVL4QdW3Ytf0V+Dq6+cqV/FrxewBw7Rv8ux4ZQ8TYm4OjZjfUV
	NyGRBELUKQG/qmMV86G7mlFdX6i9HmvOfO/6AUhFrAGfLt6kZgwL1LLLrm4/hUiA
	KDGngVpxpewz4f1yABpFnFyrQ=
Received: from ProDesk-480.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3Hz40C39pmxGTKQ--.55310S7;
	Sun, 01 Feb 2026 16:13:53 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: alchark@gmail.com,
	andrzej.hajda@intel.com,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	airlied@gmail.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	nicolas.frattaroli@collabora.com,
	robh@kernel.org,
	rfoss@kernel.org,
	hjc@rock-chips.com,
	sebastian.reichel@collabora.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 5/5] arm64: dts: rockchip: Add DisplayPort dt node for rk3576
Date: Sun,  1 Feb 2026 16:13:31 +0800
Message-ID: <20260201081338.407999-6-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260201081338.407999-1-andyshrk@163.com>
References: <20260201081338.407999-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3Hz40C39pmxGTKQ--.55310S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4fZFWkAryfAryDZFW5Jrb_yoW8Wr13p3
	ZrC395X3y8Wr12qwnxt34vvrZ5Jan5JFs0kr17JFyUtr4Sqry7Kr13Krn3A34DJr47Z3ya
	vFsavry7KFs0y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jqa0PUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxQENa2l-C0HQSgAA3k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_001526_504695_BEC9F332 
X-CRM114-Status: UNSURE (   8.30  )
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

The DisplayPort on rk3576 is compliant with DisplayPort Specification
Version 1.4 with MST support, and share the USBDP combo PHY with USB 3.1
OTG0 controller.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---

(no changes since v1)

 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index a86fc6b4e8c4..a153c3976cb3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1446,6 +1446,34 @@ hdmi_out: port@1 {
 			};
 		};
 
+		dp: dp@27e40000 {
+			compatible = "rockchip,rk3576-dp";
+			reg = <0x0 0x27e40000 0x0 0x30000>;
+			interrupts = <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>;
+			assigned-clocks = <&cru CLK_AUX16MHZ_0>;
+			assigned-clock-rates = <16000000>;
+			clocks = <&cru PCLK_DP0>, <&cru CLK_AUX16MHZ_0>,
+				 <&cru ACLK_DP0>;
+			clock-names = "apb", "aux", "hdcp";
+			resets = <&cru SRST_DP0>;
+			phys = <&usbdp_phy PHY_TYPE_DP>;
+			power-domains = <&power RK3576_PD_VO1>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dp0_in: port@0 {
+					reg = <0>;
+				};
+
+				dp0_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		sai7: sai@27ed0000 {
 			compatible = "rockchip,rk3576-sai";
 			reg = <0x0 0x27ed0000 0x0 0x1000>;
-- 
2.43.0


