Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6681AC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 15:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+/OyG161XLiJCGU/kD1VVaHgi3XUfffUqBX65XuhLY=; b=ewJUjjcUMNAubyPY9moKUmfupT
	HeFuDks5gXxrrEVsvSHRMPMO9qjBtsPZ0HMGrPwDvrjFJUTIVC5u1yCZnrxXPbyw/YZYIKvJvzRKY
	ZLK/QhgBf0obQmZkV3GkB4DG+9pGnW0rQB2rRlGIIm2VeHH9dYf8uqa/cT+D4cuSzwDzkDlNbsKxr
	ZcYLcz0ax1Zct6ZiItUHD61CsptNRVzU6/xB4VInHC9wSahOj+3/o9h94/vxFYjlMDKo52gp7UVJL
	z3lYKR/QAn3o9AFM3TFusE2dBbEmNE391HDyNzeAZPGXWsboxI6iXiHlIxkebuKiOAjNPULkQBuS6
	r0+SPqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xk8-00000007mlZ-2dPq;
	Wed, 09 Apr 2025 15:53:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xha-00000007mHQ-3sSx;
	Wed, 09 Apr 2025 15:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744213856;
	bh=bvozvL+Ka3UE57hADrHygiEEqNN6MU5nlJ3B+28IPjg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d/QSwyj6A/GsoV1lb0JMMaH1EXGZRVDAAH/pa/Fy+Vzkgi5vrgyalGshHWTccvu2T
	 eH7NBGQrxOZhgkW2FTWZ1fmBoPA/hG8GdyAGGg7ePKqln76v5bafr9JTsQRd5OnQJr
	 BpFdUtAlooojoZJ97HPjV5MN9Tcr3v0fKsYV7JfOz/qb6UXYoOKiVEgPvZep4kAM59
	 B0j9BiMIdGbzUl2HoROUyJijk+zTKxegWlSan6vy74mKleqdX0Fq2XLmOz1FDbW+YT
	 zVaK+shJ3ZNBWq8JkyAkoX14HLQQODhOwBJDcQjOTTTY3AGhXEMuOMLukiPFy2TDkC
	 ID2JcQzQ31ceA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F07EC17E0657;
	Wed,  9 Apr 2025 17:50:55 +0200 (CEST)
Message-ID: <399f89fb-092e-4fb3-8a0b-987dea129554@collabora.com>
Date: Wed, 9 Apr 2025 17:50:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] memory: mtk-smi: mt8188: Use
 devm_pm_runtime_enable
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Friday Yang <friday.yang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250408033206.12176-1-friday.yang@mediatek.com>
 <20250408033206.12176-4-friday.yang@mediatek.com>
 <20250408-woodoo-quick-worm-bf82b4@shite>
 <e777f95c-c21f-4a91-b044-5fc19eb22c3d@collabora.com>
 <258c8fda-70cc-4624-aef6-7cbef3cdbde6@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <258c8fda-70cc-4624-aef6-7cbef3cdbde6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_085059_116457_5D5CBDF7 
X-CRM114-Status: GOOD (  15.39  )
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

Il 09/04/25 11:56, Krzysztof Kozlowski ha scritto:
> On 09/04/2025 10:26, AngeloGioacchino Del Regno wrote:
>> Il 08/04/25 08:29, Krzysztof Kozlowski ha scritto:
>>> On Tue, Apr 08, 2025 at 11:31:56AM GMT, Friday Yang wrote:
>>>> Replace pm_runtime_enable with the devres-enabled version which
>>>> can trigger pm_runtime_disable.
>>>>
>>>> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
>>>> ---
>>>>    drivers/memory/mtk-smi.c | 16 +++++++++-------
>>>>    1 file changed, 9 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
>>>> index f25d46d2ef33..daef6d350419 100644
>>>> --- a/drivers/memory/mtk-smi.c
>>>> +++ b/drivers/memory/mtk-smi.c
>>>> @@ -713,16 +713,17 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
>>>>    	if (ret)
>>>>    		goto err_link_remove;
>>>>
>>>> -	pm_runtime_enable(dev);
>>>> +	ret = devm_pm_runtime_enable(dev);
>>>> +	if (ret)
>>>> +		goto err_link_remove;
>>>> +
>>>>    	platform_set_drvdata(pdev, larb);
>>>>    	ret = component_add(dev, &mtk_smi_larb_component_ops);
>>>>    	if (ret)
>>>> -		goto err_pm_disable;
>>>> +		goto err_link_remove;
>>>>
>>>>    	return 0;
>>>>
>>>> -err_pm_disable:
>>>> -	pm_runtime_disable(dev);
>>>
>>> You now broke/changed the order of cleanup without any explanation.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> I agree some comment in the commit description saying that the cleanup reordering
>> doesn't matter in this specific case would've been nice to have, but anyway IMO
>> it's not a big deal - he didn't break anything, anyway :-)
> 
> Cleanup orderings are tricky, so are you sure nothing got here called in
> incorrect moment?

Yes.

 >> I see that runtime PM will be disabled much later and
> what certainty you have that device won't get resumed that time?
> 
How can a device that failed to probe be resumed?! Who's going to resume it?! :-)

Also, in the remove phase, all users get removed first, there's no ISR (implies
that there's no isr that will resume this device inadvertently, and other than
no isr - there's no kthread/queue/this/that that could do this), and no nothing.

Moreover, SMI-LARB cannot be removed unless all of the components are unbound;
SMI-Common (be it a common or a sub-common) cannot be removed if SMI-LARB is still
using it.

No I don't see anything that can resume it before devm does its job.

If you do see something though, I'm curious to understand what I'm missing here :-)

Cheers!
Angelo

