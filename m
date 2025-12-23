Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DC3E6F090
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 12:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfaiHxIYIp3N/DeWYX1DmUBsP56Xds/2kQwokJP6mwE=; b=oBiHugfGx/SViqAIWbFc39Iz2M
	jz4e4TBHafeM91Nf+R83m2TyR0G8a/4PTcaOv7LU7myxhkh+nRGg5U+Bx69SB39EYur17FoXt8b8Y
	6Hg6XZ3RzpHj3MfLU9BhPmHsp0D8Sqzw4N2xn/dL2mLPDo7ncntKQjnZJyA2Ex6jVMXzBsC/lHizD
	GrbwOzFczgvzzCewYzdc0frLBO0FaLdIjvUlHjZSmGQkBQUjRB4iCdNxYlfhmSrrIWI8KVpvFjFra
	Wo+I1uD2yGzJd4vy71Tv9cvKopnCA+8gC9PCOFiGBWqMN7EXFC1DuDvICktbUj8QgBDAvC4D4h7vl
	lTEo38pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1ee-0000000FTd6-47dM;
	Tue, 23 Dec 2025 12:38:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1eV-0000000FTUH-2mTK;
	Tue, 23 Dec 2025 12:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766493489;
	bh=K5Nj+BYQPFzSaJiXTGgmFgtyYEa4HLdec7n2eRuB2Tc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QXNvcrhTYXILhwMqpY3ljwG2I38H2MrXI7HIFkhDASQQBNSRDG4HIfWn9A3x3b8Oa
	 Qvu73DqtmF/L/hN0uXQ2NEZKTV6OtLXxFGQE2gEIG9zlX8s01ndlRPyhA6A8Pr+i85
	 /t8usTQRYKEUdGxGI9di8JdCcDhJGLfow6J1/nzOVtafjGNRvxO738SMQTGSk7T42D
	 cJTyx1ZA6XWJxJxqhwZOskEeGixJxxqjzPY5t3tbhC9+jdIShLFAlhm2yXptpoS9ao
	 Z6nS5BON0QtNBZuV3eicjNNXVL6nQyeWZMv3yp0vxMVyklrJU4myaZ/guQbM0cgjs5
	 WsAVwQtshSdxw==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531:0:f337:3245:2545:b505])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 259A117E150C;
	Tue, 23 Dec 2025 13:38:09 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id 5F8C4117A0679; Tue, 23 Dec 2025 13:38:08 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Tue, 23 Dec 2025 13:37:56 +0100
Subject: [PATCH v5 6/8] arm64: dts: mediatek: mt7981b: Disable wifi by
 default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-openwrt-one-network-v5-6-7d1864ea3ad5@collabora.com>
References: <20251223-openwrt-one-network-v5-0-7d1864ea3ad5@collabora.com>
In-Reply-To: <20251223-openwrt-one-network-v5-0-7d1864ea3ad5@collabora.com>
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
X-CRM114-CacheID: sfid-20251223_043811_911554_CD41BA69 
X-CRM114-Status: UNSURE (   9.59  )
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
index 6be588be3761..1f4c11435466 100644
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


