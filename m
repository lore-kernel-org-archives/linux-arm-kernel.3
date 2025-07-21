Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3866C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z0gKiB5QfkcIAH9TYUc4eTVrsgmC0ACXqwOh1MHM+Hc=; b=OicI2jeJpDBmhR1xQSXb03ENnY
	d8voGoGmf5RSqJUhKil9vuX26IW3GMLKmrHOegXlbVXsDGi4/Qz208sCxRM/W0QLqXBmM+XVtif8L
	npRWoL3ER9NZIzdvsR6H9UTRlMcN4ELnkm9tGPaWzdxIvxLnlKPEoQoNG0Om9p7JW6gU83njL5//y
	VnsoDYO73pwuJk5Vxn10t5Tn110wlbyC2ml0URr8yQEDsMr8LnDhHMjxIKOIlMfQVuTa7vaBtQCyl
	RVw+R/avh4kcLXFLaldRhX2TDCpAoz3pskrWAuDkgH0DJODQSoGUoSjBr4bxVw3fhNIK1eFYNncqR
	aUyPHy4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udorL-0000000H7C7-0ayY;
	Mon, 21 Jul 2025 11:39:07 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnJc-0000000Gu3L-2Hg5;
	Mon, 21 Jul 2025 10:00:16 +0000
Received: from laptop.tail0c4ee0.ts.net (unknown [125.33.218.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id DDDF23FABE;
	Mon, 21 Jul 2025 10:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753092009;
	bh=z0gKiB5QfkcIAH9TYUc4eTVrsgmC0ACXqwOh1MHM+Hc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=leLCp1BBH1QQXDygsFCkQca/P9qhHXHU+oSiTCTHd2vAOzcNnpcEdm5V58GRV2KEZ
	 26ReFlqGFnpIoF11BaBBBdaGlpJJcr4bAKGuMkrdM5icSYZ7bG8rxj255PGl8cUtLl
	 y6s+FZuvEE1VgcK+Dh9ZK+61JJ+fi/ydnzSj0GDjmCQAngCQDUHmFlj1WPFiXAzjnl
	 HJsbHaYfc7/58mwhxfOziYPhD1hYuQDNhrwEAm7uUXY/tLRB2hbqjLF4n9Zt9bpBTP
	 aKTz7CXNuTMy5T80NLXQxfTW1GCiWkDfj6t7ZhYAXfJHuhpodOpDt2x/PPj5F0cZ99
	 yIAkNhz5t1/4A==
From: Guoqing Jiang <guoqing.jiang@canonical.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jianjun.wang@mediatek.com,
	tinghan.shen@mediatek.com
Cc: macpaul.lin@mediatek.com,
	guoqing.jiang@canonical.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8195: Remove suspend-breaking reset from pcie0
Date: Mon, 21 Jul 2025 17:59:59 +0800
Message-Id: <20250721095959.57703-1-guoqing.jiang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_030012_964980_C1A81180 
X-CRM114-Status: UNSURE (   8.54  )
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

When test suspend resume with 6.8 based kernel, system can't resume
and I got below error which can be also reproduced with 6.16 rc6+
kernel.

mtk-pcie-gen3 112f0000.pcie: PCIe link down, current LTSSM state: detect.quiet (0x0)
mtk-pcie-gen3 112f0000.pcie: PM: dpm_run_callback(): genpd_resume_noirq returns -110
mtk-pcie-gen3 112f0000.pcie: PM: failed to resume noirq: error -110

After investigation, looks pcie0 has the same problem as pcie1 as
decribed in commit 3d7fdd8e38aa ("arm64: dts: mediatek: mt8195:
Remove suspend-breaking reset from pcie1").

Fixes: ecc0af6a3fe6 ("arm64: dts: mt8195: Add pcie and pcie phy nodes")
Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index dd065b1bf94a..50cf01452208 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1563,9 +1563,6 @@ pcie0: pcie@112f0000 {
 
 			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_MAC_P0>;
 
-			resets = <&infracfg_ao MT8195_INFRA_RST2_PCIE_P0_SWRST>;
-			reset-names = "mac";
-
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
-- 
2.34.1


