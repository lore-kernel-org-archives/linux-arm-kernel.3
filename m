Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C9FD116F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyUBuwX90WoAJd5EKF1+CNHkbe6N/JgXeAUSm2ZebPE=; b=lzE7ewpU6pI7RJPuZ6kamMj9EP
	FWeiiuH3H6Odu6nXaexrfLWSi7IM2itmkms1q2Om48g8QwYpc9sGucGA8i1Ouhf3Wn27l5BC/ksIX
	CV6JjFekWc3uND+8AeYOsf5GNIDlzQEXmjyvTV2qxL3dwr3qX2FhpFriKD3OcH+yvVDuqu/bz1RKp
	mrIX+svYJLTf+eDgCQ4wEY57LJb4YlGrixZwvXE/tP+UKa0vwC2kdVYLFf+BVM5KuA7jHfdWWm2VV
	IJ5sNJsWunfGEna20NQkqWyzZkWKAjSJman97QX8BlV8CGYoEDgEfQSzy+ValSkZfb87S9WU0T/Kc
	ufuUcH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2zi-00000003YN7-1UeM;
	Mon, 01 Dec 2025 12:27:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2zh-00000003YMY-1szV;
	Mon, 01 Dec 2025 12:27:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B0FA66017E;
	Mon,  1 Dec 2025 12:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B838C113D0;
	Mon,  1 Dec 2025 12:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764592024;
	bh=i96DCyLXmoxXifwkwlWsefxHps4cKXJHbSKtrIEuu9s=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=Q4+R+26xuBHHarucFdM9/YbUv8dpIFuWGta1ixc5h8eizQQuMAHaz0HKcDsPHZs32
	 jAeSuHi+f+lOPfADoUuPvEq305KQdovareskahJd1eMAIH3fn1JXV1vdwn0pQl1wwy
	 gQsUwYqsAfyNvFKIiP30LTiQICc5y+7WlnXrEm/tb9BzcsQn0pJ6Xc6xaaFoAGByv1
	 Yk75IfW6W/gXdMmShXwfor+9p0tuwHDv1YN4sEXEkr5kwtpNtFaLHnXbeoykvoGGrU
	 AI5UWt67CyWB7YWNYB1eLKcvYXO9wll1evu8Ap4CoA5d8rRYvGNYtPx8c+AVDRas9E
	 ta5QuJe/UxFsQ==
From: Rob Herring <robh@kernel.org>
Date: Mon, 01 Dec 2025 06:27:02 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Gary Bisson <bisson.gary@gmail.com>
In-Reply-To: <20251201-review-v2-0-dc2df44eec7e@gmail.com>
References: <20251201-review-v2-0-dc2df44eec7e@gmail.com>
Message-Id: <176459099842.2909480.6224244901963014446.robh@kernel.org>
Subject: Re: [PATCH v2 0/4] Add support for Ezurio MediaTek platforms
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


On Mon, 01 Dec 2025 11:23:14 +0100, Gary Bisson wrote:
> This series adds support for Ezurio MediaTek platforms called
> "Tungsten". It includes support for MT8370-based Tungsten 510 and
> MT8390-based Tungsten 700 SOMs.
> 
> Changelog v1 -> v2:
> - use b4 to cc all maintainers properly
> - squashed patches 2/3 together
> - updated node names to be generic (pmic)
> 
> Couldn't repro the schema issues sent by the bots.
> 
> Regards,
> 
> Gary Bisson (4):
>   dt-bindings: vendor-prefixes: Add Ezurio LLC
>   dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
>   arm64: dts: mediatek: add device tree for Tungsten 510 board
>   arm64: dts: mediatek: add device tree for Tungsten 700 board
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |    2 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>  arch/arm64/boot/dts/mediatek/Makefile         |    2 +
>  .../dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
>  .../dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
>  .../dts/mediatek/mt83x0-tungsten-smarc.dtsi   | 1481 +++++++++++++++++
>  6 files changed, 1523 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi
> 
> --
> 2.43.0
> 
> ---
> Gary Bisson (4):
>       dt-bindings: vendor-prefixes: Add Ezurio LLC
>       dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
>       arm64: dts: mediatek: add device tree for Tungsten 510 board
>       arm64: dts: mediatek: add device tree for Tungsten 700 board
> 
>  .../devicetree/bindings/arm/mediatek.yaml          |    2 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
>  arch/arm64/boot/dts/mediatek/Makefile              |    2 +
>  .../boot/dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
>  .../boot/dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
>  .../boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi   | 1481 ++++++++++++++++++++
>  6 files changed, 1523 insertions(+)
> ---
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> change-id: 20251201-review-750072579991
> 
> Best regards,
> --
> Gary Bisson <bisson.gary@gmail.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: base-commit 7d0a66e4bb9081d75c82ec4957c50034cb0ea449 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/v6.18-rc3 (exact match)
 Base: tags/v6.18-rc3 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20251201-review-v2-0-dc2df44eec7e@gmail.com:

arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: i2c0-gpio-pins: pins-gpio: {'pinmux': [1536], 'bias-pull-up': 203, 'drive-strength-microamp': [1000]} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: spmi@10027000 (mediatek,mt8188-spmi): pmic@6:reg:0: [6, 0, 11] is too long
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: spmi@10027000 (mediatek,mt8188-spmi): #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: spmi@10027000 (mediatek,mt8188-spmi): #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: spmi@10027000 (mediatek,mt8188-spmi): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@6' were unexpected)
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: spmi@10027000 (mediatek,mt8188-spmi): pmic@6:reg:0: [6, 0, 11] is too long
	from schema $id: http://devicetree.org/schemas/spmi/spmi.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: spmi@10027000 (mediatek,mt8188-spmi): #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/spmi/spmi.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: spmi@10027000 (mediatek,mt8188-spmi): #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/spmi/spmi.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: pmic@6 (mediatek,mt6315-regulator): regulators:vbuck1: Unevaluated properties are not allowed ('mtk,combined-regulator', 'regulator-compatible' were unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: pmic@6 (mediatek,mt6315-regulator): regulators:vbuck3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: pmic@6 (mediatek,mt6315-regulator): regulators:vbuck4: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: vbuck1: 'mtk,combined-regulator' does not match any of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9#+\-._@]{0,63}$', '^[a-zA-Z0-9+\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*'
 , '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^
 bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^cso
 t,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '
 ^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^
 goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '
 ^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logi
 ctechno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*'
 , '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^o
 verkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,.*', 
 '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis
 ,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc
 ,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*
 ', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: mmc@11250000 (mediatek,mt8188-mmc): Unevaluated properties are not allowed ('cap-sdio-async-int', 'eint-gpios', 'enable-sdio-wakeup' were unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'AVDD-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'CPVDD-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'DBVDD-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'DCVDD-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'MICVDD-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'PLLVDD-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'SPKVDD1-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'SPKVDD2-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: i2c@11e01000 (mediatek,mt8188-i2c): pinctrl-names: ['default', 'default'] has non-unique elements
	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: panel-dsi0 (tianma,tm070jdhg30): 'power-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: i2c0-gpio-pins: pins-gpio: {'pinmux': [1536], 'bias-pull-up': 203, 'drive-strength-microamp': [1000]} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: spmi@10027000 (mediatek,mt8188-spmi): pmic@6:reg:0: [6, 0, 11] is too long
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: spmi@10027000 (mediatek,mt8188-spmi): #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: spmi@10027000 (mediatek,mt8188-spmi): #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: spmi@10027000 (mediatek,mt8188-spmi): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@6' were unexpected)
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: spmi@10027000 (mediatek,mt8188-spmi): pmic@6:reg:0: [6, 0, 11] is too long
	from schema $id: http://devicetree.org/schemas/spmi/spmi.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: spmi@10027000 (mediatek,mt8188-spmi): #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/spmi/spmi.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: spmi@10027000 (mediatek,mt8188-spmi): #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/spmi/spmi.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: pmic@6 (mediatek,mt6315-regulator): regulators:vbuck1: Unevaluated properties are not allowed ('mtk,combined-regulator', 'regulator-compatible' were unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: pmic@6 (mediatek,mt6315-regulator): regulators:vbuck3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: pmic@6 (mediatek,mt6315-regulator): regulators:vbuck4: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: vbuck1: 'mtk,combined-regulator' does not match any of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9#+\-._@]{0,63}$', '^[a-zA-Z0-9+\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*'
 , '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^
 bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^cso
 t,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '
 ^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^
 goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '
 ^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logi
 ctechno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*'
 , '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^o
 verkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,.*', 
 '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis
 ,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc
 ,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*
 ', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: mmc@11250000 (mediatek,mt8188-mmc): Unevaluated properties are not allowed ('cap-sdio-async-int', 'eint-gpios', 'enable-sdio-wakeup' were unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'AVDD-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'CPVDD-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'DBVDD-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'DCVDD-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'MICVDD-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'PLLVDD-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'SPKVDD1-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: codec@1a (wlf,wm8962): 'SPKVDD2-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8962.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: i2c@11e01000 (mediatek,mt8188-i2c): pinctrl-names: ['default', 'default'] has non-unique elements
	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: panel-dsi0 (tianma,tm070jdhg30): 'power-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml






