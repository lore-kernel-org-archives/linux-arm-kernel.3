Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D48EC1EB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EnMnpIeuPy7Z/cnkxlqs5uaU61ief8Wjttb8sbefyYc=; b=HoYMngc8i98m7Zm1YIpadPTH/I
	2ooPGVfX6U6aZt8qcBZqP9LVtjHkNU9/4kEfwVIVJF46pX1lECQGTJCsZTtdFAY3SbGHQ2GQOYAfY
	bhNitxVF9SJdZA+MtzggeQXCS9uq5LOUag55HTb6KzJIZrzdfCJ9JRTN2LX26UDuEH7kPfTvp5rAF
	H5G4PCQzT7ujg5/DhyRz94CCbgQZhJ+HjrC9hsxSPcKxbPEBbnFz73crYF2ZI85NsvfNZEHdzY3Oz
	lwCb0OBxzpQHzSBG11eJSMzVlmXmNpfSEUTv27JGU1vfcfZaFU1QJv+C7Iye0RPjTT6EpQrePdsis
	JcGaa23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnziq-00000009ygp-1wjQ;
	Thu, 05 Feb 2026 13:48:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzio-00000009yeA-0mwt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 13:48:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AEC26012A;
	Thu,  5 Feb 2026 13:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA453C4CEF7;
	Thu,  5 Feb 2026 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299316;
	bh=XZxSLshkUvDzKJdvjP6SiupscDbgdHbq4fYCb4iLzR0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eAhfKIPSq1+56qyKlIbjOuycwvF3cTJYtQAxPSWi6jlkylSws8TwjjVQt1C5M/nWy
	 gBK7AeU/k0oIju99aoRq7GsRKHQpGIlCCoqLGYTXscw8kDR227bEQNwhn9Wd2utvn8
	 j8zDloonnlVHIOaduMJyykC83PXDPNZjiH/XJO08trIGaE3oNynuKVm4bYGfcgB6Z8
	 gtQEPApeJWS6nx6Pm9UF0TA/Zp6dEompiFqLDdMZqMjE3JxO54bLzytc3QGvk9VQpR
	 PxQ+mRfzJn+G61+CDs6MwfNugkNQDweDWq0lvQjL7OXcqieWs3738kZO5KcoiZBkoI
	 nq7On1OcTJ5XA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9685CEC1EB7;
	Thu,  5 Feb 2026 13:48:36 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v6 0/5] arm64: dts: freescale: add support for the
 GOcontroll Moduline IV/Mini
Date: Thu, 05 Feb 2026 14:48:24 +0100
Message-Id: <20260205-mini_iv-v6-0-f7cdd8f88144@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23O0WoDIRCF4VcJXtcyMzpmzVXfo4RijSZCshY3S
 EPYd68bKAayl2fw+/EuplBSmMRucxcl1DSlPLZh3jbCn9x4DDId2hYExAhg5SWN6StV6YADe/J
 IpER7/VNCTL+P0ue+7VOarrncHuGKy/W1UVGCjGoYrNeWNG8/jtnn8Vry+fzu80UsoUpPmKhja
 pjAxSFa5zzqVayesIKOVcMhsvH6YCOhXcW6Y8Rtx7phds6oQVFkdKuY/7EBJNUxL9+23yGChkj
 KvOB5nv8AkI1PxJcBAAA=
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
 Conor Dooley <conor.dooley@microchip.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770299315; l=2749;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=XZxSLshkUvDzKJdvjP6SiupscDbgdHbq4fYCb4iLzR0=;
 b=9jtzWGgNpbgqAgl3vh6kfEwxSrg90thB1M0RCETL1QtBRwVUsciDrD07y4axcD99NUV/cB93l
 NivD4LUk+ghBZtC+AK/rwVQT4xz3G1BIPewFdWt9DyeAna7K7qEpmbo
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Changes in v6:
- Update trailers
- Fix includes in the mini/iv dts patches (Frank)
- Rebased on latest next
- Link to v5: https://lore.kernel.org/r/20260123-mini_iv-v5-0-29bef040f236@gocontroll.com

Changes in v5:
- Fixup aliases (remove usb ones) (Shawn)
- Link to v4: https://lore.kernel.org/r/20251117-mini_iv-v4-0-5aa63832f51a@gocontroll.com

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
 .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         | 799 +++++++++++++++++++++
 .../imx8mm-tx8m-1610-moduline-mini-111.dts         | 687 ++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi | 444 ++++++++++++
 6 files changed, 1974 insertions(+)
---
base-commit: 0f8a890c4524d6e4013ff225e70de2aed7e6d726
change-id: 20251009-mini_iv-a05e5c2c1223

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



