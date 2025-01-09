Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEF2E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4h2bwbD0J+Nl3hPMCF5cHRI3ufJYd4bqWZPyRUO0Hg=; b=3TRtwVc+4G7UsRwuzpPUR/JvUT
	y6JdKm5wcb9Ldq2ZWs9ARZAYHh6EkpKjfcvUdCXOu2NxWNZFoUfBOC8f8fzVDbTEz2tg161fHARY/
	LnTS2s9YtP5Oy5VC4MNmjGWR+qw93ew4E8CRYzgGDTM0TSdmmaBVApuLAcGBwbJoCELfBnYRVOAbR
	k2IUnh0m6WnxHtj/qMvQg3Qnhj170JBy+0e0izyvcb6HEzYINXpgWoWWKUlauZMCCqKCFpijleWqx
	iNj4xdcpx66sl45gSoFO8tWyK4W8LQaspvRKAMLk4+SuFvUe6fBajOcK/JLAI5RvUqhF5aP8P0A3x
	cmJJZb2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtjJ-0000000CHPX-21uf;
	Thu, 09 Jan 2025 14:41:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVti6-0000000CGzc-0G3L;
	Thu, 09 Jan 2025 14:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2317E5C5AE8;
	Thu,  9 Jan 2025 14:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F4CC4CED2;
	Thu,  9 Jan 2025 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736433632;
	bh=FzKpk1Kq8AuWIYuSSIRzcUeb4DT9dYfnfccqrFUAL34=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tdAa5quYNqCwXnECoYvmsZuPDGKgx6KKp6hbctwCi00dmAUQP16Rk7E3osEbhkvG7
	 ksaAWFnCDrzIBqj3+kJzUoc+h1M63ac0Q7uzQheE5olAFrKC8+EIKHLlgYYIQ19dCX
	 7COiZRmSP6HHlIK3gPWJWqV8nVI8dr3NWz6UhNSmHcIgB4fLi1VBcMOlYyBpGeD/Oo
	 ELYHsHIRTBEv1QJ61nDTTfRpF5g9QmBAI5c2IlLlcb1WW61fx8zv6jhp9iYGRUkGbb
	 khCFIEpU1fWTv9pu1hBzYzhTzA+6KLc5ieIMat6+j6TjNT53U5OvSX2hCBZyhIa+ft
	 5gkFXptrYYraQ==
Date: Thu, 09 Jan 2025 08:40:31 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 CK Hu <ck.hu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Conor Dooley <conor+dt@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
 linux-mediatek@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: amergnat@baylibre.com
In-Reply-To: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
Message-Id: <173643343500.3320207.10375372470982398627.robh@kernel.org>
Subject: Re: [PATCH v6 0/6] Add display support for the MT8365-EVK board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_064034_212109_F347354F 
X-CRM114-Status: GOOD (  28.00  )
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


On Thu, 09 Jan 2025 11:37:53 +0100, amergnat@baylibre.com wrote:
> The purpose of this series is to add the display support for the mt8365-evk.
> 
> This is the list of HWs / IPs support added:
> - Connectors (HW):
>   - HDMI
>   - MIPI DSI (Mobile Industry Processor Interface Display Serial Interface)
> - HDMI bridge (it66121)
> - DSI pannel (startek,kd070fhfid015)
> - SoC display blocks (IP):
>   - OVL0 (Overlay)
>   - RDMA0 (Data Path Read DMA)
>   - Color0
>   - CCorr0 (Color Correction)
>   - AAL0 (Adaptive Ambient Light)
>   - GAMMA0
>   - Dither0
>   - DSI0 (Display Serial Interface)
>   - RDMA1 (Data Path Read DMA)
>   - DPI0 (Display Parallel Interface)
> 
> The Mediatek DSI, DPI and DRM drivers are also improved.
> 
> The series is rebased on top of Angelo's series [1] to
> use the OF graphs support.
> 
> Regards,
> Alex
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
> Changes in v6:
> - Fix DPI binding: remove the duplicated property (power-domains).
> - Squash defconfig commit.
> - Fix the property order in the DTS.
> - Link to v5: https://lore.kernel.org/r/20231023-display-support-v5-0-3905f1e4b835@baylibre.com
> 
> Changes in v5:
> - Patch merged, then removed from the series:
>   - dt-bindings: display: mediatek: rdma: add compatible for MT8365 SoC
>   - dt-bindings: display: mediatek: ovl: add compatible for MT8365 SoC
>   - dt-bindings: display: mediatek: gamma: add compatible for MT8365 SoC
>   - dt-bindings: display: mediatek: dpi: add compatible for MT8365
>   - dt-bindings: display: mediatek: dsi: add compatible for MT8365 SoC
>   - dt-bindings: display: mediatek: dither: add compatible for MT8365 SoC
>   - dt-bindings: display: mediatek: color: add compatible for MT8365 SoC
>   - dt-bindings: display: mediatek: ccorr: add compatible for MT8365 SoC
>   - dt-bindings: display: mediatek: aal: add compatible for MT8365 SoC
> - Enable STARTEK KD070FHFID015 panel in the defconfig.
> - Rebase on top of 6.13-rc6.
> - Link to v4: https://lore.kernel.org/all/20231023-display-support-v4-0-ed82eb168fb1@baylibre.com
> 
> Changes in v4:
> - Patch merged, then removed from the series:
>   - dt-bindings: display: mediatek: dpi: add power-domains property
>   - dt-bindings: pwm: mediatek,pwm-disp: add compatible for mt8365 SoC
>   - clk: mediatek: mt8365-mm: fix DPI0 parent
> - Remove mediatek,mt8365-dpi compatible from mtk_drm_drv.c because it
>   use the mt8192's data. It's a miss.
> - Add MT8365 OF graphs support, remove the hardcoded display path and
>   rebase on top of Angelo's series [1].
> - Link to v3: https://lore.kernel.org/r/20231023-display-support-v3-0-53388f3ed34b@baylibre.com
> 
> Changes in v3:
> - Drop "drm/mediatek: add mt8365 dpi support" because it's the same
>   config as mt8192 SoC
> - Drop "dt-bindings: pwm: mediatek,pwm-disp: add power-domains property"
>   because an equivalent patch has been merge already.
> - Add DPI clock fix in a separate commit.
> - Improve DTS(I) readability.
> - Link to v2: https://lore.kernel.org/r/20231023-display-support-v2-0-33ce8864b227@baylibre.com
> 
> Changes in v2:
> - s/binding/compatible/ in commit messages/titles.
> - Improve commit messages as Conor suggest.
> - pwm-disp: Set power domain property for MT8365. This one is optionnal
>   and can be used for other SoC.
> - Fix mediatek,dsi.yaml issue.
> - Remove the extra clock in the DPI node/driver and fix the dpi clock
>   parenting to be consistent with the DPI clock assignement.
> - Link to v1: https://lore.kernel.org/r/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com
> 
> [1] https://lore.kernel.org/lkml/20240516081104.83458-1-angelogioacchino.delregno@collabora.com/
> 
> ---
> Alexandre Mergnat (4):
>       drm/mediatek: dsi: Improves the DSI lane setup robustness
>       arm64: defconfig: enable display support for mt8365-evk
>       arm64: dts: mediatek: add display blocks support for the MT8365 SoC
>       arm64: dts: mediatek: add display support for mt8365-evk
> 
> Fabien Parent (2):
>       dt-bindings: display: mediatek: dpi: add power-domains example
>       drm/mediatek: add MT8365 SoC support
> 
>  .../bindings/display/mediatek/mediatek,dpi.yaml    |   2 +
>  arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 236 +++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 336 +++++++++++++++++++++
>  arch/arm64/configs/defconfig                       |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   8 +
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +
>  6 files changed, 586 insertions(+)
> ---
> base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
> change-id: 20231023-display-support-c6418b30e419
> 
> Best regards,
> --
> Alexandre Mergnat <amergnat@baylibre.com>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com:

arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: switch@31: 'interrupts' is a dependency of 'interrupt-controller'
	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: vcodec@17020000: 'assigned-clocks' is a required property
arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: pinctrl@10211000: reg: [[0, 270602240, 0, 4096], [0, 268455936, 0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pwm@1401f000: compatible: 'oneOf' conditional failed, one must be fixed:
	['mediatek,mt8173-disp-pwm', 'mediatek,mt6595-disp-pwm'] is too long
	'mediatek,mt8173-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
	'mediatek,mt8173-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm', 'mediatek,mt8365-disp-pwm']
	'mediatek,mt8173-disp-pwm' was expected
	'mediatek,mt8183-disp-pwm' was expected
	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: charger: usb-otg-vbus-regulator: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/power/supply/mt6360_charger.yaml#
arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@1100e000: Unevaluated properties are not allowed ('id' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: dp-bridge@5c: 'extcon' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#






