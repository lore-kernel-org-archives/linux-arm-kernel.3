Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E17F589D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCOUmyCYGwEY2Foet02Vaww9vNupcZt1d3Ifp8xNNkw=; b=c+N9whbqWXLT2OhlGtV6Ivb0hp
	H86YLduCsbP/69NVjfBZnFR0Yevui/pHdP8QIWbsJZnIHtsNKjO4pyru31zBZ0hcpk6z/atLffOSM
	fcjOfWqUnUAA8vJx1aTyOdvsfBmMuU8ZHJ16LRgyN+6Ofus6TtidixyFnJS2vrlX8necLn1pHT2MP
	MlAVTRSwVE4RFMrMgdXIZ7n/m09tcImBdzWBHl04cbr+5vzKSFMkXT878w98JdE8ADVRA1flKFtrM
	OzOHtyGjmJVkfVz8H3lcVgpw2dNl3ww+xRg7Dx2FbSqwBMj/iE8l/acydW9JJ7v7a4zzGswg1pfQW
	xZIOj4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuME-0000000BlXS-0sJM;
	Thu, 23 Apr 2026 13:44:42 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuMB-0000000BlWb-2HIX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 13:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=eCOUmyCYGwEY2Foet02Vaww9vNupcZt1d3Ifp8xNNkw=; b=d26QQlDYWJoWUhW2tmX2Wu4+ha
	PAd6/1EFB725wzjU4Q149FqJva95gemdkRf0j1Wxy86auHIuqQuXEw/+UakW3lnOvNX390Ltqu3o5
	tktfeLKqQ4weibtcH8bqb2+6lA3ZXv5608bVdrvzSP9kCggg5q63B1E9xkltvkIt2W00=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wFuLv-000000003ju-1JAI;
	Thu, 23 Apr 2026 09:44:23 -0400
Date: Thu, 23 Apr 2026 09:44:22 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com, antonin.godard@bootlin.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v2 00/15] var-som-6ul: improve support for variants
Message-Id: <20260423094422.09206dc0166d30af36c8b87d@hugovil.com>
In-Reply-To: <20260305180651.1827087-1-hugo@hugovil.com>
References: <20260305180651.1827087-1-hugo@hugovil.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_064439_679029_649D3385 
X-CRM114-Status: GOOD (  27.80  )
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

On Thu,  5 Mar 2026 13:06:15 -0500
Hugo Villeneuve <hugo@hugovil.com> wrote:

> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Hello,
> this patch series improves support for Variscite VAR-SOM-6UL based boards.

Hi,
simple ping to know if anything is missing for this series to be
applied/picked-up?

Hugo.


> 
> The first two patches fix DT/dmesg warnings.
> 
> The next patches fix the incorrect use of VAR-SOM-MX6UL to refer to the
> VAR-SOM-6UL.
> 
> The next patches add support for the imx6ull CPU variant of the VAR-SOM-6UL.
> 
> Then improves/fixes the following features/options that are currently not
> working on the concerto EVK board:
>   - ethernet ports ENET1
>   - LVDS display panel
>   - Wifi/Bt
> 
> Note that the previous configuration of the optional Wifi/Bluetooth module
> was copied from the original Variscite kernel tree, and required custom
> shell scripts to properly configure the Wifi/Bluetooth module.
> 
> Also factor out optional features into separate DTSI include files, so it will
> be easier to support them for other boards, and to make sure they are not
> unconditionnally enabled.
> 
> I have tested these changes on a Variscite concerto EVK board using a
> VAR-SOM-6UL with the following options:
>   - EC (ethernet phy on SOM)
>   - LD (LVDS encoder assembled on SOM)
>   - WBD (Wi-Fi 802.11 ac/a/b/g/n and Bluetooth 5.2/BLE on SOM)
> Result of tests:
>   - Both ethernet ports Ok
>   - LVDS display panel Ok
>   - Wifi/Bt Ok
> 
> Also tested on a custom board with a VAR-SOM-6UL SOM (will be submitted in
> a future series).
> 
> Thank you.
> 
> Link: [v1] https://lore.kernel.org/all/20260302190953.669325-1-hugo@hugovil.com/
> 
> Changes for v2:
> - Place imx6ull-var-som-concerto.dtb in alphabetical order (Frank)
> - s/include/dtsi in commit msgs (Frank)
> - Clarify and improve patches to change VAR-SOM-MX6UL (Krzysztof)
> - Collect tags for some acked patches (Krzysztof)
> - Reorder pinctrl_gpio_leds in separate patch (Frank)
> - Improve git commit messages ((Frank)/Krzysztof)
> 
> Hugo Villeneuve (15):
>   ARM: dts: imx6ul-var-som: fix warning for non-existent dc-supply
>     property
>   ARM: dts: imx6ul-var-som: fix warning for boolean property with a
>     value
>   ARM: dts: imx6ul-var-som: change incorrect VAR-SOM-MX6UL references
>   dt-bindings: arm: fsl: change incorrect VAR-SOM-MX6UL references
>   dt-bindings: arm: fsl: add variscite,var-som-imx6ull
>   ARM: dts: imx6ul-var-som: Factor out common parts for all CPU variants
>   ARM: dts: imx6ul-var-som-concerto: Factor out common parts for all CPU
>     variants
>   ARM: dts: imx6ul-var-som-concerto: order DT properties
>   ARM: dts: imx6ul-var-som: factor out SD card support
>   ARM: dts: imx6ul-var-som: add proper Wifi and Bluetooth support
>   ARM: dts: imx6ul-var-som: factor out ENET2 ethernet support
>   ARM: dts: imx6ul-var-som: add support for EC configuration option
>     (ENET1)
>   ARM: dts: imx6ul-var-som: factor out audio support
>   dt-bindings: display/lvds-codec: add ti,sn65lvds93
>   ARM: dts: imx6ul-var-som: add support for LVDS display panel
> 
>  .../devicetree/bindings/arm/fsl.yaml          |   8 +-
>  .../bindings/display/bridge/lvds-codec.yaml   |   1 +
>  arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
>  .../dts/nxp/imx/imx6ul-var-som-audio.dtsi     |  30 ++
>  ...ar-som.dtsi => imx6ul-var-som-common.dtsi} | 140 +++-----
>  ...ts => imx6ul-var-som-concerto-common.dtsi} | 159 ++-------
>  .../nxp/imx/imx6ul-var-som-concerto-full.dts  |  22 ++
>  .../dts/nxp/imx/imx6ul-var-som-concerto.dts   | 318 +-----------------
>  .../dts/nxp/imx/imx6ul-var-som-enet1.dtsi     |  44 +++
>  .../dts/nxp/imx/imx6ul-var-som-enet2.dtsi     |  79 +++++
>  .../nxp/imx/imx6ul-var-som-lvds-panel.dtsi    | 112 ++++++
>  .../boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi   |  27 ++
>  .../boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi |  75 +++++
>  arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi | 219 +-----------
>  .../nxp/imx/imx6ull-var-som-concerto-full.dts |  22 ++
>  .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  21 ++
>  .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi |  36 ++
>  17 files changed, 575 insertions(+), 741 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi
>  copy arch/arm/boot/dts/nxp/imx/{imx6ul-var-som.dtsi => imx6ul-var-som-common.dtsi} (60%)
>  copy arch/arm/boot/dts/nxp/imx/{imx6ul-var-som-concerto.dts => imx6ul-var-som-concerto-common.dtsi} (50%)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-lvds-panel.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
> 
> 
> base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
> -- 
> 2.47.3
> 
> 


-- 
Hugo Villeneuve

