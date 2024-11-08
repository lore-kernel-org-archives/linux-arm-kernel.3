Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D90D5C0CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPQvHE3q81KEG1KWpRY76/YYpzUKNWMXavpJD8Jdyj8=; b=OdleJZ475tGt7ukZjDgYdEpT9O
	WGIR6kZap75pp6SGKLuMGmGoVme+dKhrMi67IHGp8CfRSQtPOdMuqA0TEkQJ2O5LkNusiNJacedT0
	dlaQPetLFA/yZaUY4J1WThTdlwDgOvbuwfHtjxqcydHr9XCZcgV+zRxjvkiiVGwqTzV2vhiXhxzPj
	mTXi8bQwPjt559+GhAFoNPpA5qASo/ad+t+LzZV+Ufjf88aI6qbZyb6DcZ9lw5F0zTAHxotccqGY1
	MwTvtGULuKbbFapvEdXu3SssgehjXKEpKwpTxoQRVGwCFLxSs8BiCptysHw3fb2h+T7jIQ/CrlzWY
	5YQSWN7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Q1g-0000000ArQz-17PQ;
	Fri, 08 Nov 2024 14:31:52 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pbm-0000000An5I-12E9;
	Fri, 08 Nov 2024 14:05:08 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731074703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hPQvHE3q81KEG1KWpRY76/YYpzUKNWMXavpJD8Jdyj8=;
	b=X6+JIDD8w/pV1TnT7U0Owy43XKZNWlYyZGxAGEXciKVjqCG2FkpMvi+HP+IlhfTOnTzZk9
	8r56/KZNaLMB4D+VcUVPKibgBLC9G5ZY61C9/Liy15awpYRC3/r9kwyThxSlZMZazdqlHI
	nDRU/88tU4JCAfavUYsWg3LUKl4IgBsmIemzeiFpd+CL99C/2cDZfxDK+I2SEy2mManDod
	LHmWYccNCv+ek5zuXrZZUDtwiJdqKbOZZQzMlslS9UxsqkLdYRoOXl+K6L0qhscfIfXMDg
	bCN7wzNvAnM3mJKpAIsZMvwCS+MaoRuM5W/uxj4EqpsjOuVjeNZ9Hy6KRXDOQA==
Date: Fri, 08 Nov 2024 15:05:02 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/rockchip: dsi: Perform trivial code cleanups
In-Reply-To: <13633881.uLZWGnKmhe@diego>
References: <cover.1731073565.git.dsimic@manjaro.org>
 <35555b58a7284450fb16281514e4e6a3eb9c7b82.1731073565.git.dsimic@manjaro.org>
 <13633881.uLZWGnKmhe@diego>
Message-ID: <3734f6a5424e3537d717c587a058fc85@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_060506_767113_FFAB6BE5 
X-CRM114-Status: GOOD (  16.98  )
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

Hello Heiko,

On 2024-11-08 14:56, Heiko Stübner wrote:
> Am Freitag, 8. November 2024, 14:53:57 CET schrieb Dragan Simic:
>> Perform a few trivial code cleanups, to make one logged message a bit 
>> more
>> consistent with the other logged messages by capitalizing its first 
>> word, and
>> to avoid line wrapping by using the 100-column width better.
>> 
>> No intended functional changes are introduced by these code cleanups.
>> 
>> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> ---
>>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 12 ++++--------
>>  1 file changed, 4 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c 
>> b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> index 58a44af0e9ad..f451e70efbdd 100644
>> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> @@ -1379,7 +1379,7 @@ static int dw_mipi_dsi_rockchip_probe(struct 
>> platform_device *pdev)
>>  	}
>> 
>>  	if (!dsi->cdata) {
>> -		DRM_DEV_ERROR(dev, "no dsi-config for %s node\n", np->name);
>> +		DRM_DEV_ERROR(dev, "No dsi-config for %s node\n", np->name);
> 
> this is all probe-related, why not convert to dev_err_probe?
> 
> As the doc states [0], DRM_DEV_ERROR is deprecated in favor of dev_err.
> So dev_err_probe would be the correct way to go?

Thanks for your quick response!  Seeing that DRM_DEV_ERROR() is now
deprecated (which I originally missed, in all honesty) makes me very
happy. :)  I've never been a huge fan of the format of the messages
that DRM_DEV_ERROR() produces.

However, perhaps it would be better to keep these patches as-is, as
some kind of an intermediate, limited-scope cleanup + bugfix combo,
and leave the complete DRM_DEV_ERROR() --> dev_err()/dev_err_probe()
conversion to separate patches.  I think it would be better to avoid
a partial conversion, and I'll be more than happy to put the complete
conversion on my TODO list. :)

> [0] 
> https://elixir.bootlin.com/linux/v6.11.6/source/include/drm/drm_print.h#L431
> 
>>  		return -EINVAL;
>>  	}
>> 
>> @@ -1408,19 +1408,16 @@ static int dw_mipi_dsi_rockchip_probe(struct 
>> platform_device *pdev)
>>  			dsi->pllref_clk = NULL;
>>  		} else {
>>  			ret = PTR_ERR(dsi->pllref_clk);
>> -			DRM_DEV_ERROR(dev,
>> -				      "Unable to get pll reference clock: %d\n",
>> -				      ret);
>> +			DRM_DEV_ERROR(dev, "Unable to get pll reference clock: %d\n", 
>> ret);
>>  			return ret;
>>  		}
>>  	}
>> 
>>  	if (dsi->cdata->flags & DW_MIPI_NEEDS_PHY_CFG_CLK) {
>>  		dsi->phy_cfg_clk = devm_clk_get(dev, "phy_cfg");
>>  		if (IS_ERR(dsi->phy_cfg_clk)) {
>>  			ret = PTR_ERR(dsi->phy_cfg_clk);
>> -			DRM_DEV_ERROR(dev,
>> -				      "Unable to get phy_cfg_clk: %d\n", ret);
>> +			DRM_DEV_ERROR(dev, "Unable to get phy_cfg_clk: %d\n", ret);
>>  			return ret;
>>  		}
>>  	}
>> @@ -1465,8 +1462,7 @@ static int dw_mipi_dsi_rockchip_probe(struct 
>> platform_device *pdev)
>>  	if (IS_ERR(dsi->dmd)) {
>>  		ret = PTR_ERR(dsi->dmd);
>>  		if (ret != -EPROBE_DEFER)
>> -			DRM_DEV_ERROR(dev,
>> -				      "Failed to probe dw_mipi_dsi: %d\n", ret);
>> +			DRM_DEV_ERROR(dev, "Failed to probe dw_mipi_dsi: %d\n", ret);
>>  		return ret;
>>  	}
>> 
>> 

