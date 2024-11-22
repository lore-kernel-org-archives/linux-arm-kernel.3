Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E30CE65D29
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 07:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cVFYeQ/pGFqTE9jOGggLAbh/WEQM0IFDd4XoMgz0QVo=; b=WoOtTU7+pNQmglWhl6fhCN/Y6d
	6tWJ41Z7POPMq/cwmMFI+5EGZBTDF2k4KiIPqBhGni/gGQYQtpt0dDl6gg+GVkUa/3EwADUwPH1Xw
	v4IuCwGsVqkAjBfvpEsX8JJn9QwTADnwy/65HDAx/zdzQELHZOvwNrlmbh01guiLCbCHxLQU2IdQR
	gbp4vVhZyNlmAO2fVMmro4+Xf10Bz04+q9d7Zrp0J7eRoVyZZEFHFVVWwjLdKZjtWgNy5CK+Z2bH8
	T3xxJWQdz+gDJgESROPDT0LWsnnFYdCh9ek5wAgvIwM/9UuFutp7RQPrU25A2VqzFrNEsKq/e4mCq
	XW+4xqxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEO9K-00000001olE-0pFc;
	Fri, 22 Nov 2024 07:32:18 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEO7R-00000001oMe-2bld;
	Fri, 22 Nov 2024 07:30:23 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c04:2930::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3848de84;
	Fri, 22 Nov 2024 15:30:09 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/2] arm64: dts: rockchip: rk3568: add reset-names for combphy
Date: Fri, 22 Nov 2024 15:30:05 +0800
Message-Id: <20241122073006.99309-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQxhKVhgZQ0tDTUNPTE1NTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtPQUlCSEtBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0
	1VSktLVUtZBg++
X-HM-Tid: 0a9352c73fde03a2kunm3848de84
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oj46Eww4PTIjTj8QECk*Tx8y
	QjkaClZVSlVKTEhJSU1LTUpKSktCVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS09BSUJIS0FBSllXWQgBWUFKTU5CNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_233021_885778_5BF06E07 
X-CRM114-Status: UNSURE (   6.56  )
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

The reset-names of combphy are missing, add it.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      | 1 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index ecaefe208e3e..695cccbdab0f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -350,6 +350,7 @@ combphy0: phy@fe820000 {
 		assigned-clocks = <&pmucru CLK_PCIEPHY0_REF>;
 		assigned-clock-rates = <100000000>;
 		resets = <&cru SRST_PIPEPHY0>;
+		reset-names = "phy";
 		rockchip,pipe-grf = <&pipegrf>;
 		rockchip,pipe-phy-grf = <&pipe_phy_grf0>;
 		#phy-cells = <1>;
diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 62be06f3b863..e55390629114 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1681,6 +1681,7 @@ combphy1: phy@fe830000 {
 		assigned-clocks = <&pmucru CLK_PCIEPHY1_REF>;
 		assigned-clock-rates = <100000000>;
 		resets = <&cru SRST_PIPEPHY1>;
+		reset-names = "phy";
 		rockchip,pipe-grf = <&pipegrf>;
 		rockchip,pipe-phy-grf = <&pipe_phy_grf1>;
 		#phy-cells = <1>;
@@ -1697,6 +1698,7 @@ combphy2: phy@fe840000 {
 		assigned-clocks = <&pmucru CLK_PCIEPHY2_REF>;
 		assigned-clock-rates = <100000000>;
 		resets = <&cru SRST_PIPEPHY2>;
+		reset-names = "phy";
 		rockchip,pipe-grf = <&pipegrf>;
 		rockchip,pipe-phy-grf = <&pipe_phy_grf2>;
 		#phy-cells = <1>;
-- 
2.25.1


