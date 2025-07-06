Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0016BC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g21bBD7mXy6vE6r3AM8CZB/eS4lAHwa225fW5g9CpQA=; b=EAH3mxTxjhAOZChd9OOOX/eLTK
	vGX7SRTrscyhTJd1BYHXkvTbmFBiWXudnk1gA3j3RShQ95J+v5lz4IXkRouCzwYgt0Xcr0MvDsXda
	NlpXh30zVpLUREw6e+EqNY2D1zc4R/cr5dBMsJ56TmKgKKcCI054vRgxWCNByi4VN503gGSuJxiAf
	WClNw6NIYldzUO4bBjG6NLB41t6KWY8Hvlv12Arg/ECeerD7vlOz+mh0pgDD2FhLhy54E87z2iPm6
	lp3LQVLqzUpiqzR21rQUB0J04vHqPFqkCo2mIz8gzbQo1iuK3e90YzDvXNSmPh3XayEvrhB0BMhl6
	Ud5JqgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUqb-00000000iF2-3fII;
	Sun, 06 Jul 2025 19:16:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUON-00000000fFm-1bqD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:47:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6209461136;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEEC3C4CEED;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827629;
	bh=F01Zl2KLwJZEJs0qPrL6t3cMCxuqK7s2DTQP4dCVqcU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jd91LstO7qvQFfLNUb8fxwQNFAdN2QkEKBC9UGL8cITx4f/bd0BT4Xz27XK8MjQg2
	 F/v6f3rQUVC7A1ewmzDgwgRVZ5oAieBG88Plesn+NNbsMTbtWzV4FfJDftanFKfYJq
	 7yVyHS/MwEaFn2QacHuGTJn/OkAYXTyNiHD+d2mVkJLHjgKqZxicSpkv32z3XrOABf
	 //qaVsKyyNAqGE9rdmPflSVlXeGFyWJAloP3Z0Bje0vFNS8dvkcT1Z3Lnsgz2wvV2l
	 Yp+8rSw8NHJMX6Aj3FGXA5wXXzBW5QKSL7CO1h3/pIyqnKML4NHxdNwFJfKWmuilaC
	 P3tFqL0saATCw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B117FC83F09;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Subject: [PATCH 00/11] ARM: dts: nxp: clean lpc18xx DTB check warning
Date: Sun, 06 Jul 2025 14:46:56 -0400
Message-Id: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKDEamgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMz3ZyCZEOLioqK+JSSYt0kI0NjcyNDs1SzZAMloJaCotS0zAqwcdG
 xtbUAqorP3V4AAAA=
X-Change-ID: 20250706-lpc18xxx_dts-b2137216e6c0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=1879;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=F01Zl2KLwJZEJs0qPrL6t3cMCxuqK7s2DTQP4dCVqcU=;
 b=Y44sZ3YsNp/IVrlrnvKtROO939BSVTW6WmqJDHFZ8OzLPEspu1u3iBWJ8qukYTqtKbLiW+fNR
 6+5hPmY9vrpDnEJLlArm74FP/V1e9PqGTeDkmqGWIPjxgFh5t5hSHCt
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

There are 3 dt-binding patch wait for pick.
[1] https://lore.kernel.org/imx/20250617-hound-of-improbable-intensity-e7c3c9@kuoka/
[2] https://lore.kernel.org/imx/174916907717.3619367.3745642154654809311.robh@kernel.org/
[3] https://lore.kernel.org/imx/175087864578.2055525.4510390315154712025.robh@kernel.org/

lpc18xx related DTB warnings reduce to 0.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (11):
      ARM: dts: lpc18xx: rename node name flash-controller to spi
      ARM: dts: lpc18xx: rename node name mmcsd to mmc
      ARM: dts: lpc4350-hitex-eval: change node name flash to flash@0
      ARM: dts: lpc18xx: swap clock-names bic and cui
      ARM: dts: lpc: add #address-cells and #size-cells for sram node
      ARM: dts: lpc: add cfg surfix in pinctrl child node
      ARM: dts: lpc4357-myd-lpc4357: add power-supply for innolux,at070tn92
      ARM: dts: lpc: change node name 'button[0-9]' to button-[0-9]'
      ARM: dts: lpc4357-myd-lpc4357: change node name mdio0 to mdio
      ARM: dts: lpc18xx: add #address-cell and #szie-cell for spi flash controller
      ARM: dts: lpc18xx: add missed arm,num-irq-priority-bits

 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi             | 14 ++++++++++----
 arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dts         |  6 +++---
 arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts   | 22 +++++++++++++---------
 arch/arm/boot/dts/nxp/lpc/lpc4350.dtsi             |  9 +++++++++
 .../arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts | 21 +++++++++++----------
 arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts  |  6 ++++--
 arch/arm/boot/dts/nxp/lpc/lpc4357.dtsi             |  9 +++++++++
 7 files changed, 59 insertions(+), 28 deletions(-)
---
base-commit: bb0fde92b56b76f7a0c90a6e9d9f050919fa835e
change-id: 20250706-lpc18xxx_dts-b2137216e6c0

Best regards,
--
Frank Li <Frank.Li@nxp.com>



