Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C00ED7234B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 08:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sLZGDTV+i0TCtBYhvLAsONCwdka8CGVNrlVzZLiWnH0=; b=ATIxkzo5uXNjtXkxe9L2dGy/qU
	1DK5EpudITldhGB5P8ISqHGKL40XlnYiDMJgEpOXq8+QHB281PozBh2dLbOti2hKS5r6TurxQfljW
	JdBY5LLy2flmPT2dUon11TuVEc8EDzusyHffoIAIMUzqFcfy2DQ5XzlS3s27rPEn0Wu/0XWZsTdra
	YCOopNjGE0nId0vEALU4pBKnm6eB1jHF3wxXJDE/CBolZvDW1DmEHvh22PRsBLJpdfzjmmTZGb7wV
	vqtrK8Feg+yy55LJ2ya1BZgqLJ09fIAiBVx2VhAwhFT1Mix844XLG2+cB1VEsUWBmPSGj246hUOf1
	x8k03mXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCYx-00000008TZu-0osl;
	Fri, 23 Jan 2026 08:30:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCYp-00000008TVr-3bCX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 08:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C079540878;
	Fri, 23 Jan 2026 08:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9135AC19425;
	Fri, 23 Jan 2026 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769157030;
	bh=qP1NLLG9rTvhPI7VcZ3e4V6pqIk+aWjOp6382FhfNww=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=u4TwvJRtbQvnCJX0DpQ1wF5rJBVx5oolJhXO1MaHB5rzj+hAeK1+WTT5WCByDePMM
	 iSzZHThB1cQV9kkSbb4DRfcmcYW+9Jx2xoiMz4oMiYn/jRX8/QuEo7k9DW6qfQIr6s
	 Y+3NxfB2tnv7va4mIqpmKK9NQ+Efv1Xu9gTsTBpq4qJPZZJT+y/Oo51w3uAkfFbKmT
	 yEaNgAlNWwUkB2/GUJWNh1ptLvHNWYZB1aoZ66GQOZuZnIiFWp3aev+WjBgFtPrLPQ
	 yL9qTxFhL/pqSUrnPB846Jm8ZYu5OzIgElw45Hd+u0bLKirzmtyRjxXTSvCrEbBKh9
	 OvVPKNcDzHChg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EF3D72345;
	Fri, 23 Jan 2026 08:30:30 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v5 0/5] arm64: dts: freescale: add support for the
 GOcontroll Moduline IV/Mini
Date: Fri, 23 Jan 2026 09:30:27 +0100
Message-Id: <20260123-mini_iv-v5-0-29bef040f236@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23M0QrCIBTG8VcJrzM8R12zq94jIsR0HdhmuCFF7
 N2zbgzW5Xc4v/+LTT6Rn9hh82LJZ5oojmXo7Ya5mx07z+laNkOBGoQwfKCRLpS5Fdprhw4QJSv
 f9+QDPb6l07nsG01zTM9vOMPnum5k4IIH2bbGKYNK749ddHGcU+z7nYsD+4Qy/mDEirFgFDa0w
 VjrQP3F8gdLUbEs2AfdOHU1AcH8xapigH3FqmBtbSNbiUGDXeFlWd4Fe5b1WgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769157029; l=2544;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=qP1NLLG9rTvhPI7VcZ3e4V6pqIk+aWjOp6382FhfNww=;
 b=WYzINIuOP4mCBBodYcvLeOdMLJgwXSrgFXWpQiqb3CFwOamicg+qwM8vvYPOCv6G0afTml/NE
 IGeyucl9D5cCtRjO7o3yj3DyKeRdj3jHV0o1x4eVrdIBTIMAJlM54wx
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_003031_940667_F611F38A 
X-CRM114-Status: GOOD (  11.53  )
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
 .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         | 798 +++++++++++++++++++++
 .../imx8mm-tx8m-1610-moduline-mini-111.dts         | 686 ++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi | 444 ++++++++++++
 6 files changed, 1972 insertions(+)
---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20251009-mini_iv-a05e5c2c1223

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



