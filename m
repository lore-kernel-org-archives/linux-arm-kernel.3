Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61206D34095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 15:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWu6sXdHjYYQkuVcg7TPfKLgU3Ds1iapMZ6klxTyf1c=; b=VfwK7OLVx0Av1rt24XSRZttDF3
	UKkShzIjWQp2O7NybnSOJtwC071rhqiO1JGH3y1iyCw/+CHyuhcz5jrcFyDOKEibkPNHbOeNHdJ4R
	J+HLImaAasB4bDJx6UIRpEv3aGaa5hll4KgRwG2E/MXgUMI24G/lY5N207F9qIdNPPcydfg2uDW09
	f3t7eFH1MaV1l6PNWSgTaeXf3Um9XSAG8yWQ1qBVEMBMMhJyVBp1KzmHVOzbPpuH+JCg+d+/YkiBf
	Mmy7n1OYns8B0TLHrDnilfeSNRBSIVHjuIXX00ZKBhg5ooQS+OuWz5oah9u+8lfychEf4roSJbAqT
	Xsg2tIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklQq-0000000EaSK-1sBB;
	Tue, 27 Jan 2026 15:56:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklQn-0000000EaRy-1o0e;
	Tue, 27 Jan 2026 15:56:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DAB9600AD;
	Tue, 27 Jan 2026 15:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CED1C116C6;
	Tue, 27 Jan 2026 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769529400;
	bh=pyesTGZkOMY1CDLH595pytnp+a/HTRbOucVfk8mO0ZE=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=ljxMjaQUO+xIXWR2kM5tAeDfxymnyk4/q4shrBM0f5GeTIT0DmYoM63aLv7+lQcCy
	 Rk7IYQtD1bOoEL0oQEWsZBhaCCEXDj4NLcqQYJQxNV1sXXqEs/2rRpnRnRMR6KyYRo
	 buTfxs1BbBY+zuVAYwZD0matwCs7Looq6cbtnepQqI7Eq0owiAxLkgGkHmulB4I+GP
	 1ti7KFgGBbQspUdPV6iBN6kp/6PFtkyA3D252xhb5n0H5rVunUEgP++7niqXUr2eAd
	 K60jcWQ3eZZbSf6vQT4KkJdCCletNodCaJzokJuwQN97yc0spPtBp6VjXxUASch5Tm
	 sgmxNsvhOULWw==
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 Jan 2026 09:56:39 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-amlogic@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 linux-clk@vger.kernel.org, shuai.li@amlogic.com, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, jian.xu@amlogic.com, 
 linux-sound@vger.kernel.org, zhe.wang@amlogic.com, 
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>
To: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
Message-Id: <176952925847.1904460.11456869237043173749.robh@kernel.org>
Subject: Re: [PATCH v6 0/5] Add support for S4 audio
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


On Mon, 26 Jan 2026 06:01:41 +0000, Jiebing Chen wrote:
> This series completes the end-to-end audio support
> for S4 SoC from hardware bindings to driver implementation
> and system integration.
> 
> 1 Device Tree Bindings Updates
> Added audio power domain and S4 audio clock support for S4 SoC.
> Added S4 audio tocodec binding support.
> 
> 2 Driver Implementation
> Implemented S4 tocodec driver for G12A architecture.
> Added S4 audio clock support in AXG audio clock
> 
> 3 Device Tree Integration
> Add Amlogic S4 audio subsystem support in arm64 DTS.
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
> Changes in v6:
> - Fix the problem of string for Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> - Remove clock pad register, and it will be submitted as an independent patch.
> - Redescribe sound/soc/meson/g12a-toacodec.c
> - Link to v5: https://lore.kernel.org/r/20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com
> 
> Changes in v5:
> - Fix warning Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yam when make dt_binding_check
> - The audio reg is mounted below the APB bus in dts file.
> - Deal with pad clock in a distinct controller.
> - Fix warning for sound/soc/meson/g12a-toacodec.c
> - Link to v4: https://lore.kernel.org/r/20250319-audio_drvier-v4-0-686867fad719@amlogic.com
> 
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
> Jiebing Chen (5):
>       dt-bindings: clock: meson: Add audio power domain for S4 soc
>       dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
>       ASoC: meson: g12a-toacodec: Add S4 tocodec driver
>       clk: meson: axg_audio: add S4 support
>       arm64: dts: amlogic: Add Amlogic S4 Audio
> 
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  18 +-
>  .../bindings/sound/amlogic,g12a-toacodec.yaml      |   1 +
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 222 +++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 361 +++++++++++++++++++++
>  drivers/clk/meson/axg-audio.c                      | 165 ++++++++++
>  sound/soc/meson/g12a-toacodec.c                    |  36 ++
>  6 files changed, 801 insertions(+), 2 deletions(-)
> ---
> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
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


This patch series was applied (using b4) to base:
 Base: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com:

arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dtb: clock-controller@330000 (amlogic,s4-audio-clkc): reg: [[0, 3342336, 0, 216], [0, 3346048, 0, 16]] is too long
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: clock-controller@330000 (amlogic,s4-audio-clkc): reg: [[0, 3342336, 0, 216], [0, 3346048, 0, 16]] is too long
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml






