Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E15DC44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJss3VOjh1dL28mQ+kvQWQdilXJsvBvoA6Z2f1e6ABs=; b=DabuBGW/YXTktWfjdMCZYhBHc8
	i2LaGAuESP98Kh2O7++JKzzd5u01ERhDHKK1BIsqh88AIU8y4l1A7+DcBjrJ66/sry3jD6WWf0try
	jF0uIUjd3dlidpczS/zoNUA+oJNI6x3K+25oDQ36+U9uTw0Ty96lgMH5OoQH2c3bPg0Kk53/66IPc
	HYbEKkxNEejTFRhOX3V66i7rvOpWJKRmE7OriF+nymTkeE+8/QLhZ5l/fkdY17ybGDkUxWvwkF8oJ
	kV9InfP4vA0UvD8KNMqYMPe2cZUlQdwen1JyParK5QLDvgGukHbTAlB32RbfU27EeaTTStMJDN08t
	lV1ubU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcun-00000001OoQ-3286;
	Fri, 17 Jul 2026 07:23:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcui-00000001Ogp-44dx;
	Fri, 17 Jul 2026 07:23:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6822443D30;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BAACC2BD00;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784272996;
	bh=bedEX7IdqcLQwG2ntTfKH+49oD/U3l2m9X3GPu4//iA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LoLYdGBKcoT466rAJBYl62YMB2NaP0jWUyPlZLYKg06zYwE2BppljbXb3eh6oB9hT
	 9LjPKVn0tpMVYWER94q2aMh8LniKXvjVLsgNEZfDp79+CE3yN23UZ0Jcgj4ZmO/tO+
	 cYO/G3NF2jKfaY7ItGNejntGXUKDSV5AwuE1yIYBpp6c6kuTJ6Qy98Ui6zWd3XnFTe
	 im5HHuNYkXv+ZvUBqvJ9yseC6QBW6o67rnCI8KaXmr4ZNDth6EDhnRrsk5DvmxMsKJ
	 lPdVP09VGyg10VHj28VimKspIz2W/esgNo/fZmvpJtgrpF6SrhnQPBWdnjyAIFqJqQ
	 I8eGdukeG6oTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DE7C44507;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 17 Jul 2026 09:23:06 +0200
Subject: [PATCH v4 08/12] arm64: dts: rockchip: rk3588s-nanopi-r6: add
 gmac1 add phy-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-nanopi-m6-v4-8-b31391a72e41@gmail.com>
References: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
In-Reply-To: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784272993; l=746;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=cbMRGCjK0cqeVUY3RIsYZSs7mBZYvBiBTtHs1FmJ/94=;
 b=ZnRgRgisL/g9rcTeSEO7p9vVAGRpab0QuLj3vnVlT/BTHqHnEd9GZQT7kr0ClemfbYKctbbtb
 pWgo/2thcMFC90774z5QIB1fhKjLSwwRN22ESyUN0RNxVVQ9R7aPOxf
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
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
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The RTL8211F Ethernet phy is powered from the VCC_3V3_S3 rail.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 30e09352bbe9..97a495eab7d5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -210,6 +210,7 @@ &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
 	phy-mode = "rgmii-rxid";
+	phy-supply = <&vcc_3v3_s3>;
 	pinctrl-0 = <&gmac1_miim
 		     &gmac1_tx_bus2
 		     &gmac1_rx_bus2

-- 
2.55.0



