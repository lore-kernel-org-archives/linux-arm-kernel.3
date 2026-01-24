Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6236AD715EB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 13:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mklat3V6lPC6tcY+1ZK8dWl61Dm7SUQT3yFTtiyVHqg=; b=ttQB/rios3mVOnd7rh9xV3x4UT
	aCUPVieWPDcpPnSduFXwrg83i4Mh3TC2W2c6cdzdTOtWPKvpGNVzTB2cBomhTjClcFu7cnpBX6nn6
	nu9MBq5Lko9laSZ6yBAo4lxDNEB5ZadeB7CYHP0SPw05+kzUawD+08t0u+5CQ9F66SYtyffZhD/fS
	5/BMHh00nmdvoJJ06iVPD+NCu/gcmW2n7i5u9AGh6klKxngg8wA5Z0x1lrsFgqStpnw82N7YD4ymR
	IfvvRdDXTh++CFpqJDcVZt6BQTu5NjbW/ldOFHLEtirqY6VCCKUMIERO6B8baxOxAAO1ElAgHUxQ7
	OnTCo34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vje81-0000000AIaB-0FxE;
	Sat, 24 Jan 2026 13:56:41 +0000
Received: from ms.puri.sm ([2a01:4f9:c012:9260::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vje7w-0000000AIZq-1fVB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 13:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1769262990; bh=WaEx9JbT1ocsMl2cCjYOFkLVa63KbyoeWsW4DzXeu8U=;
	h=From:Date:Subject:To:Cc;
	b=dJu4UK7LBLqigMU+MyvMDtZQWVZXVuxpmTkQXpBDCE2ZgWZIfUmk3Yx9E8z7u3X2v
	 mueA4zRtqzocWrHZ0GDaU0Q6Lt4ftaijCWUnRXOS6lJ/A5zjaYdSHvJmZhta5X/OSf
	 w617NY14nUw3u8JgOXV/TVHWEwLqphBKMmyZ+jqmGfy4WJtco3+NXxjU+oZ7LCWeJE
	 RDLMu/IvUvpZs7I0RMjEfQD4yyNI8mjZUTfWYQX6Kjspvbx6gCzPkMEVKe3tH7Yv6z
	 AhR7/NX8G6po7wqTVIEIAPrAm7l4xa1dcEpgh2DNE8OOFDc14/yzUrK0jCeKaWLDyK
	 XvfLuIw/5KUfw==
Received: from pliszka.localdomain (79.184.64.12.ipv4.supernova.orange.pl [79.184.64.12])
	by ms.puri.sm (Postfix) with ESMTPSA id A41371FC84;
	Sat, 24 Jan 2026 05:56:28 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Sat, 24 Jan 2026 14:55:48 +0100
Subject: [PATCH] arm64: dts: imx8mq: Set the correct gpu_ahb clock
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-imx8mq-gpu-ahb-clock-v1-1-11c2e7c857b7@puri.sm>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ6CMBBA0auQWTuxxUisVzEupuNIJ9ICrRgSw
 t2tLt/i/w2KZJUC12aDLB8tOqYKe2iAA6VeUB/V0Jq2M9acUeN6iTP204IUPPIw8gvtyXlyTI4
 6hppOWZ66/re3e7WnIugzJQ6/2aBpKcdI5S0Z9v0LyMbr14UAAAA=
X-Change-ID: 20260105-imx8mq-gpu-ahb-clock-139ba9ca9a6c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@puri.sm, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1077;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=WaEx9JbT1ocsMl2cCjYOFkLVa63KbyoeWsW4DzXeu8U=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpdM+M8iuwOiLFNHvgo9y9nj5lKxXmAwh3Lo0Jy
 wJVIBg/szWJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaXTPjAAKCRDo8jXPO9vD
 /77ND/wK3Mxk91/EOQVO3K7G05rArzUGrAXagRlfdG/EB65PE5NMRYeIIJGRLscO/NafHaiUjC+
 o/yzpZ4Tfs35e7ve9RQdoJfM7biGv/Q3B8KRBZ46jW4ViR3pHNqg+QzhL7GGlXcVESeoX2a6iZV
 EmfYzN3lSVnmL1uPyBVh/RD5dLpg9n3FhHuvwT3ov1RyQo1kM9preBUObk4BjDubqayB3EU2W49
 b9PKuV6x3aBq2r3Tup4oAolH8SJx4Q+LVHXUuHezO/ONqSMjFZUmX2PZlLJVh8TTFCFA1A5zflD
 y5GfSDKBDoCIpdIrGgliQNqPC/r4dsLLpykBf934A7cQ62ewPHUFNf4W0oeFE1n1/SGHw4igKM3
 jI0ykdRMjSOYZPOI9hklC3lW5oG0MiDnQXnU62JAuxjEOvPsUJJZA/YNm98rXOVkvXbV1zyTDae
 b4egigx9nvSEIG8Dl5nnS0UkRG+WVKcqWMSvOiEbJbvM9sSXlY0eiQAM6TVAq11nxgp10p3EQSl
 VZCk/19Ty+cUYjirg1pXRHlwEcYNRlI8J/SNNakWUbJRTCATOqF3xAWR7rLwxuCe/OD3/OCTOTo
 B9stx774sZuQ0b/mpXsgzUXwJTtl9s+KKZF/OUdgXkr0cBKDphBaxkUSrAatPisUEzeHH4Ijoux
 dTRRKayp4dxW41w==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_055636_633393_DC4D3BF1 
X-CRM114-Status: UNSURE (   9.04  )
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

According to i.MX 8M Quad Reference Manual, GPU_AHB_CLK_ROOT's maximum
frequency is 400MHz.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 607962f807be..6a25e219832c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1632,7 +1632,7 @@ gpu: gpu@38000000 {
 			                         <&clk IMX8MQ_GPU_PLL_OUT>,
 			                         <&clk IMX8MQ_GPU_PLL>;
 			assigned-clock-rates = <800000000>, <800000000>,
-			                       <800000000>, <800000000>, <0>;
+			                       <800000000>, <400000000>, <0>;
 			power-domains = <&pgc_gpu>;
 		};
 

---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260105-imx8mq-gpu-ahb-clock-139ba9ca9a6c

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>


