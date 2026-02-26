Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E19BFC5927
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACIzDCkhxtQJV5IF7s1iC699gkzxLNEonaEWItuvqUg=; b=gkZ1MWy4GPHWZPPPLTNADjHIaK
	ZhO1ESx6iL3wcGZUhxXGsVJBotZ5cH1xW3dAvCMyl8rrGjR8uN/TtOTQnDZr8/fJp7jK3t+sejcTM
	B+XnoGPYVKg+zwSf2ffFlHYTLEMsyP1UkbQAyqSGM9/DfllEDkNNqOH2YxeK9PcEL3zjDa2Hpm2jU
	5hrb0xrD4MAa6Zno+iFEIr7kz2WufQSiDxyabp1O934WEHd2FbI5upVe3/Q1JpTLxdxHJBVBRv2jv
	ZjKXwzxokIJ4uy0ij3lwL+2Z3Ktc25xniaCz6WY1iTPgIUWxSgko2A7t+iUh2nYO/qurObj9n/lzw
	cs6tr2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYjA-00000005wF4-0IO4;
	Thu, 26 Feb 2026 10:36:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYj6-00000005wE2-1pqP;
	Thu, 26 Feb 2026 10:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772102169;
	bh=W3qLjNuC+QLK2F8P217EOXE0d8RIhLDiKC2NEPOx7v8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G3B4blNbzGIfSFsN2Pq23YbXZim4VHupb3i2mKyKj4xFv4ddYl4Sus69IZSY4lw7t
	 6i3gpratx3W9zv3kXHtvbOfl9x7tdqVZqqI21laWGAoq/8yUCaCC9bd0OqJM3K8qaT
	 g/FFF2doYJdQTsguQe+VkqThZ94g1f5Rng8kQXTj93PmZ+7sM+oa4TswUvr1tDvYfa
	 oBWqzoOAdgoPg10cd8Vk1HprIvxxB0YEa3NsPoWq2O9uwpXi3Djqf0LodAgvm4nL3s
	 F923l+cXyGnxkL14T07f6d3l4PLUpzdDw/rJMFjqYdv2NDs/AmzXSYMLGfdBq34uWs
	 e1XlOztdw9ebw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 24C5817E03E5;
	Thu, 26 Feb 2026 11:36:08 +0100 (CET)
Message-ID: <48e8f40b-f5f3-42b5-a97b-7a25d1dc0fb8@collabora.com>
Date: Thu, 26 Feb 2026 11:36:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 20/23] scsi: ufs: mediatek: Back up idle timer in
 per-instance struct
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>
References: <20260216-mt8196-ufs-v7-0-b5f2907c6da7@collabora.com>
 <20260216-mt8196-ufs-v7-20-b5f2907c6da7@collabora.com>
 <5d9723fd6b4ff8430889efb33e0fc93a10c4a880.camel@mediatek.com>
 <cad2e275-8b5d-4023-b3da-a191bfd065c5@collabora.com>
 <6297edc9c2d6d1a323f188ef411205701a629d88.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6297edc9c2d6d1a323f188ef411205701a629d88.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_023613_007003_41A9D6AB 
X-CRM114-Status: GOOD (  13.64  )
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

Il 26/02/26 04:46, Peter Wang (王信友) ha scritto:
> On Wed, 2026-02-25 at 13:40 +0100, AngeloGioacchino Del Regno wrote:
>> In my opinion "ahit" is way less readable than
>> "hibernate_idle_timer".
>>
>> The hibernate_idle_timer member here stores the AUTO HIBERNATE IDLE
>> TIMER, and
>> there is no other possible hibernation state in this driver.
>>
>> Not sure why this could ever be confusing in terms of its intended
>> use: its
>> intended use is to store the (auto) hibern8 idle timer, and the
>> member is called
>> hibernate_idle_timer.
>>
>> In my eyes, that matches 1:1 with its usage. Loud and clear.
>>
>> Regards,
>> Angelo
>>
>>
> 
> Hi AngeloGioacchino,
> 
> If you want to refer to the AUTO HIBERNATE IDLE TIMER,
> then you cannot omit "auto" because the UFS driver also
> has a manual hibernate method.
> However, "AUTO HIBERNATE IDLE TIMER" is too long,
> and we often use "ahit" instead (which is also used in
> the UFSHCI spec). For example:
> https://elixir.bootlin.com/linux/v6.19.3/source/include/ufs/ufshcd.h#L978
> 
> So, if you want to distinguish it from hba->ahit, I suggest
> using backup_ahit or saved_ahit instead.
> 

Okay, does "saved_auto_hibern8_idle_tmr" sound good for you instead?

Regards,
Angelo

> Thanks
> Peter


