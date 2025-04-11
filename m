Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74440C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 17:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Is0Tv5Qzwt4A9uWjI0HGYq4sHB+E6BSjr5ZDy2SLn80=; b=K8yBgarFD7+ekPCxtMJ0e58rsR
	eUjEYZJYMC2FfYxLJgTTN/PLoF/tvNhpMO5wXHvbv72O/XK5zFvfyvduvuI+z3HZwor12ghePq3v4
	zCaxegWvT/9P1563UIHhdQrwFJAH4WJtOX6IuW/nhOp8qhtSFeuHv05Zf3U466QiHErTxb/spkIci
	DJdf958Zw6XZ/U0SBbgbK5ZGLU+Uce5b1bAJIGUok61GFtOJvGkbZMPDWLzQsTCxEhqpXajBIyCwu
	SWUw2fXr0fJOR1PLDZ4JwuQ6ebOPibW9Nr3AFyLJcSzBkuGV2RZCfoz8fvsO62Gcr59t4Ce8q5YQl
	oEriCJDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IWz-0000000EZrt-17DM;
	Fri, 11 Apr 2025 17:51:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IUI-0000000EZXW-43t8;
	Fri, 11 Apr 2025 17:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BF2443E9A;
	Fri, 11 Apr 2025 17:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94F4C4CEE2;
	Fri, 11 Apr 2025 17:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744393702;
	bh=lfoVd2WdvvKEWN86eDOm1mDwX18E8UkAi+d0laS83N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YbBL8KzLUS8f0W9icJQycy88I9hs0MoLv4zCFYgjJbtjewOghzGPPZyG6f8nJ4xDn
	 yweLKfStxNC94+fOu7dpl/UoNWBkB+G12mOwykSjo05N6vGBG+bsDxEI/UYEDDLvjJ
	 fvdxVoTPS+qOmLXeWWbRWwoftBL7+ymGRVUMUok4RsZZL6EfTLfnRTK41IGNS7nGNE
	 eEgjfVwThhmuA8g6w0F4jJtgyO4I1FiiIjogT2jb6YgUo0MnN0wVChnNuHqeAHucbb
	 5LyUPnZ1m3K0PVqJ/jngk2vNuddqthTjdejCTfa5FcauTgFGhBo/P/jXG9C/J3847t
	 FAIF6xiMJ13Aw==
Date: Fri, 11 Apr 2025 12:48:20 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	y.oudjana@protonmail.com, lukas.bulwahn@redhat.com,
	u.kleine-koenig@baylibre.com, geert+renesas@glider.be,
	amergnat@baylibre.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: mediatek: Describe MT6893
 Clock Controllers
Message-ID: <20250411174820.GA3602673-robh@kernel.org>
References: <20250410144110.476197-1-angelogioacchino.delregno@collabora.com>
 <20250410144110.476197-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410144110.476197-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_104823_048403_2E9A59DA 
X-CRM114-Status: GOOD (  12.52  )
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

On Thu, Apr 10, 2025 at 04:41:08PM +0200, AngeloGioacchino Del Regno wrote:
> Add bindings to describe both the System Clock Controllers,
> providing PLLs and main clocks, and the functional clock
> controllers, providing peripheral clocks (i2c, multimedia, etc),
> as found in the MediaTek Dimensity 1200 (MT6893) SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/clock/mediatek,mt6893-clock.yaml |  56 +++
>  .../clock/mediatek,mt6893-sys-clock.yaml      |  68 +++

These just duplicate the same schema as the mt8365 bindings. Just add 
compatibles there.

Or I'm open to other options. The only variation among all of these 
seems to be whether or not they have 'syscon' compatible or 
'#reset-cells'. And for mt8188 it seems we have that wrong (see below)


In general, it would be nice to see more clean-ups of the existing 
Mediatek stuff before a new SoC. It makes me sad when I appear to be the 
only one that cares.

For reference, here's the top warnings for Mediatek on arm64 (999 total, 
182 unique (stripping the dtb name), 27 undocumented compatibles). This 
information is available daily from my CI job
(https://gitlab.com/robherring/linux-dt/-/jobs).

Mediatek has the most warnings with 182. 

arch/arm64/boot/dts/mediatek:999:182
     29  syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
     27  pinctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
     27  pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
     27  pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
     27  pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
     27  pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
     27  pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
     27  pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
     27  pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
     27  dsi@14014000 (mediatek,mt8183-dsi): ports: 'port@1' is a required property
     27  dsi@14014000 (mediatek,mt8183-dsi): ports: 'port@0' is a required property
     27  dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
     27  bt-sco (linux,bt-sco): '#sound-dai-cells' is a required property
     22  pmic (mediatek,mt6359): regulators: 'compatible' is a required property
     22  pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
     17  pinctrl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
     17  pinctrl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
     17  pinctrl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
     17  pinctrl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
     12  sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
     11  pinctrl@10005000 (mediatek,mt8183-pinctrl): 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1000-mipibrdg-en', 'pp1800-mipibrdg-en', 'pp3300-mipibrdg-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
     11  mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
     11  mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
     11  clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' is a required property
     11  clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' is a required property
     11  clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' is a required property
     11  clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' is a required property
     11  clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' is a required property
     11  clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
     11  clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property

arch/arm64/boot/dts/mediatek:27
['dlg,da9211']
['marvell,sd8897-bt']
['mediatek,mt2712-pcie']
['mediatek,mt2712-scpsys', 'syscon']
['mediatek,mt6331-regulator']
['mediatek,mt6380-regulator']
['mediatek,mt6779-audio', 'syscon']
['mediatek,mt6795-timer', 'mediatek,mt6577-timer']
['mediatek,mt6797-scpsys']
['mediatek,mt7622-pcie']
['mediatek,mt7622-scpsys', 'syscon']
['mediatek,mt8173-afe-pcm']
['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
['mediatek,mt8173-mdp-rdma']
['mediatek,mt8173-mdp-rsz']
['mediatek,mt8173-mdp-wdma']
['mediatek,mt8173-mdp-wrot']
['mediatek,mt8173-rt5650']
['mediatek,mt8173-vpu']
['mediatek,mt8183-audio']
['mediatek,mt8183-audiosys', 'syscon']
['mediatek,mt8183_da7219_max98357']
['mediatek,mt8183_da7219_rt1015p']
['mediatek,mt8183_mt6358_ts3a227_max98357']
['mediatek,mt8183_mt6358_ts3a227_rt1015p']
['melfas,mip4_ts']
['winbond,w25q64jwm', 'jedec,spi-nor']

