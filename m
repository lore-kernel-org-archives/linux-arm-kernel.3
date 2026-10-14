Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4108CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 16:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRWtqMPUBXRHoTGSUG1RbSws2aF8y8UiSiEGBoUeIX8=; b=ypO35rchfla8nqcTj+4Q6oTQkz
	rtgveY0hd4K3p8kCwPyEUwj4YRpZEhCN/XBN/9pSsOCOx3FqlLoYsWNA4ARxgUFtUi+Kf/aFQhZQF
	beDraHdzQZdZse+L3QrdM7uEA8ilIvVLday2hbXur2yx5IhMNxJ5WYAnCVwJYe70TcdBc28InbhAO
	XwKo0aSFS/5/FPUkYZH/gGvr8x15SzDegzC8OEsJsYtd6+s/nwApGsyLJuqLY5Onsd4eI3VcJAc8I
	NtxR2lhxSnZTlspnhVhkCTuZCN1seuM/TPo7YisgKQE9vUWe4fnIxovyUUHpM41EMkB9xImwJ/ZHw
	AH0PU1kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1wI-0000000FzBv-0XDh;
	Wed, 14 Oct 2026 16:34:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1wF-0000000Fz7V-2VxS;
	Wed, 14 Oct 2026 16:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11B224458C;
	Wed, 14 Oct 2026 16:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9976C2BCFF;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791995687;
	bh=yoEkzv3L18sWFC59rJDzuQJ9eP+Jz/EAEuSDh1mibNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fB1eeuJJlYK6UEGbklkPSoK/EAepoW/iFbSAeXUmCOG+ZJybhYDBaUBFbhdtImbuR
	 uyCsSfAZCZ5NsFPd6tkQwNLS6BDq3CT5uvSQ/M6PR1Z4xbiGaPDM2SMWqlLaXh6dB4
	 +irT29j2/VYlZu8WVnL9afOS6MR08nl+VfiLXuL8+XMg/VP6ErHG09q187RYtCkEnv
	 EXiCjQsxdVs+vkAgMG3TXl2JUo/1cWQJKZR5NYmiMwol8w5xkE7jguVt516Yb4Pp0f
	 3bkk98lAvcf8a+JNFZW09lKDJEF5tIXny3+tpn9fFJB3R1G7KYko5yYTmTpj3VbkuV
	 ZBtsCzZCNn0vQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87BBC3DA7A;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 14 Oct 2026 18:33:08 +0200
Subject: [PATCH 8/9] arm64: dts: rockchip: rk3588s-nanopi-m6: rename pcie2
 power pin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nanopi-m6-improvements-v1-8-e713f71eb4d3@gmail.com>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791995685; l=1149;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=GfKqko+BDEDT60oHbA0Oxe3Rj0eMd1CHLKLNk3udR1A=;
 b=Z+r8PqUi76NbwVK8sVcXAQug20g8SdGQ4/NrTN1UApcxjAeBJd8eciHBIVaVullfyosGIHwp/
 jF3YyjAAfBKAuAh1hQItJf0VcHsWNvNWk0EINVvj0d6tn3WDcw6KaCm
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

pcie20x1_2_con_pwren matches the signal name in the schematics, which
simplifies cross-referencing.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
index 6205a542cd1a..ca115d8e108a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
@@ -41,7 +41,7 @@ vcc_3v3_pcie: regulator-vcc-3v3-pcie {
 		enable-active-high;
 		gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pcie2_2_pwren>;
+		pinctrl-0 = <&pcie20x1_2_con_pwren>;
 		regulator-name = "vcc_3v3_pcie";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -116,7 +116,7 @@ hp_det: hp-det {
 	};
 
 	pcie {
-		pcie2_2_pwren: pcie2-2-pwren {
+		pcie20x1_2_con_pwren: pcie20x1-2-con-pwren {
 			rockchip,pins = <3 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

-- 
2.56.0



