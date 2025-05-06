Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E825DC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=84e6e4Ol8eZu6s5Ld00ciNwRbV9pN47l4alaSoa1fFw=; b=f96OJo78gGWpPg3jfOF4j2idtF
	UT2R6HAXdqAgDQDAihPY0DfKCBLtLeyoO3vFwPj5u1fH6wjjsEiAnwNRIC7pvCSHUo3DVv5Ld4dbL
	MB6qj991vJnpI6NF/0aNN7AvF8jDiYKCVlq53Vcm6C2e7lzbFqOsQlsM/H55kZX/btofTyiUadmWS
	XvnqGCYnnDYINKCGryi2OhoO98LraafIcw4ISITWuC+/DpdSfe1t7lA8XL6AuB1ekWLjSLdbTr3AS
	fsNUI75UkKKRkniLR54CecUiMyS+Hp0EDpgzdyP/vLIJZuCJDXfJaKFEyICV1GMunXT+/AaUqtozt
	Vb+4PGHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGsx-0000000BoWK-16rP;
	Tue, 06 May 2025 11:54:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCER1-0000000BKPH-0FSk;
	Tue, 06 May 2025 09:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746523073;
	bh=g9uR/nQOA/ZuUqaNkBigHW5Nr4WkTOkDR5cVAA5mdbE=;
	h=From:To:Cc:Subject:Date:From;
	b=H0rErT+hcov7ZEzilF34pRRwyK+ygGlosnSPFx5bFFBDzqmay9ST/J7lmdEJxRmZd
	 d1IBRHaqH5IkDwYkkudTWimpLzAfNzPPWIso3NGGstRdT4dvBXQHN8xZ9h4x0w8e6q
	 SSDSzquAD3KPPGzSeGbCdEx21R/lVDUSUFdBGEcrrk4RiHLQhxhWFrMz9nk2fgOvp4
	 s4Y8dJZxHLafvheqMF4loY7UbbzB+uVjXJDwTH/kWGT8PyOMaODsz0xhG/7lhYQ2lZ
	 /DIoqeDiBIoeXeQcclY7ggxxTEK/Y/fkpNP/Is2fN0LxCZO/eDzCV10OdvHAZ2sugC
	 nDyKASo+cGmBA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE60D17E078A;
	Tue,  6 May 2025 11:17:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.16
Date: Tue,  6 May 2025 11:17:32 +0200
Message-ID: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_021755_273891_D085B2C7 
X-CRM114-Status: GOOD (  17.24  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.16

for you to fetch changes up to 1fe38d2a19950fa6dbc384ee8967c057aef9faf4:

  arm64: dts: mt6359: Add missing 'compatible' property to regulators node (2025-05-06 10:35:45 +0200)

----------------------------------------------------------------
MediaTek ARM64 DTS updates for v6.16

This adds new MT8186-based Google Ponyta Chromebooks and improves
support for already supported SoCs and machines.

In particular, SoCs changes:
 - MT6893
   - Added pinmux header for this SoC
 - MT8183
   - Added port	node for dsi_out in mt8183.dtsi	to fix some DT
     validation	warnings.
 - MT8188
   - Adds an important fix for its Display Controller's Read DMA 0
     (RDMA0), as it was using the wrong IOMMU and failing;
   - Multimedia Data Path 3 (MDP3) devicetree nodes were added: now
     hardware assisted color format conversions are available;
   - Since SCP firmwares are available on linux-firmware, the
     necessary nodes for the dual-core SCP were added to devicetree
     along with the firmware-name property in mt8390-genio-common,
     enabling hardware video encoders and decoders on the MediaTek
     Genio 510 and Genio 700 EVKs.
 - MT8195
   - Power domains for video decoders and encoders were reparented
     as the secondary vdec/venc core needs the primary core to be
     also powered, as those are sharing the LAT hardware and SRAM;
   - Missing power domain was added to the primary DisplayPort
     Interface (dp_intf0) node.
 - MT8196
   - Added pinmux header for this SoC

... and machine-specific changes:
 - Radxa NIO-12L (MT8395)
   - Added support for Audio DSP and sound output through 3.5mm jack;
 - MediaTek Genio 1200 EVK (MT8395)
   - Support for this EVK's DSI display was added and enabled;
   - Secondary display backlight was disabled as it was unused
 - MediaTek Genio 510/700 (MT8370/MT8390)
   - Added support for the DSI display on these EVKs too;
   - Fixed an issue with integrated USB Bluetooth getting unplugged
     permanently due to wrong declaration of the ID GPIO polarity of
     the secondary USB port on the SSUSB2 controller;

Other than that, some other devicetree validation fixes were added
on the MT6357 and MT6359 PMIC DTs: for the former, all of the
compatible strings in all regulators were dropped as those were
wrong and causing DT kselftest failures - and for the latter, the
compatible string for the main `regulators` node was added as it
was missing.

----------------------------------------------------------------
AngeloGioacchino Del Regno (6):
      arm64: dts: mediatek: mt8195: Reparent vdec1/2 and venc1 power domains
      dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
      dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
      arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
      arm64: dts: mediatek: Add MT6893 pinmux macro header file
      arm64: dts: mediatek: mt8390-genio-common: Add Display on DSI0

Axe Yang (1):
      arm64: dts: mediatek: mt8186-corsola: make SDIO card removable

Cathy Xu (1):
      arm64: dts: mediatek: mt8196: Add pinmux macro header file

Chen-Yu Tsai (1):
      arm64: dts: mediatek: mt8188: Fix IOMMU device for rdma0

Jianeng Ceng (2):
      dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
      arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks

Julien Massot (4):
      arm64: dts: mediatek: mt8395-nio-12l: Add scp firmware-name
      arm64: dts: mediatek: mt8395-genio-1200-evk: Add scp firmware-name
      arm64: dts: mediatek: mt8395-nio-12l: Enable Audio DSP and sound card
      arm64: dts: mt6359: Add missing 'compatible' property to regulators node

Louis-Alexis Eyraud (3):
      arm64: dts: mediatek: mt8390-genio-common: Fix pcie pinctrl dtbs_check error
      arm64: dts: mediatek: mt8395-genio-1200-evk: Add display on DSI0
      arm64: dts: mediatek: mt8390-genio-common: Set ssusb2 default dual role mode to host

Macpaul Lin (1):
      arm64: dts: mediatek: mt8195: Add power domain for dp_intf0

Nícolas F. R. A. Prado (4):
      arm64: dts: mediatek: mt8188: Describe SCP as a cluster with two cores
      arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for scp0
      arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles
      arm64: dts: mediatek: mt8395-genio-1200-evk: Disable unused backlight

Pin-yen Lin (1):
      arm64: dts: mt8183: Add port node to mt8183.dtsi

Rob Herring (Arm) (1):
      arm/arm64: dts: mediatek: Add missing "#sound-dai-cells" to linux,bt-sco

Łukasz Majczak (1):
      arm64: dts: mediatek: mt8186: starmie: Fix external display

 Documentation/devicetree/bindings/arm/mediatek.yaml                      |    7 +
 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml     |    4 +
 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml   |    4 +
 Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml   |    4 +
 Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml |   10 +-
 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml            |    8 +-
 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml           |    8 +-
 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml           |    1 +
 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml        |    8 +-
 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml           |    8 +-
 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml         |    8 +-
 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml          |    1 +
 arch/arm/boot/dts/mediatek/mt2701-evb.dts                                |    1 +
 arch/arm64/boot/dts/mediatek/Makefile                                    |    2 +
 arch/arm64/boot/dts/mediatek/mt6357.dtsi                                 |   10 -
 arch/arm64/boot/dts/mediatek/mt6359.dtsi                                 |    2 +
 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h                            | 1356 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                           |   11 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                                 |    4 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts              |   18 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts              |   22 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi                  |   49 ++
 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi                 |   45 --
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi                         |    1 -
 arch/arm64/boot/dts/mediatek/mt8188-evb.dts                              |    6 +-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                                 |  349 ++++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                                 |   51 ++-
 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h                            | 1574 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi                    |  170 ++++++-
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts                   |  127 +++++-
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts                    |   59 ++-
 31 files changed, 3797 insertions(+), 131 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h


