Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F26C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 05:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I11TGJ/34iVtBwVI5g4O/YYyP3TziDPB5aVFJFQ2HZ0=; b=W+VeV0qgJPwouHZ2099VsulSVs
	q5DF6IIFxpB/x9MStY7pZGDjlRCx0StHSEqv0mBANWG7exEJO2cWb+/UUQMCpyHyWU3pZTEzGK+an
	CJJIhQOOdwagtwTnvyhPQR/FepudaTbS8QDbXfh0nVQrU3IR9JvJpOx2rui24MV1EsfJxzACGrKpB
	Z8Z/agWR5qN2e6HgDIUELygIOOFNcRxrwoOSiuFjoIlzwxe6iAMaDu85MSQoxmMNYEz32Hk9h54Un
	umq6DnF/phvoAMdbi38rB29Wn/G4zV2JcUUfQWgduvPJoUxc+qsx3k0XJEB+8mCoFPIGi182FIYlV
	bTlx1Nqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVOTh-0000000GR2t-1fqR;
	Sat, 28 Jun 2025 05:51:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVOMq-0000000GQWr-3gWG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 05:44:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03DC544DD2;
	Sat, 28 Jun 2025 05:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5137C4CEEE;
	Sat, 28 Jun 2025 05:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751089486;
	bh=dpDcT0JGPHxnE3OT+sUCmMdAicGM1TQ8WJOYe+HFJCc=;
	h=From:To:Cc:Subject:Date:From;
	b=OKgaL/DfcCOo9Mdys6/xM4PvMcJg5uNhsLK8Em3NX9BYIVrO50PVaVUq4nSkpNmgf
	 IbN8VfS2zqxDMebYiCUoeyC4kwWLCKx3MAIBL/trHaVOZh72ZIFfy324Hu2Bb0yCWV
	 D6BGpNsUUQiElqG8Q8LGtAOei8ESIMeenJ9dgMzdaWAy2R76QnSLyc/0kLRMPf4L9J
	 Hzh5puij23jq4SY4HwwhxsPVZhQEb7ak71eLoyO7AQeVtMePa7ClDw54FC1fGWmutL
	 jj+vfpXAuvDErjEgWXGPtvmyiRSCcYG6McR7AgSMYxlllQ1QP0Tr6ZqkKiZgH1Yu9y
	 aWiz36OusLR4A==
Received: by wens.tw (Postfix, from userid 1000)
	id 4048C5FD53; Sat, 28 Jun 2025 13:44:44 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH net 0/2] allwinner: a523: Rename emac0 to gmac0
Date: Sat, 28 Jun 2025 13:44:36 +0800
Message-Id: <20250628054438.2864220-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_224449_014314_73F5E066 
X-CRM114-Status: GOOD (  15.84  )
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

From: Chen-Yu Tsai <wens@csie.org>

Hi folks,

This small series aims to align the name of the first ethernet
controller found on the Allwinner A523 SoC family with the name
found in the datasheets. It renames the compatible string and
any other references from "emac0" to "gmac0".

When support of the hardware was introduced, the name chosen was
"EMAC", which followed previous generations. However the datasheets
use the name "GMAC" instead, likely because there is another "GMAC"
based on a newer DWMAC IP.

The first patch fixes the compatible string entry in the device tree
binding.

The second patch fixes all references in the existing device trees.

Since this was introduced in v6.16-rc1, I hope to land this for v6.16
as well.

There's a small conflict in patch one around the patch context with 

    dt-bindings: net: sun8i-emac: Add A100 EMAC compatible

that just landed in net-next today. I will leave this patch to the net
mainainers to merge to avoid making a bigger mess. Once that is landed
I will merge the second patch through the sunxi tree.


Thanks
ChenYu


Chen-Yu Tsai (2):
  dt-bindings: net: sun8i-emac: Rename A523 EMAC0 to GMAC0
  arm64: dts: allwinner: a523: Rename emac0 to gmac0

 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 2 +-
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi              | 6 +++---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts     | 4 ++--
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts     | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.39.5


