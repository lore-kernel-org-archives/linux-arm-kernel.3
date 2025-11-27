Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E15CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 20:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpfHILOYcnlUWrQ0nF82zorqnAjNZW2XmxVU0QntN7I=; b=v7VBmo82djiQT9jic6palv5vJG
	OE7JL2jdjppQvyPVRwRDXgQr0tZPJKFtigTl52HZc9MA7BrrEo8Vp/qWg/iZukZyrJDUVWpZGYdgY
	Rpjy9Lyx/6fGHtr6Wav0l2opGEsiFvfj6WMmrwos0roVTGfhfoCOGYt9nQjRER+RodzoAuoncbFTy
	AmvQaKfXdJ/g5cSqM5s1GfSaeWcQp907UxDhruWM7MZgTWvPZ937o/RHGCY+Kkwjkv1EUpirXoUB7
	/A+/ge/0af2yIgll/i6W6RN6/B1EggSeqNW2OgqTwdF8djZgqH29hc5cQ6zb7y+hAac4brrlFnzK2
	qMSRfpvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOiBn-0000000HB42-3qLJ;
	Thu, 27 Nov 2025 20:02:03 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOiBl-0000000HB3g-04tn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 20:02:02 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dHS4h05Nhz9tSr;
	Thu, 27 Nov 2025 21:01:56 +0100 (CET)
Date: Thu, 27 Nov 2025 21:01:51 +0100
From: Lukas Timmermann <linux@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v2 2/3] ARM: dts: exynos: Add Google Manta (Nexus 10)
Message-ID: <jqfu76ojoznc7xgyevuzmj7fg3necrr5cp645ye5zk652ytx5w@s4yaxzcq7jzt>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
 <20251125-google-manta-v2-2-0f097cfff39c@timmermann.space>
 <20251126-cunning-locust-of-atheism-e1dd0d@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-cunning-locust-of-atheism-e1dd0d@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_120201_223755_1729B467 
X-CRM114-Status: GOOD (  23.37  )
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

On Wed, Nov 26, 2025 at 10:10:46AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 25, 2025 at 04:12:41PM +0100, Lukas Timmermann wrote:
> > +/ {
> > +	model = "Google Nexus 10";
> > +	compatible = "google,manta", "samsung,exynos5250", "samsung,exynos5";
> > +
> 
> Everything looks good in general, thanks for working on this. I have
> few nits below. You can send next version whenever you are ready, but
> just to let you know - my tree is already closed till RC1.
> 
First of all, thank you!
The as3668 bindings are yet to be applied, no need to rush here.
> > +	aliases {
> > +		mmc0 = &mmc_0; /* eMMC */
> > +		mmc1 = &mmc_1; /* WiFi */
> > +	};
> > +
> > +	memory@40000000 {
> 
> Please order the nodes in top level by node name (see DTS coding style).
> I know that existing files do not follow that, but we try to have new
> code conforming to the coding style.
> 
We ordered them as seen in other devices. I've checked out the coding style 
guideline and will make modifications accordingly.
> > +		device_type = "memory";
> > +		reg = <0x40000000 0x20000000
> 
> Separate <> for each entry.
> 
Acknowledged.
> > +		       0x60000000 0x20000000
> > +		       0x80000000 0x20000000
> > +		       0xa0000000 0x1ff00000>;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = &serial_2;
> > +	};
> > +
> > +	firmware@204f000 {
> > +		compatible = "samsung,secure-firmware";
> > +		reg = <0x0204f000 0x1000>;
> > +	};
> > +
> > +	fixed-rate-clocks {
> > +		xxti {
> > +			compatible = "samsung,clock-xxti";
> > +			clock-frequency = <24000000>;
> > +		};
> > +
> > +		xusbxti {
> > +			compatible = "samsung,clock-xusbxti";
> 
> Are you sure you have this clock input? I think on Exynos5250 usually
> only XXTI was provided, no?
> 
We checked with the downstream code and found this clock input. We
recognize, that downstream kernels aren't 100% correct at times.
I tested the device without this clock input as you suggested.
It seems that this is in fact not needed. So I will remove it in v3.
> > +			clock-frequency = <24000000>;
> > +		};
> > +	};
> > +
> > +	gpio-keys {
> > +		compatible = "gpio-keys";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&gpio_keys>;
> > +
> > +		key-down {
> > +			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_VOLUMEDOWN>;
> > +			label = "volume down";
> > +			debounce-interval = <5>;
> > +		};
> > +
> > +		key-up {
> > +			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_VOLUMEUP>;
> > +			label = "volume up";
> > +			debounce-interval = <5>;
> > +		};
> > +
> > +		key-power {
> > +			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_POWER>;
> > +			label = "power";
> > +			debounce-interval = <5>;
> > +			wakeup-source;
> > +		};
> > +
> > +		lid-switch {
> > +			label = "Lid";
> > +			gpios = <&gpx1 3 GPIO_ACTIVE_LOW>;
> > +			linux,input-type = <5>; /* EV_SW */
> > +			linux,code = <0>; /* SW_LID */
> > +			debounce-interval = <10>;
> > +			wakeup-source;
> > +		};
> > +	};
> > +
> > +	multi-led {
> > +		compatible = "leds-group-multicolor";
> > +		color = <LED_COLOR_ID_RGB>;
> > +		function = LED_FUNCTION_STATUS;
> > +		leds = <&status_red>, <&status_green>, <&status_blue>, <&status_white>;
> > +	};
> > +
> > +	wlan_pwrseq: mmc1-pwrseq {
> 
> Just "pwrseq"
> 
Acknowledged.
Just out of curiosity. Why is that?
> Best regards,
> Krzysztof
> 
> 
Best regards,
Lukas Timmermann

