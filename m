Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20654CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 01:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hovQSyd+JxEsYjlB8mTVe+qRtrkSjfOrblEnkCkXXJg=; b=SIDU4skSkz62Yvf/7KK4bC1Doi
	VgHX0Rauz5AE38+o4qKPhCN4rCsJ0Q4y3lnt47sqAY8P2HRomUcuMlYT6gCJs8oi2B5IcYKjSRmc2
	xIDd9ZSMmTxdjs7FVmiNRKJkDfb3YqrQI0JR5eOIlHCaFrWuE2/84WI3KFDk5fkq2cbIeMaOeg4PH
	9KHcZ333w98BV48p6vOXtUOKmch+TdXEyhNi4/FtpYUT5a5u+ormkCQnNBNfh+jzgVkZ5HfPMs2BJ
	7deEByoSLR4N3cY51NIRb/VrGoWXzzmDjo4bPO3ckCq+mNGYlPcQ+i33zcciSU5S1yNExXSoh1x03
	42nTPwZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ach-00000005AYP-4A3D;
	Thu, 25 Sep 2025 01:18:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1acg-00000005AYG-438F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 01:18:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 474F7601EB;
	Thu, 25 Sep 2025 01:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD03AC4CEE7;
	Thu, 25 Sep 2025 01:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758763094;
	bh=45bAfEzqB4LMImO72az8/GSyERP99FSqFK9rILx3i4k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=n50gbN6XBzzmYff3NeHKPI4Qf7l/TA8deCuiLrcdX8GQGy4yimp+I09eEuoUIhNkJ
	 CzAPqg5pkgFd3UzV+5KrGlKq48jKr5zxZXGEZEM8mlXGLKiKr1hY6xJhUcoXSRgGau
	 lpJHKsQnU54bJwZzR98vY2Wr6FRxWYkFNlFSPZGkUzZkEM9g7SAnczgC2FoGyjCxFB
	 99z2K6PpbfceiZBSuy4DzxJBlCiTH8HSuytnC+P2+U3rW9oBsLaE8qgbaupAv9NKcT
	 Br9gsnM+L6syEaeCZP3B1wTatmT6E7wvTUTkqi/UGOmfw5lnA9aTxHgrIhFRBwD/3m
	 IE/Evxqjx9Nyw==
Date: Wed, 24 Sep 2025 20:18:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 linux-amarula@amarulasolutions.com, Frank Li <Frank.Li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250924130749.3012071-1-dario.binacchi@amarulasolutions.com>
References: <20250924130749.3012071-1-dario.binacchi@amarulasolutions.com>
Message-Id: <175876282784.3268717.7038048984656005880.robh@kernel.org>
Subject: Re: [RESEND PATCH 1/3] ASoC: mxs-saif: support usage with
 simple-audio-card
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


On Wed, 24 Sep 2025 15:07:44 +0200, Dario Binacchi wrote:
> Add support for enabling MCLK output when using the simple-audio-card
> driver. In the sound/soc/mxs/mxs-sgtl5000.c use case, that driver
> handles MCLK enable/disable by calling mxs_saif_get_mclk() and
> mxs_saif_put_mclk() at probe/remove. This does not happen when the
> simple-audio-card driver is used. Extend the mxs-saif driver to enable
> MCLK output in that scenario.
> 
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  sound/soc/mxs/mxs-saif.c | 123 ++++++++++++++++++++++++++++-----------
>  1 file changed, 90 insertions(+), 33 deletions(-)
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
 Base: using specified base-commit cec1e6e5d1ab33403b809f79cd20d6aff124ccfe

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250924130749.3012071-1-dario.binacchi@amarulasolutions.com:

arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'edt-ft5x06-wake@0', 'edt-ft5x06@0', 'fec-3v3-enable@0', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'tlv320aic3x-pins@0', 'usb0-vbus-enable@0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1-vb
 us-enable@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#






