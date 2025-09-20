Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D673CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 16:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q80w6XFXvELBmPWUOgcqaqJi4m55PNVCe0OHmyFN2Vg=; b=4ldP+CZLFh0Jvkzr0ptb7rwBHV
	aqf8eoTcnfqq8vZaEjk2Ajfg97zoE/0WuRVL5ZcEf6ihLLUiY80t13oFFK5oalM6ID5WjBgfbQnJ4
	DPXxC6LUO2mqpqLDuPF+8BpmO8G7z3pwaHkskLNhYHn/Nlg4WbHx+9e9F0IMMqZm1Gt4sUtypgzIs
	nqPVvKbWVE/CHojoXi/hCcLnS62pZk3UCv4EE1uFGaKqzDdpZJelV0/C2yLkdN9YrfuABeaN399zK
	WwEYP9mU/cQYEDR958F8UsybnaH/1VpLMfHgbFBW8Xkpn6cBZUCk9bT6GwHi3lueeK9CM30ieUSr2
	WG1yIcuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00Oz-00000005cEo-19yf;
	Sat, 20 Sep 2025 16:25:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00OP-00000005bgY-0uFS;
	Sat, 20 Sep 2025 16:24:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF937601B7;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 664E6C4CEFA;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758385493;
	bh=wmglTdOzvnu1osT4KrcPRK2F9+u7HUzFQhkD3GLaJoM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IdpzhaREvgAq/lTr4gTriUHIyxCA3wqGmRdDHZSvTQatSslcjFkb5ur8pnBWSxY6h
	 JJhWA+W6+ABPPkryP6N5+e3VSr6s/egFk5uY7dcJ7PhtigMejK88LhOCxoYrEfrXuc
	 umY7loUIaCUZZQj/REdDP1gktzuOIhHHFyR3M/WpAnZcwyUOaPbxcgf2c/Bd4u8V58
	 1SbwTGMT2ihdEFabJstE8mUaHgJ89KFCESLZQg4ent4JnDpe/Oi7KIqBjrilMF6h2+
	 tkMYGWtKFtbIllPovDExgiuqe3fGYb/bNl1H0zgfDCYavbG2XvkNg4Gl1yWR7kjD3c
	 mjbIaqBp4XVOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4A5CAC5A7;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sat, 20 Sep 2025 20:23:31 +0200
Subject: [PATCH 06/10] ARM: dts: mediatek: mt6582: add mt6582 compatible to
 timer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6582-v1-6-b887720f577d@protonmail.com>
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
In-Reply-To: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758392693; l=1128;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=r6SXHQbEHcaMnuM7G635DvBb4GqKr2d885SMc7iqSiQ=;
 b=z6YTtrGMN5Tgfi5hnkCwEdqfPbpmjia5G5oRbA2+IRGF5mPfUNLHlgAQk0ZuNJvauGoo5Me3t
 R8K3WtIxkAJCQdUJ9uVrnv16xY0b3iunHZm/GNJ2V73/uCjtEtDAHBq
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
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
Reply-To: cristian_ci@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Bindings already have mt6582 compatible for timer, so add that to DTSI.
While at it, remove clock-names property (which is not required by timer
node) and fix node address.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6582.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt6582.dtsi b/arch/arm/boot/dts/mediatek/mt6582.dtsi
index 8a14dc1759d6f65fa75accddab83c1b6424d1632..54d675ecb390c52c7ca0f406155bfc59e32137ec 100644
--- a/arch/arm/boot/dts/mediatek/mt6582.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6582.dtsi
@@ -66,12 +66,11 @@ watchdog: watchdog@10007000 {
 			reg = <0x10007000 0x100>;
 		};
 
-		timer: timer@11008000 {
-			compatible = "mediatek,mt6577-timer";
+		timer: timer@10008000 {
+			compatible = "mediatek,mt6582-timer", "mediatek,mt6577-timer";
 			reg = <0x10008000 0x80>;
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&system_clk>, <&rtc_clk>;
-			clock-names = "system-clk", "rtc-clk";
 		};
 
 		sysirq: interrupt-controller@10200100 {

-- 
2.49.0



