Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662B0C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9ZVhWybsQPBRrmpyo04d68VKV2Tp06jwUv8a+/Fie0U=; b=H2aEXH8oQWpG/w
	elGFEUu4aiHavNYyOHNIwGrM06R8YCnaShYIiJj/KN5DQ8/4K/owOOsFsZbjq81/jOpCdTp7ENsVu
	uSu4yWk2Ru7tJkfmwVBVr3V03gqWJIlwrf040nWqwhtm+V/Kg7ld8hdI6AKS3QfosUzbAgCJzt5lz
	bSiG4a2zwH2kScsyVLGkCUXG6y3UzEVqayFDqUpkEm/eU9ZLmvOLDTFTpYnU5n9o0s+h5ohkgGbo3
	P2dnRnzi5vH4t8GaJau4xXu4bZURk3CjCPyvCPFNicVP/bxaGJAOw8FNbSyWil6dRTSJRQYr0AGQX
	VTRPldllF4b4zYQTli9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hbZ-0000000BvLo-3wz3;
	Fri, 04 Apr 2025 14:01:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hTt-0000000Btft-3KX9;
	Fri, 04 Apr 2025 13:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743774791;
	bh=vR24AuULjA4+FsZtPLkXjrIG5WFlOIcKpNzCDaqBB8I=;
	h=From:Subject:Date:To:Cc:From;
	b=o8Eb81yclHsonFXupkotQQ545cCg1bjrcg/KlF+sm4DtYaKpbAjYczvlI2rBtAN4H
	 nhuW6IAhFV89ORMHep6ac+fbEaMXoPTLIlI1QRLFhqCqPExaDxvL0uibg15dbY/hqr
	 Xy5RSFQn/EYF2cxGGnVC5mXf5i1GSeAV+yboQPxsZN6afxxc5s17g5M0Qv6/ueYy+t
	 SwdUWIcIQOYpNR1QXuxNG/RVQ3jP3V2UkEK1aTOsKnREXoOKPqy2ZeAZSEYfImhwUO
	 MrWVS6HjZX9YlR9O+xrOAvEouLA/64+7vfkuVZXtObUTP5a36PuW47uyCzYId2rtm0
	 yFV0p5z0m7OlQ==
Received: from apertis-1.home (2a01cb0892F2D600C8f85cF092D4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E7BC317E00AC;
	Fri,  4 Apr 2025 15:53:10 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/2] mt8395 evk/radxa-nio-12l Add scp firmware name
Date: Fri, 04 Apr 2025 15:53:08 +0200
Message-Id: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAETk72cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwMT3dwSC2NLU93i5ALdtHJdQ2PTpBQDA9NES4skJaCegqLUtMwKsHn
 RsbW1ADuol6VfAAAA
X-Change-ID: 20250404-mt8395-scp-fw-135bd005a98b
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
X-CRM114-CacheID: sfid-20250404_065314_019814_11729DC3 
X-CRM114-Status: UNSURE (   7.74  )
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

Add missing firmware-name property for mt8395 genio-1200-evk and
radxa-nio-12l.

To: kernel@collabora.com
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
To: Ben Lok <ben.lok@mediatek.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: kernel@collabora.com

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Julien Massot (2):
      arm64: dts: mediatek: mt8395-nio-12l: Add scp firmware-name
      arm64: dts: mediatek: mt8395-genio-1200-evk: Add scp firmware-name

 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 1 +
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts  | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: a4cda136f021ad44b8b52286aafd613030a6db5f
change-id: 20250404-mt8395-scp-fw-135bd005a98b

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


