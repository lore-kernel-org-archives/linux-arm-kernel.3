Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C411EEA71B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 01:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ub/LM4mSa9Y9f6qyXrsX8koH8Fds31RXZLT4tZZdr4o=; b=2OJ7O2qXfENgNm9I0cL4l1Hrci
	6Jyx/gWE8dwMqEQHRs7+HRGnTvsOR82R4wDcv7UrW9CfgLZipCnxk3nv31DYSXKdQVtltvhvAe6zN
	sSb0Z17nKGYOvtE7FNJXxvUIaOTNzeq6EJ8xDFKKA0OSckCuqX6PU6zt85eucM+Qzr+kRmAa1g5Z7
	tuw4b4qKJrYNFle53IWyynOuJQbySgemjOrRPQE+XhrykpU4nqo34DxgBmN5iUi0ER8BpkQUTD0LE
	OOWfm8APrCgbOWYVN1xnWV7B886kHpvIdSMjreU8Ufjkcxc5VEFfbl1kxksqcofrFfjHzUs552Ilx
	WZwxWMHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEdDN-00000006GNT-0gPF;
	Mon, 20 Apr 2026 01:14:17 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEdDJ-00000006GJo-32Gh;
	Mon, 20 Apr 2026 01:14:15 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEdDD-000000002aX-3qvh;
	Mon, 20 Apr 2026 01:14:08 +0000
Date: Mon, 20 Apr 2026 02:14:04 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 9/9] ARM: dts: mediatek: mt7623n-bananapi-bpi-r2: add HDMI
 audio machine node
Message-ID: <854c8f99582eb0adf13d91dad8ded3faa4e753ec.1776646435.git.daniel@makrotopia.org>
References: <cover.1776646435.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776646435.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_181413_762698_C6EF642E 
X-CRM114-Status: GOOD (  10.31  )
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

Instantiate the mediatek,mt2701-hdmi-audio machine on the
BananaPi BPI-R2, binding the AFE HDMI playback path to the
on-chip HDMI transmitter acting as the generic HDMI codec.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: no changes

 arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
index a37f3fa223c72..139a76764faa0 100644
--- a/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
@@ -132,6 +132,13 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0 0x80000000 0 0x80000000>;
 	};
+
+	sound-hdmi {
+		compatible = "mediatek,mt7623n-hdmi-audio",
+			     "mediatek,mt2701-hdmi-audio";
+		mediatek,platform = <&afe>;
+		mediatek,audio-codec = <&hdmi0>;
+	};
 };
 
 &bls {
-- 
2.53.0

