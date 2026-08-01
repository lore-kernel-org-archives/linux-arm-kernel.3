Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251D3C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 00:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzY/k3NbrPUOrQd3jU72V+NtvafmpCx0kRb55WvQT1k=; b=WtkAcwJMbJYKUQTw3kuYkGB6xt
	GSIg9Knw0B18CuUWWCkH6L83z9knAnw0zGtUe32vxYh18KX3NQ+9KmcEt36M3tX/hkB5kcLsCgyEC
	DSPy0el/WThS+JwtYIKDnK+BhZzc4aFQ6F3k0ZQJbqxdeNNPXrbs0BnC6YOacwqFmuEpSnWGNMhTX
	JJzuEP9wMffYIPvjkZllD8uWv3/dST8+XT3nL/XvvMqo0ir74tG5MfDESvmbG0LjgmhyJtePtJtp/
	4j6mi4uJCQ4IpAdkn9nmyyxAl/0pqFoSf9IJay96+IA+ngdGBKyEV7JoN4LChTIgFb2gKxNYCyZYV
	oDAOKSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpxhN-0000000DlfI-3j8I;
	Sat, 01 Aug 2026 00:35:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpxhM-0000000DleI-1o2P;
	Sat, 01 Aug 2026 00:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC3C145039;
	Sat,  1 Aug 2026 00:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CFD3C2BCF7;
	Sat,  1 Aug 2026 00:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785544531;
	bh=MwjxCyiJsCeuTiPKzMU/FedWyjS0LP9YP2Og3RvfeEE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AoODgjZbMcmAcyZt7TIv9Lx5vJLQ2nWq5TaxvR+h6KnekN4dbzV50A/JTpmoMphlq
	 M3dlGrCg4c+H3Pa5OA7lZkluiyxjdVj6Nr2NVay+rwyCPJj/MuMm2ACmuUsGBZO9ND
	 uOeYLUA2qX3/1UFDuZtqPijWLNFNcZUy/lML2D+BeFKw52QbhvBUHyOkAPaE0ScJ4W
	 3Bmc6/eYy3tAIjhajSadSCh5k0edgbx62Xpa5/Lmw0A+YZ9Wg/SCtP/qqO2c0PPqyR
	 A7b9rbUc7Z7k9pIKtqy5lkGXfUQ7MEqFOKT0HIOO7Yc1Ce1oH6nfZ6bg3ftEYm8aCv
	 qfngeXA+WcPdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D865C55173;
	Sat,  1 Aug 2026 00:35:31 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 01 Aug 2026 02:35:21 +0200
Subject: [PATCH 2/4] arm64: dts: rockchip: rk3399-pinephone-pro: DW9714
 coil requires higher voltage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-pp-pro-camera-v1-2-7b4d90788f9f@ixit.cz>
References: <20260801-pp-pro-camera-v1-0-7b4d90788f9f@ixit.cz>
In-Reply-To: <20260801-pp-pro-camera-v1-0-7b4d90788f9f@ixit.cz>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Ondrej Jirman <megi@xff.cz>, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>, 
 Manuel Traut <manut@mecka.net>, 
 Alexander Warnecke <awarnecke002@hotmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 phone-devel@vger.kernel.org, imx@lists.linux.dev, 
 David Heidelberg <david@ixit.cz>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1252; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=CtmW0a2W86bMEcZ0dtSszyADwP8LgbVPYzdrAT7lUhE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqbT9REkGT6wYkrnw7vVFzBUUDFM/Z1kzdvuRLM
 Svh7a0sPZ2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCam0/UQAKCRBgAj/E00kg
 cij8D/9+k7eLtMvAoLHwLgwTcoON+ku4R3r/iZgjbChEXxwwoyY50stWKatXXAP8hQLuLiX/lYh
 YpcbJe1OHhF20GPHkuHDl/ro/Z+/l3/Gr0/25KnGGubWHyiCIyv6YAYx0TkkG71LdPUfzRYNo+r
 mPnyPaw2xjxvwTt+uAp68JurQ0zHeXB+8XeC2boI5uamRdrpBdV0qw3xN8YN7py/kpjh4t4q67E
 M+vkL8Qf8a7W7xT0drcE5qjtPcXQaeSzhw1MwSuxvmy/4t+ZcLiwQsxGwMJiHFmGU7Rt9tmtfGM
 8/OpXLXqE7IMyY0FBMCpbBj0ZASTDfburmVhABNc6Xi4rdVIoNAGttEbEUsF9usaVgQJ4Axazfo
 vzAGopGLCCxwD4wN45a/KLvJAsYg3SdAogiyCTVMJFxc1yKD8bjD9/ihDdCTRgncr/BdB8obpIj
 tigr6xti3ytptoQHrPhQ+nJcdKcL8t8chOvER/cz1717ggmmKHtEVm2ikwA4BQvKxfo1wlphAhc
 SBEDW+L+tqUK1j5dV0xO9uzG+HB+AXAJr9yIOh1H2ibnVB1+OEeZpF/yIiFEW3/p6oQESyxTfhk
 NEu3IE4dfgSg5P4rqERNdiTH2SPPJ2sEI5YJSQRHPkvzP8TbUkCostDgjkE31+AkUY7IIQNn/Lj
 +uteGSYwVzO3MJg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

By datasheet the VDD (in-kernel named vcc) range is between 2.3 to 4.3 V.
Usually it's around 2.8 V. Here it matches the avdd2v8_dvp.

Fixes: 9336eb829a18 ("arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world camera on PinePhone Pro")
Cc: stable@vger.kernel.org
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index d46cdfe3f7849..bde35d9b2263e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -473,17 +473,17 @@ wcam_out: endpoint {
 			};
 		};
 	};
 
 	wcam_lens: camera-lens@c {
 		compatible = "dongwoon,dw9714";
 		reg = <0x0c>;
 		/* Same I2c bus as both cameras, depends on vcca1v8_codec for power. */
-		vcc-supply = <&vcc1v8_dvp>;
+		vcc-supply = <&avdd2v8_dvp>;
 	};
 
 	ucam: camera@36 {
 		compatible = "ovti,ov8858";
 		reg = <0x36>;
 		clocks = <&cru SCLK_CIF_OUT>; /* MIPI_MCLK1, derived from CIF_CLK0 */
 		clock-names = "xvclk";
 		dovdd-supply = <&vcc1v8_dvp>;

-- 
2.53.0



