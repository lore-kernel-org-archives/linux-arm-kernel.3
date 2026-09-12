Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC199C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 13:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DnJWeorHgGcTwejXOU8CUXLihBM6J4Yckp3F9JhXuzI=; b=sQMSp7RVDpovsaVsqqlDrJ3w6b
	mXYT6sxFoaXChvmWiJAhxJ94NZkGy3z88gi83JBuhN8RSILYAq3/CtG4sx8xkGjB7J/6ewzpTeuaX
	O0kELuA89qxRYPVO9JY7VBdbvd0lwgIIHsF/ngv/OoK7e0I8PYrDCHFZou8dypvmScgkf4r+1FcaU
	AwABBgpEPeEv4uQbcYW6YvQb54YPVDyOnQa0FQg/wM/WQb51tx9ugX09m3aTxLEFPhyK3ET4gawRL
	oltgrCg9+GHQAx9ZeT5XCihBb2Gm9KYuT3Df4NyyIdKdjKyI6ZhxSzW+Q0m8/Eb3FAL+dd2Fq7mxS
	fFHO/TpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5NqX-00000000u23-1cIP;
	Sat, 12 Sep 2026 13:32:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5NqW-00000000u1U-0K3s
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 13:32:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CFF54395D;
	Sat, 12 Sep 2026 13:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6329EC2BCF5;
	Sat, 12 Sep 2026 13:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789219963;
	bh=OrWt6rMcj6X1ajmEcZpTCRWUVCtmz1KcB9KqCUg4L08=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MANaxdac1idLyNbcmHIk3DuXNNb4dYVZeQcKbafSUcOZ21NORXoj92ksCZN8zSZo9
	 +gr+OV6pDwmM3QcXDogYL6UrhFtTtjjN/MYOpQZM7EdUF+pKAKVDHoFirA1ccEesgr
	 yhglXC6hMDAy83YdXzLja1qgPUZxNixuVFe5ytHsjtX17b0ngRifyqsM6jcFIlIA45
	 OFyDCdUS8e7CQ49BE2qIDCj2szdXdDENaZZGOTAEhUIe2dWhkfNS3Us422cVHGEYGZ
	 Pnqko8mlDVVcFGX2dESrhvV7r45OIwwmUTkwVOr5VEf65nTPw6WegIlyobQapuBuwH
	 TjDHfQqjhoMjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4131FC88E5C;
	Sat, 12 Sep 2026 13:32:43 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v5 0/3] arm64: dts: freescale: add Free Mobile Nodebox v3
 CPU Module (LX2160A)
Date: Sat, 12 Sep 2026 15:32:35 +0200
Message-Id: <20260912-for-upstream-nbxv3-dts-v5-0-ead604dba61b@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHNUpWoC/43PTQ6CMBAF4KuYrq2Z/gDVlfcwLlo61S4E0mKDI
 dzdwgoWRJdvkvnezEgiBo+RXA4jCZh89G2TQ3E8kPqpmwdSb3MmHHgJZ6ioawN9d7EPqF+0MUM
 S1PaRGoO1BQlCaU7ychfQ+WGBb/ecnz72bfgsPYnN059kYhSok8JZAK5Mpa4uIJ5cIDOY+H8Iz
 0hppHZWlEyB2SJijahdRGSEWaUMrxkrFWwRuUIY20VkRnh+prJFURV6dck0TV9f4CssiQEAAA=
 =
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789219957; l=2820;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=OrWt6rMcj6X1ajmEcZpTCRWUVCtmz1KcB9KqCUg4L08=;
 b=u/fmjZZEnrnpwQPJPqOgX1QDr5zvJVm6nT8vRCIisliHgtt4il7bFesIn6VRknz++VO83xHxp
 AJ6MYWXyaOCBb1aN+EvXLzp+OHkVMfmh8iprjWWCtFyA1VTBb1b0TuU
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Nodebox v3 is a Free Mobile CPU module built around the NXP LX2160A
(16x Cortex-A72, DPAA2).

The same fsl-lx2160a-nbxv3.dtsi shall be used verbatim by the
U-Boot port, sent in parallel to the U-Boot list, so the two trees
cannot drift.

Dependency:

the DTS uses gpio hogs on the QorIQ GPIO controllers, which
needs the commit
  78c0baf85cd0 ("dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child nodes")
already in gpio/for-next and that will likely arrive in v7.4-rc1.
Until it lands, dtbs_check reports the five hog nodes, the rest of the
tree validates clean against the current schemas.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v5:
- read dts-coding-style: many reorder/cleanup including
  comments from Frank Li without functional changes
- Link to v4: https://lore.kernel.org/r/20260911-for-upstream-nbxv3-dts-v4-0-2fd07d5575ab@free.fr

Changes in v4:
- dt-bindings: arm: fsl: commit message like the other ones (Krzysztof Kozlowski)
- Acked-by on the vendor prefix
- Drop U-Boot comments from the DTS commit message (Frank Li)
- Boot NOR reset: reset-gpios on flash@0 instead of a gpio hog (Frank Li)
- ethsw-mdio-en: regulator-fixed instead of a gpio hog (Frank Li)
- ethsw-reset#: hog dropped (Frank Li)
- pltrst#: platform without consumer node
- Link to v3: https://lore.kernel.org/r/20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr

Changes in v3:
- Drop the thermtrip hog on gpio1 line 23, should have been clean'd
  before
- Link to v2: https://lore.kernel.org/r/20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr

Changes in v2: (from Sashiko's comments)
- Makefile: dtb entry in alphabetical order (before qds).
- Move the XSPI1_A_DATA[7:4] GPIO mux group from &fspi to &gpio1, so
  the reset hogs on gpio1 do not depend on the fspi probe.
- gpio hogs: describe ethsw-reset# and ethsw-mdio-en with their
  active-low polarity (GPIO_ACTIVE_LOW), same electrical levels.
- Link to v1: https://lore.kernel.org/r/20260907-for-upstream-nbxv3-dts-v1-0-f43fd0028b78@free.fr

---
Vincent Jardin (3):
      dt-bindings: vendor-prefixes: add Free Mobile
      dt-bindings: arm: fsl: add Free Mobile Nodebox v3 CPU Module
      arm64: dts: freescale: add Nodebox v3 CPU Module

 Documentation/devicetree/bindings/arm/fsl.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts |  34 +++
 .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      | 330 +++++++++++++++++++++
 5 files changed, 374 insertions(+)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260907-for-upstream-nbxv3-dts-bbecd04038a2

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>



