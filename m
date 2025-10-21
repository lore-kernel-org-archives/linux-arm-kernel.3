Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1052CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4g2x5xGumaQy5GWFg7QREkyDoRsz5KHGgy2XdyYNds=; b=XLM0MIWiaj6/zaacn6v5xkqpT4
	xBiLlkXAW9Cx//D1LMJjMD06p0mfZOysSKBJXb7ccHAkCAOtNOS/6wRS+xwAhQxPY34LGANfT7MFv
	jQ3maj8H4qhb77XuJEUoASPdtuJqmuEWA+F1oNnzbp2hjrRSMpbStKAv0QZBUcxValXMgEeeUE6TL
	BToOxPMOl348NnbGda3XINlM3ETAsXFskbzh7Ls0/dYYetUJDDeDuwCID/Z8aXyYtZTH6xkvJn9fX
	KX28+XqwNQ8f9Z/kTXY0862d3Q/NmghyZOqonX9RJIuUcP/uGsztTmKLd+iFdQ9I1NK2ue8dwYC+B
	+c2559Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6qb-0000000G4ta-0Ge6;
	Tue, 21 Oct 2025 07:31:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6qU-0000000G4oT-2MKu;
	Tue, 21 Oct 2025 07:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761031908;
	bh=qr9XyEgoKDrOvlQ/a4EvmrD00l7EvEI7RmtYodAKgIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dW0gTjgeOApqnGqmEI57D2DqO0dLmHAF2ruzdQQoe0xxt+dy4PLcasIdyPbR6HG0M
	 Lv0N9El/lXwuwcdtP3baYFAASpLznKjJVFzGHzrrPddXI9d+GrifdBJQbgOWd84CnD
	 tsHOVG1yVeJ/xvC8z/hKQgKS7jT6ZsP+OIlj+U7pAXZOHFZRVl+PehVydDi6yZPSOH
	 6C2kEb9w8JrpQkWd1cznIflMWViMXLIleiCQvxdFWgRZbsTfJFoet1qAajhlcEOZ4t
	 EbqWu00tZ+ZkOYHrGfaLS3nYoixj0yblyor/1v6rnjZGReJ9HcLYNmPen+TxPfZqra
	 GXqqXZXkldPPg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF99D17E1404;
	Tue, 21 Oct 2025 09:31:47 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 21 Oct 2025 09:30:53 +0200
Subject: [PATCH v2 3/3] arm64: dts: mediatek: mt8365-evk: Enable GPU
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-mt8365-enable-gpu-v2-3-17e05cff2c86@collabora.com>
References: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
In-Reply-To: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761031905; l=1137;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=qr9XyEgoKDrOvlQ/a4EvmrD00l7EvEI7RmtYodAKgIY=;
 b=BTk5evTjx76vWj0BG4kqs51CoKzKQA0I1u53jD7R8c+No3fzOaD/cj8PcW5jg7FGhngEcjNh5
 lfTS+ARGzmiB2mjtHq+TygszS/qCGstK24Iinm/XVo45JtYMCefdsmE
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_003151_650439_E86441C9 
X-CRM114-Status: UNSURE (   9.48  )
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

Enable for the Mediatek Genio 350-EVK board the support of the
Arm Mali G52 MC1 GPU integrated in the MT8365 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 3de04ae70cc5fcd203a9cb745dfb3575ace66801..92ecde96dfeb4bdbc85a8fd869b405ef6cc1cdc0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -284,6 +284,11 @@ eth_phy: ethernet-phy@0 {
 	};
 };
 
+&gpu {
+	mali-supply = <&mt6357_vcore_reg>;
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <100000>;
 	pinctrl-0 = <&i2c0_pins>;
@@ -354,6 +359,10 @@ touchscreen@5d {
 	};
 };
 
+&mfg {
+	domain-supply = <&mt6357_vsram_others_reg>;
+};
+
 &mmc0 {
 	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
 	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;

-- 
2.51.0


