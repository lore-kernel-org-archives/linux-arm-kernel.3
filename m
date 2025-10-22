Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC90CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G94rTWm+M8Jv6bRrOJ20Kh5013Lb7wUpa6Kf4kmdDMI=; b=JlDB3t7EhO7ol/MGhK71HPgNVs
	Pxl/FHY4+9f/Ah/YRkgTisB+oPsXoTXQuCO41xMxjWgTl91NGaMB2QL/iPTaBDmysYfE3Ji6QEdOo
	xnmYuV2gVLOdou4139geiSsXOlS5yxJZ4J+AkpoTTAvonYTxTo26Kxnxs6UytQbN8JKqI925JCHHm
	nHrtzXRfP2VMa4GbQvTW262/seypJIbMboFyfWCEvkh+/7XR0+B/+wpU0+cPR7fSJzhpRaOGARz6A
	Uec36DoqYoAivT+Cd8DjETlVsaAWn1qlqeb2a0eQ+ykgqhk7bNrlBe2VGhxtR/4q5XLZB+0zB0Hz/
	jBbx2u3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTBM-00000001qfY-3yot;
	Wed, 22 Oct 2025 07:22:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTBG-00000001qb7-0CNx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 07:22:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13C2B42B69;
	Wed, 22 Oct 2025 07:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF02EC4CEF7;
	Wed, 22 Oct 2025 07:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761117764;
	bh=6MxoejU7iKxp9mf2s8THn5c4jDLFtHOP5ivmjYnDox0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tCDAuass2USKptSp3Urz8RFIJHosHnDRCL4O9vUQ3W3xWunIvmY5E8wNzeUr9cdXp
	 2Aq822wED1ySumLmTyB04CNMJLDr+pV/bD7yCddj6zLV6PZh29zYSOTJCsvpg9b0Lt
	 92k4Y2sL7b0dgHcWJt01DN4MWEPOnaPvWQlqmGBJlwitgEk2ACamqmFURB5qU2DNnv
	 lmBDWIsK35ebK1ILK2favwL67F6tdq1OaD0dURQvaZwNpbGeyc+3R+f9H+zwzTZq/F
	 BVC0RNq/gtS9wWUfNBcZsofpLWW8AlVhcqMe/RazTNBroARP1E9iyA4VI1Y3kxVppy
	 IbWISFKwt97eA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4D7CCD195;
	Wed, 22 Oct 2025 07:22:44 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v2 0/5] arm64: dts: freescale: add support for the
 GOcontroll Moduline IV/Mini
Date: Wed, 22 Oct 2025 09:22:36 +0200
Message-Id: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADyG+GgC/2XMQQqDMBCF4avIrJuSjIZqV71HkSLpqAOaKYmEF
 sndm7rt8n88vh0iBaYI12qHQIkjiy+BpwrcPPiJFD9LA2q0RutOrez5wUkN2pJ16AxiDeX9CjT
 y+5DufemZ4ybhc8DJ/NZ/Ixml1Vi3beeaDht7uU3ixG9BluXsZIU+5/wFvo3v0aMAAAA=
X-Change-ID: 20251009-mini_iv-a05e5c2c1223
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761117763; l=1486;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=6MxoejU7iKxp9mf2s8THn5c4jDLFtHOP5ivmjYnDox0=;
 b=8EDC4BIHHluETyJsGoyj3Ub5ZCMaVm7eZYUrj9HEkXC3ILQwIrUDvDuWDi3lD+10vmAFhAPht
 fbrq37zJBZJCz9pkBRodQSo996DWROXX/di837e4v0DP/zUj/N4dKZ4
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_002246_314916_C84505AB 
X-CRM114-Status: UNSURE (   7.82  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add initial support for the Moduline IV and Moduline Mini embedded
controllers.

These systems are powered by the Ka-Ro Electronics tx8m-1610 COM, which
features an imx8mm SoC.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Changes in v2:
- Fix allignment issue in imx8mm-tx8m-1610.dtsi (fec1)
- Move phy-reset into fec (works better in barebox)
- Make the gpio-line-names groups of four on every line
- Link to v1: https://lore.kernel.org/r/20251009-mini_iv-v1-0-f3889c492457@gocontroll.com

---
Maud Spierings (5):
      dt-bindings: arm: fsl: Add GOcontroll Moduline IV/Mini
      arm64: dts: imx8mm: Add pinctrl config definitions
      arm64: dts: freescale: add Ka-Ro Electronics tx8m-1610 COM
      arm64: dts: freescale: Add the GOcontroll Moduline IV
      arm64: dts: freescale: Add the GOcontroll Moduline Mini

 Documentation/devicetree/bindings/arm/fsl.yaml     |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h     |  33 +
 .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         | 801 +++++++++++++++++++++
 .../imx8mm-tx8m-1610-moduline-mini-111.dts         | 691 ++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi | 439 +++++++++++
 6 files changed, 1969 insertions(+)
---
base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
change-id: 20251009-mini_iv-a05e5c2c1223

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



