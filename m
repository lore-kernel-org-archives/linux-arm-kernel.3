Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EE0C3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 16:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOHwUHP1EEo4uG8QjQMQfu9OTpvF8KR24TS1ZlS97lM=; b=weajITezJWY5TLem1QRAGX36dr
	xjDK1Rq2uU/6FaMu4Mucf3FUjwqHQm3nR/T6hLj28rb7zbVQS88iwYshtF7NL8Ymo7CSNXRG0TUd+
	NIT/sRjDUGPFwEb29LhCMz3e1QvsAqSxlUzW8MacNyEmE+6GF8f4myPLjUsAfnYbZ0GANIylDf+yS
	q+reAUgXF3RLspKl5fD/p2M1DwGTWH68kh3f+gGBHTd42/LTWh4S2xGkRKg6WzgwP6wMKJIfouxCB
	1reLtWo9762VrX5bCH+nYIjge5XVCJt2p53S8ERW/xqlsgaLLeFu8ODuxQ26oZKpjIuygVVX5wPGf
	8sNQAsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1wH-0000000FzA5-1Ll5;
	Wed, 14 Oct 2026 16:34:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1wF-0000000Fz7B-1kDh;
	Wed, 14 Oct 2026 16:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E80784451D;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9B8FC4AF11;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791995686;
	bh=DQlqMZ8mkMUn9N8GXl8KrKZD30XKvJbahTg3l+XwR6U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jdlqOOIKxUz8nWWD4gpzAxhsxiwkZvwBNPjVcO+v8ZUBDVKl8h2gTycEc2woCijzz
	 rlPKz7iNt0eJ2KZkZJAENH2dO6sF3TyCDYNKGRcsorcZeTtT1fb8idx4b0XjZGG2I1
	 ElkO+N4VB07YCp/cvktULvp5rZU192n5ayoSNFlicFWirQRYCMi2NfyJjSwbgqOMnj
	 wGSIEMZ/0cdO/79O83KMslUAkFJqGpHgMATJJ9r8z7SYlFsCmUnTOW8ELdaROUJCHf
	 /sSvXOc7TTA40E2nFwmos5xY8MHUX3sUc/YoLeqsdENnku19K82ClxqWDsghysamzr
	 rh9i8HBHT/9rg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7139CC6B2E;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 14 Oct 2026 18:33:06 +0200
Subject: [PATCH 6/9] arm64: dts: rockchip: rk3588s-nanopi: rename usb host
 power pin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nanopi-m6-improvements-v1-6-e713f71eb4d3@gmail.com>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791995685; l=1217;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=69W1lTAzZdFrwbRG3RydcrBa/M/DJ1hW57t5Lc/1y5A=;
 b=w57+GkJsIHqACLRjfvRURkDV9sghuLwE/rhvN7ApWzAK69xtm/pBI79RuU2ftW/2qL9ZdLu1V
 7X6SWMF54IHBgu5VLcz4EIvIwGS8hBO8V4MSMgC+6JLrn0jc9mleIO2
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

usb_host_pwren matches the signal name in the schematics, which
simplifies cross-referencing. In M6/M6V2 this pin was renamed to
usb20_host_pwren.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 1d37862edb5b..56264ff3b409 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -79,7 +79,7 @@ vcc5v0_host_20: regulator-vcc5v0-host-20 {
 		enable-active-high;
 		gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&vcc5v0_host20_en>;
+		pinctrl-0 = <&usb_host_pwren>;
 		regulator-name = "vcc5v0_host_20";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -340,7 +340,7 @@ sdmmc_pwren: sdmmc-pwren {
 	};
 
 	usb {
-		vcc5v0_host20_en: vcc5v0-host20-en {
+		usb_host_pwren: usb-host-pwren { /* usb20_host_pwren on M6 */
 			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

-- 
2.56.0



