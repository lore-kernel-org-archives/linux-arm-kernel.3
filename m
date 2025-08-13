Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB60BCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 09:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9D6xojEEEt1DOf1LmhEk9dJZxpTEn0iwsR7aBRr2FSU=; b=jmkgXKcO4atl44DLDIToOBMNJz
	8teeXX4FOcuXZ85GlQLCPX34UH7cp4mx9IItkd6YWTHxgSpmk558WKgZ7F3obqLHHzfT8ZvGB9JYE
	Q9ZAexP4oxm6uJP0Wnn6WP9f+QTq4UNa6djzIxA3Nk4u2xR+CM34r3MPTAa6+9ZArL7C5QRUH27OV
	iXZh9pJuPvcTn234pkLS9/6kzvMENZXTAv245z6SoZml01c/VY5FgatmvXkMJbH2iuC3MNFPkUDyh
	dmQ7VJddLWBoGIL20RMJ/EahcgSlMLqy/vXrowqqFc2fKLoJC36DtyCmxgG8pC8zhrKSIRgt8cMQY
	p4YccJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7vk-0000000DFAC-2fZa;
	Wed, 13 Aug 2025 09:38:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7lS-0000000DDvu-3xrK;
	Wed, 13 Aug 2025 09:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9D6xojEEEt1DOf1LmhEk9dJZxpTEn0iwsR7aBRr2FSU=; b=nuAnB4GYSsdOqcrQKxFCJ94xpx
	9SFayZQz8VVHGq2u4PJfp1r+2fSjKHIJfYOWh539+vdzgvzGfuqkIMEWWCg/p79OfdX1ksWQvUP+q
	mF6c2VoHsditPju3DJrh5jdoW+3nnZq5WgQwkHvQF9rukjhW/I8WBkm5JxMzLYF+6KBeiPKOi+eR3
	dbza0g6XH61BjvneYH7ioCFFdtZMsBuEEFGTvA1pVCJhR71ruyWu1IsAwigPslPqVhQcyiiY0gkvo
	QCBPGEhlv1NwvuQeJ23Br5WGwOOO18PfGh20KW7HFasfD/lqAEN+DbokhQWIEHr8vJkmC4cJVgTED
	t/b+S2Yg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7lP-0000000G2Cm-4BJh;
	Wed, 13 Aug 2025 09:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755077214;
	bh=GsBiIB+JAKlRgMGVDCXXiu9HEN1btXm7zaeu99PDBiw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YgjV8UbgInZG14R44PY8w1qjPXDYCOfIxQso2AT+Dm7tJXZU7/6mdMSrYBjJArAbc
	 DhsZCNdfQvOFkB58fu2g15cm/PQK6VdgYzplBSf+V2OKVTH/G5mG85NgPFEq/ycOaT
	 nn+NWzTl+voiFrxOhh5RIncw+wlPThOcFsslMVi2I9FTVQuo3KcuMIQUtwa8OmkWoH
	 m3wOr2agpiDtdo6TAYKQTp4YFiGGF3p2fgI80/3rsbTHe3cKm13zbdynKCJiKscxgF
	 VHWYKtThLmBcyi+RXmtAsKZSmDEXURcHvmnkcRalQM8+yiElX4HX79g/9to4pd4Mr4
	 jtiMl6M5Q0NGQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C506517E1014;
	Wed, 13 Aug 2025 11:26:53 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 13 Aug 2025 11:25:44 +0200
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8365-evk: Enable GPU support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-mt8365-enable-gpu-v1-3-46c44c6c1566@collabora.com>
References: <20250813-mt8365-enable-gpu-v1-0-46c44c6c1566@collabora.com>
In-Reply-To: <20250813-mt8365-enable-gpu-v1-0-46c44c6c1566@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077211; l=1054;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=GsBiIB+JAKlRgMGVDCXXiu9HEN1btXm7zaeu99PDBiw=;
 b=+MSuQ8H3GNnkHrrL2stWSQyx1La3ptro7rPiBYOu8PnLBhliqTgBGzlV1lU2fad/EO+hN5+NZ
 RDG4BUsw1v2ATJseuo7vvarGtDqgHdwxUoIU6TJ0pM92/SAQIsKq9om
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_102720_184595_9755CDED 
X-CRM114-Status: UNSURE (   9.32  )
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

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index c8418888268d982875b3aa1aff5551f7c6b5e339..b5dd5ef9fa11ae1d54aa754325bac2e184b90dd3 100644
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
@@ -353,6 +358,10 @@ touchscreen@5d {
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
2.50.1


