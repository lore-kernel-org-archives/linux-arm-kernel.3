Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46483CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 12:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/k03sYntLq8Zfi4yO8/asoWJl9UlmpXJOixmGdXcyI=; b=pMkFR0TXAKHJk7luz5ewYSbBBM
	bP2IZQVCJTAQ75+eonGTTwZUgflAdv9E38MvoIWMT7Xm5T5qO8bsFIPcMryO6/Jxpnaw5ibMcIh++
	YATIHMBM8hH98jZ3EcWOq2p/IpAhh0h7Drp/ugTjNi4lljSsQZlzZ1QCSdhpyRGQgTV57KsStq5Z+
	6YFh972ALfFirpu0nLmV0ERvWj6g6Ai4XFcSPYOn53kr7P5FXSOM/pD3lsm4hJebES6z5BALn5x33
	d9x8XpYir8jjrLU5hgRREMHx/Ns282bcngI8Es/Tj79cr2r8pn8jKX/ZJNrU+ArAN7gqCd7FHgLJq
	lNwEMmug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8djs-0000000GBq5-2lqY;
	Tue, 14 Oct 2025 12:02:48 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8djp-0000000GBp4-3up0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 12:02:47 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cmCX207CPz9ssn;
	Tue, 14 Oct 2025 14:02:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760443362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/k03sYntLq8Zfi4yO8/asoWJl9UlmpXJOixmGdXcyI=;
	b=aiqICYOzVOtRvf45kCUN9D3ePfh9PDjsWLq321JNC/20zo7IUdO0LnT+lmtSBjy4l0mLfL
	QBctdxgpYAdDupOqxL527XAV8FmE5GVKUQP+YgvzP7GBsu8vCQDqRTcQM4bz9mK616XeHX
	SF0kvrHLR7CntlilUs1dyeRIn3RFkey0s3aiTr9dOIQiUfawS6dVLWBMp7SJwIEiEJiY3Y
	H58vSGv9p9lYxw/qEP4TDKIKHQjWTMr2I8ZDE4J/HNWI4BH7KSStlCqLMo8n/1+fQhRkOm
	GIJUyKKh8RFSgKM3b6tftTIekpOBxU4y6EL6MGDqlbz/YmJtx5/iVvx9Q/IyvQ==
Message-ID: <f5d51ead-eae8-430f-b8b3-1ad4b78490ae@mailbox.org>
Date: Tue, 14 Oct 2025 14:02:37 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 04/39] drm/imx: dc: Use bulk clock
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-5-marek.vasut@mailbox.org>
 <aO0utF930vhlJFl8@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO0utF930vhlJFl8@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 211e7aa255b7d3d8ef5
X-MBO-RS-META: bkw6rpy7gkkayzw1g5i6hemzbnb81gy6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_050246_186251_C0CF75EF 
X-CRM114-Status: GOOD (  16.53  )
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

On 10/13/25 6:54 PM, Frank Li wrote:
> On Sat, Oct 11, 2025 at 06:51:19PM +0200, Marek Vasut wrote:
>> Switch to bulk clock operations, as many of the blocks present in DC
> 
> s/operations/API
> 
>> use multiple clock on i.MX95. The use of bulk clock operations allows
>> the driver to seamlessly handle one or multiple clock.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Abel Vesa <abelvesa@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Liu Ying <victor.liu@nxp.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-clk@vger.kernel.org
>> ---
>>   drivers/gpu/drm/imx/dc/dc-drv.c | 14 ++++++++------
>>   drivers/gpu/drm/imx/dc/dc-ic.c  | 14 ++++++++------
>>   drivers/gpu/drm/imx/dc/dc-pe.c  | 12 ++++++------
>>   drivers/gpu/drm/imx/dc/dc-pe.h  |  3 ++-
>>   4 files changed, 24 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
>> index f108964bf89f4..2717c92aba6c5 100644
>> --- a/drivers/gpu/drm/imx/dc/dc-drv.c
>> +++ b/drivers/gpu/drm/imx/dc/dc-drv.c
>> @@ -31,7 +31,8 @@
>>
>>   struct dc_priv {
>>   	struct drm_device *drm;
>> -	struct clk *clk_cfg;
>> +	struct clk_bulk_data *clk_cfg;
>> +	int clk_cfg_count;
>>   };
>>
>>   DEFINE_DRM_GEM_DMA_FOPS(dc_drm_driver_fops);
>> @@ -163,10 +164,11 @@ static int dc_probe(struct platform_device *pdev)
>>   	if (!priv)
>>   		return -ENOMEM;
>>
>> -	priv->clk_cfg = devm_clk_get(&pdev->dev, NULL);
>> -	if (IS_ERR(priv->clk_cfg))
>> -		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk_cfg),
>> +	ret = devm_clk_bulk_get_all(&pdev->dev, &priv->clk_cfg);
>> +	if (ret < 0)
>> +		return dev_err_probe(&pdev->dev, ret,
>>   				     "failed to get cfg clock\n");
>> +	priv->clk_cfg_count = ret;
>>
>>   	dev_set_drvdata(&pdev->dev, priv);
>>
>> @@ -201,7 +203,7 @@ static int dc_runtime_suspend(struct device *dev)
>>   {
>>   	struct dc_priv *priv = dev_get_drvdata(dev);
>>
>> -	clk_disable_unprepare(priv->clk_cfg);
>> +	clk_bulk_disable_unprepare(priv->clk_cfg_count, priv->clk_cfg);
>>
>>   	return 0;
>>   }
>> @@ -211,7 +213,7 @@ static int dc_runtime_resume(struct device *dev)
>>   	struct dc_priv *priv = dev_get_drvdata(dev);
>>   	int ret;
>>
>> -	ret = clk_prepare_enable(priv->clk_cfg);
>> +	ret = clk_bulk_prepare_enable(priv->clk_cfg_count, priv->clk_cfg);
>>   	if (ret)
>>   		dev_err(dev, "failed to enable cfg clock: %d\n", ret);
>>
>> diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
>> index a270ae4030cdc..67441b349a7d2 100644
>> --- a/drivers/gpu/drm/imx/dc/dc-ic.c
>> +++ b/drivers/gpu/drm/imx/dc/dc-ic.c
>> @@ -30,7 +30,8 @@
>>
>>   struct dc_ic_data {
>>   	struct regmap		*regs;
>> -	struct clk		*clk_axi;
>> +	struct clk_bulk_data	*clk_axi;
> 
> I am not sure if "axi' is good name for bulk clks. Maybe use 'clks'. _axi
> quite specific to special 'axi' clocks.
Fixed both, thanks.

