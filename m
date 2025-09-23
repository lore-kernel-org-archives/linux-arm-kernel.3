Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0328ECAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 03:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KUKqQ7mqQ2zVDBXjqLvwFYHz4+0xl7oABzJGnrMKc8=; b=F+rrdqCSLsMH8kD5FEmCIATiKE
	gNMBTtikWZmL28B/gAXfNaABMdQBgZD2vo1myGJYDi3VLzbTJtTEr9zAn3T1ncM66NCT6tVRip4L/
	YwUrK+cHL8kawXbcd3POA9A5Y0cJatA8q2ZvAeexMXQSvF/mwJsxHVsQfdv7kD2HFLi3M7zNsoiyb
	zwtRCwNgBm21ltkZXDkO0EAN4L0A9DiB8ry13kh2QNHoa7lRVP60r/pKQQ8PTPaj+goFpcvRTGDt2
	tJ7mFjBWcBEs90ExbMHaasftDRIaEcAwLYiM7Jkb+zmPCZkmcBNlrimq/LvgIxEJNE3+2zGNxnt4e
	cCRxhNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0tvS-0000000CGC4-419i;
	Tue, 23 Sep 2025 03:42:46 +0000
Received: from mail-m19731110.qiye.163.com ([220.197.31.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0tvP-0000000CGAk-31tf;
	Tue, 23 Sep 2025 03:42:45 +0000
Received: from [172.16.12.153] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23b93816f;
	Tue, 23 Sep 2025 11:42:38 +0800 (GMT+08:00)
Message-ID: <7265bd00-3e44-40d7-8b53-0e4cd90f2717@rock-chips.com>
Date: Tue, 23 Sep 2025 11:42:36 +0800
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
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <mpyfe63tzxzxyyqf4vxwmrewzeosnaftlkko7pq2ynld6u3lcz@wlpixckov4hg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9974aa8dc603abkunm5757e026ec32e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxhCSlZIGB0ZGEMdQ05PHh9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cm2djMyY1KSH7R7fj+BsJrZJpRz+hFv7DR4CBPuZ4cXqi3Is0Xjfft+/qnuL+x3z0kVzyLXAGY05jU733OTg60njGbJQ4gL9W3wM+iO1LEwMSFrycz0UveCTLgVqGInCPgDsc1qJPFl0nezkToL/8ryZ29AAW5Px2Zd+JK2flzQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=4KUKqQ7mqQ2zVDBXjqLvwFYHz4+0xl7oABzJGnrMKc8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_204243_912146_ECC54EDF 
X-CRM114-Status: GOOD (  15.24  )
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

On 9/23/2025 11:17 AM, Dmitry Baryshkov wrote:

> On Tue, Sep 23, 2025 at 09:53:06AM +0800, Chaoyi Chen wrote:
>> Hi Dmitry,
>>
>> On 9/23/2025 9:12 AM, Dmitry Baryshkov wrote:
>>> On Mon, Sep 22, 2025 at 09:20:34AM +0800, Chaoyi Chen wrote:
>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>
>>>> The RK3399 SoC integrates two USB/DP combo PHYs, each of which
>>>> supports software-configurable pin mapping and DisplayPort lane
>>>> assignment. These capabilities enable the PHY itself to handle both
>>>> mode switching and orientation switching, based on the Type-C plug
>>>> orientation and USB PD negotiation results.
>>>>
>>>> While an external Type-C controller is still required to detect cable
>>>> attachment and report USB PD events, the actual mode and orientation
>>>> switching is performed internally by the PHY through software
>>>> configuration. This allows the PHY to act as a Type-C multiplexer for
>>>> both data role and DP altmode configuration.
>>>>
>>>> To reflect this hardware design, this patch introduces a new
>>>> "mode-switch" property for the dp-port node in the device tree bindings.
>>>> This property indicates that the connected PHY is capable of handling
>>>> Type-C mode switching itself.
>>>>
>>>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>
>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>
>>>> Changes in v4:
>>>> - Remove "|" in description.
>>>>
>>>> Changes in v3:
>>>> - Add more descriptions to clarify the role of the PHY in switching.
>>>>
>>>> Changes in v2:
>>>> - Reuse dp-port/usb3-port in rk3399-typec-phy binding.
>>>>
>>>>    .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
>>>> index 91c011f68cd0..83ebcde096ea 100644
>>>> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
>>>> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
>>>> @@ -51,6 +51,12 @@ properties:
>>>>          '#phy-cells':
>>>>            const: 0
>>>> +      mode-switch:
>>> Having the mode-switch here is a bit strange. I think the whole PHY
>>> device should be an orientation-switch and mode-switch. Otherwise it
>>> feels weird to me.
>> I think this is a difference in practice. In the previous binding, there was already an orientation-switch under the usb-port. I trying to add both an orientation-switch and a mode-switch to the top-level device in v2. And Krzysztof reminded me that adding a mode-switch under the dp-port would be better, so I changed it to the current form :)
> I couldn't find the comment on lore. Could you please point it out?

Sorry, it is v1. I added an orientation-switch and a mode-switch in the top-level PHY [0]. Comment is here: [1]


[0] https://lore.kernel.org/all/20250715112456.101-4-kernel@airkyi.com/

[1] https://lore.kernel.org/all/4dfed94c-665d-4e04-b527-ddd34fd3db8f@kernel.org/



>>
>>
>>>> +        description:
>>>> +          Indicates the PHY can handle altmode switching. In this case,
>>>> +          requires an external USB Type-C controller to report USB PD message.
>>>> +        type: boolean
>>>> +
>>>>          port:
>>>>            $ref: /schemas/graph.yaml#/properties/port
>>>>            description: Connection to USB Type-C connector
>>>> -- 
>>>> 2.49.0
>>>>
>> -- 
>> Best,
>> Chaoyi
>>
-- 
Best,
Chaoyi


