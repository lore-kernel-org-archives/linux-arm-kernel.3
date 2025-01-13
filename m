Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CCDC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4IntZx8T++xezyKkQzpmI+9FPCXAyPDtOToEJbE7HM=; b=4vamCc8nCmj0XSGZbeKmYL7bRM
	Ldah8GtrY29llYrkhdrN1IpMYqm9JCyBuz2jxUDwDeEsNVNv7jugjWAEsBQ6g+2v7AFFk2JPP8i0y
	hvCqEoC5pAe+d7TFMLxHbHLXTAaAoIqaLuYV+fb5hHSNBicWtihK7DNbfKFCvhqLwSjV4khoZUkxw
	UHRjjNOkrF43EyVTVJEc6L7sYxjkoMgU//gk+CRN+8Jj0W7KykfnXmMfY9YFDoGvVTYEKHJdxSB7t
	vANquYnbkbvEZOYrwcrvLKy3ieNxjP8NaFDXUH5hyeCqR6Qo/8gD4geptAda1YYgTN46RrShAQev+
	DZiimGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMrU-00000005l0R-28ZR;
	Mon, 13 Jan 2025 16:00:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMKR-00000005ck2-2enD;
	Mon, 13 Jan 2025 15:26:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 336065C564A;
	Mon, 13 Jan 2025 15:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980F5C4CEE6;
	Mon, 13 Jan 2025 15:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736781970;
	bh=T7t+1Ze8yLQOWuB84xpWs3Ri1LIErbNg7RQFQV/TxUQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jYfqx2/Z4QGhBfoSDKllsJeP9TSCI17tpVC+pdmI+BN+iG1sGEOtdQGgrZIldw7wh
	 kHluGCOY0QaXSPFusc2eiQI4+bqmFDgr/mUud5vGEJGaA/CYoGYtWA8IdBsN+KojWS
	 /sggSFJ2hQw+t+BfLhsJWTFKNOCJU/2jb42LqVV6nrW/trDBNWHYZvw/Z6SLBcY5Dx
	 mKgqPiuJ8yFCE8nV4EzMPibJ+IUJ5km+9PlhM7lUkrMi3z+vyJ2zNkzq0+jGcqGraJ
	 w5wnBXBcPK8mSJg1InYS54PA/zwBDNgzdEWFZZ3GV1Fbn13B4cOC0S1Mwl0Ye+S+Kn
	 ssXo7DlFm3Tqg==
Date: Mon, 13 Jan 2025 09:26:09 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 linux-amlogic@lists.infradead.org, linux-sound@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
To: jiebing chen <jiebing.chen@amlogic.com>
In-Reply-To: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
Message-Id: <173678161502.2153418.9839486392491673173.robh@kernel.org>
Subject: Re: [PATCH 0/3] Add support for S4 audio
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_072611_758509_6CB97C8F 
X-CRM114-Status: GOOD (  14.10  )
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


On Mon, 13 Jan 2025 14:35:12 +0800, jiebing chen wrote:
> Add the tdmout pad control and tocodec control driver.
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
> jiebing chen (3):
>       ASoC: dt-bindings: Add Amlogic S4 audio
>       ASoC: meson: s4:support for the on-chip audio
>       arm64: dts: amlogic: Add Amlogic S4 Audio
> 
>  .../bindings/sound/amlogic,s4-tdmout-pad.yaml      |  36 ++
>  .../bindings/sound/amlogic,s4-tocodec.yaml         |  44 +++
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 226 ++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 385 ++++++++++++++++++++-
>  sound/soc/meson/Kconfig                            |  16 +
>  sound/soc/meson/Makefile                           |   6 +
>  sound/soc/meson/s4-pad-out-control.c               | 372 ++++++++++++++++++++
>  sound/soc/meson/s4-tocodec-control.c               | 376 ++++++++++++++++++++
>  sound/soc/meson/t9015.c                            |   5 +-
>  9 files changed, 1461 insertions(+), 5 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com:

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
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: bus@fe000000: audio-controller@1A000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: bus@330000: audio-controller@E58: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: clock-controller@0: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller@1A000: 'AVDD-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/amlogic,t9015.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-amplifier-0: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/simple-audio-amplifier.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: sound: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#






