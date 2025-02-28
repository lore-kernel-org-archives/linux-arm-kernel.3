Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F307CC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HPtsDePWV0VmSraDDltpF/dLT7ALgaOgLR4dOn0AqY=; b=gXlpWvep/zesbABSb/LdQgLt2L
	yHiTnFmeBp0Nj51OlPcDPWgGhM6oCpoECi+uFqVvNEf6gLuVZlMnYvGd+QJMRn829paTyVGWqJ1U6
	cnaCc6w/bmBHO7e/vD+IFg0FrmA6tS7TW3mnjshjDPxR3ZUdpPaZXXdN9MsKYa7zAfNaDp3ZwykMO
	uTa6XL1FrPnBBlOvByIhAn5SsvbrmGIES46CakpCD1cbY1spcTapwyqk5XR056RMj3irAXUljxUWR
	moKAVwlbatxtZW3J+iNUzmDUnnK0eURodDC+maow7qJ1DitIVzSKHQ47Ca2d+ovgRXIJypvlXBuyV
	/1hk8hGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1e5-0000000BKEY-3ceg;
	Fri, 28 Feb 2025 14:47:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1HU-0000000BFUE-1LWm;
	Fri, 28 Feb 2025 14:24:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADCD25C64E7;
	Fri, 28 Feb 2025 14:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC3DC4CED6;
	Fri, 28 Feb 2025 14:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740752639;
	bh=Z7Ql+u5YzWqD85Qt5XHh+UJpa/CVhj/NNrypB2fEbOE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=vCqUrCKWlROX8qqb+alRvT9d1dHuXdSRM7IJ8P5HQF/P161M4IVJfrXPHgBMd/HIE
	 R4NLkwfue3o+ZAfjnp7Z4UqzOSQdfJFSaTnRWC5gK7WAtRPcMPJwOhnNA//QtkkFlN
	 Eme9Zd9QA8vqnyPSKDi4s1c+XKYqnG3f/KRFlotQs+C77uLWh95eDHGMsYDxJroyHh
	 uqvy4a5u0JB5VoyDsry3RGgqdir0wKjBXHehEjxB+9364DRAWGdTkJ3vm2NLOppiy5
	 d4+FIdQDoVrWauwVSQ6xiJC9loR3ebCWeq1C+g8fv6uGbhhZ2PxyQ0DpVubK5YtHc9
	 zfS4wV68oomwQ==
Date: Fri, 28 Feb 2025 08:23:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 linux-amlogic@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-sound@vger.kernel.org, zhe.wang@amlogic.com, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 jian.xu@amlogic.com, Liam Girdwood <lgirdwood@gmail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 linux-clk@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 shuai.li@amlogic.com, linux-kernel@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>
To: jiebing chen <jiebing.chen@amlogic.com>
In-Reply-To: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
References: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
Message-Id: <174075232847.2756181.14032687393614819238.robh@kernel.org>
Subject: Re: [PATCH v3 0/6] Add support for S4 audio
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_062400_471064_31D53528 
X-CRM114-Status: GOOD (  16.13  )
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


On Fri, 28 Feb 2025 16:04:08 +0800, jiebing chen wrote:
> Add s4 audio base driver.
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
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
>       clk: meson: axg-audio: Add the mclk pad div for s4
>       ASoC: meson: s4: Add s4 tocodec driver
>       arm64: dts: amlogic: Add Amlogic S4 Audio
> 
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  18 +
>  .../bindings/sound/amlogic,g12a-toacodec.yaml      |   1 +
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 219 +++++++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 371 ++++++++++++++++++-
>  drivers/clk/meson/axg-audio.c                      | 410 ++++++++++++++++++++-
>  drivers/clk/meson/axg-audio.h                      |   4 +
>  include/dt-bindings/clock/axg-audio-clkc.h         |  11 +
>  sound/soc/meson/g12a-toacodec.c                    |  51 +++
>  8 files changed, 1081 insertions(+), 4 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com:

arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-0: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller-2: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: sound: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#






