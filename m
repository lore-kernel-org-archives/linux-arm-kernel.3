Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752B0D16819
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzAReR1091Le0SVSkp0tKu3QEn+e3skDFjvhBvZNaZU=; b=IIjGs2UglkEBAjLjMCvmV5epnf
	kGMiPM8PPNrCLpkfQJa81uG9QyCoOH930ONstO3lVkbHjid0erKr048zoRAovv4Hr5SrqzFF8HLO3
	DYVDYh7FvM6c6Yx2xNK6aRCvOSDcmSneEfAWkgXu+tKrmly1mNUMfv7z5DnzgndTL1YhRLvFUmwrZ
	jkP8Ho5ebnEpzy2dqkH8s//exgBIQVqgSDJ9ULhn9mJjqndZXDu474agynWriD8jGH/sRwAFpka2e
	a8xpZJpyM4ieZEAs1o7tkxnN1g+jLsmax/MJ/z4Cg5GACFTEX4aO0NP1Os17fO9JfOsCMoK4Xphbn
	EJvYGZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyO-00000002F3E-2mfB;
	Fri, 09 Jan 2026 11:48:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyH-00000002EtL-0ARP;
	Fri, 09 Jan 2026 11:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767959278;
	bh=JQQ9uUUWvTOcI1b1QPZrc3DbM5ir8kQy0SvCXacT88Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ezHg/MrlBwvAX5TCyKZeL4aT+MfexfD7YZlFmW5gpMoVhZho38c3jn6PuhHxyweac
	 ehMoOUvBAY/0BKtP6TlRR3TVvMpLtwjRBPo+sABW1VdPGa0DtVnrsV1asPat3On+Lx
	 qU7goiY+x+NNjtB7lQgzjrRnFqzcF1CJBRckgqbHXMOBph0NOAl0OjlvaoOQrKnnzu
	 hjwoD3Mxlf2SwtG5l75uaaliUUB0psAu4qgweNBP7Fhy1Gbzqh1ryMUCIqE70ZQIfA
	 lLxbJw9dMv/Qk/Mf4EXSuE3m8V3cBCbYH/Zb2o6myXBujXaEioSoRiVlyd3T7ELN14
	 sw8y4o/sRmimg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CBB8C17E150E;
	Fri,  9 Jan 2026 12:47:57 +0100 (CET)
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
Subject: [PATCH 04/11] arm64: dts: mediatek: mt7981b-openwrt-one: Remove useless cells from flash@0
Date: Fri,  9 Jan 2026 12:47:40 +0100
Message-ID: <20260109114747.37189-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034801_243728_57DB796F 
X-CRM114-Status: UNSURE (   8.47  )
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

In spi2's flash@0 there is only one `partitions` subnode: this
alone makes specifying address and size cells useless, but then
this subnode has no address and no size, which even makes the
currently declared address/size cells wrong.

Fixes: 869b3bb5ada2 ("arm64: dts: mediatek: mt7981b-openwrt-one: Enable SPI NOR")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
index 3de368c73bc8..48b80af90438 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
@@ -213,8 +213,6 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.52.0


