Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0A5CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 02:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRHxWofqNvre4c7gYW9pSN8OyvpdSlasaGgbf/HjiS0=; b=VqnCE/XjOD41txWYrr+cCscR80
	A8Xg5UNtWXfNhJ/XG8CKzBV++HnfjD5kgJQlQVUNOeSKzC6eo2eT0zFANay/hrGsd/kL99JZna+Cm
	fTWwaGEdAqg0wq3xHESOqy6c5NgvZcttNuFmYEu4gVgOZgQv/PAzcJ3tldGIf7y2AcgXB0kwpmLMD
	Gmbip3MkQmhMhMi+2AZv+Y327EM5bW9MLOK+96Y41VZbgRFh1HP0por0Yg6lgrtCHIbzegNX+skUC
	V52/nAB1dCEOB0jbB/KkLNlA9wJh8MFwUA9B2pH34Lc6zectrHMDUH/Rw2ig5kl1Aekc9Z9T2Frlo
	eOMQ5Wqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIEV-00000003Mtt-403C;
	Thu, 30 Oct 2025 02:17:48 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIER-00000003Mog-2etj;
	Thu, 30 Oct 2025 02:17:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761790620;
	bh=dRHxWofqNvre4c7gYW9pSN8OyvpdSlasaGgbf/HjiS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=vH0+LccfeOAwAVbnBaALWmAmLCQEj0I8XtZdc7sGZoSzAxN3Fkuqu1qQiaiYL326u
	 w0G0xVRL7RYAxor0SPxfERiDUdrioBntr8160rWJi2xG/AFwy9X8HWMz1E9UWok7HM
	 1qh5KwrbjQzrpGbwTxZuXiZy/uF4UY+A9kIw3+QM=
X-QQ-mid: esmtpsz21t1761790610t2286961f
X-QQ-Originating-IP: FCJSyEhyWxQkXT6SGDOtofz4EUe9Cd81eY6Os229Qyg=
Received: from [172.16.12.149] ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Oct 2025 10:16:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1275723360735953640
Message-ID: <C6253E8254C80B0F+839b71d0-1bd8-40b7-9515-7ce4a1eb8673@airkyi.com>
Date: Thu, 30 Oct 2025 10:16:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/10] arm64: dts: rockchip: rk3399-evb-ind: Add
 support for DisplayPort
To: Peter Chen <hzpeterchen@gmail.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
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
 <cc8b583a-77ec-4a7f-97cc-2d148f7fee9f@rock-chips.com>
 <e0c5bda3-7428-49e0-9955-fa23f1e4f35d@rock-chips.com>
 <CAL411-oXfvp-iqN+uRmFHijdmW=1omKwozKOoZ2shxukMHmwPg@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <CAL411-oXfvp-iqN+uRmFHijdmW=1omKwozKOoZ2shxukMHmwPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OPdvjVtisQSKcRlL75dFsNIHBIAyQERADWxFjoYDC99KDjawoBPtVKHI
	LCrYqtLsiWfOlaL2LG+wsIWqBljK30GyvyuzT3MUap7nfmPo5CVKWNebzd0+Blijy9gkM4k
	g9Xt0X0E4A9gNOkoeOsXSnA9ixZmvdJlhrS8hCWTXMH36UKzQFppq7xhDxnodqE1sXNCI2q
	fov8SDOyWn/+BepodydDTDV+/W7bYIrhxgC5rOsToxhS8EtRU3p7Oq24IcPf3HQhtayBGrv
	Ye1UOksVbmfPArt88xVNNb+yFwzngM7eZM93fjAGUxdi/g9byknI3BmQg3rbOTKvrI+4YH2
	mPHpcgIxbAHgDGgDYtFk6OBqZZiYA1H687er9fqyAAzRaXktqAz0flyrcnZGIMoSXE8CQ07
	xagvXTqO2yLqHetA05BnikFrYoWCpe/SFF45ZhCIY0FkpYjA2eXhPgWks+EnEOmNa8k1Iw9
	GAptxxlL4PpGfPOAgUcdKrFXIZYvLkjHwwxjyNpvtVOl3kLw3xAwswxlSStDPbWdrXQebsb
	xA/6MBwqjFBWotvEK7UZRm0rEWaFev3xYYDiEBrdjMwI8ri4++//9kMcRJqrXwVSx5iCm+d
	UymplYqdMbjUrFpr97zU+Wpoxj67Z6vpQ/YJfAevp5d3yVs06MNJWvt7ywVmjkKtOmZBIO/
	OP4lHYxmWmLCxwHY7uWu8i7yv1d7uoAshWDOIeUXvBYP1U49z/p5CSxzafxfgo5B9TfeclG
	nQnSIwQlAsCqJyorHNNpignubeM6WLap0U6tDfrjBJzX5DTIW+KpF04g6lcHdClWqFTmIBU
	7QVhn7rloaA1T+lzlioy+2xl0un3jVBXvCtGoqSdoRr99hoYC0fKCPElBterF8knaQzdT9e
	zUj0j4oDJnxxyfVwbcJTE/sUCLIp8yzBrgQRAuzdiF9KGzK404/J02udjNaIcsMLDhcp8Vm
	gq/+5Ry0Udy2MxFVYKgVyy6TmUCBV6cEtwplF2D46IhMfOHFAAWxLk7JP4IpEJpJTFqaxYo
	tOSBEthA==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_191744_236500_0AA46FC4 
X-CRM114-Status: GOOD (  18.29  )
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

On 10/30/2025 9:34 AM, Peter Chen wrote:
> On Wed, Oct 29, 2025 at 6:32 PM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>> On 10/29/2025 6:21 PM, Chaoyi Chen wrote:
>>
>>> Hi Peter,
>>>
>>> On 10/29/2025 5:45 PM, Peter Chen wrote:
>>>>> +&i2c4 {
>>>>> +       i2c-scl-rising-time-ns = <475>;
>>>>> +       i2c-scl-falling-time-ns = <26>;
>>>>> +       status = "okay";
>>>>> +
>>>>> +       usbc0: typec-portc@22 {
>>>>> +               compatible = "fcs,fusb302";
>>>>> +               reg = <0x22>;
>>>>> +               interrupt-parent = <&gpio1>;
>>>>> +               interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
>>>>> +               pinctrl-names = "default";
>>>>> +               pinctrl-0 = <&usbc0_int>;
>>>>> +               vbus-supply = <&vbus_typec>;
>>>>> +
>>>>> +               usb_con: connector {
>>>>> +                       compatible = "usb-c-connector";
>>>>> +                       label = "USB-C";
>>>>> +                       data-role = "dual";
>>>>> +                       power-role = "dual";
>>>>> +                       try-power-role = "sink";
>>>>> +                       op-sink-microwatt = <1000000>;
>>>>> +                       sink-pdos =
>>>>> +                               <PDO_FIXED(5000, 2500, PDO_FIXED_USB_COMM)>;
>>>>> +                       source-pdos =
>>>>> +                               <PDO_FIXED(5000, 1500, PDO_FIXED_USB_COMM)>;
>>>>> +
>>>>> +                       altmodes {
>>>>> +                               displayport {
>>>>> +                                       svid = /bits/ 16 <0xff01>;
>>>>> +                                       vdo = <0x00001c46>;
>>>>> +                               };
>>>>> +                       };
>>>>> +
>>>>> +                       ports {
>>>>> +                               #address-cells = <1>;
>>>>> +                               #size-cells = <0>;
>>>>> +
>>>>> +                               port@0 {
>>>>> +                                       reg = <0>;
>>>>> +
>>>>> +                                       usbc_hs: endpoint {
>>>>> + remote-endpoint = <&u2phy0_typec_hs>;
>>>>> +                                       };
>>>>> +                               };
>>>>> +
>>>> Why USB2 PHY needs to be notified for Type-C connection?
>>> I think the USB-connector binding require a port@0 for High Speed.  So I filled in USB2 PHY here. And I have looked up boards with the same usage, and some of the results are as follows:
>>>
>>> - rk3399-firefly.dts
>>>
>>> - rk3399-pinebook-pro.dts
>>>
>>> - rk3399-eaidk-610.dts
>>>
> Okay.  My question is basic: USB2 PHY supplies DP/DM, and the DP/DM is
> short for Type-C connector,
> and no control is needed for Type-C application.
> Why is there a remote-endpoint connection between USB2 PHY and Type-C connector?

 From the perspective of Type-C, this should not be added.  Is the approach in v2 correct [0] ?

[0]: https://lore.kernel.org/all/20250715112456.101-6-kernel@airkyi.com/

Or is the following approach correct?


port@0 {
     reg = <0>;

     usbc_hs: endpoint {
         remote-endpoint = <&tcphy0>;
     };
};

port@1 {
     reg = <1>;

     usbc_ss: endpoint {
         remote-endpoint = <&tcphy0>;
     };
};

port@2 {
     reg = <2>;

     usbc_dp: endpoint {
         remote-endpoint = <&tcphy0_typec_dp>;
     };
};


>
>>>>> +                               port@1 {
>>>>> +                                       reg = <1>;
>>>>> +
>>>>> +                                       usbc_ss: endpoint {
>>>>> + remote-endpoint = <&tcphy0_typec_ss>;
>>>>> +                                       };
>>>>> +                               };
>>>>> +
>>>>> +                               port@2 {
>>>>> +                                       reg = <2>;
>>>>> +
>>>>> +                                       usbc_dp: endpoint {
>>>>> + remote-endpoint = <&tcphy0_typec_dp>;
>>>>> +                                       };
>>>>> +                               };
>>>>> +                       };
>>>>> +               };
>>>>> +       };
>>>>> +};
>>>>> +
>>>> .....
>>>>>    &u2phy0 {
>>>>>           status = "okay";
>>>>> +
>>>>> +       port {
>>>>> +               u2phy0_typec_hs: endpoint {
>>>>> +                       remote-endpoint = <&usbc_hs>;
>>>>> +               };
>>>>> +       };
>>>>>    };
>>>>>
>>>> There is no switch and mux, how to co-work with Type-C?
>>> I checked the phy-rockchip-inno-usb2.c but did not find any switch or mux. Does this mean that we need to implement them? Thank you.
>> Wait a minute, actually we have multiple hardware interfaces, one of which is Type-C, eventually connected to USBDPPHY, and the other is micro-usb connected to U2PHY.
> I assume the Micro-USB connector does not use Type-C/PD IC, is it
> right? Does it relate to this patch?
>
> Best regards,
> Peter
>


