Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0916CC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 08:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7wX0gzLeWkrGxRLbyOTwtE5y4InHoKHV6eGmDDTlvY=; b=Srg5rT2H+WC1+WcHDCxY/mQeu0
	tugbege92PnmsFxJlj+bEHyUUQtl8A9B1Zfw04cz2L9N0IUaw8fa3SRXIL9IcAug2gTBy5eASoxOz
	3SS0df9xVURjVli2u7afwL/IhZab0vPpx83EcdgSHlgn9zdc/hq4t7jbCa/LXN6LrRuQbvQL4zpNz
	u385lnQGC9Hkq1Rr4WUL2R8UgxvNHfU2nBQ7t+VcH1tCADsdydZOVjefzXcVhN03UxqAoJjP5nxsw
	P+ODGWHW+7d8xiYelZoLVKk2t2Xe7Ss87FIvkQ+kex6t1PDyMF4WUfNZE/llIFpg6XeZDclQ6Hw5g
	iAS3pwWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7Qt-0000000EUjP-0QVY;
	Wed, 14 May 2025 08:25:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7CD-0000000ERlW-0guA;
	Wed, 14 May 2025 08:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747210230;
	bh=WUURxq3LHL+04YRY7uvf9Nu5I60wsu/c6IcZSpXwkhc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aJ0cxBZcXVCOuAo+ajbIyexv9Y2JdL7LnzwcFG3r7ithVWqjYvnBNUSQSRcQ6EYa9
	 +aHBr7IS6mR4tiomnYiWlRPHPRFJo53Of8AbcD3Y34kZtsCXXHL1cM6G5o/Q+XSbUJ
	 DL973cBoHrKrz7WGIo5MV/IS4G2sE/msLUC87jSlSvQuiRR17q5fQG0u32S2FK1Bqd
	 AQ1dEVXULo504UdDkbt7btVasFhPxojBfGzvwA0QXsULCboEzpOhGJeB7QeGisnKwK
	 pHi5G1xubW9/7kmd7wNjRX/Q9dyvs4exp8qgzofpJWaCweiJkrJucJ31MJyZZtHGW6
	 KSrQOpRf6XQZw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E03C17E07F2;
	Wed, 14 May 2025 10:10:30 +0200 (CEST)
Message-ID: <a5f45658-56fb-40bb-b5ed-c83428adbebd@collabora.com>
Date: Wed, 14 May 2025 10:10:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.16
To: Rob Herring <robh@kernel.org>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, matthias.bgg@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
 <CAL_JsqKmQxaOUykYfoUCaVe9jg5_fWnoLhxn5j3WmQC1Tm8ZGw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqKmQxaOUykYfoUCaVe9jg5_fWnoLhxn5j3WmQC1Tm8ZGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_011033_507938_215F26CD 
X-CRM114-Status: GOOD (  25.75  )
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

Il 13/05/25 20:28, Rob Herring ha scritto:
> On Tue, May 6, 2025 at 6:55 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
>>
>>    Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>>
>> are available in the Git repository at:
>>
>>    https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.16
>>
>> for you to fetch changes up to 1fe38d2a19950fa6dbc384ee8967c057aef9faf4:
>>
>>    arm64: dts: mt6359: Add missing 'compatible' property to regulators node (2025-05-06 10:35:45 +0200)
>>
>> ----------------------------------------------------------------
>> MediaTek ARM64 DTS updates for v6.16
>>
>> This adds new MT8186-based Google Ponyta Chromebooks and improves
>> support for already supported SoCs and machines.
>>
>> In particular, SoCs changes:
>>   - MT6893
>>     - Added pinmux header for this SoC
>>   - MT8183
>>     - Added port node for dsi_out in mt8183.dtsi to fix some DT
>>       validation warnings.
>>   - MT8188
>>     - Adds an important fix for its Display Controller's Read DMA 0
>>       (RDMA0), as it was using the wrong IOMMU and failing;
>>     - Multimedia Data Path 3 (MDP3) devicetree nodes were added: now
>>       hardware assisted color format conversions are available;
>>     - Since SCP firmwares are available on linux-firmware, the
>>       necessary nodes for the dual-core SCP were added to devicetree
>>       along with the firmware-name property in mt8390-genio-common,
>>       enabling hardware video encoders and decoders on the MediaTek
>>       Genio 510 and Genio 700 EVKs.
>>   - MT8195
>>     - Power domains for video decoders and encoders were reparented
>>       as the secondary vdec/venc core needs the primary core to be
>>       also powered, as those are sharing the LAT hardware and SRAM;
>>     - Missing power domain was added to the primary DisplayPort
>>       Interface (dp_intf0) node.
>>   - MT8196
>>     - Added pinmux header for this SoC
>>
>> ... and machine-specific changes:
>>   - Radxa NIO-12L (MT8395)
>>     - Added support for Audio DSP and sound output through 3.5mm jack;
>>   - MediaTek Genio 1200 EVK (MT8395)
>>     - Support for this EVK's DSI display was added and enabled;
>>     - Secondary display backlight was disabled as it was unused
>>   - MediaTek Genio 510/700 (MT8370/MT8390)
>>     - Added support for the DSI display on these EVKs too;
>>     - Fixed an issue with integrated USB Bluetooth getting unplugged
>>       permanently due to wrong declaration of the ID GPIO polarity of
>>       the secondary USB port on the SSUSB2 controller;
>>
>> Other than that, some other devicetree validation fixes were added
>> on the MT6357 and MT6359 PMIC DTs: for the former, all of the
>> compatible strings in all regulators were dropped as those were
>> wrong and causing DT kselftest failures - and for the latter, the
>> compatible string for the main `regulators` node was added as it
>> was missing.
>>
>> ----------------------------------------------------------------
>> AngeloGioacchino Del Regno (6):
>>        arm64: dts: mediatek: mt8195: Reparent vdec1/2 and venc1 power domains
>>        dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
>>        dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
>>        arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
> 
> I reported this already with no response, but this commit adds a crap
> load of DT warnings. This is on top of the many existing Mediatek
> warnings. Mediatek has the most warnings on arm64 and is about a fifth
> of the total (182 out of 932 on Linus' tree). If there's a fix for any
> of these, I can't find it. Either fix these warnings or drop the dts
> change.

Sorry, your email slipped through the cracks and didn't see it.

Let me check if I can add a quick fix.

Thanks!
Angelo

> 
> (Note the number is the count for the specific warning in order to
> avoid duplicates (N warnings for N boards)).
> 
>       33 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
>       33 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match
> any of the regexes: '^pinctrl-[0-9]+$'
>       33 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any
> of the regexes: '^pinctrl-[0-9]+$'
>       33 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
>       33 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional
> failed, one must be fixed:
>       33 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any
> of the regexes: '^pinctrl-[0-9]+$'
>       33 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any
> of the regexes: '^pinctrl-[0-9]+$'
>       33 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one
> must be fixed:
>       33 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one
> must be fixed:
>       11 (mediatek,mt8188-mdp3-tcc): 'power-domains' does not match any
> of the regexes: '^pinctrl-[0-9]+$'
>       11 (mediatek,mt8188-mdp3-ovl): 'oneOf' conditional failed, one
> must be fixed:
>       11 (mediatek,mt8188-mdp3-ovl): 'iommus' is a required property
>        8 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 12], [46, 186],
> [46, 191]] is too long
>        8 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 10], [46, 186],
> [46, 191]] is too long
>        8 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 12], [45, 186],
> [45, 191]] is too long
>        8 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 10], [45, 186],
> [45, 191]] is too long
>        8 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185],
> [46, 190], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42],
> [49, 8]] is too long
>        8 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185],
> [45, 190], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42],
> [48, 8]] is too long
>        4 (mediatek,mt8188-mdp3-rsz): clocks: [[51, 24], [51, 25]] is too long
>        4 (mediatek,mt8188-mdp3-rsz): clocks: [[51, 20], [51, 21]] is too long
>        4 (mediatek,mt8188-mdp3-rsz): clocks: [[50, 24], [50, 25]] is too long
>        4 (mediatek,mt8188-mdp3-rsz): clocks: [[50, 20], [50, 21]] is too long
>        4 (mediatek,mt8188-mdp3-rdma): power-domains: [[67, 15], [67,
> 20]] is too long
>        4 (mediatek,mt8188-mdp3-rdma): power-domains: [[66, 15], [66,
> 20]] is too long
>        2 (mediatek,mt8188-mdp3-rdma): mboxes: [[121, 13, 1], [121, 14,
> 1], [121, 16, 1], [121, 21, 1]] is too short
>        2 (mediatek,mt8188-mdp3-rdma): mboxes: [[120, 13, 1], [120, 14,
> 1], [120, 16, 1], [120, 21, 1]] is too short
>        2 (mediatek,mt8188-mdp3-rdma): mboxes: [[119, 13, 1], [119, 14,
> 1], [119, 16, 1], [119, 21, 1]] is too short
>        2 (mediatek,mt8188-mdp3-rdma): mboxes: [[118, 13, 1], [118, 14,
> 1], [118, 16, 1], [118, 21, 1]] is too short
>        2 (mediatek,mt8188-mdp3-rdma): iommus: [[132, 164], [132, 166]]
> is too long
>        2 (mediatek,mt8188-mdp3-rdma): iommus: [[131, 164], [131, 166]]
> is too long
>        2 (mediatek,mt8188-mdp3-rdma): iommus: [[130, 164], [130, 166]]
> is too long
>        2 (mediatek,mt8188-mdp3-rdma): iommus: [[129, 164], [129, 166]]
> is too long
>        2 (mediatek,mt8188-mdp3-rdma): iommus: [[122, 192], [122, 194]]
> is too long
>        2 (mediatek,mt8188-mdp3-rdma): iommus: [[122, 128], [122, 131]]
> is too long
>        2 (mediatek,mt8188-mdp3-rdma): iommus: [[121, 192], [121, 194]]
> is too long
>        2 (mediatek,mt8188-mdp3-rdma): iommus: [[121, 128], [121, 131]]
> is too long
>        2 (mediatek,mt8188-mdp3-rdma): iommus: [[120, 192], [120, 194]]
> is too long
>        2 (mediatek,mt8188-mdp3-rdma): iommus: [[120, 128], [120, 131]]
> is too long
>        2 (mediatek,mt8188-mdp3-rdma): iommus: [[119, 192], [119, 194]]
> is too long
>        2 (mediatek,mt8188-mdp3-rdma): iommus: [[119, 128], [119, 131]]
> is too long
>        2 (mediatek,mt8188-mdp3-rdma): clocks: [[44, 12], [39, 186],
> [39, 191]] is too long
>        2 (mediatek,mt8188-mdp3-rdma): clocks: [[44, 10], [39, 186],
> [39, 191]] is too long
>        2 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 24], [39, 185],
> [39, 190], [42, 4], [42, 41], [42, 42], [42, 7], [44, 41], [44, 42],
> [42, 8]] is too long
>        2 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 12], [37, 186],
> [37, 191]] is too long
>        2 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 10], [37, 186],
> [37, 191]] is too long
>        2 (mediatek,mt8188-mdp3-rdma): clocks: [[40, 24], [37, 185],
> [37, 190], [40, 4], [40, 41], [40, 42], [40, 7], [42, 41], [42, 42],
> [40, 8]] is too long
>        2 (mediatek,mt8188-mdp3-rdma): clocks: [[38, 12], [34, 186],
> [34, 191]] is too long
>        2 (mediatek,mt8188-mdp3-rdma): clocks: [[38, 10], [34, 186],
> [34, 191]] is too long
>        2 (mediatek,mt8188-mdp3-rdma): clocks: [[36, 24], [34, 185],
> [34, 190], [36, 4], [36, 41], [36, 42], [36, 7], [38, 41], [38, 42],
> [36, 8]] is too long
>        1 (mediatek,mt8188-mdp3-rsz): clocks: [[44, 24], [44, 25]] is too long
>        1 (mediatek,mt8188-mdp3-rsz): clocks: [[44, 20], [44, 21]] is too long
>        1 (mediatek,mt8188-mdp3-rsz): clocks: [[42, 24], [42, 25]] is too long
>        1 (mediatek,mt8188-mdp3-rsz): clocks: [[42, 20], [42, 21]] is too long
>        1 (mediatek,mt8188-mdp3-rsz): clocks: [[38, 24], [38, 25]] is too long
>        1 (mediatek,mt8188-mdp3-rsz): clocks: [[38, 20], [38, 21]] is too long
>        1 (mediatek,mt8188-mdp3-rdma): power-domains: [[60, 15], [60,
> 20]] is too long
>        1 (mediatek,mt8188-mdp3-rdma): power-domains: [[58, 15], [58,
> 20]] is too long
>        1 (mediatek,mt8188-mdp3-rdma): power-domains: [[54, 15], [54,
> 20]] is too long
>        1 (mediatek,mt8188-mdp3-rdma): mboxes: [[92, 13, 1], [92, 14,
> 1], [92, 16, 1], [92, 21, 1]] is too short
>        1 (mediatek,mt8188-mdp3-rdma): mboxes: [[131, 13, 1], [131, 14,
> 1], [131, 16, 1], [131, 21, 1]] is too short
>        1 (mediatek,mt8188-mdp3-rdma): mboxes: [[129, 13, 1], [129, 14,
> 1], [129, 16, 1], [129, 21, 1]] is too short
>        1 (mediatek,mt8188-mdp3-rdma): iommus: [[93, 192], [93, 194]] is too long
>        1 (mediatek,mt8188-mdp3-rdma): iommus: [[93, 128], [93, 131]] is too long
>        1 (mediatek,mt8188-mdp3-rdma): iommus: [[142, 164], [142, 166]]
> is too long
>        1 (mediatek,mt8188-mdp3-rdma): iommus: [[140, 164], [140, 166]]
> is too long
>        1 (mediatek,mt8188-mdp3-rdma): iommus: [[132, 192], [132, 194]]
> is too long
>        1 (mediatek,mt8188-mdp3-rdma): iommus: [[132, 128], [132, 131]]
> is too long
>        1 (mediatek,mt8188-mdp3-rdma): iommus: [[130, 192], [130, 194]]
> is too long
>        1 (mediatek,mt8188-mdp3-rdma): iommus: [[130, 128], [130, 131]]
> is too long
>        1 (mediatek,mt8188-mdp3-rdma): iommus: [[103, 164], [103, 166]]
> is too long
> 
> 
>>        arm64: dts: mediatek: Add MT6893 pinmux macro header file
>>        arm64: dts: mediatek: mt8390-genio-common: Add Display on DSI0
>>
>> Axe Yang (1):
>>        arm64: dts: mediatek: mt8186-corsola: make SDIO card removable
>>
>> Cathy Xu (1):
>>        arm64: dts: mediatek: mt8196: Add pinmux macro header file
>>
>> Chen-Yu Tsai (1):
>>        arm64: dts: mediatek: mt8188: Fix IOMMU device for rdma0
>>
>> Jianeng Ceng (2):
>>        dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
>>        arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
>>
>> Julien Massot (4):
>>        arm64: dts: mediatek: mt8395-nio-12l: Add scp firmware-name
>>        arm64: dts: mediatek: mt8395-genio-1200-evk: Add scp firmware-name
>>        arm64: dts: mediatek: mt8395-nio-12l: Enable Audio DSP and sound card
>>        arm64: dts: mt6359: Add missing 'compatible' property to regulators node
>>
>> Louis-Alexis Eyraud (3):
>>        arm64: dts: mediatek: mt8390-genio-common: Fix pcie pinctrl dtbs_check error
>>        arm64: dts: mediatek: mt8395-genio-1200-evk: Add display on DSI0
>>        arm64: dts: mediatek: mt8390-genio-common: Set ssusb2 default dual role mode to host
>>
>> Macpaul Lin (1):
>>        arm64: dts: mediatek: mt8195: Add power domain for dp_intf0
>>
>> Nícolas F. R. A. Prado (4):
>>        arm64: dts: mediatek: mt8188: Describe SCP as a cluster with two cores
>>        arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for scp0
>>        arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles
>>        arm64: dts: mediatek: mt8395-genio-1200-evk: Disable unused backlight
>>
>> Pin-yen Lin (1):
>>        arm64: dts: mt8183: Add port node to mt8183.dtsi
>>
>> Rob Herring (Arm) (1):
>>        arm/arm64: dts: mediatek: Add missing "#sound-dai-cells" to linux,bt-sco
>>
>> Łukasz Majczak (1):
>>        arm64: dts: mediatek: mt8186: starmie: Fix external display
>>
>>   Documentation/devicetree/bindings/arm/mediatek.yaml                      |    7 +
>>   Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml     |    4 +
>>   Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml   |    4 +
>>   Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml   |    4 +
>>   Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml |   10 +-
>>   Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml            |    8 +-
>>   Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml           |    8 +-
>>   Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml           |    1 +
>>   Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml        |    8 +-
>>   Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml           |    8 +-
>>   Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml         |    8 +-
>>   Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml          |    1 +
>>   arch/arm/boot/dts/mediatek/mt2701-evb.dts                                |    1 +
>>   arch/arm64/boot/dts/mediatek/Makefile                                    |    2 +
>>   arch/arm64/boot/dts/mediatek/mt6357.dtsi                                 |   10 -
>>   arch/arm64/boot/dts/mediatek/mt6359.dtsi                                 |    2 +
>>   arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h                            | 1356 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                           |   11 +-
>>   arch/arm64/boot/dts/mediatek/mt8183.dtsi                                 |    4 +
>>   arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts              |   18 +
>>   arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts              |   22 +
>>   arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi                  |   49 ++
>>   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi                 |   45 --
>>   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi                         |    1 -
>>   arch/arm64/boot/dts/mediatek/mt8188-evb.dts                              |    6 +-
>>   arch/arm64/boot/dts/mediatek/mt8188.dtsi                                 |  349 ++++++++++++++-
>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi                                 |   51 ++-
>>   arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h                            | 1574 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi                    |  170 ++++++-
>>   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts                   |  127 +++++-
>>   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts                    |   59 ++-
>>   31 files changed, 3797 insertions(+), 131 deletions(-)
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
>>
>>

