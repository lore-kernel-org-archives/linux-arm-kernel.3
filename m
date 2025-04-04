Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49353C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 14:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcC3jY9t7rWHI1JdV5HdccIzp/0UOh6MtKiHt8OK7P8=; b=zHnvH1Ztp3tFr8umVlGLWYjzZp
	ZXOLm8WjwTa/u4Bpghuh5pY6kVWXf199Cg3tDoTHH5u6hsCFxFbmvKDAZY0KNdjtpjs676mwa0egW
	drWNyKDAQWdR1F8Wfb8b/0UiV9CwfH70V9bSbaaDkb6SULZ0z21+xiPcs6AY4T86x0cCuR8A/bi5p
	S4Dy8hceoZFitSSRItUGlGMW0xwk0yAljRrGlOOasriCJqx1G5EYYGaBkxWUJkKXDudVYJNC7szfI
	HyJQECyY+8bh8Ry9wJ7ZWMaw/njy+OPk21GCljLCCNLFii5MVbHCcNwNpLl3ao9LyKnvSQxXhEkuP
	VGzxd9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hdI-0000000BvZA-2YXH;
	Fri, 04 Apr 2025 14:02:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hTt-0000000BtgB-4BiA;
	Fri, 04 Apr 2025 13:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743774792;
	bh=sG0vqdLw3qhfx8d5puG9lNUlzh/5nZPv9uRQEdtxBJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MZo/LraTabjLqvQVRuKK/N+fXRFk/p1rx2R9KGBWUm+r1NVdKMZf+ceed01Z4gW2l
	 9s0xYIqXEESFAm30xKg1GXhhsXoOQ95L1US7hNm9SKPN45Zf2tbwQJobFPKva0C7JM
	 0dbkI4K00oCDD1nTKuAcQ5/Tr9dUJXvTvUNN4huogWJen3cOx/udDFl7qMdUEgbJMs
	 AlX1UrjsWnWlMnuWgxWlVYNG+ze4P13oXgAQ4vWa+/pbp0lT2wOPaxpjE6QC6lZ6sK
	 38lX880ZOU/3PcgVkZ+65DoNzzrUyAI7ubaipvmwjYQ9hXR6FqIcQbDwqxnxL9noNI
	 nfXOZH27J6dDg==
Received: from apertis-1.home (2a01cb0892F2D600C8f85cF092D4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A8A6C17E07F2;
	Fri,  4 Apr 2025 15:53:11 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 04 Apr 2025 15:53:09 +0200
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8395-nio-12l: Add scp
 firmware-name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-mt8395-scp-fw-v1-1-bb8f20cd399d@collabora.com>
References: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
In-Reply-To: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ben Lok <ben.lok@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_065314_213254_F7E55623 
X-CRM114-Status: UNSURE (   9.13  )
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

Set the scp firmware name to the default location.

Fixes: 96564b1e2ea4 ("arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board")

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 1c922e98441a1aadf0aa3cdd76583a70401a1fa3..f2eb1b683eb76f783f5a13f28a78f6e33238b5f0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -850,6 +850,7 @@ &pmic {
 
 &scp {
 	memory-region = <&scp_mem>;
+	firmware-name = "mediatek/mt8195/scp.img";
 	status = "okay";
 };
 

-- 
2.49.0


