Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3497EC4450E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lBNHzPy2HyDx62VHa8F9d2ex4l7X7lFB44GsNxYvv/M=; b=sX+OjMbR8ilQ9yrM37l8UAAR60
	O0aenbwiYxlcnpMSbem3s7JMXStUDH+sESEtY7hjDSbRNrSavknDJN9cZCnYGNGmGMM/jtiybTKqu
	/1T3NkICakrhasVZMIB126ZTFOiPixfC0QiYjeypeGSRJ4wuq37r6WLWdbB/Viwiw4iQJxS+QEGoc
	vfdWNh2Jm9hKYCaamJZeaBoU4alwUFMYdmYY43ebjAfTrWdawojPVgBZ5U+j4Z9K4Bw0Spce84sTs
	p8ksHGyZzLatS58ROQwijuXkY0kcNhouDH7YRQ9FGjgO7G2S5Q1IDYKUA+CHQYrUoP2cVOOGby45O
	UaUW/PFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyi3-0000000EmQl-3sx1;
	Wed, 15 Jul 2026 12:27:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyi1-0000000EmOU-31nI;
	Wed, 15 Jul 2026 12:27:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB9746001A;
	Wed, 15 Jul 2026 12:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 978BFC2BCB7;
	Wed, 15 Jul 2026 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784118448;
	bh=hB/I9eJaB/xboW/bbZMVV2HvjtWDaWcZod2NgtV30/0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fcMJmw63jXUfHSiKDVjMIeyv9qEbba1pNZ/L6Ydo6oa/zFXan/fbJOJI4Nf6C6nsu
	 OBB90werzLziDvdYhain/ZTbLzOlUItFPwYRH1DVxUXRDp6k0Ut3ArH1uYFxxZ1zdT
	 JTXcUT8WFkfeknPQfejv87EI4spXvtQ2fsYekjN4P1yT9KXGQiDx8b2Q29iFdICZEd
	 RVdZviO8U7SQZ1yLb9wbR5hc7QdCBRwtlV1UClfylaXZQX6QwFmWClu60i2oLGa1xQ
	 Bg4CZTRYAQnMU4il4Fhw+iboz8mBJJgzvmSXxj/6qKPrPixzLYDh6IYyE1fKlH2t7z
	 lsV5PSwAv1gLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D32C44508;
	Wed, 15 Jul 2026 12:27:28 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v2 0/3] soc: mediatek: pwrap: mt6572 support + log level
 fixes
Date: Wed, 15 Jul 2026 15:26:37 +0300
Message-Id: <20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Nyw6CMBBFf4XM2hra8hBX/odhUctUxkjbtFg1h
 H8XMCYuT3LuuRNEDIQRjtkEARNFcnYBsctA98pekVG3MIhcVHnNBavKWjD/DMqzQje8rKQ2nZC
 wDHxAQ68tdm6/HB+XG+pxLaxGT3F04b29Jb56v3DxH06c5aw7YKlko02N5uSDG50dFN332g3Qz
 vP8AVIFwRi7AAAA
X-Change-ID: 20260712-6572-pwrap-4c91563cfd23
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784118429; l=1304;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=hB/I9eJaB/xboW/bbZMVV2HvjtWDaWcZod2NgtV30/0=;
 b=lpeHefnwrjIMVXJgaICgAHb+yogf3oRzyhyhCQVJw1FXUjRJgttvmAovYuGdQDVlG5XyBGFUF
 AwcgFMsc1k9AVO9GNT8vzBemIV4fnWKWA7xmRlIGnqG1mu7UpidlbnD
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series adds support for the mt6572 pwrap.

All known mt6572 devices use mt6323 PMIC, which is already supported
by the upstream drivers. mt6572 also shares SoC-specific init with
mt2701.

Patch 1 adds dt-bindings compatible.
Patch 2 fixes improper log levels in the driver, improving UX when
debugging.
Patch 3 adds mt6572 support.

Tested on various mt6572 devices without any failures.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v2:
- Fix typo in patch 2 commit message ('Errors paths' -> 'Error paths')
- Drop unused registers in pwrap driver and use existing mt2701 array
- Also clarify mt6320 register usage
- Link to v1: https://patch.msgid.link/20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com

---
Roman Vivchar (3):
      dt-bindings: soc: mediatek: pwrap: add mt6572
      soc: mediatek: pwrap: use correct log level
      soc: mediatek: pwrap: add mt6572 support

 .../bindings/soc/mediatek/mediatek,pwrap.yaml      |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 71 +++++++++++++---------
 2 files changed, 44 insertions(+), 28 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260712-6572-pwrap-4c91563cfd23

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



