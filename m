Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23FAC44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 14:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rqBzsr+hZ6+IGvDv8xid+NE2IZ7dsQ2695/49Tv2/I=; b=zPhztWbH14pS5ckRPbJlDk8xUq
	NSQFcoDp83muu5e1PFupuN2YA/zoF84+3dmiIZO6Z1ygxr9m2g2ri1QNd2chN+CJckX/qpaup4Dqi
	udJ4P8qDO+vMgm8ayBJr0vr3doNJBH1jow79BDRwpk2kNVBP+q40cWuGJhy4jpVIJdnprkGxnKwKS
	WlUG0Kkhm8xm4k5ItcnHiRb4CpP+j10bgfErBGmbQ/OLJSvLCrK+YzwcTedTcGswhmoMvjzUc1+uW
	jEDcttZCBkuSiDd1IWwSF+leSdu1Pztk6nZ1XOgcxeBt35N0Yp4fJulGVE9y4k1JO17d9sEIfcaVr
	Yg6ep7yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlSFJ-000000053Tc-3fGc;
	Sun, 19 Jul 2026 14:11:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlSFI-000000053TR-30QM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 14:11:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10D6443C91;
	Sun, 19 Jul 2026 14:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83311F000E9;
	Sun, 19 Jul 2026 14:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784470315;
	bh=9rqBzsr+hZ6+IGvDv8xid+NE2IZ7dsQ2695/49Tv2/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=X9QwXI7SKPPM8MKn1FY16apc0Z2fcabt/B6JxNOn5JJ/Ifh6XWwdcOyyNoI87tj+H
	 XgCb92agRsDwzXAzYaDOtEdGnv8cOyeQOaNeRX4auFGNKFbTclMiZHKZDbvLsME7vt
	 N+Vm/7dr+zwt012VORSUFvSAieO4QYroSLWWsMiEypQ5VUEeW4C14KgDr89PphjikF
	 T8pnMzhUnX7Oro4LsLuXH+8Rsr0XfsvMkcvS4Rn4Z+SRnPrOCIdtJMQj4rDQ5krGMJ
	 Qq1KIs0LwuvUxp4fpFRMr4M1IKVIvkru0BtocBptFW0dd7BMiIM8rDqwYJS/3G1clH
	 aw54crTFdSa/w==
Message-ID: <d9f1c018-793e-4021-9aec-d7139a6468f1@kernel.org>
Date: Sun, 19 Jul 2026 16:11:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] arm64: dts: apple: Add SMC hwmon nodes
To: James Calligeros <jcalligeros99@gmail.com>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 7/14/26 08:28, James Calligeros wrote:
> Hi folks,
>
> Following on from the series which added SMC hwmon driver[1], this
> series spins out and adds the Devicetree nodes required for the hwmon
> driver to operate. These were missed back in December.
>
> The System Management Controller on Apple Silicon devices exposes
> the temperature, voltage, power and fan speed data from numerous
> (potentially hundreds) of sensors scattered about the SoC and
> device at large. Unfortunately there is very little rhyme or reason
> to how Apple expose these using the SMC firmware's FourCC key-value
> system. Some sensors are reliably common across all devices and
> all SoCs, like PSTR which measures the total platform power consumption.
> Others are specific to a class of device, like the fan control
> keys, which are only present on devices with fans. Some are specific
> to a single SoC, and others still are specific to a single device.
> To complicate matters further, some SoCs are not even consistent
> across devices; the application core temperature sensors for a
> given SoC are read from different keys depending on the device
> that SoC is in...
>

Applied to sven/linux (apple-soc/dt-7.3), thanks!

[01/12] arm64: dts: apple: t8112: Add SMC hwmon node
        https://github.com/AsahiLinux/linux/commit/89efdbd8ea62
[02/12] arm64: dts: apple: t8103: Add SMC hwmon node
        https://github.com/AsahiLinux/linux/commit/4dea4ee249ec
[03/12] arm64: dts: apple: t600x: Add SMC hwmon node
        https://github.com/AsahiLinux/linux/commit/d02aeb6980b6
[04/12] arm64: dts: apple: t602x: Add SMC hwmon node
        https://github.com/AsahiLinux/linux/commit/f424abc3075b
[05/12] arm64: dts: apple: Add common SMC hwmon infrastructure
        https://github.com/AsahiLinux/linux/commit/56c65dc95f3d
[06/12] arm64: dts: apple: t8103: Add common SMC hwmon sensors
        https://github.com/AsahiLinux/linux/commit/d77603e44f55
[07/12] arm64: dts: apple: t8112: Add common SMC hwmon sensors
        https://github.com/AsahiLinux/linux/commit/ae42d7fe0793
[08/12] arm64: dts: apple: t600x: Add common SMC hwmon sensors
        https://github.com/AsahiLinux/linux/commit/fe521d15d9c5
[09/12] arm64: dts: apple: t602x: Add common SMC hwmon sensors
        https://github.com/AsahiLinux/linux/commit/fd42ff865357
[10/12] arm64: dts: apple: t8103: jxxx: Add device-specific SMC hwmon 
sensors
        https://github.com/AsahiLinux/linux/commit/b6935375d536
[11/12] arm64: dts: apple: t8112: jxxx: Add device-specific SMC hwmon 
sensors
        https://github.com/AsahiLinux/linux/commit/da160f258c36
[12/12] arm64: dts: apple: t60xx: jxxx: Add device-specific SMC hwmon 
sensors
        https://github.com/AsahiLinux/linux/commit/e88070b74578

Best regards,
-- 
Sven Peter <sven@kernel.org>



