Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E2DC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 14:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cfDZ1inHOui4m5H5mXU1kp88kQ35TPyN/bSvxLYsfwA=; b=etaG5AwMDtC8a2tJV3WPbr+y5H
	ggsbcVXSUSeBh+9D47pRp1YjsuZicmqF4oV2c3tjWaNJC46TgBKPKf/f9tkOizOjcCw9WCBj33Eej
	3MHUjeyXa/Gh2QlLizler4JABcdRBbhA8dxXBf+vMAMXELEjcy1xVweMplpkuJ9PpR26q4YPuhjXm
	YM07ZVO8PwlMVxMJUx/XsOCLl4e5UuIqR+fLDMMnRlPYqsOgUTfKF8B3JlZc+5anKN1RcgA84AGxm
	wOo0nazm9w1P995jlotd6Vn+c8Ut8QQ2oPlD5yrE2lQzynoIQ+Bc5wU8JUIKFLyMe/aoWk2kYiLj2
	4Opbp3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVWaP-0000000GsDa-1EvW;
	Sat, 28 Jun 2025 14:31:21 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVWY4-0000000GryK-06sg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 14:28:58 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751120932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cfDZ1inHOui4m5H5mXU1kp88kQ35TPyN/bSvxLYsfwA=;
	b=drzaFM0YVkZsqVrjLUvXn3A1tp93N4Rp0hgxvjIF/Zyf2+HaXHjSdNeQtnEQa12wR3Aczj
	w+NpD19PqXPEWQHqjKTEzqYvSrKC1JArSEwyrDHaq3Epbh1iSWasW8E/3fwg9wVjXtwexe
	UFHRziCozyLVNdHBbfbXzP2JPxZC6tlCxhnP6qWMKE2vlBp868vEGNQnTcWCYjeuOp8HFj
	Tg8Rli9QtB7q1SplwJgl+QZ08H+tJ4TXikfz841Bdjwl8TVmG6exLJTroOaDFwMfxJx5GW
	lTmKjQw63UB41KSc44tZhxGRTeEg2zyat8CejBpMrrp1vBPJhYPZtZ+KWLHKcA==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH] arm64: dts: rockchip: Add missing fan-supply to rk3566-quartz64-a
Date: Sat, 28 Jun 2025 16:28:18 +0200
Message-ID: <20250628142843.839150-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_072856_565079_1CD5743E 
X-CRM114-Status: UNSURE (   7.49  )
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

The Quartz 64 Model-A Schematic from 20210427 on page 7 shows that the
fan's power supply is provided by VCC12V_DCIN.

This fixes the following warning:

  gpio-fan gpio_fan: supply fan not found, using dummy regulator

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
index 3c127c5c2607..a9021c524afb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
@@ -30,6 +30,7 @@ gmac1_clkin: external-gmac1-clock {
 
 	fan: gpio_fan {
 		compatible = "gpio-fan";
+		fan-supply = <&vcc12v_dcin>;
 		gpios = <&gpio0 RK_PD5 GPIO_ACTIVE_HIGH>;
 		gpio-fan,speed-map =
 				<   0 0>,
-- 
2.50.0


