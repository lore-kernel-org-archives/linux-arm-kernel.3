Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96703C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 20:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kbki0OfbqY5P1VtcSN2MXYSVR2HgpEje9msf23VFBg=; b=zHyCz7Kuq2OiePZSzR6gLXZOir
	lttrcdoDlHV43qi+F1srshuVvNiwhzEHHf/TzuldtG5fuoUiY3FMq5a9cecYCZbiq75XeUz2zOePB
	8D5fA59JXxG43mgCa4JtyEYXYn045f1Lz5jnN5h3SLeN5C7yBfFmb2gaUVfidUNi19X58TYF8T0z1
	/m5TELso4qLOqXGWr0yqTcBA0WIQxWUVUWouJGQlx7OfrYQd7smY7UvoqqSyGRsmocf9CDbRdUUji
	hD1ELrNce5Boq/K2FAbjEQhr6iQ0ldg6/zQNe0L3j9GDc4ECSsuqbAtRunFwBkdTJtERnTewlzw1L
	e5Wz6zVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjNIn-0000000AN39-3IIR;
	Mon, 13 Jul 2026 20:30:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjNIk-0000000AMxo-0UKC;
	Mon, 13 Jul 2026 20:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D73743B5C;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C0A2C2BCFF;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783974653;
	bh=hrTsWVZxBChmSbMQPtCUh6jVWfWzSNNjuIKQn6LbXVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IaVYTzLb19eRoUvCFhXxdpQ/nh3EqCIqJTeI03aOK1lVej/DLOqNtauhiZR2e30qb
	 ovl1CgicBZGWAV9T/2ncWA9AYSy6wJtc7Mmxqj3dysFHlj/oKDOSdHHUdN+B1ZjR4t
	 43UwOrsZtgVYijeF07cz/5/n5JvVBoauYTPF77aj6DkAvtIseGqBR6Gk7fRkyEik2g
	 rg0ndgf1N0dlusNAmCU28zEJOjKLFDnBNkD6cAOOkWQdvZ7PBo9m5Ex4qsxifuZVzD
	 4c7LIcQXyHelb4zXvG6vEMXIKHzgM14LiaJ2qXNIdN9Q9jqS0hjt8sKIQYk4FssiIZ
	 DgSvPSZj6Wbjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADB2C44508;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Mon, 13 Jul 2026 22:30:13 +0200
Subject: [PATCH v3 09/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove
 bogus vcc5v0_usb regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-nanopi-m6-v3-9-227567ffc5dc@gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
In-Reply-To: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783974651; l=1672;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=iPy2X35YL+LpSjA3UQEe7qm+WPZWFPTt/yLokJTeBU0=;
 b=ntfUyTUDty3vJWNcfz9gac5nDz5BWxuwHfd33Di+1zZWW4PyP5ZBTM6GdthzA14oDqyA3PjTw
 5TOW8Jxf/VqDnO8RaHjiquKzlScCsQ2n0hEA9qvUp+vgOogM58JkV5B
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

All USB regulators (power switches) are feed from the main vcc5v0
supply. There is no regulator or switch in between.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index aa074ecda050..84fde8a669a7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -131,16 +131,6 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 		vin-supply = <&vcc_3v3_s3>;
 	};
 
-	vcc5v0_usb: regulator-vcc5v0-usb {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc5v0_usb";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc5v0_sys>;
-	};
-
 	vcc5v0_usb_otg0: regulator-vcc5v0-usb-otg0 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -150,7 +140,7 @@ vcc5v0_usb_otg0: regulator-vcc5v0-usb-otg0 {
 		regulator-name = "vcc5v0_usb_otg0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc5v0_usb>;
+		vin-supply = <&vcc5v0_sys>;
 	};
 
 	vcc5v0_host_20: regulator-vcc5v0-host-20 {
@@ -162,7 +152,7 @@ vcc5v0_host_20: regulator-vcc5v0-host-20 {
 		regulator-name = "vcc5v0_host_20";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc5v0_usb>;
+		vin-supply = <&vcc5v0_sys>;
 	};
 };
 

-- 
2.55.0



