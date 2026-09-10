Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30090C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnvpSNIEZzbKWn88EPMUeC9zeBP1XptFiHN1MhOz7t8=; b=XoKi7XAR8HLP/jvKMxSoYK/ywD
	WFdz/OEIrLrbXmBKJMfY/1NrVPq4tyXaSNoAdSFTIlaHxcq1X/N+89ziQOBfZnQsOpQzT+/l6gp4H
	SmGi34s0uhBjXxSCTqS050batXLvBi5CKDXNjl21jM7YqFcmToUw5WIETSs+5vG1747Vreq7ncC4D
	vsyOKuyTvLHpHyee2KnmF4pArBtE+dBpUvB2qsPdIBRafenoctIpQvfAoLaR+uij6SkKGGW/fdm04
	DLQZmzVwV9ihskFM5UxJsY4JR3Mn+hvTF4hRPXoaN/9vMpTtSLXtemlNhuoFRALiB92iZ+C02bpf3
	DFDaL6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewC-0000000EUFr-15z9;
	Thu, 10 Sep 2026 13:35:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ew9-0000000EUBe-166S;
	Thu, 10 Sep 2026 13:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789047331;
	bh=FhtiaZ2Qzu9sS1DBggkgNh9n1DpPL5VKV7ZWJoFJtDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=duW9rHep6ao2ePurjh/DT6Xk2AluhQbDbizVdDqBhNGMhbpOh73CEtzYcM4xij5XQ
	 Z6fVzV7l8R0Y6yUOQ2OQGKRKlMySbeSF+48bAwUFRARgad12I9eIc+LrqqXb6J5I+9
	 AAjtgcwxzq/KQ53xvFCznEqvN8bte5GE/9qlwha9OPUbPob8YAt6yphO6LRdU9flck
	 T895qYGVOF1WegMjoSOuv94fk6p+3nrszsY3ouuO2BRpE3PPOmv5k5gFpOAHDhrPCJ
	 vzLvEBVPH4+2biz0D1XluyTUML/hR078aTMku8mFlvYppzfVmJC4zFmt3PL90rf+ye
	 duzr0IRAGZzog==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 32A8817E0EB0;
	Thu, 10 Sep 2026 15:35:29 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 10 Sep 2026 09:34:44 -0400
Subject: [PATCH v2 2/8] ARM: dts: rockchip: Rename rk3288-miqi HDMI audio
 card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fix-rockchip-hdmi-audio-names-v2-2-1396a6168e20@collabora.com>
References: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
In-Reply-To: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Johan Jonker <jbx6244@gmail.com>, Alex Bee <knaerzche@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 David Summers <beagleboard@davidjohnsummers.uk>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_063533_476363_4E3F1B7C 
X-CRM114-Status: GOOD (  12.20  )
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


