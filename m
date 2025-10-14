Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18A6CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zp3zFYP65rNUfjUBaEgVLi4YFY+m2MhquIYF5ckz4yc=; b=3LPG4qpoRgMLc4AEP0aeO1glW9
	Sc3S9GSr48HTAivB2IZV27K0+Dv1CU3hgsVkUuT4t91PrOGjfZtiIxE61Qp2DH+Yf4yXf7THDC5Ui
	fPh32e1WBXDXex4DxxqMzKjKYKPDlhGHzLH6RY7J303Calg+21409zg3NCkYAckkmTMMo4gvcQ3C2
	gKgW+KDhha1L7AP434UEK7hdwn7b3mLVIcxetUqrYhfmEAABZdWu1OA+0BKiQkkPLH0+c/2GNtBKZ
	YfAd5pUs13SBLmUw1CcsKJ0IAc7aeKz6z1Y76KiubI6dfeWCOHYq9zSjHwD6d1T6EBvdmG5zOjKJW
	msBDHLcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dGT-0000000G6fB-2RlZ;
	Tue, 14 Oct 2025 11:32:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dGR-0000000G6dL-3mgY;
	Tue, 14 Oct 2025 11:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760441541;
	bh=8juqZChkhVdJOJOqCmRgkPRBnkr1y8NTqdNQbKSKwVM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nnBFVhMUh/1GaQxtOa7WgGzBInvLUnfBP0ZJ5exU29pIvQPutfuF6d55LhieayC9S
	 l7wVqv9cR+57AUhZyHQUAGTmHtMQ422yyfQGUxKKhVWVAzrBb7j9RcuzO3IVE5PLWR
	 b1Jpg72ulzl2e4LCz6NHabdLV3QrZcRhBfLq437V5Ww5+Gx2kfh0y08rUNeNx2QEb3
	 Ng/U4TIXz7za7kOR9lnK/kRAtD6MBcMIMp83Q75easNYWXalVYVvWj8KSeABQ0uyIk
	 ezJ0BGUtTbRcp7i/KvzO8BXHOD+uBPk3Zryq9vVtNLnsREVPIjWlMbc6JeQIx0RyIa
	 oHXqlalgkD+ag==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 05DF517E1292;
	Tue, 14 Oct 2025 13:32:20 +0200 (CEST)
Message-ID: <87489f92-7bc0-4494-8532-f8f2d220bd27@collabora.com>
Date: Tue, 14 Oct 2025 13:32:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/20] soc: mediatek: mtk-cmdq: Add new APIs to replace
 cmdq_pkt_write() and cmdq_pkt_write_mask()
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, =?UTF-8?B?Q0sgSHUgKOiDoeS/ig==?=
 =?UTF-8?B?5YWJKQ==?= <ck.hu@mediatek.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 =?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-11-jason-jh.lin@mediatek.com>
 <b2335fd9296bc6f3511f8139870f0c34db1be62a.camel@mediatek.com>
 <fa46fec3f7ca25532c39e6e864ea692e19b7f5bb.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <fa46fec3f7ca25532c39e6e864ea692e19b7f5bb.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_043224_087100_12C35307 
X-CRM114-Status: GOOD (  12.65  )
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

Il 13/10/25 11:50, Jason-JH Lin (林睿祥) ha scritto:
> On Fri, 2025-09-05 at 09:41 +0000, CK Hu (胡俊光) wrote:
>> On Wed, 2025-08-27 at 19:37 +0800, Jason-JH Lin wrote:
>>> To support generating GCE write instructions using both pa_base and
>>> subsys, the original cmdq_pkt_write() and cmdq_pkt_write_mask()
>>> have
>>> been expanded into four new APIs:
>>> - Replaced cmdq_pkt_write() to cmdq_pkt_write_pa() and
>>>    cmdq_pkt_write_subsys().
>>> - Replaced cmdq_pkt_write_mask() to cmdq_pkt_write_mask_pa() and
>>>    cmdq_pkt_write_mask_subsys().
>>>
>>> The original cmdq_pkt_write() and cmdq_pkt_write_mask() will be
>>> removed
>>> after all CMDQ users have migrated to the new APIs.
>>>
>>> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>>> ---
>>>   drivers/soc/mediatek/mtk-cmdq-helper.c | 41 +++++++++++++
>>>   include/linux/soc/mediatek/mtk-cmdq.h  | 79
>>> ++++++++++++++++++++++++++
>>>   2 files changed, 120 insertions(+)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> b/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> index 41e1997cdd53..7e86299213d8 100644
>>> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> @@ -213,6 +213,26 @@ int cmdq_pkt_write(struct cmdq_pkt *pkt, u8
>>> subsys, u16 offset, u32 value)
>>>   }
>>>   EXPORT_SYMBOL(cmdq_pkt_write);
>>>   
>>> +int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
>>> u32 pa_base,
>>> +		      u16 offset, u32 value)
>>
>> subsys is useless. Drop it.
>>
>>> +{
>>> +	int err;
>>> +
>>> +	err = cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX0,
>>> CMDQ_ADDR_HIGH(pa_base));
>>> +	if (err < 0)
>>> +		return err;
>>> +
>>> +	return cmdq_pkt_write_s_value(pkt, CMDQ_THR_SPR_IDX0,
>>> CMDQ_ADDR_LOW(offset), value);
>>> +}
>>> +EXPORT_SYMBOL(cmdq_pkt_write_pa);
>>> +
>>> +int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys, u32
>>> pa_base /*unused*/,
>>> +			  u16 offset, u32 value)
>>
>> pa_base is useless. Drop it.
>>
>>> +{
>>> +	return cmdq_pkt_write(pkt, subsys, offset, value);
>>> +}
>>> +EXPORT_SYMBOL(cmdq_pkt_write_subsys);
>>> +
>>>   int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>>>   			u16 offset, u32 value, u32 mask)
>>>   {
>>> @@ -230,6 +250,27 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt,
>>> u8 subsys,
>>>   }
>>>   EXPORT_SYMBOL(cmdq_pkt_write_mask);
>>>   
>>> +int cmdq_pkt_write_mask_pa(struct cmdq_pkt *pkt, u8 subsys
>>> /*unused*/, u32 pa_base,
>>> +			   u16 offset, u32 value, u32 mask)
>>
>> subsys is useless. Drop it.
>>
>>> +{
>>> +	int err;
>>> +
>>> +	err = cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX0,
>>> CMDQ_ADDR_HIGH(pa_base));
>>> +	if (err < 0)
>>> +		return err;
>>> +
>>> +	return cmdq_pkt_write_s_mask_value(pkt, CMDQ_THR_SPR_IDX0,
>>> +					   CMDQ_ADDR_LOW(offset),
>>> value, mask);
>>> +}
>>> +EXPORT_SYMBOL(cmdq_pkt_write_mask_pa);
>>> +
>>> +int cmdq_pkt_write_mask_subsys(struct cmdq_pkt *pkt, u8 subsys,
>>> u32 pa_base /*unused*/,
>>> +			       u16 offset, u32 value, u32 mask)
>>
>> pa_base is useless. Drop it.
>>
>>> +{
>>> +	return cmdq_pkt_write_mask(pkt, subsys, offset, value,
>>> mask);
>>> +}
>>> +EXPORT_SYMBOL(cmdq_pkt_write_mask_subsys);
>>> +
> 
> Hi CK,
> 
> I'll drop the unused parameters.
> Thanks for the reviews.

It's unused, but if we want to use function pointers we do need those.

Unless you want to use one variable for both things, which then becomes
kind of janky and unreadable.

Cheers,
Angelo

> 
> Regards,
> Jason-JH Lin


