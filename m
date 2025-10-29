Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766C0CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIdKn81zlWfA1LXvqyEi8MTV3mMbEs/lsyZYJVoVjZ0=; b=IgGkEx41MjbYrvwy+1AX5Obl8K
	p0RoFJjMHXm0EPcVFHJ5fXz3/O1ndiQxvJz2BppyKYSsTK43Zh+ywV9Kqgbukz2ZGLQVh+liS28Bz
	w79PXD7ixdWltBXNxs+67ovPTSZpFQ6FaX8CmjDkmphLrb/fL9X0KV3chy5y5pZWO2sV61avuP2J0
	xiuoCb2Rua1crdrLewSsCdkLMOmp2b6bgfqThkdXd6aGqQt5pbDJVUWW8H0rg7mVkI9wyNHbxMmKq
	c2dbrJB3GK381mvKl9BiN8bBn0a0c486fa6glkh8lZgPjT2BHKccOPD9d8Mu7nwpxbeLV7eUccOjM
	JHvE/eQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3qt-00000000rYp-17a8;
	Wed, 29 Oct 2025 10:56:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3qr-00000000rXd-09Yh;
	Wed, 29 Oct 2025 10:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761735382;
	bh=OTOHySwJe6r6YYDtowd4j3NiPv+2ssam78yCEgppdVo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RwnSt7HVUCjaxf67VSYhbu/C1B86w2NwjHjei7n435b5I6NWt4mRo+aa7JhaDuXH9
	 SyUVbxl9VqICpOUIgSwLFOhcZXdodbYJsKcpWXa4s7Ki1ukAen2Xf4cZypNXdh3C3X
	 ixhlLCvJz53QxZELnn0343aY5Jlf1siKYnc1CMut6/dMwCSgUJkc1ONbjAGveIz57A
	 9Yq34SBcpQmm0N3BZaA05vPcDCkTC4ReHrq9bgcqByUCTyImeQ4gqNVK2VPn1Nrp8V
	 zF2aqn0N/sgxCrdz+6Sc4xZBsQGwxuj06BJfxcWUCW9i9SAvZbj+pR4yQfLZxcSSI2
	 JfrjGolwiS6JA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3879D17E0FC7;
	Wed, 29 Oct 2025 11:56:21 +0100 (CET)
Message-ID: <21f51f37-787b-48a5-a871-d61810adff42@collabora.com>
Date: Wed, 29 Oct 2025 11:56:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] pmdomain: mediatek: Refactor bus protection
 regmaps retrieval
To: =?UTF-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Sjoerd Simons <sjoerd@collabora.com>
Cc: =?UTF-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
 "lihongbo22@huawei.com" <lihongbo22@huawei.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
 "mbrugger@suse.com" <mbrugger@suse.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 Nicolas Prado <nfraprado@collabora.com>,
 "macpaul@gmail.com" <macpaul@gmail.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "y.oudjana@protonmail.com" <y.oudjana@protonmail.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?TWFuZHlKSCBMaXUgKOWKieS6uuWDlik=?= <MandyJH.Liu@mediatek.com>
References: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
 <20250805074746.29457-5-angelogioacchino.delregno@collabora.com>
 <a2eae87efe46ebf397bcec3580eb9bc152b80846.camel@collabora.com>
 <be3a2d50-044b-429a-820c-5260c6ce730c@collabora.com>
 <0d8da30aaec2a5dc4bda6d67b640081dcc320f37.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <0d8da30aaec2a5dc4bda6d67b640081dcc320f37.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_035625_258095_5C074FFC 
X-CRM114-Status: GOOD (  29.44  )
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

Il 29/10/25 05:11, Macpaul Lin (林智斌) ha scritto:
> On Tue, 2025-10-14 at 11:59 +0200, AngeloGioacchino Del Regno wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 13/10/25 15:41, Sjoerd Simons ha scritto:
>>> Hey,
>>>
>>> On Tue, 2025-08-05 at 09:47 +0200, AngeloGioacchino Del Regno
>>> wrote:
>>>> In preparation to add support for new generation SoCs like
>>>> MT8196,
>>>> MT6991 and other variants, which require to set bus protection on
>>>> different busses than the ones found on legacy chips, and to also
>>>> simplify and reduce memory footprint of this driver, refactor the
>>>> mechanism to retrieve and use the bus protection regmaps.
>>>>
>>>> This is done by removing the three pointers to struct regmap from
>>>> struct scpsys_domain (allocated for each power domain) and moving
>>>> them to the main struct scpsys (allocated per driver instance) as
>>>> an array of pointers to regmap named **bus_prot.
>>>
>>> Trying to boot v6.18.0-rc1 on a Genio 700 EVK using the arm64
>>> defconfig,
>>> ends up hanging at boot (seemingly when probing MTU3 and/or mmc,
>>> but that
>>> might be a red herring).
>>>
>>> Either reverting this patch *or* having CONFIG_MTK_MMSYS builtin
>>> rather
>>> then a module seems to solve that.
>>>
>>
>> Thanks for the report.
>>
>> This is not a problem with this patch specifically, but surely some
>> race condition
>> that was already present before and that does get uncovered with this
>> one in some
>> conditions.
>>
>> Without the devicetree updates (which are not upstream yet) this
>> patch is
>> fully retaining the legacy functionality 1-to-1.
>>
>> I'll check what's going on ASAP.
>>
>> Cheers,
>> Angelo
>>
> 

Hello Macpaul,

> I did a git bisect on linux-next master branch and
> the result shows c29345fa5f66bea0790cf2219f57b974d4fc177b is the first
> bad commit. This change also affect MT8195.
> 
> This patch couldn't be simply reverted because there are some dependent
> commits follows this change.
> I'm not sure it this refactor causes API or flag not synced with the
> SCP firmware.

There's no interaction with the SCP on this patch.

> Just a remind that it is hard for MediaTek to update scp firmware for
> an already in mass production state chip.
> Each scp firmware and the pm-domain interface are designed specifically
> for 'that' chip only. So it is difficult to adopt pm-domain refactor
> by only reviewing the patch.

There's no need to update the SCP firmware at all - the pmdomain driver
does not communicate with that - infact, you can keep using all of the
pmdomains without ever loading any SCP firmware from the kernel.

> 
> Here are the error logs with latest linux-next master on mt8395-genio-
> 1200-evk. Hope this could help on futher debugging.
> 

Thanks for the logs! Getting issues on MSDC is really odd because the MSDC
controller does *not* use nor have any power domain...

I'll take a look at this as soon as I can, anyway.

Thanks again,
Angelo

> [    1.291055] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=8
> arg=000001AA; host->error=0x00000002
> [    1.292775] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=55
> arg=00000000; host->error=0x00000002
> [    1.294539] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=55
> arg=00000000; host->error=0x00000002
> [    1.296293] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=55
> arg=00000000; host->error=0x00000002
> ...
> [    1.430408] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=55
> arg=00000000; host->error=0x00000002
> [    1.433766] mmc0: Failed to initialize a non-removable card
> [   22.297240] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> [   22.298723] rcu:     6-...0: (2 ticks this GP)
> idle=104c/1/0x4000000000000000 softirq=45/45 fqs=37
> [   22.299827] rcu:     (detected by 2, t=5256 jiffies, g=-1051, q=200
> ncpus=8)
> [   22.300689] Sending NMI from CPU 2 to CPUs 6:
> 
> Best regards,
> Macpaul Lin



