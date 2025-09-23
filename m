Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C36CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 07:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXgNszLNxTgYBQeXLiuoM2pl3d7cCmFzHYl2QZT0EDg=; b=ClGOfLCXTllXqGnQEJ8rDenR6C
	o5Gauev6qWthQacZCiJfjp1C78UMaFQSYVVeK3lgx4kYkMxbDh3aVLhcT9Mm5/sctAcD2tEtwQWh5
	Yz0WnReTsU7kcqYxVHOVQBWvWzAx+pSBBSVzoapAYu34MluO1WD/NOkemr3yq2kfvX9peuGhANo1y
	geCAUEGw+HjaN/tWda1oOCdARdmay+1xNZFZWUZMaWJH2Cn8uUECT7Kbvyp3Ak0YY7Qu0oy3cON8I
	2qvKAnXtnnRGXm4xnAUg5qlm5WMo26XL0DbJ8tJuA7lakfPkM56zxInTzsavtUKNuPG4otso0FWHt
	Nj/aBzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xHI-0000000CfU4-2h9G;
	Tue, 23 Sep 2025 07:17:32 +0000
Received: from mail-m32111.qiye.163.com ([220.197.32.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xHE-0000000CfST-08jD;
	Tue, 23 Sep 2025 07:17:30 +0000
Received: from [172.16.12.153] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23c09b919;
	Tue, 23 Sep 2025 15:17:21 +0800 (GMT+08:00)
Message-ID: <dc554831-4368-43f0-b92b-896fd920e239@rock-chips.com>
Date: Tue, 23 Sep 2025 15:17:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] dt-bindings: phy: rockchip: rk3399-typec-phy:
 Support mode-switch
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-3-kernel@airkyi.com>
 <eb6ogrepo5acwcj5gpdolxxyg3xrx7kz6zrbizzseqyavvitfd@cnzurelqeh4t>
 <533d41bd-9293-4808-85f3-8fb6dc8bcda7@rock-chips.com>
 <mpyfe63tzxzxyyqf4vxwmrewzeosnaftlkko7pq2ynld6u3lcz@wlpixckov4hg>
 <8396dd15-9111-4ceb-a561-6ed57727546f@rock-chips.com>
 <jm32ujhxslsx5snes4o66t2grb5uxhsaapjqahektfck66g6hb@fx6f53yojlcr>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <jm32ujhxslsx5snes4o66t2grb5uxhsaapjqahektfck66g6hb@fx6f53yojlcr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99756f218d03abkunm5591869a139fab
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUgZT1ZNSE0dGUJJHklDTxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=OuYfjoI0/KRTSG9Mvp5kZYif7pjSs177Xu8KZpj87g1akZkEF+pMJzmwB3eSidvVAne+dtdEcqRxOUpwCka9htscgTlWFbmWMlv7ZiMuYOV8WMKcRTDPeqIot1jzjkJ8XCw5tP08afglgbemTqC93ar2xwElmLvVYzlSaQtWkqc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=YXgNszLNxTgYBQeXLiuoM2pl3d7cCmFzHYl2QZT0EDg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_001728_683144_C4E23D24 
X-CRM114-Status: GOOD (  22.55  )
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

On 9/23/2025 12:51 PM, Dmitry Baryshkov wrote:

> On Tue, Sep 23, 2025 at 11:40:33AM +0800, Chaoyi Chen wrote:
>> On 9/23/2025 11:17 AM, Dmitry Baryshkov wrote:
>>
>>> On Tue, Sep 23, 2025 at 09:53:06AM +0800, Chaoyi Chen wrote:
>>>> Hi Dmitry,
>>>>
>>>> On 9/23/2025 9:12 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Sep 22, 2025 at 09:20:34AM +0800, Chaoyi Chen wrote:
>>>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>>>
>>>>>> The RK3399 SoC integrates two USB/DP combo PHYs, each of which
>>>>>> supports software-configurable pin mapping and DisplayPort lane
>>>>>> assignment. These capabilities enable the PHY itself to handle both
>>>>>> mode switching and orientation switching, based on the Type-C plug
>>>>>> orientation and USB PD negotiation results.
>>>>>>
>>>>>> While an external Type-C controller is still required to detect cable
>>>>>> attachment and report USB PD events, the actual mode and orientation
>>>>>> switching is performed internally by the PHY through software
>>>>>> configuration. This allows the PHY to act as a Type-C multiplexer for
>>>>>> both data role and DP altmode configuration.
>>>>>>
>>>>>> To reflect this hardware design, this patch introduces a new
>>>>>> "mode-switch" property for the dp-port node in the device tree bindings.
>>>>>> This property indicates that the connected PHY is capable of handling
>>>>>> Type-C mode switching itself.
>>>>>>
>>>>>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>>>
>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> ---
>>>>>>
>>>>>> Changes in v4:
>>>>>> - Remove "|" in description.
>>>>>>
>>>>>> Changes in v3:
>>>>>> - Add more descriptions to clarify the role of the PHY in switching.
>>>>>>
>>>>>> Changes in v2:
>>>>>> - Reuse dp-port/usb3-port in rk3399-typec-phy binding.
>>>>>>
>>>>>>     .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
>>>>>>     1 file changed, 6 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
>>>>>> index 91c011f68cd0..83ebcde096ea 100644
>>>>>> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
>>>>>> @@ -51,6 +51,12 @@ properties:
>>>>>>           '#phy-cells':
>>>>>>             const: 0
>>>>>> +      mode-switch:
>>>>> Having the mode-switch here is a bit strange. I think the whole PHY
>>>>> device should be an orientation-switch and mode-switch. Otherwise it
>>>>> feels weird to me.
>>>> I think this is a difference in practice. In the previous binding, there was already an orientation-switch under the usb-port. I trying to add both an orientation-switch and a mode-switch to the top-level device in v2. And Krzysztof reminded me that adding a mode-switch under the dp-port would be better, so I changed it to the current form :)
>>> I couldn't find the comment on lore. Could you please point it out?
>> Sorry, it is v1. I added an orientation-switch and a mode-switch in the top-level PHY [0]. Comment is here: [1]
> My interpretation of [1] doesn't quite match yours. It doesn't say
> anything about moving mode-switch to dp-port. It basically pointed out
> that you already have two ports.

Yes, I think this can be easily changed, as long as the issue you mentioned below is resolved.


>
> Also, I'm not sure how the current construction works: you register
> switch and mux for the dev_fwnode(tcphy->dev), however the lookfup
> functions should be looking for a device corresponding to the port OF
> node (which doesn't exist).

In v1, that is fwnode = dev_fwnode(tcphy->dev) .  And dt like is:


&tcphy {
     port {
         tcphy0_orientation_switch: endpoint@0 { ... };
         tcphy_dp_altmode_switch: endpoint@1 { ... };
     };
};


Since the binding already includes a "usb3-port" and a "dp-port", it can not add another new port.

So after v1, that is fwnode = device_get_named_child_node(tcphy->dev, "usb3-port") . And dt like this:


&tcphy0_dp {
     port { ... };
};

&tcphy0_usb3 {
     port { ... };
};


Sorry, this looks a bit hacky. Do you have a better idea? Thank you.


>
>>
>> [0] https://lore.kernel.org/all/20250715112456.101-4-kernel@airkyi.com/
>>
>> [1] https://lore.kernel.org/all/4dfed94c-665d-4e04-b527-ddd34fd3db8f@kernel.org/
>>
>>
>>
>>>>
>>>>>> +        description:
>>>>>> +          Indicates the PHY can handle altmode switching. In this case,
>>>>>> +          requires an external USB Type-C controller to report USB PD message.
>>>>>> +        type: boolean
>>>>>> +
>>>>>>           port:
>>>>>>             $ref: /schemas/graph.yaml#/properties/port
>>>>>>             description: Connection to USB Type-C connector
>>>>>> -- 
>>>>>> 2.49.0
>>>>>>
>>>> -- 
>>>> Best,
>>>> Chaoyi
>>>>
>> -- 
>> Best,
>> Chaoyi
>>
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
Best,
Chaoyi


