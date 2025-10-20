Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD29CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9UqRyhTuWMPJUwu1Z1uPslo1yvarlL6qIoBqc8OuwVs=; b=3ZsZ8h1OKpIHTL8n8gLjp2rRod
	egpds9R8Uug098GYlMe46NqkYaqBm6NU/gbKioXe1kMhXOQbdAhov4mrpsf1eM4qeWWvDkMcSk79n
	nFLDB9S9lhGKd9wwHWGsds/1cunffH0CwleFyCVAgVMZPqerlGHXcPmI29EdjY2n2Y+e3GncT9pJc
	7kpvuntjFt6N1UuMb/JNA/DoVr6VR4oHbKROG/4OnldNC/LdW3ebFxjLquymLUpNw6ZuXI10DvwzE
	KmPd1EaZG2dnZQ+W3rV1qkgV3xYXlaBXS7QojYU0k7y7BBykDa9cdVhLfAg+vphVHH0fjn0uvmUCv
	kNEzCw3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQF-0000000EQy2-25qF;
	Mon, 20 Oct 2025 17:11:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQ6-0000000EQqI-2Vjk
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 17:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=9UqRyhTuWMPJUwu1Z1uPslo1yvarlL6qIoBqc8OuwVs=; b=lDOh0/QSCI7nXkNAnpBH7oxdOR
	uNDL4sxCW+XpGPjQaeQv7E0RUNNfcCSSbL0wnul9vqSmGY09bfkR1GvqvvyFe+CMIo1Es36xPl0Fv
	BH3kL/znG8gHVEpGUAR+SnuDFlf8GaL8oCe31xu4Uj1Kws+aT0150fcXygi4W0ee4k56Z+SqXRXOI
	bkmXVUvAuyWKvKB1Zo0wuJH42yq5BJ+rIJbmw2+OqHNoNdJ9WClcr4ujlfmHY9YE5TzjA4VrKk7HN
	N/RCfKCIKQJJtK3VwBosVkGFD73+mmJ+beEf3ehGfszOrRcR7C6NlC3cihWKyKstbsBaj/DW+Fj+l
	lRlB224Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsYL-0000000025I-3THC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 16:16:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72B7D43447;
	Mon, 20 Oct 2025 17:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B395C4CEF9;
	Mon, 20 Oct 2025 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980280;
	bh=TJPYa24Z5KTj/XUQBDA+4muq/sKdsaWSFY+S+sPkdkw=;
	h=From:To:Cc:Subject:Date:From;
	b=RTQz/DbS3nDJtiW0gDdrU4/D+mk33QWYGezbsuDwSgW+xyVGsCuE7m2lbKyKoZDYg
	 Qxd2TUg5S8DD4fruNkVcz6j9K2v0gJFpE6uo4SZaiwN6gkdyVwLfkaneT53r5mDLH7
	 WoUBvzrF4qdszKMcVpagSm4DAFS+/vF12j6AL74W6f3HsqSeqZ3cfBsFgCvUocr291
	 Q84eyOe8eHgi1cUIQiImKIl+am2qIMJjFA3bkyY05VTwx/oHMC06eQm5Aq1xnKVWUt
	 odkOIZ8CHk2n+GNqzHgdEF7a5pMxYN0hWChZwXnFGS4LMAX5WhEe+eSD+gJ7lXcQdw
	 MLoZ4bYpOegMA==
Received: by wens.tw (Postfix, from userid 1000)
	id 1D6D45FDC3; Tue, 21 Oct 2025 01:11:18 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] allwinner: a523: Enable I2S and SPDIF TX
Date: Tue, 21 Oct 2025 01:10:46 +0800
Message-ID: <20251020171059.2786070-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_171610_215911_F8ED787F 
X-CRM114-Status: GOOD (  17.01  )
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

Hi folks,

This series enables the SPDIF and I2S hardware found on the Allwinner
A523/A527/T527 family SoCs. These SoCs have one SPDIF interface and
four I2S interfaces. All of them are capable of both playback and
capture, however the SPDIF driver only supports playback.

The series is organized by subsystem, so each maintainer can find the
patches they need to take.

Patch 1 adds SoC/hardware specific compatibles for the two DMA
controllers in the A523 SoC.

Patch 2 adds an SoC specific compatible for the I2S interface
controllers in the A523 SoC.

Patch 3 adds an SoC specific compatible for the SPDIF interface
controller in the A523 SoC.

Patch 4 adds driver support for the SPDIF interface.

Patch 5 marks a clock related to the DMA controller as critical. The
docs are quite vague on how this particular clock gate ties in with
the other memory bus gate that the DMA controller needs.

Patch 6 tweaks the software lower limit of the audio PLL.

Patch 7 adds devices nodes for the DMA controllers.

Patch 8 adds a devices node for the SPDIF interface controller.

Patch 9 adds device nodes for the I2S interface controllers.

Patch 10 adds one set of pinmux settings for I2S2.

Patch 11 is what I used to test the changes, and serves as an example
for how to use these new interfaces.


Patch 1 can go through the dmaengine tree, or I can take it through the
sunxi tree.

Patches 2 through 4 should go through the ASoC tree.

The rest, except the example, will go through the sunxi tree.


Please take a look.


Thanks
ChenYu


Chen-Yu Tsai (11):
  dt-bindings: dma: allwinner,sun50i-a64-dma: Add compatibles for A523
  ASoC: dt-bindings: allwinner,sun4i-a10-i2s: Add compatible for A523
  ASoC: dt-bindings: allwinner,sun4i-a10-spdif: Add compatible for A523
  ASoC: sun4i-spdif: Support SPDIF output on A523 family
  clk: sunxi-ng: sun55i-a523-r-ccu: Mark bus-r-dma as critical
  clk: sunxi-ng: sun55i-a523-ccu: Lower audio0 pll minimum rate
  arm64: dts: allwinner: a523: Add DMA controller device nodes
  arm64: dts: allwinner: a523: Add device node for SPDIF block
  arm64: dts: allwinner: a523: Add device nodes for I2S controllers
  arm64: dts: allwinner: a523: Add I2S2 pins on PI pin group
  [EXAMPLE] arm64: dts: allwinner: a527-cubie-a5e: Enable I2S and SPDIF
    output

 .../dma/allwinner,sun50i-a64-dma.yaml         |   5 +-
 .../sound/allwinner,sun4i-a10-i2s.yaml        |   4 +-
 .../sound/allwinner,sun4i-a10-spdif.yaml      |  44 +++++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 135 ++++++++++++++++++
 .../dts/allwinner/sun55i-a527-cubie-a5e.dts   |  52 +++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c      |   2 +-
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        |   2 +-
 sound/soc/sunxi/sun4i-spdif.c                 |  28 +++-
 8 files changed, 259 insertions(+), 13 deletions(-)

-- 
2.47.3


