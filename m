Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0818CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 06:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sctOfaMCaVQx0TE/izjuKTlWuoHc1phPG68ypDI+DRY=; b=NYB3cFokLlhXzEP4rDpiJTtOe1
	LkOfL6ND5TmT9MubCNV2U5+pedyMpJ8kPZZiRp9HiFFyM0jm+Vxrwnrp2fbMFVYhNmydRg5TYXMgc
	1/0VYxIo+0ODg7qmhxPGzj/CtzmyPpXf0NI6eNQiQpXjA1hujdSCQc99OYEzDeSIc1KN1sy1rYm6k
	lKe9ltX4nDACRy8ZPgAJeszF3/YL4f+52wHjVpbIA1/TMZ73h8Qv7W7o+Ce3f2R5L8kCtFZo5XYwg
	+KVq48564WOkz1IgCo0XyGdERopb1pmMrjDLlkYGFiJZmJp8gkx54XkXCqpV5oQ5B+JniyN43knGL
	6Uf8GVgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEMUe-00000003afc-3c4t;
	Thu, 30 Oct 2025 06:50:44 +0000
Received: from mail-m49206.qiye.163.com ([45.254.49.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEMUa-00000003aem-0qeL;
	Thu, 30 Oct 2025 06:50:43 +0000
Received: from [172.16.12.149] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 27bf20e38;
	Thu, 30 Oct 2025 14:50:33 +0800 (GMT+08:00)
Message-ID: <e2fcc437-0650-4fdf-bb75-3463a80299fe@rock-chips.com>
Date: Thu, 30 Oct 2025 14:50:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/10] arm64: dts: rockchip: rk3399-evb-ind: Add
 support for DisplayPort
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
 <7853bbf0-34e5-4880-a2f4-2d73f25cd5e6@rock-chips.com>
 <CAL411-rFK0o_cxBO_yJFHWurGFKxZGxw6=kpqxRipMetJskTaQ@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CAL411-rFK0o_cxBO_yJFHWurGFKxZGxw6=kpqxRipMetJskTaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a33e1e5d603abkunm4fdeafe247c99d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhoeTlZCTEtOQ0pKTk1CSUNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=aQQwn+vaju0fkVYqlzGfwsD04Z6mA/IUGFwt2/LybJDUI6VkbH4gPP3HejyR9GH2oDyovSq2B+HP/lZguM+2DXuCAwhyjbvdkv8Sy0w8O/SXgQZqRujAaeLAQmJ0w9DPTEMHz7SyhBw9i5kJ4Bq+y9Ft8urfVEBjRCZLvy8wSI0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=sctOfaMCaVQx0TE/izjuKTlWuoHc1phPG68ypDI+DRY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_235041_638766_A70BB249 
X-CRM114-Status: GOOD (  22.30  )
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

On 10/30/2025 2:13 PM, Peter Chen wrote:

> On Thu, Oct 30, 2025 at 11:14 AM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>> On 10/30/2025 10:50 AM, Peter Chen wrote:
>>
>>>>> Okay.  My question is basic: USB2 PHY supplies DP/DM, and the DP/DM is
>>>>> short for Type-C connector,
>>>>> and no control is needed for Type-C application.
>>>>> Why is there a remote-endpoint connection between USB2 PHY and Type-C connector?
>>>>    From the perspective of Type-C, this should not be added.  Is the approach in v2 correct [0] ?
>>>>
>>> Have you tried debugging based on upstream code?
>> Yes, I have tried both the v2 and v8 approaches, and both can work.
>>
>>
>>> v2 is correct, but the dts needs to improve.
>>> - There is a remote-endpoint connection for USB role switch between
>>> Type-C connector
>>> device and USB controller device
>>> - There is a remote-endpoint connection for orientation and lane configuration
>>> between Type-C connector device and USB/DP PHY device.
>> In v8 patch5, we implemented typec_mux and typec_switch in the USB/DP PHY.
>>
>> I think the current remote-endpoint connections are all child node of the USB/DP PHY. That is:
>>
>>
>> &tcphy0_dp {
>>       mode-switch;
>>       ...
>> };
>>
>>
>> &tcphy0_usb3 {
>>       orientation-switch;
>>       ...
>> };
>>
>>
>> Does this still need to be improved? Thank you.
>>
> Hi Chaoyi,
>
> There are two questions I have still not seen the answer to:
> - Why USB2 PHY is related to your Type-C patch?

I was just following other people's approach. Sorry, this should be removed from the dts.


> - How does the USB role switch event notify the USB controller driver, eg dwc3?

Sorry, I misunderstood what you said before. There is indeed a missing usb-role-switch now. I referred to the approach in rk3588-evb1-v10.dts. Is the following way of writing correct?

&usbc_connector {
     ports {
         #address-cells = <1>;
         #size-cells = <0>;

         port@0 {
             reg = <0>;

             usbc_orien_sw: endpoint {
                 remote-endpoint = <&tcphy0_typec_orien_sw>;
             };
         };

         port@1 {
             reg = <1>;

             usbc_role_sw: endpoint {
                 remote-endpoint = <&dwc3_0_role_switch>;
             };
         };


         port@2 {
             reg = <2>;

             usbc_dp: endpoint {
                 remote-endpoint = <&tcphy0_typec_dp>;
             };
         };
     };
};

&usbdrd_dwc3_0 {
     status = "okay";
     usb-role-switch;

     port {
         #address-cells = <1>;
         #size-cells = <0>;
         dwc3_0_role_switch: endpoint@0 {
             reg = <0>;
             remote-endpoint = <&usbc_role_sw>;
         };
     };
};

&tcphy0_usb3 {
     orientation-switch;

     port {
         tcphy0_typec_orien_sw: endpoint {
             remote-endpoint = <&usbc_orien_sw>;
         };
     };
};

&tcphy0_dp {
     mode-switch;

     port {
         #address-cells = <1>;
         #size-cells = <0>;

         tcphy0_typec_dp: endpoint@0 {
             reg = <0>;
             remote-endpoint = <&usbc_dp>;
         };
     };
};


> Peter
>>> Peter
>>>
>>>> [0]: https://lore.kernel.org/all/20250715112456.101-6-kernel@airkyi.com/
>>>>
>>>> Or is the following approach correct?
>>>>
>>>>
>>>> port@0 {
>>>>        reg = <0>;
>>>>
>>>>        usbc_hs: endpoint {
>>>>            remote-endpoint = <&tcphy0>;
>>>>        };
>>>> };
>>>>
>>>> port@1 {
>>>>        reg = <1>;
>>>>
>>>>        usbc_ss: endpoint {
>>>>            remote-endpoint = <&tcphy0>;
>>>>        };
>>>> };
>>>>
>>>> port@2 {
>>>>        reg = <2>;
>>>>
>>>>        usbc_dp: endpoint {
>>>>            remote-endpoint = <&tcphy0_typec_dp>;
>>>>        };
>>>> };
>>>>
>>>>
>>>>>>>>> +                               port@1 {
>>>>>>>>> +                                       reg = <1>;
>>>>>>>>> +
>>>>>>>>> +                                       usbc_ss: endpoint {
>>>>>>>>> + remote-endpoint = <&tcphy0_typec_ss>;
>>>>>>>>> +                                       };
>>>>>>>>> +                               };
>>>>>>>>> +
>>>>>>>>> +                               port@2 {
>>>>>>>>> +                                       reg = <2>;
>>>>>>>>> +
>>>>>>>>> +                                       usbc_dp: endpoint {
>>>>>>>>> + remote-endpoint = <&tcphy0_typec_dp>;
>>>>>>>>> +                                       };
>>>>>>>>> +                               };
>>>>>>>>> +                       };
>>>>>>>>> +               };
>>>>>>>>> +       };
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>> .....
>>>>>>>>>      &u2phy0 {
>>>>>>>>>             status = "okay";
>>>>>>>>> +
>>>>>>>>> +       port {
>>>>>>>>> +               u2phy0_typec_hs: endpoint {
>>>>>>>>> +                       remote-endpoint = <&usbc_hs>;
>>>>>>>>> +               };
>>>>>>>>> +       };
>>>>>>>>>      };
>>>>>>>>>
>>>>>>>> There is no switch and mux, how to co-work with Type-C?
>>>>>>> I checked the phy-rockchip-inno-usb2.c but did not find any switch or mux. Does this mean that we need to implement them? Thank you.
>>>>>> Wait a minute, actually we have multiple hardware interfaces, one of which is Type-C, eventually connected to USBDPPHY, and the other is micro-usb connected to U2PHY.
>>>>> I assume the Micro-USB connector does not use Type-C/PD IC, is it
>>>>> right? Does it relate to this patch?
>>>>>
>>>>> Best regards,
>>>>> Peter
>>>>>
>> --
>> Best,
>> Chaoyi
>>
>
-- 
Best,
Chaoyi


