Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19088C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgGRTDjgzyBASmXyqLVxIYbx3Q9UYKd/CzI0L2LV1d4=; b=t6jCam/RzT6UyYpaEwBwOt7dz3
	vOiakcXZNl+SuJ4h6DhG0GcTQjdIhoLk//QLbF94NBDH9gI+ddXnOc3rRgqix2J+qyDN6Ll6Hphld
	OQnu2TwWFlfPk9xeU3ZEa2I+1dKc+RtGMo5KA999OT6lue3M2NIIgVWvpFhOEzjmoLGIIdFlT6CmR
	lcfoy42DSl1zZYgxzPjbRhHobXWlCP+e3J6kRl58juj/L4v5uwzDwWxxVkA4zZlEDVkLa096nOxC8
	oC4pOnw2/Iw12GluldXRCJOrOuvXv8EevU55rbEyVdo025YvanbygJSC3Vv3zAKZq8KsJx/w8O3Tm
	y/mWJ1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6O-00000002dxZ-3dFX;
	Fri, 02 May 2025 17:23:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtU3-00000002YPe-1Wlq;
	Fri, 02 May 2025 16:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746204210;
	bh=ygx2bzlBgpHjz1t7Ya2NDxpOQ/Eveinyd42eds817pg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q1B+zzkpLiAT/IBpIvW7htAZx20VHLTySJOBTzYHqwk+TH6dQ0Pe6AiPO20GtF+FO
	 sgvYCFkgNFm1sCbT/KBekn5a2/oxtB6g/LDSOhGlFQ+fsG5IskGTEAs7MTE8hGDySt
	 uCakBdm8dsU0mOu5xjcN16OIPtgGEMtpn5kP9S6WrlGhe34bzrLPXuNk3TKbfGFxR6
	 yWcF+Q5HkbEVQ9c3doQW6RR62S2INKAa/O0SXSU3zD0JYST73UJf615bBRCR0XVbue
	 ph8cvwttJlHntLirMQ9iEyNBO2eIj2vk7U2eifOxk+lFWDOdRGKAgTs5vWjJkitR7D
	 EWqy+WTxvnQ5g==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDDB817E125D;
	Fri,  2 May 2025 18:43:27 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 02 May 2025 12:43:22 -0400
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8365: Describe infracfg-nao as
 a pure syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250502-mt8365-infracfg-nao-compatible-v1-2-e40394573f98@collabora.com>
References: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
In-Reply-To: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_094331_551898_A2A8E72F 
X-CRM114-Status: GOOD (  13.60  )
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

The infracfg-nao register space at 0x1020e000 has different registers
than the infracfg space at 0x10001000, and most importantly, doesn't
contain any clock controls. Therefore it shouldn't use the same
compatible used for the mt8365 infracfg clocks driver:
mediatek,mt8365-infracfg. Since it currently does, probe errors are
reported in the kernel logs:

  [    0.245959] Failed to register clk ifr_pmic_tmr: -EEXIST
  [    0.245998] clk-mt8365 1020e000.infracfg: probe with driver clk-mt8365 failed with error -17

This register space is used only as a syscon for bus control by the
power domain controller, so in order to properly describe it and fix the
errors, set its compatible to a distinct compatible used exclusively as
a syscon, drop the clock-cells, and while at it rename the node to
'syscon' following the naming convention.

Fixes: 6ff945376556 ("arm64: dts: mediatek: Initial mt8365-evk support")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index e6d2b3221a3b7a855129258b379ae4bc2fd05449..49ad4dee9c4cf563743dc55d5e0b055cfb69986a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -495,10 +495,9 @@ iommu: iommu@10205000 {
 			#iommu-cells = <1>;
 		};
 
-		infracfg_nao: infracfg@1020e000 {
-			compatible = "mediatek,mt8365-infracfg", "syscon";
+		infracfg_nao: syscon@1020e000 {
+			compatible = "mediatek,mt8365-infracfg-nao", "syscon";
 			reg = <0 0x1020e000 0 0x1000>;
-			#clock-cells = <1>;
 		};
 
 		rng: rng@1020f000 {

-- 
2.49.0


