Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD9AC7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOL+UE3ZMzdwZcTonqTxsoaazd36t2Od1ckK0FgAmiQ=; b=PQIxlfqtDwbwdXtLGqCo+jSpR6
	o79yifcLzfmeavu2hPeItGszb9LRxniJHk3kfShaZbX/inYCZ2P/P1LsxbwmhSXmGPw6YhCnQJaEo
	o6fefuSKQ3TgbRuKfcE2GMe0Mq4210RnxJyJDGQZ23k0qBDybsgNV5jJhe+x3yxqRn/boFUPcT+7z
	j6Pv39NvpvjKfQASaSfzllmE/X/XoLWTrtYtfBnzPz9YPi0Ym3AeX117IgmHHsQG3UYaRNFWwnleI
	aMzKHzQTDrGjk9Kd558ZKia/5rH/T4K88d3ReWyyEX7yufFOZfEdspHYfCSW3Eznh1iP9+EcXklPR
	pcCJyE7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jv-00000006gZq-2ioj;
	Tue, 24 Jun 2025 19:55:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7F0-00000006Mlp-2r9E;
	Tue, 24 Jun 2025 17:15:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C77C5113E;
	Tue, 24 Jun 2025 10:15:07 -0700 (PDT)
Received: from [10.57.29.113] (unknown [10.57.29.113])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9A6C3F58B;
	Tue, 24 Jun 2025 10:15:23 -0700 (PDT)
Message-ID: <bc1b7891-d2d4-4104-b52d-dfa956e0a6a3@arm.com>
Date: Tue, 24 Jun 2025 18:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] iommu: omap: Drop redundant check if
 ti,syscon-mmuconfig exists
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
 <20250624-syscon-phandle-args-iommu-v3-1-1a36487d69b8@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250624-syscon-phandle-args-iommu-v3-1-1a36487d69b8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_101526_763510_885D24CF 
X-CRM114-Status: GOOD (  17.23  )
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

On 2025-06-24 1:22 pm, Krzysztof Kozlowski wrote:
> The syscon_regmap_lookup_by_phandle() will fail if property does not
> exist, so doing of_property_read_bool() earlier is redundant.  Drop that
> check and move error message to syscon_regmap_lookup_by_phandle() error
> case while converting it to dev_err_probe().

Sure, may as well.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/iommu/omap-iommu.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index 3c62337f43c67720a15b67e8b610da7886f6f39c..4448c0a512137c79195112eea25d762266c77bc3 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -1123,23 +1123,15 @@ static int omap_iommu_dra7_get_dsp_system_cfg(struct platform_device *pdev,
>   					      struct omap_iommu *obj)
>   {
>   	struct device_node *np = pdev->dev.of_node;
> -	int ret;
>   
>   	if (!of_device_is_compatible(np, "ti,dra7-dsp-iommu"))
>   		return 0;
>   
> -	if (!of_property_read_bool(np, "ti,syscon-mmuconfig")) {
> -		dev_err(&pdev->dev, "ti,syscon-mmuconfig property is missing\n");
> -		return -EINVAL;
> -	}
> -
>   	obj->syscfg =
>   		syscon_regmap_lookup_by_phandle(np, "ti,syscon-mmuconfig");
> -	if (IS_ERR(obj->syscfg)) {
> -		/* can fail with -EPROBE_DEFER */
> -		ret = PTR_ERR(obj->syscfg);
> -		return ret;
> -	}
> +	if (IS_ERR(obj->syscfg))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(obj->syscfg),
> +				     "ti,syscon-mmuconfig property is missing\n");
>   
>   	if (of_property_read_u32_index(np, "ti,syscon-mmuconfig", 1,
>   				       &obj->id)) {
> 


