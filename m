Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FB0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 22:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mvJE2F/LhVZvGNRiTXRcKWvaRpS+WJkMCwL1+jCPbBs=; b=fSxqGE/wqYlJjJUj9BxGCsjLGc
	WqUKSDcs1BItqnz0HGzB35hp91fIF/83JmtZaCtevhVhsua5+0E71deDRZP1o0CZk44DVmG9DSEe6
	MVeaZFfsSYBrnPfxGH4gT+pXU3DRcW9p93xNxb+J/7eH7A4v7JzqAiDsCNuYBTpJ9oQT5eGDf6J4g
	q45eaYhAKkFrysS2jl2rMUNojLPkgoZcqz3ZVcnm06s2WUa8l7c/FZZUsyXIML+xBOpQ3xAjvXp3e
	Fq46cPBhWNlQ9y8lU71niHNq1XiCGHcROYoL9BnjkFp8oK8maR0tROPwUS7VzCeMMK+2355wWO/Ev
	uPFaooOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO287-00000000CSH-3VEJ;
	Wed, 18 Dec 2024 22:02:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO26z-00000000CJ1-3zYi;
	Wed, 18 Dec 2024 22:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734559302;
	bh=b8/+EC1VflEBJwonWHv7sJ5l8U3pVLGQLl8mOMAAZtw=;
	h=From:Date:Subject:To:Cc:From;
	b=Yinv4hCaS3DFAGjV3qEGKTaCWZyA40M8pTkq1kVoZnPlKkF4UZc+ublCLcfz9uk+g
	 mLHMlYvznSfiJhCYRk18GwF1VwcM7jCwqPBgwux0TZrF6H1A+Tgkw4Go/GKkYb8tmn
	 1QHpGQ7C6zT6xQK9i0ciDNWK+5+flxsJ5vaGJIZJGWYU0V+xYL0DAmjZbw7g82Oopj
	 hHauSBVsxFyYNBJkRHWNfyZK+7ZSvpPb5DeJBhIc3f+0/s7EEStKHg6z4b+GbJdtKR
	 yCzOE07aq57/5TyOUKUIaw0zmnXtm0NromkDbS0l+bPzEA/YWFFZgy9uNZYYTBvOKx
	 p/3yNxe3zAEUw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E3F7A17E3822;
	Wed, 18 Dec 2024 23:01:39 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 18 Dec 2024 19:01:08 -0300
Subject: [PATCH] arm64: dts: mediatek: mt8195: Remove suspend-breaking
 reset from pcie1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241218-mt8195-pcie1-reset-suspend-fix-v1-1-1c021dda42a6@collabora.com>
X-B4-Tracking: v=1; b=H4sIACNGY2cC/x2NQQqDQAxFryJZN9BEC+pVpAsZf9ssOg4TLQXx7
 g1dvs/jv4Mc1eA0NgdVfMxtzQFyaSi95vwE2xJMetVOVHp+b70MNy7JIFzh2Nh3L8gLP+zLLSQ
 8lW6AUpyUipj/gel+nj+UccN1cAAAAA==
X-Change-ID: 20241218-mt8195-pcie1-reset-suspend-fix-3e14122149e2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_140146_187757_CD5ECD35 
X-CRM114-Status: GOOD (  10.35  )
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

The MAC reset for PCIe port 1 on MT8195 when asserted during suspend
causes the system to hang during resume with the following error (with
no_console_suspend enabled):

  mtk-pcie-gen3 112f8000.pcie: PCIe link down, current LTSSM state: detect.quiet (0x0)
  mtk-pcie-gen3 112f8000.pcie: PM: dpm_run_callback(): genpd_resume_noirq+0x0/0x24 returns -110
  mtk-pcie-gen3 112f8000.pcie: PM: failed to resume noirq: error -110

This issue is specific to MT8195. On MT8192 with the PCIe reset,
MT8192_INFRA_RST4_PCIE_TOP_SWRST, added to the DT node, the issue is not
observed.

Since without the reset, the PCIe controller and WiFi card connected to
it, work just as well, remove the reset to allow the system to suspend
and resume properly.

Fixes: ecc0af6a3fe6 ("arm64: dts: mt8195: Add pcie and pcie phy nodes")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index ade685ed2190b7339d5daad55ce81c092bd7b39e..04e41b557d44810c5be097dab40b5b94f63b1843 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1611,9 +1611,6 @@ pcie1: pcie@112f8000 {
 			phy-names = "pcie-phy";
 			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_MAC_P1>;
 
-			resets = <&infracfg_ao MT8195_INFRA_RST2_PCIE_P1_SWRST>;
-			reset-names = "mac";
-
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0 0 0 1 &pcie_intc1 0>,

---
base-commit: e25c8d66f6786300b680866c0e0139981273feba
change-id: 20241218-mt8195-pcie1-reset-suspend-fix-3e14122149e2

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


