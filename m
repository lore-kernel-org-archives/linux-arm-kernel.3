Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE57C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 11:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcI3MBPSj0BIlngssBgBDQc0EsKF1spVCU2qV220AlE=; b=cl43ikV7QRkl/VJpbFm9pTASQP
	SUPGXW+ANukpFxyEba9m15IBmQUpqh38WnLU4n9o4Uu19b3AVTxcT+am3FgUP3ac/KR5IZjYy+rJq
	bJicdke5n2DUTGNG8h7KaEIlD3p6Le8E8dsOZPLYWQPhbkeszXqwLnOuQvMis6Edyjd/ccldjYxtM
	pyBykGKh4LVcjRmdLBhvB/M0xYuAcaxZylWLKGxL6guXWnbxmYOAVWBMxP5rTmgq5blkGRqRIO88/
	l0ilaDLGLGWlxrIJiqTs90verJ8hj3lo7K/lIIRoy17kWAYzcyBF+Tdy8JBioke2kJMyWoR09MKlo
	+hVuID1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFcn-0000000Ca3c-0KLz;
	Tue, 05 Aug 2025 11:14:33 +0000
Received: from mail-m21470.qiye.163.com ([117.135.214.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFVu-0000000CZEk-3FR3;
	Tue, 05 Aug 2025 11:07:28 +0000
Received: from [172.16.12.153] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1e5e73aa8;
	Tue, 5 Aug 2025 19:07:10 +0800 (GMT+08:00)
Message-ID: <a7988745-ea31-45cd-8ffd-905e6e4d1315@rock-chips.com>
Date: Tue, 5 Aug 2025 19:07:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add Type-C DP support for RK3399 EVB IND board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20250729090032.97-1-kernel@airkyi.com>
 <3kefqzjewmsyzfvyi33kvlgjd6jphjg3fsnixb3of7yb3xkgs2@hgi6xfkgd653>
 <63ec11cf-7927-431a-995e-a5fc35ef1ba7@rock-chips.com>
 <pk5wecbbpxn7v4bdwtghhdnm76fmrmglelytljwfb4cgvpu2i6@rk5turgyt5xq>
 <0207826d-a987-4464-b306-29bdbfac45bc@rock-chips.com>
 <3e880194-5ac8-4056-929c-ac103bedc737@oss.qualcomm.com>
 <f726862a-bd18-43ee-b307-8daef2451e6b@rock-chips.com>
 <6nfmxwtwcvuyo2jaao7fele7jcgcykfpy7czbcbjmjxv7cs5sc@dmbtot73kw63>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <6nfmxwtwcvuyo2jaao7fele7jcgcykfpy7czbcbjmjxv7cs5sc@dmbtot73kw63>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9879e9ebce03abkunm2a7119d6701883
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGksaS1YZHR1IHR8ZTUoZGRpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=QO3VG4Co4nsteQv8Qv57Hfls+cf5t683+xOusxx1peKmZ26y3oXrzV2n1Yh8IPkMsUuZPGO92FYmZYsqJJuvr7R1Do+nJTWWLEytFOuX7IY7byJ2OCGPylXYwmvRz5z63+IDQxi0wCeE+ZhGlRNJmm2zpuZgUlf2I/6B0gWLdlA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=DcI3MBPSj0BIlngssBgBDQc0EsKF1spVCU2qV220AlE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_040727_469219_CA7B775F 
X-CRM114-Status: GOOD (  22.81  )
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

On 8/5/2025 6:44 PM, Dmitry Baryshkov wrote:

> On Tue, Aug 05, 2025 at 02:32:17PM +0800, Chaoyi Chen wrote:
>> Hi Dmitry,
>>
>> On 8/5/2025 12:26 PM, Dmitry Baryshkov wrote:
>>> On 05/08/2025 09:13, Chaoyi Chen wrote:
>>>> Hi Dmitry,
>>>>
>>>> On 8/2/2025 5:55 PM, Dmitry Baryshkov wrote:
>>>>
>>>> [...]
>>>>
>>>>
>>>>>>>> BTW, one of the important things to do is to implement extcon-like
>>>>>>>> notifications. I found include/drm/bridge/aux-bridge.h , but if the
>>>>>>>> aux-bridge is used, the bridge chain would look like this:
>>>>>>>>
>>>>>>>> PHY0 aux-bridge ---+
>>>>>>>>                       | ----> CDN-DP bridge
>>>>>>>> PHY1 aux-bridge ---+
>>>>>>>>
>>>>>>>> Oh, CDN-DP bridge has two previous aux-bridge!
>>>>>>>>
>>>>>>>> Now, I try to use drm_connector_oob_hotplug_event() to notify HPD
>>>>>>>> state between PHY and CDN-DP controller.
>>>>>>> Does it actually work? The OOB HPD event will be repoted
>>>>>>> for the usb-c
>>>>>>> connector's fwnode, but the DP controller isn't
>>>>>>> connected to that node
>>>>>>> anyhow. If I'm not mistaken, the HPD signal will not
>>>>>>> reach DP driver in
>>>>>>> this case.
>>>>>> Yes.  What you mentioned is the case in
>>>>>> drivers/usb/typec/altmodes/displayport.c . I have also added
>>>>>> a new OOB event
>>>>>> notify in the PHY driver in Patch 3, where the expected
>>>>>> fwnode is used in
>>>>>> the PHY. So now we have two OOB HPD events, one from
>>>>>> altmodes/ displayport.c
>>>>>> and the other from PHY. Only the HPD from PHY is eventually
>>>>>> passed to the DP
>>>>>> driver.
>>>>> This way you will loose IRQ_HPD pulse events from the DP. They are used
>>>>> by DPRX (aka DP Sink) to signal to DPTX (DP Source) that there was a
>>>>> change on the DPRX side and the DPTX should reread link params
>>>>> and maybe
>>>>> retrain the link.
>>>> Sorry, I still don't quite understand your point. I think the entire
>>>> notification path is as follows:
>>>>
>>>> Type-C mux callback -> RK3399 USBDP PHY -> PHY calls
>>>> drm_connector_oob_hotplug_event() -> DP driver
>>>>
>>>> Are you concerned that the IRQ_HPD event is not being handled
>>>> somewhere along the path? Is it that the Type-C mux callback didn't
>>>> notify the PHY, or that after the PHY passed the event to the DP
>>>> driver via the OOB event, the DP driver didn't handle it?
>>> The IRQ_HPD is an event coming from DPRX, it is delivered as a part of
>>> the attention VDM, see DP_STATUS_IRQ_HPD. It's being handled by the
>>> altmode displayport.c driver and is then delivered as an OOB hotplug
>>> call. However, it's not a mux event, so it is not (and it should not)
>>> being broadcasted over the typec_mux devices.
>>>
>>> The way we were handling that is by having a chain of drm_aux_bridges
>>> for all interim devices, ending up with a drm_dp_hpd_bridge registered
>>> by the TCPM. This way when the DPRX triggers the IRQ_HPD event, it is
>>> being handled by the displayport.c and then delivered through that
>>> bridge to the DP driver.
>> I think the issue goes back to the beginning. The key is to reuse the logic
>> in displayport.c, and the previous approach of directly setting the fwnode
>> has already been rejected. Is it a good idea to register the aux hpd bridge
>> in displayport.c? In this way, we don't need to register it with a bunch of
>> PD drivers (such as fusb302), which seems like a more generic solution.
> displayport.c comes into play only when you actually attach a DP dongle,
> which is too late for bringing up the display pipeline. But your point
> is valid, it might be worth moving drm_dp_hpd registration to
> typec_port_register_altmode().

Very insightful, thank you! I will try to do this in v4 :)



