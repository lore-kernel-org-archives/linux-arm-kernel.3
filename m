Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2160FC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMYt9oFhqXpjirBtpyW/TCCP8bfINjjpZ9L580NW+Ak=; b=qFi+bllwo/55hZFHuX76pKItTO
	wm4UvJIYL3Q30wdEvYBjoQcC8R4o+2tWxo6wreCgKOQrba/ctTpzRJOQvgacKyQnI8GV+bj83JMCq
	O2C22lG2hY27MsJ3bCeAEptWxQilHfjbpCWPXgJ/Yx69RxP67oSrBLnOrILoDFGAgNPx8y+rDlqxF
	Bv120vBnfTVVSE5JzlhDd31MPdllOWCUT5WAZl2z42A3ao5FQilP2Fif+YBr20s2fK5BlbzJPWTA8
	7O0nOJDOX9rzxOT94kml8FTg5Fh1uvKBTl9j4ga53cW+kGJp2t2JxQapUi7apXz8hQUq+B2vn1ZDK
	C+Qa+siA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NUZ-00000008TJP-4C88;
	Wed, 23 Sep 2026 13:58:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NUX-00000008TJ2-1eOt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:58:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 826DA1516;
	Wed, 23 Sep 2026 06:58:28 -0700 (PDT)
Received: from [10.57.8.59] (unknown [10.57.8.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E356B3F86F;
	Wed, 23 Sep 2026 06:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790171912; bh=seaxJTJr1QFSqstIVULiAM2ADNpuuFzk/qAkkHE/eoE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tJnXnP8Sxw1bW2f63cbHT/VB+QmCDJS/5cq6JlJRa/8qvbrrspWASzx3O0ihYVwsH
	 63upJJ8K+2t80zCYxPFRKVG5oq1raYhdy+IRaILEI5SiuMAuzjrGE3wYeNp+wcKg1s
	 Nh76mlizhUwBnVEEN88rbm+lTBnCJghfvxEzNOVc=
Message-ID: <b01154aa-16be-4dbb-861f-d4a70da7ad83@arm.com>
Date: Wed, 23 Sep 2026 15:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: h616: orangepi-zero2w: add
 SDIO WiFi/BT (AW859A)
To: Vladimir <anykey196@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20260923112009.1062-1-anykey196@gmail.com>
 <20260923112009.1062-2-anykey196@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260923112009.1062-2-anykey196@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_065833_542989_3808ED98 
X-CRM114-Status: GOOD (  19.11  )
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

Hi,

your threading looks somewhat off, and you are missing a cover letter, 
so I am a bit lost in here. But just jumping in here:

On 9/23/26 13:20, Vladimir wrote:
> Enable the SDIO bus (mmc1) and power the on-board AW859A (UWE5622)
> WiFi/BT combo through an mmc-pwrseq-simple that resets WL_REG_ON (PG18) and
> gates the RTC 32 kHz fanout clock (PG10), with the 3.3 V and 1.8 V supplies.
> 
> The pwrseq clock must be named "ext_clock" (what mmc-pwrseq-simple requests)
> and its output pin must be muxed to the clock function, as done for the other
> H616/H618 boards.
> 
> Tested on: OrangePi Zero 2W (Allwinner H618) with the out-of-tree uwe5622 driver.
> 
> Signed-off-by: Vladimir <anykey196@gmail.com>
> ---
>   .../allwinner/sun50i-h618-orangepi-zero2w.dts | 42 +++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> index ff9b40352a5..39f580af15b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> @@ -189,3 +189,45 @@ &usbphy {
>   	usb1_vbus-supply = <&reg_vcc5v>;
>   	status = "okay";
>   };
> +
> +/ {
> +	reg_vcc33_wifi: vcc33-wifi {
> +		/* Always-on 3.3V regulator for WiFi and BT */

Why is this a separate regulator? Looking at the schematics, the WiFi 
chip seems supplied by VCC-WIFI, which is connected to DCDCE/VDD33, 
which is already modelled as reg_vcc3v3, in the .dts file.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc33-wifi";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		vin-supply = <&reg_vcc5v>;
> +	};
> +
> +	reg_vcc_wifi_io: vcc-wifi-io {
> +		/* Always-on 1.8V regulator for WiFi and BT IO */

Same here, VCC-WIFI-IO, which is supplied by aldo1. It's naturally the 
same voltage as the PortG supply, already specified in the "pio" node.

So I think those two regulators can go, and ...

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-wifi-io";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		vin-supply = <&reg_vcc33_wifi>;
> +	};
> +
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&rtc CLK_OSC32K_FANOUT>;
> +		clock-names = "ext_clock";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&x32clk_fanout_pin>;
> +		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>;	/* PG18 */
> +		post-power-on-delay-ms = <200>;
> +	};
> +};
> +
> +&mmc1 {
> +	vmmc-supply = <&reg_vcc33_wifi>;
> +	vqmmc-supply = <&reg_vcc_wifi_io>;

... be replaced here with &reg_vcc3v3 and &aldo1, respectively.

And this is all depending on that we actually make DT changes for 
devices which don't have a binding, and for which we don't specify a 
child node in here.

Cheers,
Andre

> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	bus-width = <4>;
> +	non-removable;
> +	mmc-ddr-1_8v;
 > +	status = "okay";> +};


