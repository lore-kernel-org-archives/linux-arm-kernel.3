Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C918CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 10:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/jqhdj8MSGQwzWNUqhHAfc1aOTqvmqjeKUaZyjrK/kU=; b=c3BrBdYelmVcthWpC9JkWB4MFE
	ER0BYWu9WFFONwNzfQl9UGl37aowSo1tLiwBed1dtVaOb62aQxZXFnhTEpMt8yKKymQo9SwcFo+Zm
	E7aJRZSO6cY0L2cc3U17pYcnUJzxmqIiIPYu2wEyEHJKoj+p1ZcEK9rXAysiKmzUxnUxQ2vlSe2wv
	n5YrcVoWhRhPZq+nJg5tgjBIfhLNABIN2T5sZa+rbpUCnNwDRdvcLweWzkSlvu9N27v0CP4JMh+tj
	/BUz4MnaT9LShAm1NAvJXFhK5OUpElpeRKJQnN+kbBVet1jbmIF58kOPVjgFui8mF77JCsd2ys4My
	RhWUNQjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTsV-00000007oUC-3uTm;
	Sat, 10 Oct 2026 10:00:31 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTsQ-00000007oT7-1gsY;
	Sat, 10 Oct 2026 10:00:29 +0000
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 508f731cf;
	Sat, 10 Oct 2026 18:00:06 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: rockchip: remove FRL GPIO for 100ASK DshanPi A1
Date: Sat, 10 Oct 2026 18:00:00 +0800
Message-Id: <20261010100000.2236931-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa125416a5a03a2kunmbe14e65c40c299
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSUMfVh5PH0pJGRhKSkpJGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_030026_641912_A39C09AC 
X-CRM114-Status: UNSURE (   7.20  )
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

According to the schematic [1], the 100ASK DshanPi A1 board does not
have an hdmi_tx_on_h pin, so removed the non-existent FRL GPIO.

[1] https://dl.100ask.net/Hardware/MPU/RK3576-DshanPi-A1/DshanPi-A1-RK3576-SCH_V1.1.pdf

Fixes: 2cd97880fbc4 ("arm64: dts: rockchip: Add frl-enable-gpios to rk3576 boards")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
index 05fb4a7f9a16..41c90414e898 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
@@ -278,9 +278,6 @@ &gpu {
 };
 
 &hdmi {
-	frl-enable-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
-	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_tx_on_h>;
-	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -741,12 +738,6 @@ hp_det: hp-det {
 		};
 	};
 
-	hdmi {
-		hdmi_tx_on_h: hdmi-tx-on-h {
-			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
 	pcie {
 		pcie_reset: pcie-reset {
 			rockchip,pins = <1 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.34.1


