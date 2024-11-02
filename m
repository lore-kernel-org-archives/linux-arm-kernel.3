Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398A0E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 10:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dC+s2x2zpsTUqYLdynlJ3f94YiheKXfponBNvdNMjDQ=; b=HY9SVp+fT8P9yk7qpY6BTtWyVd
	P9+3n1K9Q6ue6t4J9R1BmrEfk0/3MJHF9sQ4ypjh03M30S841hfRmWkxa9AaQ8U0avhttpttOUcVc
	Obg7XuFqC80OXtgx6lkDN5yDctqTEBxxv6ao6QOGq19Lnp7olMavV6gLAahYCECXnPp5hnaE/U6WU
	hL1poyacLB4eLamaCKu2uqd1xFbygRK+VDLVeLlrYVRq7Qtjrd1f0R4TbVTddg4OhJv31xBSCwNbL
	3o1U4fK0pOrekO90ollBFvAorgqx76l73wUp9gZNZUWcym05qpvH7x9Ro3y3HKPIENUUUFz6/e+Kn
	ljT3MYtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7B7T-00000009Sfs-1O0L;
	Sat, 02 Nov 2024 10:12:35 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7B5U-00000009S14-1P8S
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 10:10:40 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id C8941A09BA;
	Sat,  2 Nov 2024 11:10:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=dC+s2x2zpsTUqYLdynlJ3f94YiheKXfponBNvdNMjDQ=; b=
	XgKiC9leoIhXmEAbZVWSBFsTDdg50PyWu8AvvLrkfT79/2cypQocCu0/JVzHzxCo
	FX9gFnIlOWM7C1GWp7tiaeNGmF3NMZUX9Na5G4NuHSzMB7LQRhxB+THIGQ3vHhrx
	EDKACzlA/6rvuklZxCoyXHRayFy5gtKxFQvFvCecArlhB4bTrvG1uWoCGt+7v0yW
	IN6j12Exu+LTCuYz6g1h6QzRnOot9Iq5oWJ4B/rq6Dx95iBoL8ZN0xSC+BDEUrii
	3XAlKVkg68RsnCofGSM5czpirf4EJKe0lrOCzUDtfnltBW1VCQ0aHQYoNzyqNUCE
	RLBlDY0vzTRfGg2fUbnHi6Ao5UDVxJG/mccJd3d2dyYNQJRLqfjVEVgPIFWA6Bk5
	JUfdtdfKQwDlGlrSSMut4vNjU+ZCTyGiUskcPWkhssQcFr5Idm4zplXOortqkU5n
	q4NZDHMmo9OTXMcF/5seugSlZGK2vnotl3Dp/hI/fWf3tDVYFCg6Z0zxeznl9H4c
	IJDj3EgwjUUzA33prma/x4WpFhx978xItF7aeikUun7jcU6NqAgNjdSjKY6aJzXn
	mMb0ahFyoYnOg42RteikoZt3TVuHlji2oB0ONDFc/TZpDk0xmHcy5aDeZL4KQ2mL
	SsfkKTyg/82fs7KZ2ZDnTkb6rBkuyoqQiLE7g0JaULE=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Mark
 Brown" <broonie@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, Vinod Koul
	<vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "Chen-Yu
 Tsai" <wens@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor.dooley@microchip.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Amit Singh Tomar <amitsinght@marvell.com>
Subject: [PATCH v5 0/5] Add support for DMA of F1C100s
Date: Sat, 2 Nov 2024 11:10:17 +0100
Message-ID: <20241102101017.2636558-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730542228;VERSION=7979;MC=3166311018;ID=220060;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_031032_890727_5FFF5552 
X-CRM114-Status: UNSURE (   9.92  )
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

Support for Allwinner F1C100s/200s series audio was
submitted in 2018 as an RFC series, but was not merged,
despite having only minor errors. However, this is
essential for having audio on these SoCs.
This series was forward-ported/rebased to the best of
my abilities, on top of Linus' tree as of now:
commit c2ee9f594da8 ("KVM: selftests: Fix build on on non-x86 architectures")

Link: https://lore.kernel.org/all/cover.1543782328.git.mesihkilinc@gmail.com/

As requested by many, this series will now be split in 2, the DMA and the
ALSA/ASoC codec driver. This is the DMA part of the series.

Csókás, Bence (1):
  dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA

Mesih Kilinc (4):
  dma-engine: sun4i: Add a quirk to support different chips
  dma-engine: sun4i: Add has_reset option to quirk
  dma-engine: sun4i: Add support for Allwinner suniv F1C100s
  ARM: dts: suniv: f1c100s: Add support for DMA

 .../bindings/dma/allwinner,sun4i-a10-dma.yaml |   4 +-
 .../arm/boot/dts/allwinner/suniv-f1c100s.dtsi |  10 +
 drivers/dma/Kconfig                           |   4 +-
 drivers/dma/sun4i-dma.c                       | 217 +++++++++++++++---
 4 files changed, 200 insertions(+), 35 deletions(-)

-- 
2.34.1



