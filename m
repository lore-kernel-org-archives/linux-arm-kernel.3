Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C023C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BypE/vyVxUuJITnV/wf5vbKYIrm9rN2H5s8yZM+WULk=; b=k24COuKtibAaV/ZCmpZwehwmV8
	qgciAWvWmSLxsXDmsrEFFJVIj8GOTGlSx5p7cHo1+LnzW9xdyUcQO0xOxUIWX/37zIvDInKmPFt9m
	jWFkclvrok48ohu9NsZ18NOGutgJ4O4sEj9krDhgS17JsdDo/rlKXpKQK8vZkcYy2Uxl/ig1f01pc
	6m5f9XeeiCdLRgbsv1o1emOb2GlyNnMNQCchvsfBNa2woyiMnsF9IFfAcNNuMlLFyL/+y/tTrvic4
	6a5oY6wnAyXa6DW8V4WdGjCEDVGKpZUrvFuMqpc2xk0MEvo7Eh1UJ0PRWVrPHgmSJIZAneJ8JMbMs
	CwHMtKrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aj3-0000000DpHT-0Xq7;
	Thu, 10 Sep 2026 09:05:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aj1-0000000DpGt-1ESC;
	Thu, 10 Sep 2026 09:05:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789031140;
	bh=ENZtiC11cN8l9AXK3zwCWvbeBdYrcIe4dNlUeqoNVa4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hpwx1d6KkcuuuuFphNt/pZ/VR8BjoOH5fv8MXS0R+5rm9HjX1Cd2liAZ6onBYK+la
	 UCLg7HGxELLEciRfhop14a1zKwPvk4B1xFRtWouRB3QLlfH2jhCvXyDVRwRHOiQLvh
	 uwUxJuCEdaRV/rfQnFmoZtEbxu3712xOozfhdI5whCMvB+k1i0Uzoe9LYbsdP9jq4o
	 e70XRYF4vOLRWRqNCenNscEKPoAXHCqW5DN8G8npBiSAmWZr0RXmhT30HttnlubQwn
	 aT0JDEf88wFwKzfSR1HiWUZlDIGJ0hdVnAA6cREzbbhtn1EpOwH3f4ra3pYe2PwY/l
	 kgC7V9GLK8t0g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C301817E05D3;
	Thu, 10 Sep 2026 11:05:39 +0200 (CEST)
Message-ID: <4e658914-7a17-444b-b20b-8d8b647238b5@collabora.com>
Date: Thu, 10 Sep 2026 11:05:39 +0200
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cydeh263kd5o2un27oeplqx2phe7vzhxvk53kr7dbvtplazafv@rs37qtkhguhj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_020543_505510_3E022304 
X-CRM114-Status: GOOD (  14.21  )
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

On 9/9/26 19:25, Manivannan Sadhasivam wrote:
> On Tue, Jul 07, 2026 at 05:42:44PM +0200, AngeloGioacchino Del Regno wrote:
>> In preparation for adding support for the eDP PHY found in newer
>> SoCs, transfer the register mask for PHYD_TX_LN_EN to SoC specific
>> data.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/phy/mediatek/phy-mtk-dp.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
>> index 4603f28d1466..f5aadc5fdc42 100644
>> --- a/drivers/phy/mediatek/phy-mtk-dp.c
>> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
>> @@ -220,6 +220,7 @@ struct mtk_dp_phya_imp_sel {
>>    * @regs_ana_lane:  Register (layout) offsets for ana_lan
>>    * @regs_dig_glb:   Register (layout) offsets for dig_glb
>>    * @regs_dig_lane:  Register (layout) offsets for dig_lan
>> + * @mask_dig_tx_ln: Register mask for PHYD_TX_LN_EN field
>>    * @val_dig_bitrate:IP Version specific register values for Bit Rate setting
>>    * @ana_bias_r:     Internal resistance "R" Selection Settings (global)
>>    * @ana_cktx_imp:   TX Clock Impedance Selection Settings (global)
>> @@ -239,6 +240,9 @@ struct mtk_dp_phy_pdata {
>>   	const u8 *regs_dig_glb;
>>   	const u8 *regs_dig_lane;
>>   
>> +	/* Register masks */
> 
> Duplicate comment. With this removed,
> 

Sorry but I think you didn't understand what the comments are there: the kerneldoc
is used to describe the structure, of course, but the comments in between are used
as a way to describe (and kind of enforce) the order of members.

/* Register offsets */
u16 member1;
u16 member2;
....

/* Register maps */
const u8 *regs1;
const u8 *regs2;
...

/* Register masks */
u32 mask1;
u32 mask2;
....

etc.

Does that make sense now? :-)

Cheers,
Angelo


> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> - Mani
> 

