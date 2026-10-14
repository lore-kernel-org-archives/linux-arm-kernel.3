Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E18C3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Da+N8/h/LOIomXWrIUCxjdkd16K2eMbcBUf7cUXxZGM=; b=zkCC3k9hsni4qnNiGaHWVpqXWa
	63Kih5TrXH5Rq9zapS+UCQtNJPCcuLOVBUqIwgIyXHFNXptuZbC4B2tj+vvBMsQcHUITzvBjotIgu
	KhO41tzAvhZyozLjnijSFiZdYv8D5kOF61NVGqOa71udXIxU9zcl2X++llQebfGS1RdXZVPjcBxOC
	YybcJH4kG83ZCETZ582meqqtt/sNcOaqg69l0qW2s1GaCJC3NfM9l7k56xD3iI2G2OVNv3yE+E7k4
	IjVo57VKzv8C52sDYMW85AizzdArLhxseScYYq3yEKtMxZTqS3JITDMsgIGLxvLk571TQLv5t2sX5
	UEqhLB/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1wG-0000000Fz8V-2qcQ;
	Wed, 14 Oct 2026 16:34:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1wF-0000000Fz6z-0gg9;
	Wed, 14 Oct 2026 16:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9905143D0D;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72A47C2BCF7;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791995686;
	bh=ALUyyge6FUZ6GWamul8z2xtbvXbH61GTco3jjpVzi54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ipRc0OAmGqmZyBY/NKktdCe/Mj+58+8V056sW7ZEYdXbdh1zpy2cVDKsd+m6NRaCF
	 oihJmJORLGn8kDm5J2AgaCI9u9Q8khE/kst6n6SxMMRC/9wBi6Wv8Y27ZOS+bszstb
	 9016BxuG6/xGZ5rFu7vl8YlPAYwUmosav7+dELLGorZ9C8p6wmXV8Vm37BWyBX+TeY
	 kkxCJiGQ2ZI7391b3vOXJcl5kCQgsNF1uhU4Z7gNZ/z2iD810QzbVXtS4gm/s7x0fJ
	 Uacc/8o/1QHdzHg666r8870DrsY9+uMKie7pQJw18+fewU8MvCzr+vK/+c2Iu0t820
	 hoSNGln9lasyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5144AC3DA7A;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 14 Oct 2026 18:33:01 +0200
Subject: [PATCH 1/9] arm64: dts: rockchip: rk3588s-nanopi: fix sd min/max
 voltage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nanopi-m6-improvements-v1-1-e713f71eb4d3@gmail.com>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791995685; l=999;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=ZL0Hzb2jEWUjL2wvU/uKxEAnzsHMxAzmFWNQXvnrLKo=;
 b=G2CZan4JvljYpymAFg6tQTWMFL8j5loRE3S67B5NyNlSv4GXYdGWQ8Iycbgd6uQFQNZk20w+p
 D4sUbWZyF0pAgaH4+zwPCWNAhfBeV1G3ZqMHFelarJm9l2BE2z2pTz+
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

This regulator is only a simple power switch and cannot change the
output voltage.

Fixes: c08257d642ac ("arm64: dts: rockchip: refactor rk3588s-nanopi-r6 to support M6 boards")
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 22b0cdee22b4..8c36268e9876 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -79,8 +79,8 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 		pinctrl-0 = <&sd_s0_pwr>;
 		regulator-name = "vcc_3v3_sd_s0";
 		regulator-boot-on;
-		regulator-max-microvolt = <3000000>;
-		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
 		vin-supply = <&vcc_3v3_s3>;
 	};
 

-- 
2.56.0



