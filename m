Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C566E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 22:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YndHkwUDFJiqzHjuVBQbxKUao+/GdCUYUIN+0tlqQlU=; b=0CZr3JXhn1ZngaGGuEz2+Rng0U
	SZ58se6ByYSHRz363LAV7iRmgeI6oSI0ytOVr9YdO/Fp6mEru5V45RYTfi5MhsxF7A2WBDKVMp0KE
	sOIV/Ei+eBcT9zPdAihG0U8m5c2cbM0+4TKjAd80ftP98ud0z9owqn4cl1zb2FDI/tCpRKblJllCg
	v5PyrmF2cWYfgLYxhg2xrkCQT5jApfgVfxAqzpEYykszQw6yB6s+8XXF/jtPl12PR976etuxxtRCi
	GZvkwIyQxWYW/2vqjaR7zWwjn988YEXyZ96MzYHNtL8YgOSqDK0hP/JUNwp/SBAolPvKGC7QJIGca
	kCq0EMMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVef1-0000000A2nf-3cHr;
	Wed, 08 Jan 2025 22:36:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVeda-0000000A2Se-3iq3;
	Wed, 08 Jan 2025 22:34:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E6F4A4181D;
	Wed,  8 Jan 2025 22:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51960C4CED3;
	Wed,  8 Jan 2025 22:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736375693;
	bh=WPM0lgLhcXgBhGTurYPnKmr64Y3Q50Ezvc/k+z3x8S4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YydRynON5nSluNf0CaQIPW+b8UUathMlNoXw6TXeA7c7tSt5JrXuUNCO/3i9PrfJM
	 XQdtEmQwmTOGDTHL7utLx6zCixwuLgMa68xjyOiNg6hUPrhgN75WhjbKLXcgvj+qB6
	 G24BADeLNvuw+jkl7hfpgM1rI54HYGrTsLmuf6AFTVra0syOYjD8+dGremMb7lafvA
	 qXa2JKzs2BUUlyhvkj2B5uy3E323ERVk2+CytKbosUbhPXqEpByvBawwfTd6EVnyl3
	 75xYnLjQxS3n4qWTfjMJIyjIVW77ckxpSqqMniG90jDfH6DXePMFgdbYd5bGx1XbR0
	 o+FVXh4E3WJ+w==
Date: Wed, 08 Jan 2025 16:34:52 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
 Catalin Marinas <catalin.marinas@arm.com>, David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
 Will Deacon <will@kernel.org>, CK Hu <ck.hu@mediatek.com>, 
 Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 linux-kernel@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
To: amergnat@baylibre.com
In-Reply-To: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
Message-Id: <173637565787.1164195.4383151341351649520.robh@kernel.org>
Subject: Re: [PATCH v5 0/7] Add display support for the MT8365-EVK board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_143455_050927_503299DC 
X-CRM114-Status: GOOD (  27.46  )
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


On Wed, 08 Jan 2025 17:15:42 +0100, amergnat@baylibre.com wrote:
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
> Alexandre Mergnat (5):
>       drm/mediatek: dsi: Improves the DSI lane setup robustness
>       arm64: defconfig: enable display connector support
>       arm64: defconfig: enable STARTEK KD070FHFID015 panel
>       arm64: dts: mediatek: add display blocks support for the MT8365 SoC
>       arm64: dts: mediatek: add display support for mt8365-evk
> 
> Fabien Parent (2):
>       dt-bindings: display: mediatek: dpi: add power-domains property
>       drm/mediatek: add MT8365 SoC support
> 
>  .../bindings/display/mediatek/mediatek,dpi.yaml    |   5 +
>  arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 236 +++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 336 +++++++++++++++++++++
>  arch/arm64/configs/defconfig                       |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   8 +
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +
>  6 files changed, 589 insertions(+)
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


New warnings running 'make CHECK_DTBS=y mediatek/mt8365-evk.dtb' for 20231023-display-support-v5-0-3905f1e4b835@baylibre.com:

arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: /soc/dpi@14018000: failed to match any schema with compatible: ['mediatek,mt8365-dpi', 'mediatek,mt8192-dpi']
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: /soc/dpi@14018000: failed to match any schema with compatible: ['mediatek,mt8365-dpi', 'mediatek,mt8192-dpi']






