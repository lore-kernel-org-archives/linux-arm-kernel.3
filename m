Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6BED609B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 08:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FE/xYpEtLPBBApyve4RoEr1JW6NeDAa603isZjdpPQ=; b=Kq7gx1gurxmsny3D12Eg5DLqIM
	NtfMcBpSzfjxXOV0YhWNCHf0YxsdWa3u5jeF/QwzozKxiZqeKxheojIGU0VGmzW45Lvdm114THmaU
	ntL64IfrT/qnTm5cEPp3zeTD0yOOUxOeQYn8QwjYt6dvB6TGQOFJM5qTGhwF6Clhgaju7hQ8sP/Hw
	O94VraZ64ZywlAmFqcTTQ2IMN5qZRlFwLEvC7sz9+uXMtW76o6Qm5TV8UEEJDx199tAgLgtF3rAmh
	EfvLE8cTchpC9haVceK92CVE8L9Du5RL40FC4IvI4XzQG7qyXPZVzvjsVh+LtsmemwutRCBanbIhB
	MUSEKTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDeB-0000000CbgH-3CQ1;
	Wed, 27 Nov 2024 08:43:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDct-0000000CbNS-11Zf;
	Wed, 27 Nov 2024 08:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732696941;
	bh=1SruQ6equFJEJ3DDQvtA5uhMPF4SVyogTYV0u07VntU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XerAHcE/bSIaVT+gDx5+/EXDHU4d77hSNKsYcHdGjAyUawEmdllA2suX/9cM4ePtZ
	 +cMuz99nwjOx2nUQl5hhrazHxLAPvVZZ0yhfYtDxWLe4RVqVglSgh2DyWYp2d5D71i
	 NNhbWNfuUWtOz+xhx2B5W+zwblnPOee4AdFrzTTwZ75SAb3e2jKuCMn0I+YGOra6vm
	 O11LKMWWkJ/6qMAo3cgUTP64fUemDdu/UGxStaO+Jgc/ZYZ4mkG8sr2Udll4NZqQ3e
	 vOoSXnkwUPO51ZeUCkC9/B+PttGmc9e0tv2hkM7uBhrZb1v85/U/7gNyKvYmIMp4Ma
	 0g9Gn6jLlVYeQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08DD017E1330;
	Wed, 27 Nov 2024 09:42:21 +0100 (CET)
Message-ID: <8fec2c21-9d72-4a6b-9f00-01f2e6375831@collabora.com>
Date: Wed, 27 Nov 2024 09:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
 <133167aa2a3fab40547f5dc6602adf2c3d9e01e5.camel@mediatek.com>
 <4143b793-c5b1-4b6d-8547-26a9dc526957@collabora.com>
 <0711c097f724409941239696f5ab790b302d194a.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <0711c097f724409941239696f5ab790b302d194a.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_004223_425584_74F1D52A 
X-CRM114-Status: GOOD (  16.54  )
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

Il 27/11/24 04:08, CK Hu (胡俊光) ha scritto:
> On Tue, 2024-11-26 at 09:57 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Il 26/11/24 08:42, CK Hu (胡俊光) ha scritto:
>>> Hi, Angelo:
>>>
>>> On Wed, 2024-11-20 at 13:45 +0100, AngeloGioacchino Del Regno wrote:
>>>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>>>
>>>>
>>>> Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
>>>> found in MediaTek's MT8195, MT8188 SoC and their variants, and
>>>> including support for display modes up to 4k60 and for HDMI
>>>> Audio, as per the HDMI 2.0 spec.
>>>>
>>>> HDCP and CEC functionalities are also supported by this hardware,
>>>> but are not included in this commit.
>>>
>>> Both MT8173 HDMI and MT8173 CEC has hot plug detection interrupt.
>>> I don't know why but MT8173 choose CEC to detect hot plug.
>>>
>>> Does MT8195 CEC has hot plug detection interrupt?
>>> If it has, may we align the hot plug detection flow with MT8173?
>>>
>>
>> The CEC on MT8195 does have an hotplug detection interrupt, but that *must* be
>> used exclusively for CEC for one important reason.
>>
>> While on MT8188 we only have the HDMI (TX) Encoder, MT8195 features both HDMI TX
>> and HDMI RX and in the specific case of this SoCs, the CEC block is shared between
>> the two controllers.
>>
>> If we use the CEC hotplug detection for HDMI-TX, we wouldn't be able to share the
>> block with the HDMI-RX without hacks.
>>
>> This is why we need to use the HTPLG/PORD provided by the HDMI-TX block instead of
>> the CEC one.
> 
> OK, please add this information to commit message so that we know why not use CEC to detect hot plug.
> 

Sure, I'll do that for v2.

Cheers,
Angelo

> Regards,
> CK
> 
>>
>>> This is not a strong suggestion because I don't know why MT8173 choose CEC to detect.
>>> I just want more function to be common.
>>
>> Yeah, I got the point and I would've asked the same question, but for the reasons
>> that I explained, that's unfortunately not possible :-)
>>
>> Cheers,
>> Angelo
>>
>>>
>>> Regards,
>>> CK
>>>
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>
>>
>>
>>



