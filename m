Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911C4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wHwfsxRbTOa0gU9usTCXPDJPqT4eeQ+LjY91O9UILnQ=; b=ZopecbmwPH+yESFmvfymM8HPZI
	K5mcpmrTyZo0BmXnMtsxkIm+GC+a9h69mm77rNgVHJja8l9GYM5yv5vRjjCm5EGhcL6UzIW5fD53U
	tyMHL1k9h1AgDNFNBGfQ4sEOwr5sSG46r5ZNDmezq52LbzlGmJK3qZlUABSCJ1fHNqDpJpdfirgOl
	kBNhvFygaIHdkgWSeghe+jOkiIEoSUWhgMKNTYPMSRgIUr7KikFN7sXnHItBy3ZmI+Kgjzuvbn9Ye
	SqlilsnGggDbmX7+NXCXUuvX/TWfaLwgVHYmeP4UgjHfDK2kSjbizCOFbtNa2eHjEtT3XLvf/zW61
	ZIev9vBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkvp-00000001kg5-2YQl;
	Thu, 09 Jul 2026 09:20:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkvm-00000001kfJ-0HMX;
	Thu, 09 Jul 2026 09:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783588827;
	bh=IUXue47GQ8Gj1555jbfNOvhmcryaDDAxPK4/yzK/6hQ=;
	h=From:To:Cc:Subject:Date:From;
	b=KLL1Y9QIwZMKAm/vyXLdVsnTvvPMQtUUuk2Gs5/L2ivp5UJUbwq2PgnxN5Jf0Zc2M
	 XHTEEQZmyjwE5ISAlVf6RzcLmzLbHdgWskrbxkhX/LY2+oKPs7q6nG3YDEOCUNQOuS
	 BQ/FxMOaS/YtM7rlrr3Jz9aepeRYLtlGE4vGjwO5ZN30M//dYcemYYfyB4X36CadMw
	 ILpbKXYz58+2G1m0M33FNS6iih5RDgIN5PfPClnkhqlKSXmbODo+hKVwOzP4hVGIQY
	 i+MsAsJ8UdGoRDzsKbLyPw+Nx1kz6iy7EV3X0fEDkHmTk5fq+1Shj1SHepwbVsVsWd
	 ydq/xq7oIq8Hg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC52B17E0564;
	Thu, 09 Jul 2026 11:20:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bisson.gary@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: tungsten-smarc: Remove unnecessary cells
Date: Thu,  9 Jul 2026 11:20:21 +0200
Message-ID: <20260709092021.34023-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_022030_254615_331A1135 
X-CRM114-Status: UNSURE (   8.82  )
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

Remove unnecessary address and size cells from both the disp_dsi0
and the xhci2's ethernet usb device subnode to fix a dtbs_check
warning for avoid_unnecessary_addr_size.

Fixes: 9fda4a8a479f ("arm64: dts: mediatek: add device tree for Tungsten 510 board")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
index 9f5a0ec563e8..8256279c5629 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
@@ -265,8 +265,6 @@ &disp_pwm0 {
 };
 
 &disp_dsi0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	status = "okay";
 
 	ports {
@@ -1049,8 +1047,6 @@ &xhci2 {
 	ethernet@1 {
 		compatible = "usb424,7850";
 		reg = <1>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		mdio {
 			#address-cells = <1>;
-- 
2.54.0


