Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738EFC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUoh5Mqm1EKJCihmab6x9riDOsj2E7Suqmt6ZBKHLcY=; b=fjdUU/9j1m/c87Jx/PTUsYEEvZ
	Sw0CQADuCKtJw0dJI7bBkGMSwdl9rf0XmrJcV/xOIiJV21oAhpXIHIVbxnRAaTy47xMtuU2OWKECN
	TkzoEsujl50HelhD+XyZ4PXIiz2gQkgYOI5CXhN90RAFoiclJXF7NyKRCgkijMAIZeHAZvqUg//Sj
	7emHs2wjY+JfTGufyO9bWHIP2oTKQnIQWHz5Sbl4srxTIwE5CBVVRBzipqs2f9s+oMUuG6AvZTziL
	XGcX2p9AAduqSaCxrc0evFm1netzONq/NZKg7SwW/bw5/179PWILyvqNdZi4a3o//Nb2J9Jwa5dIY
	omry24fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vzN-0000000G42p-14mx;
	Fri, 11 Sep 2026 07:48:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vzK-0000000G42L-1uE7;
	Fri, 11 Sep 2026 07:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789112876;
	bh=ruI4u/j0531/L6p3OmQduRDVD6eAPgK4O4B88AoufBA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fKTBOdIU38tZS6iAx4RsuMRR2ViORWzbPsH7zJy86cIpgB4cIE44WdjoNAB7ftLGg
	 yCzwD6mJnjfFT+WTcPyUvTIGEWFZdZ+nBiWg0gfNeCmmtCzqBgAfItQf/JjNXFJPJn
	 Fo8kOgX3+W3tkS4r6kahQdKQBnagoxFo1mrT2q6+0e0pSnPyn+eoIi4VZMDMXFZN2p
	 E1YNUMCmSiBe+xtyuSLIK2XTt/iI+1PhbvYwQnS0kdaSGR0oVsddaGabEvS/vkySdW
	 3MHOtl0slIOUkVT0VUw/HDSpvtlkc2tg6FilUKX+tAc3E08DZlcuIuXWqGwwy0J1bQ
	 YX5GHHosJw7xA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6886417E0CA6;
	Fri, 11 Sep 2026 09:47:55 +0200 (CEST)
Message-ID: <87408499-de7e-4359-a2ea-d997abd1d0c4@collabora.com>
Date: Fri, 11 Sep 2026 09:47:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] phy: phy-mtk-dp: Add PHYD Lane EN register mask
 to SoC data
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 justin.yeh@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-12-angelogioacchino.delregno@collabora.com>
 <cydeh263kd5o2un27oeplqx2phe7vzhxvk53kr7dbvtplazafv@rs37qtkhguhj>
 <4e658914-7a17-444b-b20b-8d8b647238b5@collabora.com>
 <m3fpa2igwmsnsxhhxtg5hubsmxbn2vmzcpo4hwacs66z52x5ll@xrl5kac2qmtk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <m3fpa2igwmsnsxhhxtg5hubsmxbn2vmzcpo4hwacs66z52x5ll@xrl5kac2qmtk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_004758_656214_376BE284 
X-CRM114-Status: GOOD (  15.73  )
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

On 9/11/26 07:15, Manivannan Sadhasivam wrote:
> On Thu, Sep 10, 2026 at 11:05:39AM +0200, AngeloGioacchino Del Regno wrote:
>> On 9/9/26 19:25, Manivannan Sadhasivam wrote:
>>> On Tue, Jul 07, 2026 at 05:42:44PM +0200, AngeloGioacchino Del Regno wrote:
>>>> In preparation for adding support for the eDP PHY found in newer
>>>> SoCs, transfer the register mask for PHYD_TX_LN_EN to SoC specific
>>>> data.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    drivers/phy/mediatek/phy-mtk-dp.c | 13 +++++++++----
>>>>    1 file changed, 9 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
>>>> index 4603f28d1466..f5aadc5fdc42 100644
>>>> --- a/drivers/phy/mediatek/phy-mtk-dp.c
>>>> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
>>>> @@ -220,6 +220,7 @@ struct mtk_dp_phya_imp_sel {
>>>>     * @regs_ana_lane:  Register (layout) offsets for ana_lan
>>>>     * @regs_dig_glb:   Register (layout) offsets for dig_glb
>>>>     * @regs_dig_lane:  Register (layout) offsets for dig_lan
>>>> + * @mask_dig_tx_ln: Register mask for PHYD_TX_LN_EN field
>>>>     * @val_dig_bitrate:IP Version specific register values for Bit Rate setting
>>>>     * @ana_bias_r:     Internal resistance "R" Selection Settings (global)
>>>>     * @ana_cktx_imp:   TX Clock Impedance Selection Settings (global)
>>>> @@ -239,6 +240,9 @@ struct mtk_dp_phy_pdata {
>>>>    	const u8 *regs_dig_glb;
>>>>    	const u8 *regs_dig_lane;
>>>> +	/* Register masks */
>>>
>>> Duplicate comment. With this removed,
>>>
>>
>> Sorry but I think you didn't understand what the comments are there: the kerneldoc
>> is used to describe the structure, of course, but the comments in between are used
>> as a way to describe (and kind of enforce) the order of members.
>>
>> /* Register offsets */
>> u16 member1;
>> u16 member2;
>> ....
>>
>> /* Register maps */
>> const u8 *regs1;
>> const u8 *regs2;
>> ...
>>
>> /* Register masks */
>> u32 mask1;
>> u32 mask2;
>> ....
>>
>> etc.
>>
>> Does that make sense now? :-)
>>
> 
> Yes it does. Sorry for the oversight
> 
> - Mani
> 

No worries, it just happens to everyone from time to time :-)

Cheers,
Angelo

