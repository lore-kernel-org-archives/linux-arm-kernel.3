Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1E4CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 03:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9ztqH78wDt1szeKu+Mrw37tmnOhAVykkfsydy8rr6U=; b=rbpcyQJ0RvqyhJsP8PSD52vtOL
	T5RwIBuPWhjGm90M2QVyY5vu+1X/V9NqQHu1uk1nLIKjoYbeI7qsoYgBtLTBMyVMYWuyYFRNU0bFd
	42Gmz1qoUrlZPJk4NQ+Tsc2igd8AqhXFDB3ysa5o0arDTRumJJU6i3JtxwvCga7zARQpKtETdc8wH
	dnEfOmfX9dgmD38KsUWoPlLt/tRp9qWLQsS+zRyDVcd6YfgMtZF/v1q5dNnJmyScp3PSmNTuZlOse
	FedlL30dEpzDt7toM2ybxaLajfOL0UzZm3sJirdopRIkHMLPc6yD3ITzvEF7ZHm7HzAc9dMjqbk2S
	UjamEnYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEJ70-00000003PFr-3drQ;
	Thu, 30 Oct 2025 03:14:06 +0000
Received: from mail-m3284.qiye.163.com ([220.197.32.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEJ6w-00000003PF2-0XTu;
	Thu, 30 Oct 2025 03:14:04 +0000
Received: from [172.16.12.149] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 27b7b5d56;
	Thu, 30 Oct 2025 11:13:53 +0800 (GMT+08:00)
Message-ID: <7853bbf0-34e5-4880-a2f4-2d73f25cd5e6@rock-chips.com>
Date: Thu, 30 Oct 2025 11:13:51 +0800
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
 <cc8b583a-77ec-4a7f-97cc-2d148f7fee9f@rock-chips.com>
 <e0c5bda3-7428-49e0-9955-fa23f1e4f35d@rock-chips.com>
 <CAL411-oXfvp-iqN+uRmFHijdmW=1omKwozKOoZ2shxukMHmwPg@mail.gmail.com>
 <C6253E8254C80B0F+839b71d0-1bd8-40b7-9515-7ce4a1eb8673@airkyi.com>
 <CAL411-pULVu4AYybW9oW7kmr4M_kJhdytgBjLPb4y6w_2dj+0w@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CAL411-pULVu4AYybW9oW7kmr4M_kJhdytgBjLPb4y6w_2dj+0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a331b863b03abkunmb7090e2043262e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUJNGFZNQ0tDGU9DGh9MSU1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=SQVUwkwvxyCWtCdSzsP/tXB93YNtCupIhIhQ00CSdl54mjwHsgiZuOkw9accZWeqDE2m3y5GmX8bLQn1Dz42qXdQqPuIMzqAFw7dir7OI14TX7BSiWvgzFwiCL2OALE2z+GHw55hkOovciBLGJ5HKDcID5cMmDcTqARlrl/WMlY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=u9ztqH78wDt1szeKu+Mrw37tmnOhAVykkfsydy8rr6U=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_201402_660127_52EED18B 
X-CRM114-Status: GOOD (  17.76  )
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

On 10/30/2025 10:50 AM, Peter Chen wrote:

>>> Okay.  My question is basic: USB2 PHY supplies DP/DM, and the DP/DM is
>>> short for Type-C connector,
>>> and no control is needed for Type-C application.
>>> Why is there a remote-endpoint connection between USB2 PHY and Type-C connector?
>>   From the perspective of Type-C, this should not be added.  Is the approach in v2 correct [0] ?
>>
> Have you tried debugging based on upstream code?

Yes, I have tried both the v2 and v8 approaches, and both can work.


> v2 is correct, but the dts needs to improve.
> - There is a remote-endpoint connection for USB role switch between
> Type-C connector
> device and USB controller device
> - There is a remote-endpoint connection for orientation and lane configuration
> between Type-C connector device and USB/DP PHY device.

In v8 patch5, we implemented typec_mux and typec_switch in the USB/DP PHY.

I think the current remote-endpoint connections are all child node of the USB/DP PHY. That is:


&tcphy0_dp {
     mode-switch;
     ...
};


&tcphy0_usb3 {
     orientation-switch;
     ...
};


Does this still need to be improved? Thank you.


>
> Peter
>
>> [0]: https://lore.kernel.org/all/20250715112456.101-6-kernel@airkyi.com/
>>
>> Or is the following approach correct?
>>
>>
>> port@0 {
>>       reg = <0>;
>>
>>       usbc_hs: endpoint {
>>           remote-endpoint = <&tcphy0>;
>>       };
>> };
>>
>> port@1 {
>>       reg = <1>;
>>
>>       usbc_ss: endpoint {
>>           remote-endpoint = <&tcphy0>;
>>       };
>> };
>>
>> port@2 {
>>       reg = <2>;
>>
>>       usbc_dp: endpoint {
>>           remote-endpoint = <&tcphy0_typec_dp>;
>>       };
>> };
>>
>>
>>>>>>> +                               port@1 {
>>>>>>> +                                       reg = <1>;
>>>>>>> +
>>>>>>> +                                       usbc_ss: endpoint {
>>>>>>> + remote-endpoint = <&tcphy0_typec_ss>;
>>>>>>> +                                       };
>>>>>>> +                               };
>>>>>>> +
>>>>>>> +                               port@2 {
>>>>>>> +                                       reg = <2>;
>>>>>>> +
>>>>>>> +                                       usbc_dp: endpoint {
>>>>>>> + remote-endpoint = <&tcphy0_typec_dp>;
>>>>>>> +                                       };
>>>>>>> +                               };
>>>>>>> +                       };
>>>>>>> +               };
>>>>>>> +       };
>>>>>>> +};
>>>>>>> +
>>>>>> .....
>>>>>>>     &u2phy0 {
>>>>>>>            status = "okay";
>>>>>>> +
>>>>>>> +       port {
>>>>>>> +               u2phy0_typec_hs: endpoint {
>>>>>>> +                       remote-endpoint = <&usbc_hs>;
>>>>>>> +               };
>>>>>>> +       };
>>>>>>>     };
>>>>>>>
>>>>>> There is no switch and mux, how to co-work with Type-C?
>>>>> I checked the phy-rockchip-inno-usb2.c but did not find any switch or mux. Does this mean that we need to implement them? Thank you.
>>>> Wait a minute, actually we have multiple hardware interfaces, one of which is Type-C, eventually connected to USBDPPHY, and the other is micro-usb connected to U2PHY.
>>> I assume the Micro-USB connector does not use Type-C/PD IC, is it
>>> right? Does it relate to this patch?
>>>
>>> Best regards,
>>> Peter
>>>
>
-- 
Best,
Chaoyi


