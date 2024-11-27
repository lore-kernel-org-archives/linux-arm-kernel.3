Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1CFD609BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 09:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAFheFVkotLm3wy7t+46i/2OSexrdWJFGKeEH7J88WI=; b=P0x7QuKBnfonsTindgVZgIR7hF
	h6gyH8Ct/amS13PlOtUGajaHo14GT3nQ+OQXd8VaCZ0EDlDRkWPGHApSN6yRWniwq590/dxSvLFdY
	RVUkEO9vMVCsV+CmSNNGG43MgV5GQAhUd7yz2xFaS7alxsL/DXKyR6NhAqATK/8JhbOGwA9skaXXD
	KNck9zQ+54Me53uGIXjsic2pa4rHnjyXpd1MZ4wEMIhmTse/KErc3a4ZSuJxR0WqbBLyxDgGOODJm
	xWSKCbz5C8OPHwR5H2BHbnAj3tJk4WSmHDEo6VjrRaUSYA1+h9zmmyV2vdPqWMYzvnWW8gNzXGA28
	/d41+yCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEBr-0000000Cgaq-2B2g;
	Wed, 27 Nov 2024 09:18:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEAt-0000000CgTw-35ip
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 09:17:33 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-382423f4082so4743107f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 01:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1732699049; x=1733303849; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GAFheFVkotLm3wy7t+46i/2OSexrdWJFGKeEH7J88WI=;
        b=xH7fd5il3eVtR/Jm/ivgCgL5Bg8uU+9QQabSksv/7gwitCxv4Gjj9Nicx0TbbDmzOA
         aSjKINPx8RoT8tUvns3l/C2HvcKIvZHO9k6doLebKz2xl665lw01FWvbq09D/0gPQAvW
         57mIGgD8gxWwcThMUJKpa3kJ5fPMK8NIOa5ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732699049; x=1733303849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GAFheFVkotLm3wy7t+46i/2OSexrdWJFGKeEH7J88WI=;
        b=Ga9ew0p77sqI4+HR6QPnEDlpzGIFWJmuzC6Sr/tGMs2n63TNcemqNl67scJnFvBb/x
         lxcDZzZ18YRnyuq90Du71015BPnkynYYkScj2Xa3vjraCHQ3LP9XgzY4yvYWkPPRQHi+
         oqNGRHGW5PtOsyAR2gEzcgYPmgcw2SP3BBtwArRreqr2py7uwIcfMQPkcJgeQb/u00YD
         DkARIZYGJbvbn/5G3RS+io6nQvNO3NQEPp80JRdQPwmJX6pPBYPOh7mwJo8lgiCj66rj
         Co3dUBAvkZBMp1mun82FHcWAMrOWyfFEoPzS0OgFdUgJkbjp83ZNUh2O++IMy6pTP5D1
         4m4g==
X-Gm-Message-State: AOJu0Yw4vSBxb5BLTocw/R2djBSanbI5vOqtAZ+B9LxgYwAsHfvDcMig
	A4gdbAjaqbvf7RhlVrdlsssRdpmYJ5yGl4h2L01gu+mplJShEh+f/HxNm+E9NjQqzYp5mGb1OO2
	q
X-Gm-Gg: ASbGnctUOAeivkafxn2lHwEOIJGYGYscqEu4HPx5OhK53tUWb0nexc5baOQZ/2zyNCC
	BkUIUVKtR9asFHFg1S7xrAbdMpFfxXQd2lTCUjEkIPrq8g/BJFL0mH6mfC5Lrd88QSVgw5MxLJA
	ltqBSLbo8hzhoDyeH9+GaCpZMZnzl7QceLyXJz8tLvgKzUzEJCql8W0A5lRluRV+XjzE4O4TIxi
	yE7VlamQieWfh6Nyeo4sofDv6hMVtJdGmqhKeJcGJAZA+b8XDeXPgw1+znkhkdbW8yPD7A0e0Wz
	BKfLb/3hUkOnm+KzNWPYcMikO9SnOS6abYxW7w==
X-Google-Smtp-Source: AGHT+IHMfWTM2iJ94uv0iDMqL2dLO7VcGnFqdboNj1Fdq2fH3veFKQ+TuqEWJS1JJOImhanrQYAJIw==
X-Received: by 2002:a5d:47cb:0:b0:382:22c6:7bcb with SMTP id ffacd0b85a97d-385c6eb4c32mr1924315f8f.3.1732699049143;
        Wed, 27 Nov 2024 01:17:29 -0800 (PST)
Received: from [10.5.90.17] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd04ef5sm15685520f8f.111.2024.11.27.01.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 01:17:28 -0800 (PST)
Message-ID: <32e81174-8a17-4f29-b338-0dbd0d7e498b@smile.fr>
Date: Wed, 27 Nov 2024 10:17:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE
 output for PCIe1
To: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, kristo@kernel.org,
 vigneshr@ti.com, nm@ti.com, Romain Naour <romain.naour@skf.com>
References: <20241126173307.4054601-1-romain.naour@smile.fr>
 <5e2d2174-44a7-4143-8562-4dcdb5ad6c94@kernel.org>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <5e2d2174-44a7-4143-8562-4dcdb5ad6c94@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_011732_044765_3E6262F9 
X-CRM114-Status: GOOD (  19.36  )
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

Hello,

Le 26/11/2024 à 20:04, Krzysztof Kozlowski a écrit :
> On 26/11/2024 18:33, Romain Naour wrote:
>> From: Romain Naour <romain.naour@skf.com>
>>
>> Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
>> (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
>> provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
>> provide refclk through PCIe_REFCLK pins.
>>
>> Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
>> module's PAD IO Buffers.
>>
>> Signed-off-by: Romain Naour <romain.naour@skf.com>
>> ---
>> With this patch, we can remove "HACK: Sierra: Drive clock out" patch
>> applied on vendor kernel for BeagleBone AI-64:
>> https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
>> ---
>>  arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts |  4 ++++
>>  arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 10 ++++++++--
>>  2 files changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
>> index fb899c99753e..681e3af7ce6e 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
>> @@ -859,6 +859,10 @@ &pcie1_rc {
>>  	num-lanes = <2>;
>>  	max-link-speed = <3>;
>>  	reset-gpios = <&main_gpio0 22 GPIO_ACTIVE_HIGH>;
>> +	/* There is no on-board or external reference clock generators,
> 
> Please use generic style comments, not netdev.

Fixed.

> 
>> +	 * use refclk from the ACSPCIE module's PAD IO Buffers.
>> +	 */
>> +	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
>>  };
>>  
>>  &ufs_wrapper {
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> index 0da785be80ff..9f47e7672922 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> @@ -5,6 +5,7 @@
>>   * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
>>   */
>>  #include <dt-bindings/phy/phy.h>
>> +#include <dt-bindings/phy/phy-cadence.h>
>>  #include <dt-bindings/phy/phy-ti.h>
>>  #include <dt-bindings/mux/mux.h>
>>  
>> @@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
>>  			reg = <0x4140 0x18>;
>>  			#clock-cells = <1>;
>>  		};
>> +
>> +		acspcie0_proxy_ctrl: acspcie0-ctrl@18090 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

I updated to: "acspcie0_proxy_ctrl: acspcie-ctrl@18090"

> 
> 
>> +			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
> 
> I am not familiar with naming, so is this j784s4 or j721e or K3 SoC?
> Compatible should be SoC specific.

Me neither.

"ti,j784s4-acspcie-proxy-ctrl" compatible is the only one available in the
syscon devicetree binding. Should we add a new "ti,j721e-acspcie-proxy-ctrl"?

This patch is adapted from a recent commit on the TI's kernel for the j784s4 Soc:
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-rt-linux-6.6.y&id=bb4442cd523d6e34c5db43fd78c9f579d6937f6a

There is another example with "ti,j784s4-pcie-ctrl" compatible used from
k3-j722s-main.dtsi:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi?h=v6.12.1#n240

Though?

Best regards,
Romain

> 
> Best regards,
> Krzysztof


