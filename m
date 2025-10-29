Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F215DCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2y//5yz0cKqyDq/eGQvh7lZNErNDwqj5oCuOmDJhx+0=; b=XqGTRRJvL31ajJpnqvmHRc0Aws
	9uEMy+SJv11cORwTGpBvx/cFfL9oANrsNe1ejkG73IchuY9YjrO9gYNSpxo3UbAFfZRzDOM/a7f08
	u34hdd6VOxfpxxTdKxJDn4/R0DCTMOLnefOBYNIwzhyWlyw7j5EmNjOGDQ57MlQNmDIDFXjvClTk0
	8nIElfSXMX7/TJ9KVQ9rmCnXaZB6+/Ni8jXdM8t1HMZ/L5BH7m1w0F8d9UrvAnK57S3YFbcU9MB3k
	AYLHM1O6nqAZMXNsnaX4MjVrXT/nPSj6S2Ml0HyljEcpnUmZizkn9lkdYLMW4aldmPYoINVYBpkn4
	FnjS0QEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Iw-00000000hlO-1fZI;
	Wed, 29 Oct 2025 10:21:22 +0000
Received: from mail-m49195.qiye.163.com ([45.254.49.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Is-00000000hgv-3YTI;
	Wed, 29 Oct 2025 10:21:20 +0000
Received: from [172.16.12.149] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 27a20e337;
	Wed, 29 Oct 2025 18:21:09 +0800 (GMT+08:00)
Message-ID: <cc8b583a-77ec-4a7f-97cc-2d148f7fee9f@rock-chips.com>
Date: Wed, 29 Oct 2025 18:21:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/10] arm64: dts: rockchip: rk3399-evb-ind: Add
 support for DisplayPort
To: Peter Chen <hzpeterchen@gmail.com>, Chaoyi Chen <kernel@airkyi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251029071435.88-1-kernel@airkyi.com>
 <20251029071435.88-11-kernel@airkyi.com>
 <CAL411-o6mF71oBeRsJ-OPZNbLegn4iJ_ELN9xVdppTM3ssUPOw@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CAL411-o6mF71oBeRsJ-OPZNbLegn4iJ_ELN9xVdppTM3ssUPOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a2f7c571703abkunmeb663c22345d26
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhkeGlYYQh9NGEtMSx4dQhlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=LdvT8yD55DgQk4sSKILpIpTMXTznVSncF63l6VkUkbyLicwzodkCBt91xnRXJAz6qAqJzyDEiy1ZOtqF1gWvG+5YfYbEXIgUeJHQ1NXAoz4QIXjvKBF5G6COWnbG0/O9NjxQJZ7SzaH6qSjtRb0zw7ZkPku5KSQcFgmMTSj/5MY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=2y//5yz0cKqyDq/eGQvh7lZNErNDwqj5oCuOmDJhx+0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_032119_389848_22080BD8 
X-CRM114-Status: GOOD (  12.87  )
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

Hi Peter,

On 10/29/2025 5:45 PM, Peter Chen wrote:
>> +&i2c4 {
>> +       i2c-scl-rising-time-ns = <475>;
>> +       i2c-scl-falling-time-ns = <26>;
>> +       status = "okay";
>> +
>> +       usbc0: typec-portc@22 {
>> +               compatible = "fcs,fusb302";
>> +               reg = <0x22>;
>> +               interrupt-parent = <&gpio1>;
>> +               interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&usbc0_int>;
>> +               vbus-supply = <&vbus_typec>;
>> +
>> +               usb_con: connector {
>> +                       compatible = "usb-c-connector";
>> +                       label = "USB-C";
>> +                       data-role = "dual";
>> +                       power-role = "dual";
>> +                       try-power-role = "sink";
>> +                       op-sink-microwatt = <1000000>;
>> +                       sink-pdos =
>> +                               <PDO_FIXED(5000, 2500, PDO_FIXED_USB_COMM)>;
>> +                       source-pdos =
>> +                               <PDO_FIXED(5000, 1500, PDO_FIXED_USB_COMM)>;
>> +
>> +                       altmodes {
>> +                               displayport {
>> +                                       svid = /bits/ 16 <0xff01>;
>> +                                       vdo = <0x00001c46>;
>> +                               };
>> +                       };
>> +
>> +                       ports {
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +
>> +                               port@0 {
>> +                                       reg = <0>;
>> +
>> +                                       usbc_hs: endpoint {
>> +                                               remote-endpoint = <&u2phy0_typec_hs>;
>> +                                       };
>> +                               };
>> +
> Why USB2 PHY needs to be notified for Type-C connection?

I think the USB-connector binding require a port@0 for High Speed.  So I filled in USB2 PHY here. And I have looked up boards with the same usage, and some of the results are as follows:

- rk3399-firefly.dts

- rk3399-pinebook-pro.dts

- rk3399-eaidk-610.dts


>
>> +                               port@1 {
>> +                                       reg = <1>;
>> +
>> +                                       usbc_ss: endpoint {
>> +                                               remote-endpoint = <&tcphy0_typec_ss>;
>> +                                       };
>> +                               };
>> +
>> +                               port@2 {
>> +                                       reg = <2>;
>> +
>> +                                       usbc_dp: endpoint {
>> +                                               remote-endpoint = <&tcphy0_typec_dp>;
>> +                                       };
>> +                               };
>> +                       };
>> +               };
>> +       };
>> +};
>> +
> .....
>>   &u2phy0 {
>>          status = "okay";
>> +
>> +       port {
>> +               u2phy0_typec_hs: endpoint {
>> +                       remote-endpoint = <&usbc_hs>;
>> +               };
>> +       };
>>   };
>>
> There is no switch and mux, how to co-work with Type-C?

I checked the phy-rockchip-inno-usb2.c but did not find any switch or mux. Does this mean that we need to implement them? Thank you.


>
> Best regards,
> Peter
>
>
-- 
Best,
Chaoyi


