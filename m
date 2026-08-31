Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08ADC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 14:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnvpSNIEZzbKWn88EPMUeC9zeBP1XptFiHN1MhOz7t8=; b=Nr+U8KTjPUAStdAeFGGTFB2zbE
	vP5vrh/h4Tfg/itSxX/dW6/9KJ3qYgeWbrmP7unsZCpJeNUlz4qPW7XuhAx3QbZfKo3l2R2HRfYhr
	nxmU9DIKS6huxnupmMGFP9OYge9mrRD3pB3odFH6y1GD+FrkSOqKYJmQRwqOuGlfR1+JufQR46BLf
	Iv76xr8BGbaEkiug3USQDXOKjfxBheXwB+a3AVeq5i7PEEoONA4404TZJge7kY6pou/O/wRPxNQq9
	z3ChOAzONCoS48cJRwO8v1+8huX6mR7wRWANBJh2y5Ke5nCPcCRKTmVAp8gRFjXqNNQ2gTL1yFJx6
	UVoIs+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12sx-00000009c4W-2aqy;
	Mon, 31 Aug 2026 14:21:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12st-00000009bzB-15dN;
	Mon, 31 Aug 2026 14:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788186064;
	bh=FhtiaZ2Qzu9sS1DBggkgNh9n1DpPL5VKV7ZWJoFJtDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H0wWhTgsLb88QkkUHetTPsq3zHZSSM7eJKZgqCdJHIvwhwnpb3gse72alyDDqNN0z
	 muuSdx+6PFaXxsEljeK0aMT9etOyaMOafCt1t5E4HgvjQOSGpOmpQCExjWy7FfJUXJ
	 l0HHoe2KYiG/OqbbC1lK4DKcJ7IXUVIeVsCWpyPsngHycbKG0FVJcGNYTCP5IfRz18
	 SaQl+NaEI7ovxWXrxSufT1tfZT2Sc5effjIRS45GXVSaxi5kq79SR4uwrQb58RYDmL
	 DsfqFIvMPeuGhCRi4Pu0an42jWayVG14rlu3Wd70+8EGsL6fQKjuzHyFt7CAmGT90/
	 37L6en3CDcARg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED1D617E07EF;
	Mon, 31 Aug 2026 16:21:02 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 31 Aug 2026 10:20:49 -0400
Subject: [PATCH 2/7] arm64: dts: rockchip: Rename rk3288 HDMI audio card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-fix-rockchip-hdmi-audio-names-v1-2-5b155ae05293@collabora.com>
References: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
In-Reply-To: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Johan Jonker <jbx6244@gmail.com>, Alex Bee <knaerzche@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_072115_457389_CB640E46 
X-CRM114-Status: GOOD (  12.03  )
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

Rename the card from "HDMI" to "RK3288 HDMI" so it identifies the SoC
in user-visible ALSA fields and no longer collides with the identical
"HDMI" string used by other Rockchip SoCs.

Fixes: 2a91dcd5be9d ("ARM: dts: rockchip: add HDMI audio to rk3288-miqi")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm/boot/dts/rockchip/rk3288-miqi.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-miqi.dts b/arch/arm/boot/dts/rockchip/rk3288-miqi.dts
index a5f5c6d38f80..090255244c86 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-miqi.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-miqi.dts
@@ -82,7 +82,7 @@ vcc_sys: regulator-vsys {
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
-		simple-audio-card,name = "HDMI";
+		simple-audio-card,name = "RK3288 HDMI";
 		simple-audio-card,mclk-fs = <512>;
 
 		simple-audio-card,codec {

-- 
2.55.0


