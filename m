Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E47CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 16:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYeL4rQJuqqqc+s9Omow7VVPXnXYK31XQT7qXL4f4AE=; b=S+EvD3bWQ7n/Ups1ln6sHSLjOc
	guGgzx/aYP0rSdgqqoexi2COjQvlYLDsjgCysDGiCUbvfbo+8Hs9jI/tnjACSc6rGE6AIVi22i5l4
	07sx6/nkDoCUDbnTbrBaUiGXeksZVQR8RVY45Cdw3nMkX2WVoEaorYTBNqsJcYGJKNlIZ4WdRTpBH
	fo3k9zmkAs6PHwXdpCbE3TSSOnqo4PBCZ7hTPOG25muBkFMsyv/dLUF8S/RLgZOHY/CmUMUgoSOTK
	ooGY8DxvwvR3Oq2lrZW1jc9s9XZO2K81yTxzwm30BQ7ntMpKuaHYDKMsTpKP+uMhgavUv36YmyiXg
	U1A9VYXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1wH-0000000Fz9U-0OWg;
	Wed, 14 Oct 2026 16:34:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1wF-0000000Fz76-1MGf;
	Wed, 14 Oct 2026 16:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D83DC43F2F;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B63F1C32786;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791995686;
	bh=NlD/T1r5N3q6haBkpqusdEWF9LUkI0TJP/q2IERXYOE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vt1LlG1KjCpwrB0tA3wTFqg/mwn/Qo0gK7VK5QPy/xos5cADYrh4z7GIciTOHfw/z
	 rkMm4PJslhsYH0kNUMS7wiSx3qXRa7oA3TlV1LKSjA+dwdmC6KUUjGraTeKcQFJiPC
	 2XIdYKHV4IdNjKgMdHXiD4FxZNdNIkZD899uYeVa45UHiiFDBnz9IdGtsHS9Y9ty1I
	 59+ceUUTYuUrQcd086GDa6oGjSBzOfvrWDUgZ3CL10tvxt+zWWtXjDFfoLHAbExHoq
	 uV5mFNBUPg2UnafoaLejyNnihIlWulu31HK863rAXNLz+IWcj62zLhH5kIp8FBdpcu
	 PimJAnh0hutbQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4247CC6B2C;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 14 Oct 2026 18:33:05 +0200
Subject: [PATCH 5/9] arm64: dts: rockchip: rk3588s-nanopi: rename sd power
 pin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nanopi-m6-improvements-v1-5-e713f71eb4d3@gmail.com>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791995685; l=1134;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=mv3bdQaRX66XNib8g8ADisdP4Xg5uB2QK9LE7Hrnk3Y=;
 b=dh+EhMzhSLc+l50nV2Z/J8JwVtOClQTg5p+gD3DlpaezqpEWUzDK+dwj9stzXDbymGSTA8W9H
 WSAp2eV21mtAMMzCufu8N1f5kKl0FQ/3WZIkv70Ayc051YXIxZvXspp
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

sdmmc_pwren matches the signal name in the schematics, which simplifies
cross-referencing.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index a99e2e60c5f7..1d37862edb5b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -66,7 +66,7 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 		enable-active-high;
 		gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&sd_s0_pwr>;
+		pinctrl-0 = <&sdmmc_pwren>;
 		regulator-name = "vcc_3v3_sd_s0";
 		regulator-boot-on;
 		regulator-max-microvolt = <3300000>;
@@ -334,7 +334,7 @@ sdmmc_det_pin: sdmmc-det-pin {
 			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
-		sd_s0_pwr: sd-s0-pwr {
+		sdmmc_pwren: sdmmc-pwren {
 			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};

-- 
2.56.0



