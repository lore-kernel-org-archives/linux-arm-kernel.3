Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA48C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaSo4Yb5WbEA26v9hASwh38CJf2MLKJoEN33KGK1KgY=; b=PKRkJ5OXnkBQWuEa+8IACou2BI
	OrnIIKQIBQlB1XliFFNo/b7SHw3cXbhPugboG644kG6ScSst1hlWUp+EGHj576EyyaBo93I2Z9zcd
	UEzlPHL8PtlsavyRKU3ll1cXC2kYV1BVbF8XhIIgya5nUFWmhcwKbec+5AndUMPAudH8bUD8jzFSF
	gtbOLcQAdyna7SxPAcjWTPEKbH78oYfyuqeDVXy2roxI9mpbalv6N0yfBZG+OMR28z/rmAFHskwe2
	ild5J7Z5buYpnseVeIHAjilBTyOiQJn2PT62NEDdPtqtAj5EBUCB0p3pQHFFK8+rajNGWHNhH1Ec2
	NHDq8Vcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZdM-00000003vyL-30KU;
	Tue, 29 Sep 2026 15:20:44 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZdK-00000003vxk-2YIQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:20:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2D00106C7C;
	Tue, 29 Sep 2026 17:20:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790695232;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jaSo4Yb5WbEA26v9hASwh38CJf2MLKJoEN33KGK1KgY=;
	b=OwYg1zNeWSvdQ4w9b+0TZLvqfWPigX0M3fzPgWzz+vPcJje+jsx5G9iaA3nb96uB46BhnB
	bpUAgegtqCIlqJEgRs0tC8jzU80+f6TWCC84lEsbRMhI8+7qZtAXimvd0Lm7j/MYgIdq7z
	edl6CZsip8z+cEmazKcVjdbds4HsGMLJcIS6hCj1Oz/bbZSruTBoyXbT4sqtJQQBcSJkWB
	3hmFeCIdr7PMB7WkQQJVPjS+YNXhHY87/CldFdRAvSBSRRNrmicvjq1iNcGnutArvRKDVJ
	xops2aHs+in5y9A7DwQgid3i7qcN704OwIO/ZkKV5hOsm2YG5QaKgDKIMdKRTA==
Message-ID: <49303872-5622-4e1d-8e1a-01394ec29367@nabladev.com>
Date: Tue, 29 Sep 2026 17:20:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: imx95: Add support for Data Modul
 i.MX95 eDM SBC
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260928204741.175754-1-marex@nabladev.com>
 <20260928204741.175754-3-marex@nabladev.com> <arvPDq8sjjv7na01@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <arvPDq8sjjv7na01@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_082042_877154_0D029D53 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

On 9/29/26 4:45 PM, Frank Li wrote:

Hello Frank,

>> +	backlight_lvds: backlight-lvds {
>> +		compatible = "pwm-backlight";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_panel_backlight_lvds>;
>> +		brightness-levels = <0 1 10 20 30 40 50 60 70 75 80 90 100>;
>> +		default-brightness-level = <7>;
>> +		enable-gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>;
>> +		pwms = <&tpm3 3 5000000 0>;
>> +		/* Disabled by default, unless display board plugged in. */
>> +		status = "disabled";
>> +	};
> 
> The both backlight is not used in this dts, can you remove it and
> add these when it real use.
It's the same thing we do on the other boards, so I would prefer to keep 
this consistent:

arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts: 
backlight: backlight {
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts: 
compatible = "pwm-backlight";
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts- 
brightness-levels = <0 1 10 20 30 40 50 60 70 75 80 90 100>;
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts- 
default-brightness-level = <7>;
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts- 
pwms = <&pwm1 0 5000000 0>;
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts- 
/* Disabled by default, unless display board plugged in. */
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts- 
status = "disabled";
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts-    };

