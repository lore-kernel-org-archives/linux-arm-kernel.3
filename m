Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40793D16819
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uF6AIs/uH4tMjgKmO2ECJOwP/Ue0TTC6JhmwVQ0vNDo=; b=c2rN0jTCsBzh3BVeqaUMYp0t7H
	rj28L4/8aBJMJchKuUg6H1EUS/C76gJ70g+91gf8fwZUd28IhKzxWnj9839cw5oBQPM7+Jk7B+i18
	W7CQjzKRDCpG8nZ8JOonfvAA+scBYHBrOGg/VLAG+OmCzTz8J93raoyJ9eMppoQDeB7S/irdDwhG3
	VoY0oDkD4h9TSHWLOIULcUcCE6EQp1mcrEeTXhxRWuykok7rko7gl7ewQYAeFP/e4LkG2k/k3JUH6
	spGH4KfOwMOEOCnbUBZ/GTaVaxA2JSzsqtbNSI9NOrI0l0SaoTN8PDwIi2clyc0moPXiNDDtFFcBo
	SrREXQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyS-00000002F9b-2Euc;
	Fri, 09 Jan 2026 11:48:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyJ-00000002EvF-40Vb;
	Fri, 09 Jan 2026 11:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767959281;
	bh=OzoPO+OLSyAg1VhmUybHI1KvXEqvQKuV5ZYinEoXMrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JS7uinolBEIm7Lo+Qf8egLoJljMqYqx93segk2IjQ3sI7aW9eKG8WPlxIfFMYPRaS
	 KPj7B00H/csozTrgZt4xvL4Y/gcLsT92xDLs472Z0t0eunpe/+R97PTKvCSRXaTFhH
	 FfzsSMlJifdsEmg0134ozgk6K0b0DrYralTjxyiFKfiSB6MYwO8aDWY/SM5qN20MeV
	 NQWppDySceCgLd+AeP8Un49atmRbsI4XcNLYwJoyhPtxblmwTNdZ7Pj5QTYuhWwFVd
	 WpxtpX5vQZuXIDfljdW894V6jykiUqROoQUKznKAFLSaV6vYTMcRcu86HmFI2kMNL5
	 m2ZKoo/H8vmOA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A5A017E1380;
	Fri,  9 Jan 2026 12:48:01 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sjoerd@collabora.com,
	hsinyi@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 09/11] arm64: dts: mediatek: mt8173-elm: Remove regulators from thermal node
Date: Fri,  9 Jan 2026 12:47:45 +0100
Message-ID: <20260109114747.37189-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034804_199953_D8348C2A 
X-CRM114-Status: GOOD (  10.99  )
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

The only reason to have a regulator in the thermal node is to keep
the CPU cores up while reading temperatures, but this is incorrect
because the AUXADC Thermal IP doesn't need any regulators to work,
at all.

Since the thermal node was inherited only for adding vregs, remove
it entirely.
This change is safe also because, among other things, the actual
driver never used those regulators anyway.

This also fixes a dtbs_check warning.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index dc064cdcedb5..a0573bc359fb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1147,11 +1147,6 @@ &ssusb {
 	status = "okay";
 };
 
-&thermal {
-	bank0-supply = <&mt6397_vpca15_reg>;
-	bank1-supply = <&da9211_vcpu_reg>;
-};
-
 &uart0 {
 	status = "okay";
 };
-- 
2.52.0


