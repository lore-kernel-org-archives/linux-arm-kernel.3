Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89C7FC5926
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuf9p+K+CpXtf4kZkaIKXjdKIsukISTMXyjOai+xhDs=; b=EbejWORy2GmTgeTLihnXNJIUHu
	SRw+863tx3IYsI7NmgVZ/46k+iIwr3kU9aYFlh6hdWh7g0S2uT/b8kITKi/O3BOUOarUv13iOupQb
	AcRzukv2BST7Eor6xP5apvnCwZsbY3xGb9/yQrr7m2erOZnSxF6EBWaoafx2fVrJ9KJ+Sf3QtxVeT
	I/Oke2KIUzK6W+lm54n9ZWfG3FbIhGbhLdK3C7hMmzjMHNruY3Yj6s2+ExZmKtAh2L8gIEgo8IHRo
	d9el4wXq4cwRAPoo9oEUjDiVZuDZ7y+NaN2JC3MzzU+iqxRiWLIYP2zLq3S9KcLKKvAFc4OJHHe5f
	ckcy2Kbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYyD-00000005xqa-1IE9;
	Thu, 26 Feb 2026 10:51:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYyB-00000005xq3-1jWx;
	Thu, 26 Feb 2026 10:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772103104;
	bh=IkJdKD7faa2UuFj9IHFkVko8rvI1zt0tw5f/fUIjArE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=YGmER0kqMduk83TZ1QAJY/NXqU+hh+kbXJhqkRW/mnZQAmjrBJ04xrH+5wLktOZbt
	 eWm3qnQ5dmtSOdUwgdfefUxO4RmYV9TX21epX4xPPkdk2Lgr/P+p4kQa8zUgCsCgkn
	 gcnWJjcPor7ZwVQrW8hzhNsiAWHU393WOLc9khrZq8U23qDIy7xhVgDjxv818Lii3A
	 RMcoG2qoUYaaw2us5sXxd9HbLvBxqwbfMdVhpV49o3H8OqaEiyAmwn2c6a7VdT+TsX
	 Q8yDzOZu6Tatl/9AHh5YLDLEUCtFj9SG2tNFsMaxyORcgfvjCOW++RyaP64BMYQxmT
	 uR5EeNVeMuZSA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2276E17E03E5;
	Thu, 26 Feb 2026 11:51:44 +0100 (CET)
Message-ID: <67acc82d-e145-4f98-88b2-d30cc73f73a0@collabora.com>
Date: Thu, 26 Feb 2026 11:51:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Plane Color Pipeline support for MediaTek
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 Nicolas Prado <nfraprado@collabora.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>
Cc: "wiagn233@outlook.com" <wiagn233@outlook.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, Daniel Stone <daniels@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <TY4PR01MB144323B0DDC18B05EE1472B5298BFA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <TY4PR01MB14432E7601C0BE848D25E80C398BAA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <cdf6a704-88f8-414a-adf1-65ea7237337f@amd.com>
 <20260206110901.660cf712@eldfell>
 <5963bca37996fa054ad75d4e5017d9c7e5158e9f.camel@collabora.com>
 <3efaa7ec40c68f0d463da00c3a57474a40d4fdae.camel@mediatek.com>
 <2e241629-2526-41c5-92fd-a0a0ec3ffc4e@collabora.com>
Content-Language: en-US
In-Reply-To: <2e241629-2526-41c5-92fd-a0a0ec3ffc4e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_025147_598780_3AAFBCE2 
X-CRM114-Status: GOOD (  27.44  )
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

Il 26/02/26 11:26, AngeloGioacchino Del Regno ha scritto:
> Il 26/02/26 07:24, CK Hu (胡俊光) ha scritto:
>> On Fri, 2026-02-06 at 08:28 -0500, Nícolas F. R. A. Prado wrote:
>>> On Fri, 2026-02-06 at 11:09 +0200, Pekka Paalanen wrote:
>>>> On Fri, 2 Jan 2026 13:40:21 -0500
>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>
>>>>> On 2026-01-01 07:37, Shengyu Qu wrote:
>>>>>>
>>>>>>
>>>>>> 在 2025/12/30 02:53, Shengyu Qu 写道:
>>>>>>>
>>>>>>>
>>>>>>> 在 2025/12/24 3:44, NÃ colas F. R. A. Prado 写道:
>>>>
>>>>>>>> Given the lack of support for writeback connectors on the
>>>>>>>> MediaTek KMS driver, combined with limited hardware
>>>>>>>> documentation, I haven't been able to verify the correctness
>>>>>>>> of
>>>>>>>> each curve, only that they were visually sane (gamma curves
>>>>>>>> made
>>>>>>>> the image on the display brighter, while inverse gamma made
>>>>>>>> it
>>>>>>>> darker).
>>>>>>>
>>>>>>> Hmmm I don't think this is acceptable. sRGB/scRGB has two
>>>>>>> transfer
>>>>>>> functions mentioned in original specification[1]. To keep color
>>>>>>> accuracy, we need someone from mediatek confirm whether this is
>>>>>>> piece- wise or pure power 2.2 transfer function, this is
>>>>>>> already
>>>>>>> done in original amdgpu color pipeline series, sRGB means
>>>>>>> piece-wise while also dedicated power 2.2 function exists.
>>>>>
>>>>> Not sure what you mean with this not being acceptable. This is
>>>>> about
>>>>> enabling HW support for this functionality. Not every HW has
>>>>> writeback for testing. At some point you'll have to trust the
>>>>> driver
>>>>> devs if you're going to use functionality of the driver. We're not
>>>>> always going to get everything perfect, but if that's really such a
>>>>> worry you can always use shaders to do precisely what you want.
>>>>>
>>>>
>>>> Hi Harry,
>>>>
>>>> yes, but I understood that in this case, the hardware documentation
>>>> available is so vague that it's impossible to say what it will
>>>> actually
>>>> do. There are no formulas given or referenced in the documentation,
>>>> are
>>>> there, Nícolas?
>>>
>>> No formulas at all, the only documentation I had available for the
>>> curves was the register definition, which simply lists the possible
>>> values: SCRGB, BT709, BT2020, HLG.
>>
>> Hi, Nicolas:
>>
>> In [1], it shows OVL could output data to WDMA which could write data into DRAM.
>> Its control is similar to RDMA. RDMA read data from DRAM and WDMA write data into 
>> DRAM.
>> Do you have interest to implement WDMA?
> 
> I wrote a WDMA driver a long ago, but I couldn't get it to work (though, I admit I
> didn't try hard to actually get it working).... if you want to take a look to check
> if anything obvious is missing, the driver is here:
> 
> https://gitlab.collabora.com/mediatek/aiot/linux/-/blob/mediatek-dev/drivers/gpu/ 
> drm/mediatek/mtk_disp_wdma.c?ref_type=heads
> 
> The driver I wrote was supposed to work on MT8781 Helio G99 (for a personal project

Eh, sorry for the double email, I was meaning MT6789 Helio G99 - just to be
extremely clear, though that wasn't much important (given that the WDMA IP is
anyway practically the same between the two..).

> as in upstreaming of the Xiaomi Poco M5 smartphone) and on MT8195 as a PoC.
> I did test both platforms and this driver didn't work on both... not sure if that
> was because I misconfigured the MMSYS routing (on both) or if there's any actual
> issue with the driver I wrote.
> 
> Again, didn't invest much time on this, anyway, so some obvious issue might be
> present.
> 
> Cheers,
> Angelo
> 
>> This is just a suggestion.
>> I could accept we believe what document say first and wait for someone to verify it.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ 
>> drivers/soc/mediatek/mt8195-mmsys.h?h=v7.0-rc1#n8
>>
>> Regards,
>> CK
>>
>>>
>>
> 
> 


