Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C010CEBF96
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 20:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dp/5wNhrbtwapW+ZRZXWBO5in38eZanyORlRgzGBhBc=; b=2D1NRsrRLsUdtn573GWolqNFz8
	wp7urLHJhjjq1trkHYtF9Pi9T6cRGuMFzK7oqbEZMQuQf1atRbCHN/uPLhu9UaNHceR6MSB23F0eS
	duZHYav3LpA2ox+G284FtCztSlYXPBNTHBqApE+2uDmTROe5XwdsCNUmzFe4JSRsInY97ez1myMth
	SztS27zlgI0gyyDL39fStMYW4a5Kzo6faJSFgDkmPz2194S3OG6P9qWigkC2setbRf4ec3pZlFGVK
	aXriLL3FHLpuRq1zu5ySESkRdOvngvLcP97V6D4I1moVKD0TGdXBsGC2hZH8xT5SGronzDTjoAXOC
	/MlG6wXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKNME-0000000E5RM-0u8V;
	Sat, 15 Nov 2025 20:58:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKNM1-0000000E58h-40C6;
	Sat, 15 Nov 2025 20:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763240314;
	bh=haXHZnrCQw87Hh0XlwT4Nqlq0lDr5SGoeyDsPgAcJ6c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TOoV/J7cx5DpMaFvAYsYvaD9LPvgXxNp7YzX6WYjs3cvvv0YO0wkhBXGgOmqU/Ik7
	 citiTlK3d5z1LTbYuHmb6MUtRogL7OxbF6U0iWhIn6Y4MvG2zgv3D7DL0apFPvVNzW
	 BPaVnpgrMw1xz2XZajY8//z15GGj207k1X6yywHUMOTQab6fKfaJi5WtX/PrgK4nC1
	 /HZAdkTMK0OCovro7ffLfFUPelI1Dr3XCSA48/7lOpabn8tVXe3lA3tYWXZpkwiwmJ
	 qPKcMyPXAONT/3J0p/TPOe38lIR5eCa/W59LppUe1I2oE0djAJ6RZheKd5/xiQ/XHK
	 by8Tbx2CrPd5Q==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5C9D17E141E;
	Sat, 15 Nov 2025 21:58:33 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id 3FC51110527E9; Sat, 15 Nov 2025 21:58:32 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Sat, 15 Nov 2025 21:58:12 +0100
Subject: [PATCH v4 09/11] arm64: dts: mediatek: mt7981b: Disable wifi by
 default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251115-openwrt-one-network-v4-9-48cbda2969ac@collabora.com>
References: <20251115-openwrt-one-network-v4-0-48cbda2969ac@collabora.com>
In-Reply-To: <20251115-openwrt-one-network-v4-0-48cbda2969ac@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-phy@lists.infradead.org, netdev@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>, 
 Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_125842_182365_C62C650B 
X-CRM114-Status: UNSURE (   9.83  )
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

Disable the wifi block by default as it won't function properly without
at least pin muxing.

This doesn't enable wifi on any of the existing mt7981b devices as a
required memory-region property is missing, causing the driver to fail
probing anyway.

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
V2: Newly introduced patch
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 6be588be3761a..1f4c114354660 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -499,6 +499,7 @@ wifi@18000000 {
 			clock-names = "mcu", "ap2conn";
 			resets = <&watchdog MT7986_TOPRGU_CONSYS_SW_RST>;
 			reset-names = "consys";
+			status = "disabled";
 		};
 	};
 

-- 
2.51.0


