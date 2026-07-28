Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39945C54F56
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4aTS/8UM2KNtCS+sBxY1eLnTWCmgPbs27lUsL9TiQw=; b=es8prValHp2Y3nly3iQOgaF52Z
	udTCwA//cwKmfCtP31c1Nq62ejpEuurosSrnkA1AwxwL7S0u2cVDzjJJyl92JeNNYyGG+dWfTgffl
	56ZzCOhKJRNJ4Bk0IndQuTLKEdnBn0G6aHjdjRl2DsSAiBOPoM7dp7d3d3UrnnM4K9GQuAYb5XmXU
	tzunQ1ohnNbs2gF6y2ObyjkMsvsuaabtTCrIN0CIz7ozgNNgA4btw/vRkgviwr88jq+ZQUtGlyZRu
	RZbqBAnD4NT3tl+oEGxadNm867KiW1UE9CYjUAM9cLwK0Nzo53UMwgfC48Q53+vnLRTGUiev2/esq
	g0y/210A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogW0-00000005AFs-19G9;
	Tue, 28 Jul 2026 12:02:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogVx-00000005AA3-1pjs;
	Tue, 28 Jul 2026 12:02:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02E3B45129;
	Tue, 28 Jul 2026 12:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8C69C2BD04;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785240148;
	bh=YS6d1wOk1uNnWdkK9m1ywZhRYLXLB7Jc+RlOQ6jQP7k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Oi4//B5GNtJlX2g7P2DMttP2fRqsvOiu2ddGrjRIcizOqFz0A2u/ov4moAYkiZvwP
	 M2Czm7MSG8F3evNmtjlbgB0scNZ2KsIaidt2SJRWcFl7GBrVP1LDFmLAkcnL8B0Z60
	 9lUVGVZ3TBBT1g4VXmUWf8JcN6ADLr/u0t7r4zq1jTGYXvQLX6SwxA1ovBExLiU0R8
	 rYGXKLOE86lcNDau/8HQX6rbhq3lzYWTFmZOzN0gp1Nf/RohnyMQtLCHqMEsee9PJx
	 iiVwg4oAJy/oNUcnRnbm2wCRaM/WYHCm0uk+z8+4r9JaNhN5c3gAFlwzaar5QnIuME
	 53UZwoPwODfGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FFBC531F9;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Tue, 28 Jul 2026 14:00:35 +0200
Subject: [PATCH v5 08/12] arm64: dts: rockchip: rk3588s-nanopi-r6: add
 gmac1 phy-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-nanopi-m6-v5-8-cbc1eb0d8d56@gmail.com>
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785240146; l=746;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=7mBOG4nn7SH8FJfxK3Rb2LwUqsvEOBR3h73EDOVqpVs=;
 b=IfXI9VDlw25+1n/T8XMAX8cicBFfFb3hQmva5PGBSAAQP+vJlnvw7+K2IWC0uDz8frEdt3vUq
 RkPiUMeltbVCDnqSpm30lK0Dd+Wl4dSabf0O42eKOW8JwhUBNCgZlhW
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
index 50af092f9cfa..206cc88fdaa1 100644
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



