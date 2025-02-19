Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62735C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 00:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pICHfxgYHccXfhYVWjlKU+dYEkkD3yjTz6FSX4iS01A=; b=Z1lTamQyKhgZLJJ7qqQVmkVJHd
	PqM7WtytQbow6bIpPwAxVX8SQpXxWR9TYsd0Ebn++VrRnzSPrvzJZNYDk6zes6aVEh5+F9hDEVmEW
	0K0h/ZXnpf8/1jNhZtMttxsC1DSulSKP3gAQpyhI1K/lD2ls9276JYrqkEgJhFgAEfLW4dzW2/3KJ
	TaCl/47/a1O8gRBu+M93IoKEfP1lgZ4LDFL7onAy0Tc3XYGUxZdgE+hm4EFgmhLmEQt/IJ+SXfPJv
	6YIbpi4rbqlTFjGliVfoMc9r0u/l5qwA3g/RVvU5M0zgoAL0xzOLvkQ1K8q0h8Nz2OnSL3DwYH/Eu
	GkM1xCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYDH-0000000AOUl-0TEO;
	Wed, 19 Feb 2025 00:45:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYAM-0000000ANl0-34w7;
	Wed, 19 Feb 2025 00:42:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12E24A41E68;
	Wed, 19 Feb 2025 00:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E737C4CEEA;
	Wed, 19 Feb 2025 00:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739925737;
	bh=khIFgwQ769ZHyT5CdIGu1HrTamF79U/Lvixfrt97yy4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tYMECnuhBbykHVm1RU15MSPfwodg3z1htxAN/KBLJjEfTm6ZjKKZzvM4LQNkkEvqR
	 ClaezR+1hPyqLCLF9vcsJwyS3LhntD+NWvyEi5YBIFSW0FufMXlY1v2Y3LqPPUDAVR
	 xk+l2T+xh4m0oCPjiQ6a6pP+ZQSZLa2lgZFSJkOQe1mAAOjV497vgDKm+pNJJooPld
	 hebKKloMzj0TIyTVuWJP9YJgRpgmVHlc7LehcPCefynw7SIqVXZockj4d/PfPp8T8+
	 mDTXJSCkCKGNNLetz1B3T4purqsau+/G7TLHts/6T/lZbHqDxHtSBH5R8JQkvnWwJT
	 sCoYAzENbIfkw==
Date: Tue, 18 Feb 2025 18:42:16 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 shuai.li@amlogic.com, Stephen Boyd <sboyd@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, zhe.wang@amlogic.com, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, jian.xu@amlogic.com, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: jiebing chen <jiebing.chen@amlogic.com>
In-Reply-To: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
References: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
Message-Id: <173992515659.2064996.1911122760174546370.robh@kernel.org>
Subject: Re: [PATCH v2 0/5] Add support for S4 audio
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_164218_897597_ABE80B3D 
X-CRM114-Status: GOOD (  15.98  )
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


On Fri, 14 Feb 2025 10:13:39 +0800, jiebing chen wrote:
> Add s4 audio base driver.
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
> Changes in v2:
> - remove tdm pad control and change tocodec base on g12a
> - change hifipll rate to support 24bit
> - add s4 audio clock
> - Link to v1: https://lore.kernel.org/r/20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com
> 
> ---
> jiebing chen (5):
>       dt-bindings: clock: axg-audio: Add mclk and sclk pad for s4
>       dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
>       ASoC: meson: s4:support the audio clk
>       ASoC: meson: s4:support audio tocodec
>       arm64: dts: amlogic: Add Amlogic S4 Audio
> 
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  18 +
>  .../bindings/sound/amlogic,g12a-toacodec.yaml      |   1 +
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 219 +++++++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 370 ++++++++++++++++++-
>  drivers/clk/meson/axg-audio.c                      | 410 ++++++++++++++++++++-
>  drivers/clk/meson/axg-audio.h                      |   4 +
>  include/dt-bindings/clock/axg-audio-clkc.h         |  11 +
>  sound/soc/meson/axg-card.c                         |   3 +-
>  sound/soc/meson/g12a-toacodec.c                    |  64 ++++
>  9 files changed, 1095 insertions(+), 5 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com:

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
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: audio-controller@740: compatible: 'oneOf' conditional failed, one must be fixed:
	['amlogic,s4-toacodec'] is too short
	'amlogic,g12a-toacodec' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,g12a-toacodec.yaml#
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: sound: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#






