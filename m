Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD30CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 06:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcRU7Z/PkU7Ppn7Ao+1BSxCwQMj8o7al8ldpZz63HXk=; b=Fxj35jqUywNsrtahdUy+ijw6bS
	cZJihZO+3TojMiM7aXODBv/uDMiM7tNsczohXYU36cxbvszjJH/QmhjIDwQbXWqclYcK/GBnVRxFm
	VN3iJBOK87uGsB7CQvOnyVCiWgBxH15LAoeoD4vQ33CNxcw7LSi4H3nHvJ3agnIK2ejMMaKt8nDfx
	S0bXcwF/AqQXk9hs4X85FX/T8anVqd5O5fH5e8SsDhnNDFR5XDPzHtEDGDQXTSL9ou0YVIkjDxV4q
	iIdDnMlfDBlOTvOabKqzJ6GVewwVIA1XANeH+pMjYlaBHHd7QFF6cwD8Hz2pgAHT1mDJHLJSHXa4A
	wQWFZwZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4NZ-00000005mTr-2fdo;
	Sun, 24 Aug 2025 06:39:01 +0000
Received: from mail-m1973176.qiye.163.com ([220.197.31.76])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4Kv-00000005mG6-0JL4;
	Sun, 24 Aug 2025 06:36:19 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2063387f6;
	Sun, 24 Aug 2025 14:36:09 +0800 (GMT+08:00)
Message-ID: <8513b4b6-0b59-4b42-864b-0fe0423cd7fd@rock-chips.com>
Date: Sun, 24 Aug 2025 14:36:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/rockchip: analogix_dp: Apply
 devm_clk_get_optional() for &rockchip_dp_device.grfclk
To: Heiko Stuebner <heiko@sntech.de>, andy.yan@rock-chips.com,
 hjc@rock-chips.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250824031932.3204920-1-damon.ding@rock-chips.com>
 <7656195.LvFx2qVVIh@phil>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <7656195.LvFx2qVVIh@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98dacaa0e303a3kunmefff2f7629c876
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkoZQlYYTk5LS01CQkpMQk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bxUMKVL+NrOoJGo0j4JgfMVjfGeoJtah3thFVVG8wSzKTDStABIUg7WbZ9XvtcP47w1h8dvuRThD6xthQB6L53UVa3N1PaIfZmKod8eCZd4iuBDTPsGmWtFHEFkK6EmcaYr6PGmOunhPJgBRb+vaFxz5D6HPK53Opjr1JHcx5ws=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=XcRU7Z/PkU7Ppn7Ao+1BSxCwQMj8o7al8ldpZz63HXk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_233617_760590_C20BF88D 
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

Hi Heiko,

On 8/24/2025 2:08 PM, Heiko Stuebner wrote:
> Hi Damon,
> 
> Am Sonntag, 24. August 2025, 05:19:32 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> The "grf" clock is optional for Rockchip eDP controller(RK3399 needs
>> while RK3288 and RK3588 do not).
>>
>> It can make the code more consice to use devm_clk_get_optional()
>> instead of devm_clk_get() with extra checks.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> index d30f0983a53a..d0f78ab9faa6 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -335,12 +335,8 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
>>   		return PTR_ERR(dp->grf);
>>   	}
>>   
>> -	dp->grfclk = devm_clk_get(dev, "grf");
>> -	if (PTR_ERR(dp->grfclk) == -ENOENT) {
>> -		dp->grfclk = NULL;
>> -	} else if (PTR_ERR(dp->grfclk) == -EPROBE_DEFER) {
>> -		return -EPROBE_DEFER;
>> -	} else if (IS_ERR(dp->grfclk)) {
>> +	dp->grfclk = devm_clk_get_optional(dev, "grf");
>> +	if (IS_ERR(dp->grfclk)) {
>>   		DRM_DEV_ERROR(dev, "failed to get grf clock\n");
>>   		return PTR_ERR(dp->grfclk);
> 
> generall I definitly I agree, but you're loosing the
> "don't print anything for EPROBE_DEFER" handling.
> 
> Additionally DRM_DEV_ERROR says in the code
> "this is deprecated in favor of drm_err() or dev_err()." .
> 
> Also this in the probe-path, so to catch both issues, I'd sugest
> using dev_err_probe() for the message, which handles EPROBE_DEFER
> automatically.
> 

Yeah, I will use dev_err_probe() instead in the next version.

In addition, it should be nice to modify the other similar codes in 
rockchip_dp_of_probe(). I will add another commit to do it.

Best regards,
Damon


