Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D607E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 12:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pk5TzG9ulHaPrWI6Yef9KB4XVNg6BFE1tRPKJ6lzZbg=; b=qGwAHeEw5anc+ZzijcMA4RG/lQ
	ElY9voRGBg1G3+Um5sroJTeXEvDViEL+isOoAgUmQ2xDidD6eXUgMzq35ljmDXZzQpAiAaKpGv2I5
	k76C5xO5KFp1QXCPEENaF73uzLLx54Xv2av6wbT8OmYCzH2WBMadM3xE9Z479PyBrh2JGzZh6TES5
	leo4IvQRB5NNfGXPNcyxHa2sGtIUAaHxpiorwaTVctBpnUCbo0fLxadbzJd0KW3Hf0TO/QdkZjAkv
	9Vm4Gvg4kbgGrjXvKKIoHz7P3BVoxOUZ2DqiSUHXApfzhNl5IC7tRsqxVQbNoiFwKI5tBlXE2zI4y
	qA9vfmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJmc-000000058HI-3iw8;
	Mon, 13 Jan 2025 12:43:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJlN-00000005819-3dKl;
	Mon, 13 Jan 2025 12:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736772107;
	bh=IPHpSM0gHK7uddhO4HkJ69FBlgIeHdL9qA0Mae2fHr4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=VC+R6ACbOfUWrWeEV/dMVdMegVVfY293Z272WfnnP9gAAe5nGySUw7Ewsk/E3Mq1O
	 R1fl+ysBGlkyUOzEBNvKO+NuPduRw2z+69b4EVq0ikhR+cjRZa0qwXJm/s3gd9p7Os
	 MnD+yVax1J7MizNFBV5K4F9roF0QbZ+qfVV+HXTse9tcTVEoex06shQRq0NgOoDIZe
	 XmFk/gS8WvyoY7+pcWKQFz4iMw5TB7KaElIzYhaNcLYlBN4JGvoMEdODEQ1qi2oyV1
	 lGNVd+LyU7G6/RpQ14TausVzYeZZ3iI9LD9lAEvCRGwpKkZ3/EgVXgw18sEpm1bh9j
	 MnzwmWE6zz56A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1160917E04AC;
	Mon, 13 Jan 2025 13:41:47 +0100 (CET)
Message-ID: <516d16e3-6fc6-49ba-a0ce-f451b65a6c1a@collabora.com>
Date: Mon, 13 Jan 2025 13:41:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_044150_063911_346A3130 
X-CRM114-Status: GOOD (  19.83  )
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

Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> There is also no real benefit in printing errors on missing syscon
> argument, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.
> 

I agree with this change but can you please rebase it over [1]?

The same code got migrated to mtk_hdmi_common.c instead :-)

[1]: 
https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com

Thanks,
Angelo

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index ca82bc829cb9..4b0eb7dc25d8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1458,15 +1458,11 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>   	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
>   	 * registers it contains.
>   	 */
> -	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
> -	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1,
> -					 &hdmi->sys_offset);
> -	if (IS_ERR(regmap))
> -		ret = PTR_ERR(regmap);
> -	if (ret) {
> -		dev_err(dev,
> -			"Failed to get system configuration registers: %d\n",
> -			ret);
> +	regmap = syscon_regmap_lookup_by_phandle_args(np, "mediatek,syscon-hdmi",
> +						      1, &hdmi->sys_offset);
> +	if (IS_ERR(regmap)) {
> +		ret = dev_err_probe(dev, PTR_ERR(regmap),
> +				    "Failed to get system configuration registers\n");
>   		goto put_device;
>   	}
>   	hdmi->sys_regmap = regmap;


-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

