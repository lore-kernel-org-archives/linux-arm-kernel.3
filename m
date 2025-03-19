Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7E4C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 23:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCRtMt/0zKGXpQ7zY4COT3UtWsb5ugKGd4EAhHhlNDE=; b=naM97uhzPHI/c7WjtT7JThqJIj
	pzL0d+sAaYc8lRu2m6sBuG7XPeYQf8MKs2tp3+g0cKtu2UUoMc7f2EyHcmsFRwlWSRqeNG+QFOrO2
	otdQ/0C0GvAKxCBvmz3uwVoCar3tZbHi1hS5qjD5iFtUiIGQ0Oub+zORmgwSrNIu5VXC0ZTWqBZVW
	Cm+VIzi8RHG+4bOwQk+kXGKB/za+3NrCTGEOIlRXu2BTJ4LAF3+JVmnAr3+lmairA2HO6V5r9PeRA
	26RUSSaTOnV4D5oyKBUBmXr6A9wLoXZ/XpYXxi1/DL66w0vHF3J7bVFbqkIwrdxP1gYNAaMXFEnho
	xASblEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2c3-0000000AP7c-168d;
	Wed, 19 Mar 2025 23:14:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2Yg-0000000AO6b-3nVQ;
	Wed, 19 Mar 2025 23:10:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A22A2A48B51;
	Wed, 19 Mar 2025 23:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E28C4CEE4;
	Wed, 19 Mar 2025 23:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742425845;
	bh=hpem3UEpjL9zg0df1KCgbi91SjPixiAmgIzpZt1KUJg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Wrgt/+Cu7qJjwLfGyMrE5m390d+gbteLAjKaxp7899EkxuXYaUzs3o357/afeEo2I
	 sNea93qPS9XMTYzjNX16xtSCWnp1IZD9m0e+1f9kSTvJa79v3D8D5EQmpYVnHP6xeg
	 leFvxd9RuBzF+zGHCXZ07MdrJ4hgrp00T4UPMq49J2AGybnTVxfCfWbMdvcKbUUqBu
	 OozrPjc5+2ug9gvQRSzzHV0z5Uu9AA/2se8ukJ5/lnkwrZ9AQmO/dAY20iEz4q0ChP
	 /R5CXDqRTYNXAAbsw/KF0Xcnko/nK1bTni/lrIMM0NVFvEZJc/kxjA10AXYjzUP+v3
	 V12O2lP/89qUA==
Date: Wed, 19 Mar 2025 18:10:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, jian.xu@amlogic.com, zhe.wang@amlogic.com, 
 Michael Turquette <mturquette@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
 shuai.li@amlogic.com, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-clk@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-amlogic@lists.infradead.org, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jiebing chen <jiebing.chen@amlogic.com>
In-Reply-To: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
References: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
Message-Id: <174242564271.2499930.16784872359354582008.robh@kernel.org>
Subject: Re: [PATCH v4 0/6] Add support for S4 audio
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_161047_079924_63F94680 
X-CRM114-Status: GOOD (  18.37  )
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


On Wed, 19 Mar 2025 15:04:43 +0800, jiebing chen wrote:
> Add s4 audio base driver.
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
> Changes in v4:
> - fix dtb check warning
> - add maxItems of power domain for dt-bindings
> - fixed audio clock pads regmap base and reg offset
> - use dapm widget to control tocodec bclk and mclk enable
> - Link to v3: https://lore.kernel.org/r/20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com
> 
> Changes in v3:
> - remove g12a tocodec switch event
> - Modify the incorrect title for dt-bindings
> - Link to v2: https://lore.kernel.org/r/20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com
> 
> Changes in v2:
> - remove tdm pad control and change tocodec base on g12a
> - change hifipll rate to support 24bit
> - add s4 audio clock
> - Link to v1: https://lore.kernel.org/r/20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com
> 
> ---
> jiebing chen (6):
>       dt-bindings: clock: meson: Add audio power domain for s4 soc
>       dt-bindings: clock: axg-audio: Add mclk and sclk pad clock ids
>       dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
>       ASoC: meson: g12a-toacodec: Add s4 tocodec driver
>       clk: meson: axg-audio: Add the mclk pad div for s4 chip
>       arm64: dts: amlogic: Add Amlogic S4 Audio
> 
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  20 +-
>  .../bindings/sound/amlogic,g12a-toacodec.yaml      |   1 +
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 219 ++++++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 372 ++++++++++++++++-
>  drivers/clk/meson/axg-audio.c                      | 441 ++++++++++++++++++++-
>  drivers/clk/meson/axg-audio.h                      |   6 +
>  include/dt-bindings/clock/axg-audio-clkc.h         |  11 +
>  sound/soc/meson/g12a-toacodec.c                    |  46 +++
>  8 files changed, 1111 insertions(+), 5 deletions(-)
> ---
> base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
> change-id: 20250110-audio_drvier-07a5381c494b
> 
> Best regards,
> --
> jiebing chen <jiebing.chen@amlogic.com>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250319-audio_drvier-v4-0-686867fad719@amlogic.com:

arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: sound: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb: clock-controller@0: reg: [[0, 0, 0, 180]] is too short
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#






