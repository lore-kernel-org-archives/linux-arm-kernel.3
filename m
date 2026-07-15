Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C999AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/AlFWwnDA/SV5JENDj0Z4O7qhKDad5syaPLp/K1Aq8=; b=bFrUqCORlhjsezHwRd8HbQv4c0
	7IsoId6rM0qG6JF/k1b/e6vcu+/NeP5fJIaolA63Bz9UbCOk4VMKgcWJl1gCLA4Bz3Ehg0V5YyP+y
	sFALHcdY369Yn2xF+hfq4rgHri537ENCtELRsFVU+ODgPpM7V8rnSLZ+Q9/zeJMFCxeUDCYG4vZo5
	qdOdf/cdxSLNYyIarOKkhau4pg3ybNlcEvvXCwNTpVwJsfUirNJCynwuIy4ZqHZA8+w64OK8/B8pI
	cQoDV63BM8CN01BD3EO+NUN/mbj1XTBATmmyxAEG+E0qpMxv1PVm0XXLugSp6i0nNzXUBheppRwGE
	GPdCNlSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0tR-0000000FCvq-09Rf;
	Wed, 15 Jul 2026 14:47:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0tP-0000000FCvV-00jY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:47:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EDF76136E;
	Wed, 15 Jul 2026 14:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9D31F000E9;
	Wed, 15 Jul 2026 14:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784126842;
	bh=4/AlFWwnDA/SV5JENDj0Z4O7qhKDad5syaPLp/K1Aq8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Kp04aKsBor216y3M2IQhJWClxfjKrVp0CdavYdhymjRdXGcmmZCVNHfmmmUijU61h
	 0R406OBsN0NucPYLhUQBScrmhq7/FGcHl64Z+trYg6pXWD0II9VhDj2VCThGtVLVJS
	 wAlueNQBgkYBSUCUjDvewxz81e4UMTuIZuWb255e7oDoAxlt7a1YVqavt4P/wMoMwz
	 kqnmct5VkUpV5EOBxklqwQ131oTjAiveXcuVWDRS1AIMgk7EUytNiClppxdUlL/moG
	 k9RZBfPLeKJsgx4GKgXTPZqY1bFYqW6iBvmYXZffgAegMoFVWTg8IgXZsnVXXTsIC9
	 JYiRAsHC3J1lg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 09/10] arm64: dts: apple: Initial T603[124] (M3 Max
 and Ultra) device trees
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org
In-Reply-To: <20260715-apple-t603x-initial-devices-v2-9-df65b2485710@jannau.net>
References: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
 <20260715-apple-t603x-initial-devices-v2-9-df65b2485710@jannau.net>
Date: Wed, 15 Jul 2026 16:46:42 +0200
Message-Id: <178412680283.41818.6965684846949512896.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=951; i=sven@kernel.org;
 h=from:subject:message-id; bh=xHG4Cgmp0u4sP3xzDzY3WvztI9ASDmdcF3CfBU0mdu0=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1b43Oj86Yu4eCfMP6ClwXZn39N2zu7eUsOExA6D+QJTr
 Ir7rpR0lLIwiHExyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACZiqsfI0MOrkmnX4NJqyyxd
 NUex4Aa3RW3W01WMKfnrbl19du3XCob/+f/ObMyzePIrKaNg14XX0Vv1UrpP9WSd89VPm1exyG4
 mAwA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
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

On Wed, 15 Jul 2026 11:11:56 +0200, Janne Grunau <j@jannau.net> wrote:
> diff --git a/arch/arm64/boot/dts/apple/t6031-die0.dtsi b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
> new file mode 100644
> index 000000000000..e02c29e1d9f3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
> @@ -0,0 +1,197 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * Devices used on die 0 on the Apple T6032 "M3 Ultra" SoC and present on
> + * Apple T6030 ("M3 Pro") and T6031 / T6034 ("M3 Max").
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +	wdt: watchdog@2a02d4000 {
> +		compatible = "apple,t6031-wdt", "apple,t8103-wdt";
> +		reg = <0x2 0xa02d4000 0x0 0x4000>;
> +		clocks = <&clkref>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 718 IRQ_TYPE_LEVEL_HIGH>;
> +	};

wdt belongs below the adt node.

Reviewed-by: Sven Peter <sven@kernel.org>

-- 
Sven Peter <sven@kernel.org>

