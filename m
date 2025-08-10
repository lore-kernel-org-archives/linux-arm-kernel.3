Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F739C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 10:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frSahLhn9/F8MaeqEWBy4dT5Wk9+5EOhC8C+2xvFP70=; b=akj1I1wa/D/PntE4Ka2nWMe7qm
	/l0juXuh0jHsb0u4O+6SFhTQHnPaP5T+ydX65fUKCvVcdUb+MYNnA1iyW/vnJJ5p8sLiFk5CARWCM
	XDSjP8KVYowKbwmNQ4T/dYLr8s8qd0A6gOXk2FOghYb77ukd7kRIPD/XFAJ4A9aaJwUxzZGly1nPR
	Kb/c0idVMnlbjUMjaoIN0a27JsKFgo7uNgBZp/JhPBstWf9z9lpfrVmAugd01Yj1eEMBtFBW/wM/m
	vCJptcrM47msFZOKWDqOA0XHrq+zhJlf2lL2HjLElqjbIkO2Ysem43yhY56xfWCyK79hAj8s/Oi5d
	Nx/9UI9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul2vz-00000005Vzb-0YmR;
	Sun, 10 Aug 2025 10:05:47 +0000
Received: from mail-m60121.netease.com ([210.79.60.121])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul2qy-00000005Vj7-32A2;
	Sun, 10 Aug 2025 10:00:38 +0000
Received: from localhost.localdomain (unknown [119.122.215.209])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ede32cf4;
	Sun, 10 Aug 2025 18:00:27 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: rockchip: improve LED config for for Radxa E52C
Date: Sun, 10 Aug 2025 18:00:20 +0800
Message-Id: <20250810100020.445053-3-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250810100020.445053-1-amadeus@jmu.edu.cn>
References: <20250810100020.445053-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98936ca3dc03a2kunm8ce533755351d2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZS0ofVkhJTUoZGUNJTU8eGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJS0JZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_030036_959650_3241678C 
X-CRM114-Status: UNSURE (   9.17  )
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

The NICs have default-trigger of "netdev" in order to show up as
LAN/WAN connected, so their default-state should be set to "off".

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
index fe48a0942a57..1883bd183396 100644
--- a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
@@ -71,7 +71,7 @@ leds-1 {
 
 		led-1 {
 			color = <LED_COLOR_ID_GREEN>;
-			default-state = "on";
+			default-state = "off";
 			function = LED_FUNCTION_LAN;
 			linux,default-trigger = "netdev";
 			pwms = <&pwm14 0 1000000 PWM_POLARITY_INVERTED>;
@@ -80,7 +80,7 @@ led-1 {
 
 		led-2 {
 			color = <LED_COLOR_ID_GREEN>;
-			default-state = "on";
+			default-state = "off";
 			function = LED_FUNCTION_WAN;
 			linux,default-trigger = "netdev";
 			pwms = <&pwm11 0 1000000 PWM_POLARITY_INVERTED>;
-- 
2.25.1


