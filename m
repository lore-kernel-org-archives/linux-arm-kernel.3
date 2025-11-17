Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9F2CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 15:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Li/iv0pkpx9+ffdVXkS6TvRe/OzJY3YtwvIBWbFGahk=; b=Hj7qXNQsVshO/RnG0jSVlOLaum
	kpkgxVLpCjn4pd6JJf70kQC8CcExHM+iph0/Wfd/vzysuaOOIfwAw/ojOq0Z2cE7UAS5iOX+qlv94
	pxqQLaEbppIuq5rdBNMwCcgwxeII99KZtByi/BP/RHJ4vlzAWEGFm8ChhOuLw/L++8cA0TelMfSws
	m4n2cst8uQn4HxJDay8c7fqZTUvPMvuai/1IwaSJXzceKlrtx8aNE/QtzKdXrG0m7oPWKnyxDtUZS
	qIALUOVPK7WldNcDLKevMboMVtcLEDg4Gpcn5Cn08KkbXJu4Gzjq5B/1HFRrfc0u8innbzJvg9I24
	TxkTOudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0jz-0000000GINv-4C3D;
	Mon, 17 Nov 2025 15:02:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0jx-0000000GILq-1aqu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 15:02:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11FFC417F2;
	Mon, 17 Nov 2025 15:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2252C19423;
	Mon, 17 Nov 2025 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763391719;
	bh=KOWbH4XWe8kiPnMTy+PCLUNCxjDz4r/cuNdO+SLh1pk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jgvy7xsiLDK75w5b5RIs2d6/TwUH5Z260GMAu2zV82TcR8vNLYfT8vTcWQWSAymCf
	 kBK16S/GInaXQeAXpV8/h6ZIbnky4v74fyfWPMnU8ScJMb0lFjR90UubFmwfhrVGVR
	 zj5GUTnIg1E7Wy/d4BkaOXqbHx+Uj0B3G4N/CFZuefyH0aeHyPSvZ0/yPF6fwiZqFD
	 rrlb3IwbOdnh1Zv9JR7wtGhRrysX/Ohm6GGUPEhsz6UFLUugck3yNe14SYt0kvJPFy
	 Z/ytLlX1czzjSYJz/sFgLNTPPw3d1SMGOzioq12NVTs6kBmpc72NcCX3gu8BXQte4c
	 VQXLcsGS5HO8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99112CE8D6B;
	Mon, 17 Nov 2025 15:01:59 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v4 0/5] arm64: dts: freescale: add support for the
 GOcontroll Moduline IV/Mini
Date: Mon, 17 Nov 2025 16:01:25 +0100
Message-Id: <20251117-mini_iv-v4-0-5aa63832f51a@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMU4G2kC/23M0QqDIBTG8VcJr+fQo265q73HGENM60DlsJCN6
 N1n3RS0y+9wfv+JDC6iG8itmEh0CQcMfR7yVBDbmL52FKu8CTBQnDFNO+zxhYkappyyYDmAIPn
 7HZ3Hz1p6PPNucBhD/K7hxJfrsZE4ZdSLstRWapDqeq+DDf0YQ9uebejIEkqwwwAbhoyBGV96b
 Yzl8i8WOyzYhkXGzquLlZX2wPUBz/P8A3ppLF8dAQAA
X-Change-ID: 20251009-mini_iv-a05e5c2c1223
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763391718; l=2392;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=KOWbH4XWe8kiPnMTy+PCLUNCxjDz4r/cuNdO+SLh1pk=;
 b=8HxFs7Nh5pNNttOA92Bxz4SU7WWBT7KjRXZkC5kunbSQg8MhIrH/6EIsjGumvGnWPHuZ2onzh
 vjmBmzhw2T3CO+hge6Q8aRZumFmdMBn2ddYfD3dHzZ1i43cziI+LS00
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_070201_464014_FCADA91E 
X-CRM114-Status: GOOD (  11.77  )
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
Changes in v4:
- Fix BUCK6 property order
- Change the BUCK6 min/max voltage to match the dram specs (Lothar)
- Make it clear that the two systems are based on a SoM in commit
  message of the dt-bindings (Conor)
- Drop merged PMIC fix (Matti, Mark)
- Link to v3: https://lore.kernel.org/r/20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com

Changes in v3:
- Add patch fixing the pmic driver
- Use the proper feedback properties for BUCK6
- Slightly rework the compatibles, acked by conor dropped
- Add missing CAN interface supplies, remove the leftover comment
- Add missing vled-supply
- Add missing ethernet phy interrupt (doesn't work)
- Fix the cs-gpios properties in all spi interfaces
- Fix the order of properties in all spi interfaces
- Remove unused labels for regulators of the PMIC
- Link to v2: https://lore.kernel.org/r/20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com

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

 Documentation/devicetree/bindings/arm/fsl.yaml     |   8 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h     |  33 +
 .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         | 800 +++++++++++++++++++++
 .../imx8mm-tx8m-1610-moduline-mini-111.dts         | 688 ++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi | 444 ++++++++++++
 6 files changed, 1976 insertions(+)
---
base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
change-id: 20251009-mini_iv-a05e5c2c1223

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



