Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE088C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 01:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOSQSL8Ks5IN7rF3LDLzamVst2rGAcbD12z6Zr7VP7c=; b=dgh6wNH1gOqGgs9dIAqFM4Facg
	5oiP0VqF3F8nokYk++MagTgEstSpFCZOTmK2c1plhXF0VHGbct6q4VjOyTJOJOFiMfScOzF3UQhrt
	Vt8nf7GNdN9YR86KMmmv9bxmNoeQhHC/jSk3n8IXvJWVWh16awUDXJr6QGqJJqfh3xAa5uLtCwDFU
	G3fN8Ry2gmRdAUzwDkliWCYds95lUvtLbLT/nekW/pIOQ2nHbem2hh4POibcTo1NAHvOERa2v3z0U
	0XtqSZTuiF6SRtJpIkiUj6Q5qgtyPB9g33Vb4OTpnG6Jk9a//FSR2KbKxHGDSGfyVwtS+9q8D+rPf
	5blZkkwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubr9L-00000006Yie-3qSM;
	Wed, 16 Jul 2025 01:41:35 +0000
Received: from mail-m32124.qiye.163.com ([220.197.32.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubr6t-00000006YYh-3zxO;
	Wed, 16 Jul 2025 01:39:06 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1c21ae026;
	Wed, 16 Jul 2025 09:38:51 +0800 (GMT+08:00)
Message-ID: <91933881-e91e-4e3f-a027-1a28a30823ed@rock-chips.com>
Date: Wed, 16 Jul 2025 09:38:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: rockchip: rk3399-evb-ind: Add support for
 DisplayPort
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250715112456.101-1-kernel@airkyi.com>
 <20250715112456.101-6-kernel@airkyi.com>
 <c62d168b-92b5-44a2-9a9a-402d7f4815a2@kernel.org>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <c62d168b-92b5-44a2-9a9a-402d7f4815a2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQklOSlYeGE9NHU5DGE4eHk1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
	NVSktLVUpCWQY+
X-HM-Tid: 0a9810e26b8b03abkunm2384780b142b984
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PiI6Vjo4SDEzQgk3TgsMCwMQ
	Mj0wC1FVSlVKTE5JTUlCQk9LTUtNVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSEJITTcG
DKIM-Signature: a=rsa-sha256;
	b=QAuzT6LqqsdRYzbgiQV0dzdyntiVHNrp/6t4TvOeZeNboxwtNUTzyldzugRxbhjyKOZ8NlArNywxKchxXvUB4wm/zoE9KD7sZsPgRwe0l9DPt4qQm7qka21rrg6UUIf7MziMjtmBrwi7GvrXQG91QQYTnAdRN0D9i1vZOrsBPi4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=hOSQSL8Ks5IN7rF3LDLzamVst2rGAcbD12z6Zr7VP7c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_183904_847163_F888FDBF 
X-CRM114-Status: GOOD (  10.82  )
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

Hi Krzysztof,

On 2025/7/15 19:37, Krzysztof Kozlowski wrote:
> On 15/07/2025 13:24, Chaoyi Chen wrote:
>>   /dts-v1/;
>> +#include <dt-bindings/usb/pd.h>
>>   #include "rk3399.dtsi"
>>   
>>   / {
>> @@ -19,6 +20,16 @@ chosen {
>>   		stdout-path = "serial2:1500000n8";
>>   	};
>>   
>> +	vbus_typec: vbus-typec-regulator {
> use consistent naming. How other regulators are called? foo-regulator?

Will fix in v2.


>
>> +		compatible = "regulator-fixed";
>> +		enable-active-high;
>> +		gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&vcc5v0_typec0_en>;
>> +		regulator-name = "vbus_typec";
>> +		vin-supply = <&vcc5v0_sys>;
>> +	};
>> +
>>   	vcc5v0_sys: regulator-vcc5v0-sys {
>>   		compatible = "regulator-fixed";
>>   		enable-active-high;
>> @@ -29,6 +40,16 @@ vcc5v0_sys: regulator-vcc5v0-sys {
>>   		regulator-max-microvolt = <5000000>;
>>   		regulator-min-microvolt = <5000000>;
>>   	};
>> +
>> +	sound: sound {
>> +		compatible = "rockchip,rk3399-gru-sound";
>> +		rockchip,cpu = <&i2s0 &spdif>;
>> +	};
>> +};
>> +
>> +&cdn_dp {
>> +	status = "okay";
>> +	phys = <&tcphy0_dp>;
>>   };
>>   
>>   &cpu_b0 {
>> @@ -341,6 +362,66 @@ regulator-state-mem {
>>   	};
>>   };
>>   
>> +&i2c4 {
>> +	i2c-scl-rising-time-ns = <475>;
>> +	i2c-scl-falling-time-ns = <26>;
>> +	status = "okay";
>> +
>> +	usbc0: fusb302@22 {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Thank you for the explanation. Will fix in v2.


>
>
>> +		compatible = "fcs,fusb302";
>> +		reg = <0x22>;
>> +		interrupt-parent = <&gpio1>;
>> +		interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&usbc0_int>;
>> +		vbus-supply = <&vbus_typec>;
>> +		status = "okay";
> Why? What disabled it?

Oh, that is redundant. Will drop it in v2.


>
>> +
>> +		usb_con: connector {
>> +			compatible = "usb-c-connector";
>> +			label = "USB-C";
> Best regards,
> Krzysztof
>
>

