Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EDDC982FD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 03:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzcMe83hf5C3AZ1U0/2gbxcveYRvl8Cs0W878bkhmyk=; b=Qw3X0//HZDx963o+kDLfBdmJ8R
	8Xqm20VE2HC9NYH3v7vAkztmTFRu4W803e5+wu7NWAmaImbVwCQqegYzojgICKhB7XT/iCIub4SYZ
	Nj8WdI9MFtsWJ22VF4tbl59j+xpGum7wsUHRcpBFJl+f3IRez267lJSZGVLWZG8G+mzca2WgeFsH3
	NOs16bj3fFG6AhpLjd/KkTa5BGseEm9lz+RXYSnV8V7oUkPZcpfVDWgvX/USegdCbWc+Bt8Y8DL2d
	OcYe+lYzacX4PCzBUY1eMTJm+fvF5ry0orZgE8icfWEjEHBX8FEQ/Wp+cRP/CJncQwW03PORdxxNO
	VWQfOoCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aYc-00000009yeN-1SQ1;
	Thu, 24 Sep 2026 03:55:38 +0000
Received: from mail-m49201.qiye.163.com ([45.254.49.201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aYY-00000009ydk-3R3S;
	Thu, 24 Sep 2026 03:55:36 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ef67db11;
	Thu, 24 Sep 2026 11:40:27 +0800 (GMT+08:00)
Message-ID: <a0754d11-d88b-4dda-972f-7c696a037bc2@rock-chips.com>
Date: Thu, 24 Sep 2026 11:40:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RSEND] drm/bridge: analogix_dp: use
 devm_phy_optional_get() for the DP PHY
From: Damon Ding <damon.ding@rock-chips.com>
To: Jun Yan <jerrysteve1101@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20260924020417.868588-1-jerrysteve1101@gmail.com>
 <0ef54850-6919-4a29-a8df-586a3dc2de5f@rock-chips.com>
Content-Language: en-US
In-Reply-To: <0ef54850-6919-4a29-a8df-586a3dc2de5f@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0d180169903a8kunm9636794c1822a2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGUkZVkhPTBlCHRlMHRpMGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=R2qke+wv6KNzNLcVu0eEdHjxQszzsXDF9ACD9mTV4CxZ/ZXKWIwxNzTQqOiNNDQPFP0gCf6xZfuh0PqcHz/aMcGhDQV2s/5XbqC2H/LAfUL4btsNm1hSbcTqzUD7AsjLvtKdpEJoKLEjEHei693VjiYmqfUaLeEoYwqWUV1/7v4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=FzcMe83hf5C3AZ1U0/2gbxcveYRvl8Cs0W878bkhmyk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_205535_401850_12455C14 
X-CRM114-Status: GOOD (  21.04  )
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

On 9/24/2026 11:24 AM, Damon Ding wrote:
> Hi Jun,
> 
> On 9/24/2026 10:04 AM, Jun Yan wrote:
>> The DP PHY is optional: the Rockchip RK3399 eDP controller (used as the
>> internal eDP port) has no separate PHY device and relies on its built-in
>> PHY, which is programmed directly through the GRF registers, so its DT
>> node carries no "phys"/"phy-names" property.
>>
>> Requesting the PHY with devm_phy_get() therefore returns -ENODEV (or
>> -ENOSYS when CONFIG_GENERIC_PHY is disabled) and the driver logs a
>> misleading "no DP phy configured" error at probe time before falling back
>> to a NULL phy.
>>
>> Use devm_phy_optional_get() instead, which returns NULL when the PHY is
>> absent and otherwise behaves identically, and drop the manual -ENODEV/
>> -ENOSYS handling. This also removes the spurious error message.
>>
>> Assisted-by: Claude:deepseek-v4-flash
>> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
>> ---
>>   .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 +++---------------
>>   1 file changed, 3 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/ 
>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 18e76d1e78e1..28eb668d3e3f 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1427,21 +1427,9 @@ analogix_dp_probe(struct device *dev, struct 
>> analogix_dp_plat_data *plat_data)
>>       if (ret)
>>           return ERR_PTR(ret);
>> -    dp->phy = devm_phy_get(dp->dev, "dp");
>> -    if (IS_ERR(dp->phy)) {
>> -        dev_err(dp->dev, "no DP phy configured\n");
>> -        ret = PTR_ERR(dp->phy);
>> -        if (ret) {
>> -            /*
>> -             * phy itself is not enabled, so we can move forward
>> -             * assigning NULL to phy pointer.
>> -             */
>> -            if (ret == -ENOSYS || ret == -ENODEV)
>> -                dp->phy = NULL;
>> -            else
>> -                return ERR_PTR(ret);
>> -        }
>> -    }
> 
> It should be better to add some comments here:
> 
> /*
>   * Exynos5/RK3288/RK3399 use Analogix DP controller built-in PHY,
>   * no separate PHY configuration is needed.
>   */

Well, I think it should be fixed to:

/*
  * RK3288/RK3399 use Analogix DP controller built-in PHY,
  * no extra PHY configuration is required.
  */

The Exynos5xxx case may be more complex.

> 
>> +    dp->phy = devm_phy_optional_get(dp->dev, "dp");
>> +    if (IS_ERR(dp->phy))
>> +        return ERR_CAST(dp->phy);
>>       dp->clock = devm_clk_get(&pdev->dev, "dp");
>>       if (IS_ERR(dp->clock)) {
> 
> With the comment added:
> Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
> 
> Best regards,
> Damon
> 



