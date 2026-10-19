Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9BBCCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0DlQ/xf40TjrEq/cqhW2BlOW/2RL9CDbLOchel23Qo=; b=HDLR7PQ+15D3JoFGDOL/AlHmBc
	zVAnqBizqSHuFllg2YZSZ+zL2uFvKcF2J4J4imKnH0OxkvFCiWQeIJH9+kBVzXKoWdj3I5m1tljgR
	fi+RaoYcyBJLyLfsGV/2+uhm+FBAev4sFvGgBlUlmIynypJlfy50WfmPp88u8NCUnJFeox6P/oraf
	8WhCX3bNXA3idrGb2CHtSPSgXKkiTGxZWsWjc5UArTxMr40USvYOJKjSpBn8CjZ1mwoPvostSAT0s
	Cy8Hlw11J4tNs2WrjRt2RDRkCbVPKl4cmdK/1jCkpWzD0RmLgVTTKmZFhpS8eFYUc/38EfUXW4+NF
	jmuwZqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkcA-00000007Bxb-1YKO;
	Mon, 19 Oct 2026 10:29:10 +0000
Received: from mail-m205210164252.xmail.ntesmail.com ([205.210.164.252])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkbv-00000007BeI-0IMz;
	Mon, 19 Oct 2026 10:28:56 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 518d3ddb4;
	Mon, 19 Oct 2026 18:28:49 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 6/6] arm64: dts: rockchip: rk356x: Add eDP controller and phy nodes
Date: Mon, 19 Oct 2026 18:28:24 +0800
Message-Id: <20261019102824.3157044-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019102824.3157044-1-damon.ding@rock-chips.com>
References: <20261019102824.3157044-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa153b4f0f103a8kunme348c01b2f6c59
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGUpJVklLSkNKH0odTkMeS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Knnwf9OeJchsgWsBAold0rtvUsMcikqn3N7Tstzi0RF78LiKL+0hcUNzU3r66POuNBTKSc6aCQNh5ya64BLf4RfzI5tvu6iSx2UT0321l0g6IsDWW0wOw/4aIZw7VUk0LsLvVA+lqVUHpHaB+uYvsxtVEdloGDUjX85pRvm1NSs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=u0DlQ/xf40TjrEq/cqhW2BlOW/2RL9CDbLOchel23Qo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_032855_475281_6EDD6292 
X-CRM114-Status: UNSURE (   7.77  )
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

Add the eDP PHY GRF (with the eDP PHY child node) and the eDP
controller nodes for the RK3568/RK3566 SoCs.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd39..3b60e4355ad8 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -403,6 +403,20 @@ usb2phy1_grf: syscon@fdca8000 {
 		reg = <0x0 0xfdca8000 0x0 0x8000>;
 	};
 
+	edp_phy_grf: syscon@fdcb0000 {
+		compatible = "rockchip,rk3568-edp-phy-grf", "syscon", "simple-mfd";
+		reg = <0x0 0xfdcb0000 0x0 0x100>;
+		clocks = <&cru PCLK_EDPPHY_GRF>;
+
+		edp_phy: edp-phy {
+			compatible = "rockchip,rk3568-edp-phy";
+			clocks = <&pmucru XIN_OSC0_EDPPHY_G>;
+			clock-names = "refclk";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+	};
+
 	pmucru: clock-controller@fdd00000 {
 		compatible = "rockchip,rk3568-pmucru";
 		reg = <0x0 0xfdd00000 0x0 0x1000>;
@@ -879,6 +893,33 @@ hdmi_out: port@1 {
 		};
 	};
 
+	edp: edp@fe0c0000 {
+		compatible = "rockchip,rk3568-edp";
+		reg = <0x0 0xfe0c0000 0x0 0x10000>;
+		clocks = <&pmucru XIN_OSC0_EDPPHY_G>, <&cru PCLK_EDP_CTRL>, <&cru HCLK_VO>;
+		clock-names = "dp", "pclk", "hclk";
+		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&edp_phy>;
+		phy-names = "dp";
+		power-domains = <&power RK3568_PD_VO>;
+		resets = <&cru SRST_EDP_24M>, <&cru SRST_P_EDP_CTRL>;
+		reset-names = "dp", "apb";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			edp_in: port@0 {
+				reg = <0>;
+			};
+
+			edp_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	qos_gpu: qos@fe128000 {
 		compatible = "rockchip,rk3568-qos", "syscon";
 		reg = <0x0 0xfe128000 0x0 0x20>;
-- 
2.34.1


