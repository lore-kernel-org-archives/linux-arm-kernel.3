Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5888D10397
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+/lXe/SWnNOgo3EgU/Ev+5DKlPJih4fc3pEbAvYaXI=; b=C1lvT1DEQPd2wgkGQgpV2pJ0dx
	aKXOVGE0GGl0qxHOCNcZmKIKGCJra2SN2zVb8c01lSf64xlcXsIH0tljSY4VDqqrO71XaI3fcOz2g
	fuAznA1k6m+2OSpaSBsAPn3982MktLtUeYxer8fu0NFeeXl491hPu+e6AriC08Is+zrbCN8Z0f/LL
	1f4yJFtAhgGaVCb0YYY/yJvmf8pXRiWZgSRY6/i5On8OoXhKgdV0/pSwzYVyfHYIp9AJ23Z04i4BN
	gpUhDBjDV0tTQYnPS9BwAtAvQe8cOEefJQuzud0DUjH/RMWN2fZPA7RRKNJzfab1KEabJ/tvwCCis
	TQfjJr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBY3-0000000EgqM-3KT8;
	Wed, 26 Nov 2025 09:10:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBY1-0000000EgpM-2jVU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 09:10:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCA9341B55;
	Wed, 26 Nov 2025 09:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14396C113D0;
	Wed, 26 Nov 2025 09:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764148248;
	bh=igOYgUXsNlbmcIc0JQQrR/9RlC55FUM21fhSmCk3QKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cvnlqgOq++b61luiEx3fhLuA3Gu7FC3TD4gvwOetg74DZ844ZvlwTs+6MYtrQL3sX
	 MYhfsLMSFVziGn9Bf9KvZjgjV8o7mZ1oPiGnG47ImI7iWrUMGIECqhr1v+I+5ltUKl
	 6K0AvroBEYCjqkUxp0Fva+m23E7SeIGr2QJ26vXWE5+313O/+gSx45Gipcd97aXngN
	 s0QSxFdYPDgUBPXXc/CzLRcD0ODzm7lzpvbY4V2ui4r6IIBWKDyTFkwpEnSMEfxXL4
	 LD9cFvJ2yw0K1V8tNpgXDySI1AQ5Nyquf81tr8Xl+ieVxvGPku8Tlt0zp+5sU/Qg8Q
	 OXF9eNwJXADJg==
Date: Wed, 26 Nov 2025 10:10:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v2 2/3] ARM: dts: exynos: Add Google Manta (Nexus 10)
Message-ID: <20251126-cunning-locust-of-atheism-e1dd0d@kuoka>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
 <20251125-google-manta-v2-2-0f097cfff39c@timmermann.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125-google-manta-v2-2-0f097cfff39c@timmermann.space>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_011049_748195_CF7403B6 
X-CRM114-Status: GOOD (  12.92  )
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

On Tue, Nov 25, 2025 at 04:12:41PM +0100, Lukas Timmermann wrote:
> +/ {
> +	model = "Google Nexus 10";
> +	compatible = "google,manta", "samsung,exynos5250", "samsung,exynos5";
> +

Everything looks good in general, thanks for working on this. I have
few nits below. You can send next version whenever you are ready, but
just to let you know - my tree is already closed till RC1.

> +	aliases {
> +		mmc0 = &mmc_0; /* eMMC */
> +		mmc1 = &mmc_1; /* WiFi */
> +	};
> +
> +	memory@40000000 {

Please order the nodes in top level by node name (see DTS coding style).
I know that existing files do not follow that, but we try to have new
code conforming to the coding style.

> +		device_type = "memory";
> +		reg = <0x40000000 0x20000000

Separate <> for each entry.

> +		       0x60000000 0x20000000
> +		       0x80000000 0x20000000
> +		       0xa0000000 0x1ff00000>;
> +	};
> +
> +	chosen {
> +		stdout-path = &serial_2;
> +	};
> +
> +	firmware@204f000 {
> +		compatible = "samsung,secure-firmware";
> +		reg = <0x0204f000 0x1000>;
> +	};
> +
> +	fixed-rate-clocks {
> +		xxti {
> +			compatible = "samsung,clock-xxti";
> +			clock-frequency = <24000000>;
> +		};
> +
> +		xusbxti {
> +			compatible = "samsung,clock-xusbxti";

Are you sure you have this clock input? I think on Exynos5250 usually
only XXTI was provided, no?

> +			clock-frequency = <24000000>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys>;
> +
> +		key-down {
> +			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			label = "volume down";
> +			debounce-interval = <5>;
> +		};
> +
> +		key-up {
> +			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			label = "volume up";
> +			debounce-interval = <5>;
> +		};
> +
> +		key-power {
> +			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_POWER>;
> +			label = "power";
> +			debounce-interval = <5>;
> +			wakeup-source;
> +		};
> +
> +		lid-switch {
> +			label = "Lid";
> +			gpios = <&gpx1 3 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <5>; /* EV_SW */
> +			linux,code = <0>; /* SW_LID */
> +			debounce-interval = <10>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	multi-led {
> +		compatible = "leds-group-multicolor";
> +		color = <LED_COLOR_ID_RGB>;
> +		function = LED_FUNCTION_STATUS;
> +		leds = <&status_red>, <&status_green>, <&status_blue>, <&status_white>;
> +	};
> +
> +	wlan_pwrseq: mmc1-pwrseq {

Just "pwrseq"

Best regards,
Krzysztof


