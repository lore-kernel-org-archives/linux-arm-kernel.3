Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DC6C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 14:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nepzZKwJ79ZBPx0msF/p60T2gafrt2riBNIRduz/8KI=; b=az2zGpIsUw2bAut94ZAJR1acFn
	N22ds+btpRvMyG9yf85wnx4jjBFooL+G5SWLFNvkM78bseIP5VLQ5n7buRMWOju4+JAh1v0gHcGJs
	djqD5pSHYXZg3IxDRbPUFHO2hsuADkpZMSRrzXWCD64WfJ/vplQIKcFn/c0kIZmo3J45w4wi3Vpmm
	KhpXG2lO5JQUKcAHq5Kgr5NYEWeZKiWI5Y3r0nty2nKI//cJklxDKDoiSU8saoq6fmLIr7Z1dQsm6
	ViGDWIA48oTrFBIKFlBoGM1kZ3U6hQ7Udq8z9tmgyROJ4Oyek/UdZ/pI3ZNLAKtkhz0/oRPu4fUUa
	XOuXj4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYn4X-00000002kUk-24X0;
	Mon, 07 Jul 2025 14:43:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmvI-00000002iog-1ovn;
	Mon, 07 Jul 2025 14:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751898862;
	bh=LQqzAjspviM0/DEAi1RUbDf3DG1eq5bmeUcZl9itj0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AtdL5iXEbqhxgy7ej+d1sDhw08eL3Z+NohmrWrHh3t992W2a0EyLbHpgr0oTym4yN
	 kKwglzAKQysYONjhcURZsffcW21q0BpSges9kFdH9WKYn40lnXgO97pZX6jrRebdav
	 Udn87tPfR0BgYF/xxru0+Y4uIr4B0lExq6NVXXdVsc4+sku3+RDIXvDtEdoLV61LYH
	 jWVuJU1iD6RcsXViKrmnEQ/1gaKRIeu0HVr1PS1+maQT2J7wLFooTcYLmFy3KEL0V0
	 eBhLGLrFiTXSAvcgdFeyXQEhrM1GQkSR0TeUr5IQ3/X+z64/LonHoq6WFpvQmqB06t
	 dc2HCjbiCchXw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C1E317E0A28;
	Mon,  7 Jul 2025 16:34:22 +0200 (CEST)
Message-ID: <f665ccf7-dff2-4c42-9a3e-efa6cdf40ee4@collabora.com>
Date: Mon, 7 Jul 2025 16:34:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: NULL pointer exception in drivers/memory/mtk-smi.c
To: "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>
Cc: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>
References: <allge3h2abtjfj77idsnwccurxi2jnbcv6qcxar5f5m3jjmpvs@a4mmfghdhtv4>
 <lri2gdwioe3on3unzrnmezv4pnxke6lmixrsvargeupdcywweo@j6xoz36xjdoh>
 <1dbebbf290413eae9af13312028c2d19d3441a09.camel@mediatek.com>
 <d818cad4-9eff-4fd6-b46c-d1fc24f7130b@collabora.com>
 <c2fhyerjrb5qgtgyo7jojcyolsryvdp6injgbbzdkbzoaubdnk@37aw7p2f6rbj>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <c2fhyerjrb5qgtgyo7jojcyolsryvdp6injgbbzdkbzoaubdnk@37aw7p2f6rbj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_073424_620899_F876BD32 
X-CRM114-Status: GOOD (  31.63  )
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

Il 07/07/25 15:41, u.kleine-koenig@baylibre.com ha scritto:
> On Mon, Jul 07, 2025 at 10:47:53AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 07/07/25 09:24, Yong Wu (吴勇) ha scritto:
>>> On Thu, 2025-07-03 at 18:41 +0200, Uwe Kleine-König wrote:
>>>> Hello,
>>>>
>>>> [expanding the audience a bit according to the drivers that are
>>>> involved
>>>> now that the problem is better understood]
>>>>
>>>> On Tue, Jun 17, 2025 at 05:18:30PM +0200, Uwe Kleine-König wrote:
>>>>> on a 6.16-rc2 kernel running on an mt8365-evk I occasionally hit
>>>>> the
>>>>> following during boot:
>>>>
>>>> I invested some time now to understand the issue. So here comes what
>>>> I
>>>> understood, maybe that helps someone to spot the fix to the described
>>>> problem.
>>>>
>>>> With a configuration that has all drivers built-in but
>>>>
>>>> 	CONFIG_DRM_MEDIATEK=m
>>>> 	CONFIG_MTK_IOMMU=m
>>>>
>>>> and
>>>>
>>>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>>>> index cb95fecf6016..d4320db7cd2d 100644
>>>> --- a/drivers/iommu/mtk_iommu.c
>>>> +++ b/drivers/iommu/mtk_iommu.c
>>>> @@ -1387,14 +1387,15 @@ static int mtk_iommu_probe(struct
>>>> platform_device *pdev)
>>>>    		goto out_list_del;
>>>>    	ret = iommu_device_register(&data->iommu, &mtk_iommu_ops, dev);
>>>>    	if (ret)
>>>>    		goto out_sysfs_remove;
>>>>    	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
>>>> +		msleep(10000);
>>>>    		ret = component_master_add_with_match(dev,
>>>> &mtk_iommu_com_ops, match);
>>>>    		if (ret)
>>>>    			goto out_device_unregister;
>>>>    	}
>>>>    	return ret;
>>>>    out_device_unregister:
>>>>
>>>> I can reliably trigger the race.
>>>>
>>>> With that sleep in place iommu_device_register() completes quickly
>>>> which
>>>> enables probing of the devices with drivers contained in the
>>>> drm_mediatek module (because the modules are loaded in parallel on
>>>> a different CPU).
>>>>
>>>> Then generic driver code calls resume on all suppliers for devices to
>>>> bind, among them the four larb devices. However due to
>>>> component_master_add_with_match() not being called yet, the larb
>>>> devices
>>>> are not yet bound to the iommu device and so larb->mmu is still NULL.
>>>> The latter is a problem in mtk_smi_larb_config_port_gen2_general()
>>>> which
>>>> is called from mtk_smi_larb_resume().
>>>
>>> Hi Uwe,
>>>
>>> Thanks for your help. In this case, it looks like the disp probe occurs
>>> before the smi_larb_bind operation, we need to let disp wait for the
>>> bind to complete.
>>>
>>> --- a/drivers/memory/mtk-smi.c
>>> +++ b/drivers/memory/mtk-smi.c
>>> @@ -666,6 +666,10 @@ static int __maybe_unused
>>> mtk_smi_larb_resume(struct device *dev)
>>>           if (MTK_SMI_CAPS(larb->larb_gen->flags_general,
>>> MTK_SMI_FLAG_SLEEP_CTL))
>>>                   mtk_smi_larb_sleep_ctrl_disable(larb);
>>>
>>> +     /* The larb_bind operation may be later than the master probe. */
>>> +       if (!larb->mmu)
>>> +               return -EPROBE_DEFER;
>>> +
> 
> A .resume callback isn't supposed to return -EPROBE_DEFER.
> 

Obviously :-)

>>>           /* Configure the basic setting for this larb */
>>>
>>>
>>> Hi Angelo,
>>>    Do you have any suggestion?
>>>
>>
>> I don't have the necessary bandwidth to really broadly research about this, but
>> there's two ideas:
>>
>> 1. What if we disable PM OPS until MMU is bound? That would avoid calls to
>>     larb_resume().....
> 
> I think the key question here is: Is the iommu functional without the
> larbs bound? If not I'd claim that iommu_device_register() should only
> happen if all larbs are present and ready.
> 

Not all IOMMUs need Local Arbiters... some of them are very specific and do not
need to be arbitered, mostly because they're not shared.

Some.. like the infra contexts for the PCI-Express controller... because then
generally all of the multimedia related contexts should need the arbitering
because they should be all shared between the multimedia IPs (but it may also
be possible to use some without arbitering, depending on the application, though
upstream I think there's no multimedia context with no arbiter - I didn't really
carefully check in devicetrees anyway).

>> 2. Instead of component, we could register a device - which carries its own suspend
>>     and resume ops; the device would be registered only after all local arbiters
>>     are bound, so there would be no suspend/resume ops until everything is in place.
>>     That's more or less how it's done in drivers/usb/core/port.c
>>
>> Probably N.1 would work best - we could...
>>
>> probe:
>> pm_runtime_set_active(larb->smi.dev);
>> pm_runtime_forbid(larb->smi.dev);
>>
>> bind:
>> larb->mmu = ...
>> larb->bank = ...
>>
>> pm_runtime_set_suspended(larb->smi.dev);
>> pm_runtime_allow(larb->smi.dev);
>>
>>
>> ...the next usage/wakeup should then call resume() but at that point we're sure
>> that larb->mmu is actually initialized, because we allowed PM resume only after
>> binding.
> 
> Not knowing the details of the hardware that feels wrong. IMHO a device
> that is operational should be able to do PM ops.
> 

That's true and I completely agree with you, in general - though, this is a "Local
Arbiter" and... if there's nothing to arbiter, it's not functional.

This is arbitering iommu-bus/memory(dma)-bus access to provide some kind of basic
bus QoS: of course, if there's no iommu, there can't be any access, so again there
would be nothing to perform bandwidth arbitration with.

Count that we will (hopefully...) (and hopefully soon...) see some interconnect
driver that takes the defaults in SMI (in a way or another) and changes them to
provide a finer grain QoS (because right now it's static, there's no usage analysis
in place), so the amount of users of mtk-smi should also get higher.. maybe.

Cheers,
Angelo


