Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149DDD49795
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 03:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vInghskew2dflu0c8gMWmhPKWVHVkA65wStDFK4/TW0=; b=IECeo4Y/9BKalP2qwutSNAr8xb
	XAFysRl9WKBNSfAkECunKaOg3Nxyu1WMcdg//OLSZWMcFLaz2LXBQcuJ7dfI9SwdWqJMrJSB/0Zce
	0J0WDdMM2e2Iv4JjH7xXD8FbclJnKgZYJ6s0O8MGhXbYa1PV9jz3Fid0eC0sXSo5qKI4ONSwAtj/8
	tcufqFjR9Otnaifb2rjm+YkSnNxZoL9rcQmCLUNbg5hfA8EaVRrd8NuZxabNFfCZACebAEhPxfK1M
	3U+atogFlfX24KxGA+8HtSJ7fTQ8yxVdSvHYLP5Et9GaPulamfItgUmIR3wQq8f4WZFaIKnEWewK1
	PgjcVbUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHxAl-00000004xtX-2SGp;
	Mon, 02 Dec 2024 03:32:31 +0000
Received: from mail-m32120.qiye.163.com ([220.197.32.120])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHx6k-00000004wWx-44lq;
	Mon, 02 Dec 2024 03:28:24 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 464683d7;
	Mon, 2 Dec 2024 11:28:13 +0800 (GMT+08:00)
Message-ID: <2342f342-672c-447e-90d8-674b748af6a4@rock-chips.com>
Date: Mon, 2 Dec 2024 11:28:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] phy: phy-rockchip-samsung-hdptx: Add support for
 eDP mode
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
 <2131853.KlZ2vcFHjT@diego>
 <6e1f35c0-5ea8-414f-b3ea-4e7222c605ef@rock-chips.com>
 <2886747.Y6S9NjorxK@diego>
 <h4giob7bcrh7qmtepti6huym2llw4ujfmeff76vrgpahb5zy6x@dz6zghsifww5>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <h4giob7bcrh7qmtepti6huym2llw4ujfmeff76vrgpahb5zy6x@dz6zghsifww5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhgYT1ZLT05OHh1JSkIYS0lWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a938569573e03a3kunm464683d7
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NVE6NDo*LTIvARwqHjYRLSIs
	GAoKCilVSlVKTEhISkpLS0JOSE1NVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFNTE1LNwY+
DKIM-Signature: a=rsa-sha256;
	b=FwPs+mgLMwp68zTG3bQWxeiIZ8ov1pFf6HC8h8Y1jUaZPur5mKpIg3OQm7hTItUn0SEhpu1zzicOw9goEnCXOK/Oh3N1OuPZZ1CGRE7oZpPt2ZMKGodcg2kkYgFMR7GFl7lrX9Aso4fOo/IhdFD/GS1wF4kGfIVjZZKpoTBoWsw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=vInghskew2dflu0c8gMWmhPKWVHVkA65wStDFK4/TW0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_192823_536025_4034F5B0 
X-CRM114-Status: GOOD (  40.54  )
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

Hi,

On 2024/12/2 6:59, Sebastian Reichel wrote:
> Hi,
> 
> On Sat, Nov 30, 2024 at 09:25:12PM +0100, Heiko Stübner wrote:
>> Am Freitag, 29. November 2024, 03:43:57 CET schrieb Damon Ding:
>>> On 2024/11/27 19:04, Heiko Stübner wrote:
>>>> Am Mittwoch, 27. November 2024, 12:00:10 CET schrieb Damon Ding:
>>>>> On 2024/11/27 17:29, Heiko Stübner wrote:
>>>>>> Am Mittwoch, 27. November 2024, 08:51:51 CET schrieb Damon Ding:
>>>>>>> +static int rk_hdptx_phy_set_mode(struct phy *phy, enum phy_mode mode,
>>>>>>> +				 int submode)
>>>>>>> +{
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>> analogix_dp_phy_power_on
>>>>>> I think it might make sense to go the same way as the DCPHY and also
>>>>>> naneng combophy, to use #phy-cells = 1 to select the phy-mode via DT .
>>>>>>
>>>>>> See [0] for Sebastians initial suggestion regarding the DC-PHY.
>>>>>> The naneng combophy already uses that scheme of mode-selection too.
>>>>>>
>>>>>> There is of course the issue of backwards-compatibility, but that can be
>>>>>> worked around in the binding with something like:
>>>>>>
>>>>>>     '#phy-cells':
>>>>>>        enum: [0, 1]
>>>>>>        description: |
>>>>>>          If #phy-cells is 0, PHY mode is set to PHY_TYPE_HDMI
>>>>>>          If #phy-cells is 1 mode is set in the PHY cells. Supported modes are:
>>>>>>            - PHY_TYPE_HDMI
>>>>>>            - PHY_TYPE_DP
>>>>>>          See include/dt-bindings/phy/phy.h for constants.
>>>>>>
>>>>>> PHY_TYPE_HDMI needs to be added to include/dt-bindings/phy/phy.h
>>>>>> but PHY_TYPE_DP is already there.
>>>>>>
>>>>>> That way we would standardize on one form of accessing phy-types
>>>>>> on rk3588 :-) .
>>>>>>
>>>>>> Also see the Mediatek CSI rx phy doing this too already [1]
>>>>>>
>>>>>>
>>>>>> Heiko
>>>>>>
>>>>>> [0] https://lore.kernel.org/linux-rockchip/udad4qf3o7kt45nuz6gxsvsmprh4rnyfxfogopmih6ucznizih@7oj2jrnlfonz/
>>>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
>>>>>>
>>>>>
>>>>> It is really a nice way to separate HDMI and DP modes.
>>>
>>> I apologize for reopening the discussion about the phy-types setting.
>>
>> there is definitly no need to apologize. We're trying to find the best
>> solution afterall :-) .
>>
>>> With the .set_mode() of struct phy_ops, the HDMI and eDP dynamic
>>> switching can be achieved, which just depends on the right setting of
>>> enum phy_mode in include/linux/phy/phy.h. So the previous way of
>>> configuring phy mode may be also good.
>>
>> I think the deciding factor is, is there a use-case for needing to switch
>> modes at runtime.
>>
>> I do think the mode for the dc-phy and also the hdptx-phy is pretty much
>> decided by the board design.
>>
>> I.e. when you end up in a DP-connector (or eDP-panel) on your board you
>> need DP mode, and when you end up in a hdmi-connector you need the
>> HDMI phy mode.
>>
>> So I think the phy-mode for the hdptx-phy is largely dictated by the static
>> board definition (like devicetree), hence going with the dt-argument for
>> the mode.
>>
>> Like similar to the Naneng combophy, selecting its mode via argument
>> because deciding if it ends up in a sata port is a board-design thing.
>>
>> Is there a use-case where you need to switch at runtime between
>> HDMI and eDP? Like starting the phy in eDP mode but then needing
>> to switch to HDMI mode, while the device is running?

Indeed, we have the board as you described, on which the DP-connector 
and HDMI-connector both have been configured.

And the dynamic switching is more useful for RK3576, which has the same 
eDP/HDMI design as RK3588 but only one eDP controller/HDMI 
controller/HDPTX phy. We can only enable both of eDP/HDMI by this way.

> 
> I believe the eDP controller can only use the PHY in eDP mode and
> the HDMI controller can only use it in HDMI mode. So in order to
> support runtime switching, the following options are possible:
> 
> 1. Enable both controllers, the PHY decides which one is really
>     used, the other one is basically a non-functional dummy device
>     until the PHY is reconfigured. This requires the set_mode()
>     callback, since the HDMI and eDP drivers both expect their
>     PHY to be enabled.
> 
> 2. Properly enable / disable the used controller, so that only one
>     controller is active at the same time. In this case the switching
>     is handled one layer above and the PHY has nothing to do with it.
>     The phy_enable call from each controller would just set it up in
>     the right mode.
> 
> I guess option 1 is the hacked solution, which is easier to
> implement as DRM's hotplug abilities are quite limited at the moment
> as far as I know. I think the second solution looks much cleaner and
> should be prefered for upstream. That solution does not require
> calling set_mode() for runtime switching making this whole argument
> void :)
> 

Your friendly and detailed analysis has brought me some valuable 
insights. :)

The option 2 is really a better way to support the dynamic switching, 
and we still need the .set_mode() to select the configurations for 
either eDP or HDMI in HDPTX phy at the controller level. Would you mind
elaborating on the useful way to choose the phy mode for the second 
solution?

> FWIW I think the DT argument based mode setting and the runtime set_mode
> are not necessarily mutual exclusive. In theory one could support both
> and adding set_mode support later does not change any ABI as far as
> I can see. Basically handle it like pin mux/configuration settings,
> which are usually automatically handled by the device core based on
> DT information, except for some drivers which have special needs.
> 

>>> And other phys may want to support dynamic switching too, like the
>>> Rockchip USBDP combo phy.
>>
>> I guess USBDP is special in that in also does both modes dynamical
>> depending on its use (like type-c with option DP altmode)
> 
> The USBDP PHY is indeed quite different from the PHYs in your list
> above, but for a different reason: All the combined PHYs you listed
> above only support one mode at the same time. E.g. you need to
> decide between PCIe, SATA and USB3 mode for the Naneng combophy.
> 
> For the USBDP PHY the modes are not mutually exclusive. The USB
> controller can request the USBDP PHY in USB mode at the same time
> as the DP controller requests it in DP mode. Some additional
> registers configure how the lanes are being muxed. A typcial setup
> would be 2 lanes for USB3 and 2 lanes for DP.
> 
> Greetings,
> 
> -- Sebastian

Best regards,
Damon


