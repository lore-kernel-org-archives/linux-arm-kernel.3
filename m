Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683A4D58CCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r2f84TTEWNrh6ZSSjAaDbdTly3GCRBMKBI+zPfcgc9Y=; b=v5YAvh2i1UGdMzeusEL4EBsF/j
	FWxgZcaGpsz+Pbv9moiAESdaGY0+o8NVbxcsZ4vp8D8jufVzaRmlw9+5txl3w8pJ/jqqWszRWYvp/
	ESi4zsc0frZC+vBqKh2QpecMmUmFDhAxYlHvm3IgiDkHuPRl1a16uPXREle7AFwS0LDy6YqgcPmUc
	iKyR2kpZCAcSlvvBrnDL0FLV6EnnlCQ3HwzpEhpLMi1ZnskgOMwiIq5whVeKeK1y82GBYWT31/1qN
	Qcut6h1wFeprSnaxcVD7zSZxxGTFQcGU2LV+b3Ouy2xibt/E/YKg58srf2TkHcLHmCYXC7ZLy7RkM
	xDpj6pRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50u8-00000001NbJ-3Yva;
	Tue, 24 Mar 2026 12:30:40 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50ty-00000001NWo-3ct7;
	Tue, 24 Mar 2026 12:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=r2f84TTEWNrh6ZSSjAaDbdTly3GCRBMKBI+zPfcgc9Y=; b=SdxsBP5aJYd4z/xFwxCiA3pg2V
	sTHuoCjzNSO3ZJ5umP6P3cZXGC/5ziC+kfIm8sJEHJRiic2wPmYXNFUyM9l0fHLsDJ4f4JVlxsI33
	OcnmHXrll+bTLVa6hnH8JYiWjnddwpwwwGALji7C/57ZbXsMUNx2dJCTPoer0xGgcaRzdPPvFKgC7
	NUaR8rCrpNqUkxwGc0LzrZ/jCaeGVzBvJtmz0oO7QUbWKPh7SwfGpiQFivoiCeuwAt5FX6Vy5+tO1
	SpPef78ma2kA8OHhtNyR6JFaLxPzt9hwGA08McUAIbCzyNv6iFKRbIm4E7s0k5ILxji0XZDDQdgmx
	JybvRH/w==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w50tp-0005qD-1u;
	Tue, 24 Mar 2026 13:30:21 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w50tp-000Pna-1M;
	Tue, 24 Mar 2026 13:30:20 +0100
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 0/7] J722S SGMII support
Date: Tue, 24 Mar 2026 13:29:36 +0100
Message-ID: <cover.1774354734.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27950/Tue Mar 24 07:24:19 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_053031_027327_394DB8FD 
X-CRM114-Status: UNSURE (   9.72  )
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

The J722S CPSW and SERDES are very similar to the variants found on the
AM64, but they additionally support SGMII. Introduce new compatible
strings for the J722S to add this support to the drivers.

This is a prerequisite for the Single-Pair Ethernet interface of the
TQ-Systems MBa67xx baseboard for the TQMa67xx SoM, which will be
submitted separately.

v2:
- Keep support for the AM64 compatible strings as a fallback, adjust commit
  messages (patches 1-3 and 7)
- No changes to patches 4-6

Nora Schiffer (7):
  dt-bindings: phy: ti: phy-j721e-wiz: Add ti,j722s-wiz-10g compatible
  dt-bindings: phy: ti: phy-gmii-sel: Add ti,j722s-phy-gmii-sel
    compatible
  dt-bindings: net: ti: k3-am654-cpsw-nuss: Add ti,j722s-cpsw-nuss
    compatible
  phy: ti: phy-j721e-wiz: add support for J722S SoC family
  phy: ti: gmii-sel: add support for J722S SoC family
  net: ethernet: ti: am65-cpsw: add support for J722S SoC family
  arm64: dts: ti: k3-j722s-main: use J722S compatibles for WIZ, gmii-sel
    and CPSW3G

 .../bindings/net/ti,k3-am654-cpsw-nuss.yaml   | 20 ++++++++++------
 .../bindings/phy/ti,phy-gmii-sel.yaml         | 24 ++++++++++++-------
 .../bindings/phy/ti,phy-j721e-wiz.yaml        | 20 ++++++++++------
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi     | 12 ++++++++--
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      |  8 +++++++
 drivers/phy/ti/phy-gmii-sel.c                 | 11 +++++++++
 drivers/phy/ti/phy-j721e-wiz.c                | 24 +++++++++++++++++++
 7 files changed, 94 insertions(+), 25 deletions(-)

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

