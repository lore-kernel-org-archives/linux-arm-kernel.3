Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D719CC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0EQyW6sKhsHbEM0FiXvZEMPWbxrVBqoFMcw038Fo0o=; b=yf9U3Fr0I+1cCDxHGjNXndwJp5
	rwy5mROQzIt9IG4NNMiijHa4jv3TLOKXzGl8NYQMU2s/RaRon85TYYN/7MaxWJ4MqLnquluFAhk4N
	aUu/GNiu/cKcEVu535YdLlhAjyZduCjJUgd25MwBfc7+l3Fzh3t09UiMmrizJWRIja/fpv5I1GG+N
	4d2RtC/3JmgJuSuHueGWFl7pBBODmIx5sdFVLYuKZqEPqIjExObmLH2UqTqn5qH2pmlYTWN360frr
	kVx7lN9TABAVA/hpClFLwK9Zn7HJbAgOt/adBcvMN8ofsd/uAZ9g2VWtoKYZs4eBf7SZpCnbLBSdw
	M/UZ/PBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UIZ-00000009T1L-1VpT;
	Wed, 23 Apr 2025 07:13:35 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UDK-00000009SJi-3lwC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:08:12 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id DB3B91F984;
	Wed, 23 Apr 2025 09:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745392089;
	bh=/0EQyW6sKhsHbEM0FiXvZEMPWbxrVBqoFMcw038Fo0o=; h=From:To:Subject;
	b=taM+nq0Tp+9ii+S0WaDF9seZryAoqKrz/vlplFL9/ZBKvYNh75kCC715TxDFQa+7j
	 C/sGGFpIK77WVU5hAsa96KvTgz0cbCtwlSeMWTZM1eSsgb80787R1TEDZ13sDDM7GW
	 m9Z7zfRZZMUu6acYf0lAsIKp7oi/a6A+Q9yGEc/kyS63x9sEef5+xz2ESa0JVOJ5d3
	 eOdQVUXumLYh6f12oLeAynDGKptfRtEJhUzCj7jMfFXKsVktMRWbgLkMojclU174EO
	 /wrDlZW4ofcXxj2R+S0I3MGfFJcZRhDvsNVCxViB6AMQjgUiz1cFqeO5rPYDOfd35J
	 /6AKlQjxqp/Kg==
Date: Wed, 23 Apr 2025 09:08:07 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco@dolcini.it>,
	Philippe Schenker <philippe.schenker@impulsing.ch>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to
 usdhc2
Message-ID: <20250423070807.GB4811@francesco-nb>
References: <20250422124619.713235-1-Wojciech.Dubowik@mt.com>
 <522decdf-faa0-433b-8b92-760f8fd04388@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <522decdf-faa0-433b-8b92-760f8fd04388@kontron.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_000811_096464_52E5F0BF 
X-CRM114-Status: GOOD (  21.19  )
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

Hello Frieder,

On Wed, Apr 23, 2025 at 08:50:54AM +0200, Frieder Schrempf wrote:
> Am 22.04.25 um 14:46 schrieb Wojciech Dubowik:
> > [Sie erhalten nicht häufig E-Mails von wojciech.dubowik@mt.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > Define vqmmc regulator-gpio for usdhc2 with vin-supply
> > coming from LDO5.
> > 
> > Without this definition LDO5 will be powered down, disabling
> > SD card after bootup. This has been introduced in commit
> > f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5").
> > 
> > Fixes: f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5")
> > 
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> > ---
> > v1 -> v2: https://lore.kernel.org/all/20250417112012.785420-1-Wojciech.Dubowik@mt.com/
> >  - define gpio regulator for LDO5 vin controlled by vselect signal
> > ---
> >  .../boot/dts/freescale/imx8mm-verdin.dtsi     | 23 +++++++++++++++----
> >  1 file changed, 19 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > index 7251ad3a0017..9b56a36c5f77 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > @@ -144,6 +144,19 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
> >                 startup-delay-us = <20000>;
> >         };
> > 
> > +       reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
> > +               compatible = "regulator-gpio";
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&pinctrl_usdhc2_vsel>;
> > +               gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
> > +               regulator-max-microvolt = <3300000>;
> > +               regulator-min-microvolt = <1800000>;
> > +               states = <1800000 0x1>,
> > +                        <3300000 0x0>;
> > +               regulator-name = "PMIC_USDHC_VSELECT";
> > +               vin-supply = <&reg_nvcc_sd>;
> > +       };
> 
> Please do not describe the SD_VSEL of the PMIC as gpio-regulator. There
> already is a regulator node reg_nvcc_sd for the LDO5 of the PMIC.
> 
> > +
> >         reserved-memory {
> >                 #address-cells = <2>;
> >                 #size-cells = <2>;
> > @@ -785,6 +798,7 @@ &usdhc2 {
> >         pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_cd>;
> >         pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_cd_sleep>;
> >         vmmc-supply = <&reg_usdhc2_vmmc>;
> > +       vqmmc-supply = <&reg_usdhc2_vqmmc>;
> 
> You should reference the reg_nvcc_sd directly here and actually this
> should be the only change you need to fix things, no?

If you just do this change you end-up in the situation I described in
the v1 version of this patch
https://lore.kernel.org/all/20250417130342.GA18817@francesco-nb/

With the IO being driven by the SDHCI core, while the linux driver
changes the voltage over i2c.

I was not aware of this sd-vsel-gpios, that if I understand correctly
should handle the concern I raised initially, having the PMIC driver
aware of this GPIO, however I do not see why that solution should be
better than this one.

BTW, is this solution safe from any kind of race condition? You have
this IO driven by the SDHCI IP, and the I2C communication to the PMIC
driven by the mmc driver, with the PMIC driver just reading this GPIO
once when changing/reading the voltage.

With this solution (that I proposed), the sdcard driver just use the
GPIO to select the right voltage and that's it, simple, no un-needed i2c
communication with the PMIC, and the DT clearly describe the way the HW
is designed.

Francesco


