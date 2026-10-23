Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 10:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XQJ11tkt;
	dkim=pass (1024-bit key, unprotected) header.d=grimler.se header.i=@grimler.se header.a=rsa-sha256 header.s=key1 header.b=l1z0FiUo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M0s3SFlMeOGNR0VjX2ZhF+zTIKdV5x/45iKV7UcMLG0=; b=XQJ11tktGnf9WRICAmt2dVoaTk
	du7/9zSM6H1YHzhswLA8CcJ9UUhSE0qV3YDX5/2DkI8fhQHVyDlMvcnMvhcl3IKKbmQXxzETnejGE
	/98nWOZmvG3ab8nWKzCOydtM6bONnoFZ5NU4OaKJePe6fSohkDkam3dsWbsXHAF80PRdKJFbz2IFP
	RgDYs502mD3qO3I5ufkaI/ConDjVCyqQKgH+0qZCtGkBncuxAJPNf+vSlhiic+In0qYdXWttL+1p4
	dJeH0vVsEzH0frXgAH80/jAu3+dPDY/r5gFRAfP0Wwi8IBu5W/3CyTZbtgfGevo20RwsJOY4QPgOz
	+7O6qmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKC5U-0000000G6cI-30SM;
	Fri, 23 Oct 2026 10:01:24 +0000
Received: from out-128.mta0.migadu.com ([2001:41d0:1004:224b::80] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKC5Q-0000000G6bb-1qKs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 10:01:23 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Sl832lwWv9q0+uztm4xFM++41k7qXCoKfbSb4C6WYFM=;
 c=simple/simple; d=grimler.se;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792749675; v=1; x=1793354475;
 b=l1z0FiUo0EzYZ5/WiXjcU/n8db2gMYv3Qs5CzXmz7x4paclekKYJAoHmd7N4F4YdsfRr8B1d
 C+8jrLNs7HRHRWIIuKmawALtuA8BNR7m2CP731aCH6I5o1ILx0mUWcuzPLOLgA7Xw/sm7uL5RlO
 frNihZP4Fv0p8gCGuz2/Vhhg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 6fe652901f52c9d0;
	Fri, 23 Oct 2026 10:01:15 +0000
X-Mizu-Trace-ID: 6fe652901f52c9d0
X-Migadu-Flow: FLOW_OUT
Date: Fri, 23 Oct 2026 12:01:10 +0200
From: Henrik Grimler <henrik@grimler.se>
To: Josef Schlehofer <pepe.schlehofer@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: samsung: Add Hardkernel ODROID-U2
Message-ID: <20261023100110.GA24541@localhost>
References: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
 <20261022055208.17746-3-pepe.schlehofer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022055208.17746-3-pepe.schlehofer@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_030121_391194_9F270CAB 
X-CRM114-Status: GOOD (  32.27  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Josef,

On Thu, Oct 22, 2026 at 07:52:08AM +0200, Josef Schlehofer wrote:
> ODROID-U2 is a single board computer from Hardkernel based on the
> Samsung Exynos4412 Prime SoC with 2 GB of LPDDR2 RAM. It is the
> predecessor of the ODROID-U3 and shares most of its design:
> - microSD card slot and eMMC module socket
> - SMSC LAN9730 10/100 Ethernet on HSIC0
> - SMSC USB3503A hub on HSIC1 with two USB 2.0 host ports
> - micro-HDMI port with CEC
> - MAX98090 audio codec with a 3.5 mm headphone jack and an on-board
>   digital microphone
> - MAX77686 PMIC
> - 2-pin header for an optional PWM controlled cooling fan
> - blue heartbeat LED
> 
> Unlike the ODROID-U3, the micro-USB port has no VBUS supply switch, so
> it can only work in peripheral mode, and there is no expansion header
> with SPI. The 3.5 mm jack is headphone only and the speaker outputs of
> the codec are not connected.
> 
> Add a device tree for the board that includes the ODROID-U3 one and
> describes only these differences, as the ODROID-X2 does with the
> ODROID-X, and update the comments in the common dtsi, as the LDO22 and
> BUCK8 constraints are now also used by the ODROID-U2.
> 
> Also route "HiFi Capture" to "Mixer DAI RX", as on the ODROID-XU3. The
> odroid sound card driver adds only the playback routes for boards with
> a single CPU DAI, so without it the DPCM capture path to the I2S
> back-end is incomplete and recording from the digital microphone fails
> with "no backend DAIs enabled for Primary".
> 
> Link: https://www.hardkernel.com/shop/odroid-u2/
> Link: https://www.hardkernel.com/blog-2/odroid-u2-u-schematics/
> Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
> ---
>  arch/arm/boot/dts/samsung/Makefile            |  1 +
>  .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
>  .../boot/dts/samsung/exynos4412-odroidu2.dts  | 42 +++++++++++++++++++
>  3 files changed, 46 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
> 
> diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
> index e0143ee8c82d..2a173e4b3e1a 100644
> --- a/arch/arm/boot/dts/samsung/Makefile
> +++ b/arch/arm/boot/dts/samsung/Makefile
> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
>  	exynos4412-i9305.dtb \
>  	exynos4412-itop-elite.dtb \
>  	exynos4412-n710x.dtb \
> +	exynos4412-odroidu2.dtb \
>  	exynos4412-odroidu3.dtb \
>  	exynos4412-odroidx.dtb \
>  	exynos4412-odroidx2.dtb \
> diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
> index 93ddbd4b0a18..b56b92c78c1d 100644
> --- a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
> @@ -414,8 +414,8 @@ ldo21_reg: LDO21 {
>  
>  			ldo22_reg: LDO22 {
>  				/*
> -				 * Only U3 uses it, so let it define the
> -				 * constraints
> +				 * Only U2 and U3 use it, so let them define
> +				 * the constraints
>  				 */
>  				regulator-name = "LDO22";
>  				regulator-boot-on;
> @@ -486,7 +486,7 @@ buck7_reg: BUCK7 {
>  			buck8_reg: BUCK8 {
>  				/*
>  				 * Constraints set by specific board: X,
> -				 * X2 and U3.
> +				 * X2, U2 and U3.
>  				 */
>  				regulator-name = "BUCK8_2.8V";
>  			};
> diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
> new file mode 100644
> index 000000000000..bc14df9be9f7
> --- /dev/null
> +++ b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hardkernel's Exynos4412 based ODROID-U2 board device tree source
> + *
> + * Copyright (c) 2026 Josef Schlehofer <pepe.schlehofer@gmail.com>
> + *
> + * Device tree source file for Hardkernel's ODROID-U2 board which is based
> + * on Samsung's Exynos4412 SoC. The board is the predecessor of the
> + * ODROID-U3, so only the differences from it are described here.
> + */
> +
> +#include "exynos4412-odroidu3.dts"
> +
> +/ {
> +	model = "Hardkernel ODROID-U2 board based on Exynos4412";
> +	compatible = "hardkernel,odroid-u2", "samsung,exynos4412", "samsung,exynos4";
> +};
> +
> +/* No VBUS supply switch on the micro-USB port */
> +/delete-node/ &vbus_otg_reg;
> +
> +&hsotg {
> +	dr_mode = "peripheral";
> +	/delete-property/ vbus-supply;
> +};
> +
> +&sound {
> +	model = "Odroid-U2";
> +	audio-routing = "Headphone Jack", "HPL",
> +			"Headphone Jack", "HPR",
> +			"DMICL", "DMIC",
> +			"DMICR", "DMIC",
> +			"Mixer DAI RX", "HiFi Capture";
> +	samsung,audio-widgets =
> +		"Headphone", "Headphone Jack",
> +		"Microphone", "DMIC";

Should be no need for newline after = for
samsung,audio-widgets. Writing it as:

	samsung,audio-widgets = "Headphone", "Headphone Jack",
				"Microphone", "DMIC";

gives max width of 62 wide chars. With that fixed:

Reviewed-by: Henrik Grimler <henrik@grimler.se>

Best regards,
Henrik Grimler

> +};
> +
> +/* No expansion header with SPI */
> +&spi_1 {
> +	status = "disabled";
> +};
> -- 
> 2.54.0 (Apple Git-157)
> 

