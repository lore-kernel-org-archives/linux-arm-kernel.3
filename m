Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1028E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxaPKiSqk6Y0SpYumOvrQBkvM+Kq6cPcqUf3zMwtObs=; b=O9BpogofACEwVXaysHTiKwcr9V
	T5de10IVEWW1SGN30zhcZocmED0JdXFOh1tlSmB8LaATpYUgLfy7cQCX+2pfc9rg8W3v3lJBNJIZn
	RvgUmStCseHsFAMbcesUUNuLRcosl3kICIVRZ9XkS6jtU2RIC6y7I2OFQKYbFqFhYFUzB0AFWE1wX
	Oet9+ZD/zPv5yrr/ojNcdFijlG9PsLL7vzd4b2CLcOHwz+Psr4qAfQy666oEiLKwQCT0OT9FOVPh5
	ODVVbOIUf+i/UrBzNmq8kS1OEuhV3T00A3BN/1MRw2pen7nlMywmi0iCMuBG+PVSU0ZopeCf/5Zfq
	vIEv2DcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgUj-00000009stV-2bLX;
	Mon, 23 Dec 2024 11:21:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgLU-00000009rV1-0QL2;
	Mon, 23 Dec 2024 11:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734952290;
	bh=09Szq+5ED+uJC+jXFmk42U3WThXQRASetEvE4j3m3ag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=owpGwXqOVkNyohhBx6ON/khFurTZ0K+k1gp0sCEkTblE7f4R9OGRI88ETZAWKJKA4
	 rLPYj6Kc48ezBk8f66XBOIyKCWB03beLbfbk9VB/9ghMl6+GUgfADtyEXHAPsS3VPR
	 I1Pf+bhz3NdROPdOsKNoBaDDQAfQxgs0LX8iwyR0DeOLnrG6uTE+CKsSuXom84T2S1
	 s3/2CVkY+8immgVaviZ6/t+il8qAi+rBjedwMXWfD6PchuEzZSi5XP5OrNuZ90T3wg
	 WeLCcMXr9VaErC1bKGN3xTLMumDjs8g0LmnhxLI4tD7mQU+ZpfaH+pLhrBS/ueo3CO
	 ZgC43l1TydyzA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B67417E362F;
	Mon, 23 Dec 2024 12:11:30 +0100 (CET)
Message-ID: <481a6eec-c428-45cd-98a6-5a91f3ceb187@collabora.com>
Date: Mon, 23 Dec 2024 12:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: mtk-efuse: Enable GPU speed bin post-processing
 for MT8188
To: Chen-Yu Tsai <wenst@chromium.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org
References: <20241223100648.2166754-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241223100648.2166754-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_031132_315877_A53A2FCA 
X-CRM114-Status: GOOD (  15.47  )
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

Il 23/12/24 11:06, Chen-Yu Tsai ha scritto:
> Like the MT8186, the MT8188 stores GPU speed binning data in its efuse.
> The data needs post-processing into a format that the OPP framework can
> use.
> 
> Add a compatible match for MT8188 efuse with post-processing enabled.
> 

Let's just change the MT8188 compatible list to

compatible = "mediatek,mt8188-efuse", "mediatek,mt8186-efuse";

instead :-)

Cheers,
Angelo

> Cc: <stable@vger.kernel.org>
> Fixes: ff1df1886f43 ("dt-bindings: nvmem: mediatek: efuse: Add support for MT8188")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> 
> I'm not exactly sure about pointing to the dt bindings commit for the
> fixes tag.
> ---
>   drivers/nvmem/mtk-efuse.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index af953e1d9230..e8409e1e7fac 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -112,6 +112,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
>   static const struct of_device_id mtk_efuse_of_match[] = {
>   	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
>   	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
> +	{ .compatible = "mediatek,mt8188-efuse", .data = &mtk_mt8186_efuse_pdata },
>   	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },
>   	{/* sentinel */},
>   };


