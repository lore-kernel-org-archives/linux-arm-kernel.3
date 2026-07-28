Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7563C54F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ssa8/RJp8NzHnWgep503LaUFBdCKt7n208Abhsx7hRg=; b=jr3go6dok9IJOKWaXwCsPS72/R
	tWrTUnMw5BrXV2jC+pPNempNJqMRY3RY4n+4+bQm7GZ3Ed+ABKSime70Rv1r4vsWhLcs1C6ZiKOvM
	a2IWTTNgjGKZgfOJK/fyCM3kVR7SlXpuXi2g1Au3c5RiMSWuAHZ+oVGWW0jXllGxWqxD4L+DCpL59
	dgGdQheeQYcGuFL8aPNO4zE9XpuoFCXkeMqzcKhj8ol+9fdYzrWvv5xwrYGEAlVSdyJs4gqlGT/Zt
	n2mtqoU/ai7MMqCMPIMrjrGg0d9GMsb0sjrBZbZ/HFhxT2TExdczy3DBtlTjr7tAQjSYfKRBIu8YS
	Q8MD0DXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogW4-00000005ANa-08Ho;
	Tue, 28 Jul 2026 12:02:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogVx-00000005AAB-30qG;
	Tue, 28 Jul 2026 12:02:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 137FC45130;
	Tue, 28 Jul 2026 12:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9C61C2BCFB;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785240149;
	bh=fhzYdWjUhIfYBbHLD/ytOg92HFn/RMJtf4eZNN9JChU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BpBzagu6M3I6VFf38kTIrgtWsRhfM/gFVvHFIZHpmMI5alEF1Djsbx1g+Wt1Nloht
	 RDiLaSoRyC6biMRqDMERV+kOga3zfidSe5Rx0rIFqtq4RNqdEA7M5aB5hYu/n/BcoD
	 2jDAdDipeMJhq6KKKa7eJ4IhibwFJ+HZi24v0RyqU1/c6C6j0Fy2z8awG/cy5qIwT+
	 hJz8ZXTHlCFOzJMfJiO7XG8rKrZdC6w/Aw8/tHirDSi+VkFs64T7xQZgOf4yEoNzIn
	 e3JsoRSPTA5awGnjMCOc7T6ELOc1mrv2chEd6o+QHwJ2bh0VcDlUgy5Z5X7FquyA3/
	 J9swc1/3jLjTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8108C53219;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Tue, 28 Jul 2026 14:00:36 +0200
Subject: [PATCH v5 09/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove
 bogus vcc5v0_usb regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-nanopi-m6-v5-9-cbc1eb0d8d56@gmail.com>
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785240146; l=1672;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=UrZzPlopCnQpNaQi4ZiWK7IzfEGC03e+DmeotQv9vOE=;
 b=sxjyU4hawUkO6mc4VPr7YSyPFpOYyWguab8zMh0FfY0eMMSaAgQV8/nNWwsTGOuLAeLBmlAOG
 +yZF+W2cMZmCp62ygaCyXp7LvqnYR4EDSbWVdliUwLpKSEJeUi6gofH
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
index 206cc88fdaa1..5a42e7dadc92 100644
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



