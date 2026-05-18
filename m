Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D423CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSgtemrmf8dZPzVnFFzVzbQuYpzHfNiDPM5YoGRV8dI=; b=aCKdSgTaP0sxmOKxYdp0R+C3O+
	W4FLnreF3M3DudnZqAbECTc30Br/ClkqmerLKLLoeZ8e2CT8kGleA4dwpvAi+KIZqNVK/zT9s/AVr
	NSvEpePU0biy+t9hypUNKDqSPNGthwfKCoBvjFXDAnKQ91T6bCWssx90UGmLvfXHh9MQNwxtsg9GC
	Bir8WuYXhDIJK41J5KgvibE77fIEdBGtl5oMOn9A11+KWKA1RWIrU0fKawn7BODjfpYuY95Cufu1x
	SllEp54Q5tRwjNkoToWSmSXaNi1N8WJ5JIfYYvQue2cXfKzX1ovH6re8zFmv06KaDBAKdmrS9Vbkp
	nYpznQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOunj-0000000F8Rg-1AN2;
	Mon, 18 May 2026 10:02:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuni-0000000F8RL-0u8J;
	Mon, 18 May 2026 10:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YSgtemrmf8dZPzVnFFzVzbQuYpzHfNiDPM5YoGRV8dI=; b=D2li6kNKYsHx2TF5gJ5eN2FuJ/
	hijduQ+xSCqHD+bB0H4bXGZXKJmiyJnNoX+TNmeM3BFzq3peTAzVd3pSNAePyZCzZ28EKFZOVYu9Y
	sL9LMPHQvJhOJ4dB+8FeGRXKfQ5Bd/xkxIEF94ECQ633Ou+QtUw6qzP41QmEjxKTEIN3oI9HqMxg8
	gypr/OH9mTj3+Vepizui22TOlN9YPL+Aq6K5nxujovJvtCC41IAQN2tctJ+rmzxVx2wSdWVV/kmeT
	qeSo4Js52EL+GOH6cHvhZS1gymcQ41ySDVdQyP0/jElHIYCzL+8nZgDOjZQ4bZurOvAp3CMyknnAq
	JxHVzyEA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOunW-0000000AgA4-47sE;
	Mon, 18 May 2026 10:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779098521;
	bh=+uNpgAuOVfN6qgRkrWEDp6LOZz8aiVnozDLX8gPsA/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=megOarJa4PorMb7FNPHfAcn90/VwHzYDGoqgcGwUm1KLGv9mMBqu0ZUVXUowEXhUX
	 SvVw/N9PaL+/JvumOafJwJCSbB1wFCBd8/tAEKXVa1sRKdePie/nIH1Rj3kifrbJOL
	 /xOhlEJExyYhEfMkkkPe5nQ7MZ8aMNYHcoWgLpXT81pza5CPcdbbx/3/aFEzrhGUMl
	 G6pSe6IRlnhNbNPRCbpUJ+w4xzf2HOIrxh/UcRE7Kr0l+LXopNkLGktGb8ZOaSM89i
	 xlu5RvMB/QQ4PRL090Gs5X6Dlj++0SZ+VbXpe8Ep/+qqsMvwp1VWyuznIboAJ1bQ1w
	 sqRzNiz9XYrkw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A342B17E0443;
	Mon, 18 May 2026 12:02:00 +0200 (CEST)
Message-ID: <1a8b6793-661f-4676-bb29-6c1ee11a3ce9@collabora.com>
Date: Mon, 18 May 2026 12:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] memory: mtk-smi: Add a flag skip_rpm
To: =?UTF-8?B?WHVlcWkgWmhhbmcgKOW8oOmbqueQpik=?= <Xueqi.Zhang@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: =?UTF-8?B?V2VuZHktU1QgTGluICjmnpfoqanluq0p?= <Wendy-ST.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20250320073625.25225-1-xueqi.zhang@mediatek.com>
 <20250320073625.25225-3-xueqi.zhang@mediatek.com>
 <46e0e1f1-e094-40f9-99f9-22678bb40d39@collabora.com>
 <198865fb3184926d0b1b4e4855b5f863ad0d6a20.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <198865fb3184926d0b1b4e4855b5f863ad0d6a20.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_110210_235446_26C6886A 
X-CRM114-Status: GOOD (  34.20  )
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

On 5/18/26 09:16, Xueqi Zhang (张雪琦) wrote:
> Hi Angelo,
> 
> First of all, please accept my apologies for the delayed response. I
> have been deeply occupied with MT8196 Aluminium pKVM SMMU and SMI
> related tasks recently.
> 
> Regarding your question, my previous description in the patch was not
> accurate enough and may have caused some confusion. In fact, not
> all SMI commons have their backup/restore handled by the RTFF
> hardware. The SMI commons are distributed across various subsystems
> (e.g., mminfra, venc, display, cam, etc.). Currently, only the SMI
> common under the mminfra subsystem is backed up and restored by
> the RTFF hardware.
> 
> Therefore, I believe adding a specific 'skip_rpm' flag is more
> appropriate here. If we were to differentiate this based on a new
> MTK_SMI_GEN3 type, it would imply that all SMI common modules of
> that generation would skip the RPM operations, which is not the
> intended behavior.
> 
> To make this clearer, I plan to update the commit message in the
> next version as follows:
> 
> Subject: memory: mtk-smi: Add skip_rpm flag for certain MT8196 SMI
> commons

memory: mtk-smi: Allow no clocks for RTFF managed SMI commons

> 
> Body:
> On MT8196, certain SMI commons are backed up and restored by the RTFF
> hardware rather than by software.
> 
> For these specific SMI commons, software-controlled register backup
> and restore in the runtime callback is no longer necessary. Therefore,
> introduce a 'skip_rpm' flag to bypass these redundant RPMoperations
> for these SMI commons.
> 
> What do you think about this approach?
> 

That would be kind-of ok, but keep in mind: pm_runtime doesn't only manage clocks.

I think that the best option here would be to allow having no clocks instead,
and to still call pm_runtime_{en,dis}able() - as that would get a bit more
future-proof, should any other (newer, older, etc) SoC need to declare any power
domain but still no clocks.

So at this point, I think that just doing something like:

	if (common->plat->has_gals) {
		if (common->plat->rtff_managed) <--- not "skip_rpm"
			clk_required = 0;
		else if (common->plat->type == MTK_SMI_GEN2)
			clk_required = MTK_SMI_COM_GALS_REQ_CLK_NR;
		else if (common->plat->type == MTK_SMI_GEN2_SUB_COMM)
			clk_required = MTK_SMI_SUB_COM_GALS_REQ_CLK_NR;
	}

should be sufficient (and/or check zero required clocks in smi_dts_clk_init).

Cheers,
Angelo

> Thanks,
> Xueqi
> 
> On Thu, 2025-03-20 at 13:11 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 20/03/25 08:36, Xueqi Zhang ha scritto:
>>> MT8196 SMI commons is backed up/restored by RTFF HW.
>>> It doesn't need SW control the register backup/store
>>> in the runtime callback.Therefore, add a flag skip_rpm
>>> to help skip RPM operations for SMI commons.
>>>
>>> Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
>>
>> So the MT8196 SMI common doesn't require any clocks?
>>
>> That's fine for me, but this looks bloody similar to MT6989's SMI
>> common, which
>> is SMI GEN3 and not GEN2....
>>
>> ....so, are you sure that you need a `skip_rpm` flag and not new
>> MTK_SMI_GEN3 and
>> MTK_SMI_GEN3_SUB_COMM types? :-)
>>
>> Regards,
>> Angelo
>>
>>> ---
>>>    drivers/memory/mtk-smi.c | 11 ++++++++---
>>>    1 file changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
>>> index a8f5467d6b31..b9affa3c3185 100644
>>> --- a/drivers/memory/mtk-smi.c
>>> +++ b/drivers/memory/mtk-smi.c
>>> @@ -123,6 +123,7 @@ static const char * const mtk_smi_common_clks[]
>>> = {"apb", "smi", "gals0", "gals1
>>>    struct mtk_smi_common_plat {
>>>        enum mtk_smi_type       type;
>>>        bool                    has_gals;
>>> +     bool                    skip_rpm;
>>>        u32                     bus_sel; /* Balance some larbs to
>>> enter mmu0 or mmu1 */
>>>
>>>        const struct mtk_smi_reg_pair   *init;
>>> @@ -547,6 +548,9 @@ static int mtk_smi_dts_clk_init(struct device
>>> *dev, struct mtk_smi *smi,
>>>    {
>>>        int i, ret;
>>>
>>> +     if (smi->plat->skip_rpm)
>>> +             return 0;
>>> +
>>>        for (i = 0; i < clk_nr_required; i++)
>>>                smi->clks[i].id = clks[i];
>>>        ret = devm_clk_bulk_get(dev, clk_nr_required, smi->clks);
>>> @@ -783,7 +787,7 @@ static int mtk_smi_common_probe(struct
>>> platform_device *pdev)
>>>        common->dev = dev;
>>>        common->plat = of_device_get_match_data(dev);
>>>
>>> -     if (common->plat->has_gals) {
>>> +     if (!common->plat->skip_rpm && common->plat->has_gals) {
>>>                if (common->plat->type == MTK_SMI_GEN2)
>>>                        clk_required = MTK_SMI_COM_GALS_REQ_CLK_NR;
>>>                else if (common->plat->type == MTK_SMI_GEN2_SUB_COMM)
>>> @@ -814,13 +818,14 @@ static int mtk_smi_common_probe(struct
>>> platform_device *pdev)
>>>        }
>>>
>>>        /* link its smi-common if this is smi-sub-common */
>>> -     if (common->plat->type == MTK_SMI_GEN2_SUB_COMM) {
>>> +     if (common->plat->type == MTK_SMI_GEN2_SUB_COMM && !common-
>>>> plat->skip_rpm) {
>>>                ret = mtk_smi_device_link_common(dev, &common-
>>>> smi_common_dev);
>>>                if (ret < 0)
>>>                        return ret;
>>>        }
>>>
>>> -     pm_runtime_enable(dev);
>>> +     if (!common->plat->skip_rpm)
>>> +             pm_runtime_enable(dev);
>>>        platform_set_drvdata(pdev, common);
>>>        return 0;
>>>    }
>>
>>


