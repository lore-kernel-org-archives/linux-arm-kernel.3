Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFA6C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/iZCs5ZolpolFXhthLSg3GZX6A4/ZrWz+NTGekPQ8o=; b=1UnHjL9lnMLMCHhXxLis1uwcvt
	A3kJdixAysZtxFy5iEJca7xejsvevoRB8gCGN8AXnw+MDWnax2fw0EKEwVNf1z2CPcWZIBZ9/UykN
	hjWnPwqjc3x1pDo9uNUKmIV6RbNisY9pQoI9HAkpMcUTQg/6wIVejQcCkwQLorlE/a9c00crPvMVD
	It9NP7I3GOhN2uU5PLjijQYWIEhoiMYhR1SayZsZdolDKbuQcJYOQQMcNbIakG0uuKLeJP9aDDU0h
	5cIpaMkM2th4QAf00Xe9SHa0uRT5HNlrKtSqaKAHkhY1e6HHAAJXheW96p/lr538zE/VC7vSBGJy7
	N7E96MRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKnO-00000002ZmN-3ypA;
	Mon, 14 Jul 2025 15:08:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKGN-00000002UdE-1wxh;
	Mon, 14 Jul 2025 14:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752503677;
	bh=C64EfHnHMIz677ZQtmfMRi9lhk3psI5/NikDBBeYj6M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n6WEjRAoEnnDPHCxUVvgPzx8NXlEGXt6yao4e/J+01gPReIyc9rJzJNtD/0BKny1F
	 g5JZjL2yrCiQTGbFb1JLya5qvGW/f2o7fEgvJkvFRGzDSHElhkiMHFfS7x27ZLrOXT
	 Zomdi/9I2wLMGq7TcWwGxqikXapKeBltunIu93OFdWsN1fzBOtA+FWYg/I2pYtIgBG
	 Cn6h5SOzYwyKMwF24XNCnKdt395tYkPQ0xIiTCsauMzCvFkzX3AujuOpOLzusP3qVY
	 C5JdHLUU4VouD93vtVNkygpP+rlWBszkqbTA+mdkuili2MSibDCFvmW8b5kvBnsIkj
	 OA16Yt9ZvXILw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F2C817E05F0;
	Mon, 14 Jul 2025 16:34:36 +0200 (CEST)
Message-ID: <0c5e1177-c8f0-494f-94f1-de5e01b3715a@collabora.com>
Date: Mon, 14 Jul 2025 16:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] cpufreq: mediatek-hw: Add support for MT8196
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250714-mt8196-cpufreq-v2-0-cc85e78855c7@collabora.com>
 <20250714-mt8196-cpufreq-v2-4-cc85e78855c7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250714-mt8196-cpufreq-v2-4-cc85e78855c7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_073439_668657_DA568362 
X-CRM114-Status: GOOD (  35.32  )
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

Il 14/07/25 16:08, Nicolas Frattaroli ha scritto:
> The MT8196 SoC uses DVFS to set a desired target frequency for each CPU
> core. It also uses slightly different register offsets.
> 
> Add support for it, which necessitates reworking how the mmio regs are
> acquired, as mt8196 has the fdvfs config register and the fdvfs
> registers as two reg items before the performance domains.
> 
> I've verified with both `sysbench cpu run` and `head -c 10G \
> /dev/urandom | pigz -p 8 -c - | pv -ba > /dev/null` that we don't just
> get a higher reported clock frequency, but that the observed performance
> also increases, by a factor of 2.64 in an 8 thread sysbench test.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   drivers/cpufreq/mediatek-cpufreq-hw.c | 75 +++++++++++++++++++++++++++++++++--
>   1 file changed, 72 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
> index 53611077d0d9a2d9865cf771568ab71abc0e6fbd..de6b2b8f6600f23148a7a24cafeae339903ba119 100644
> --- a/drivers/cpufreq/mediatek-cpufreq-hw.c
> +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
> @@ -24,6 +24,8 @@
>   #define POLL_USEC			1000
>   #define TIMEOUT_USEC			300000
>   
> +#define MT8196_FDVFS_MAGIC		0xABCD0001UL
> +
>   enum {
>   	REG_FREQ_LUT_TABLE,
>   	REG_FREQ_ENABLE,
> @@ -36,7 +38,10 @@ enum {
>   };
>   
>   struct mtk_cpufreq_priv {
> +	struct device *dev;
>   	const struct mtk_cpufreq_variant *variant;
> +	void __iomem *fdvfs_config;
> +	void __iomem *fdvfs;
>   };
>   
>   struct mtk_cpufreq_domain {
> @@ -49,7 +54,10 @@ struct mtk_cpufreq_domain {
>   };
>   
>   struct mtk_cpufreq_variant {
> +	int (*init)(struct mtk_cpufreq_priv *priv);
>   	const u16 reg_offsets[REG_ARRAY_SIZE];
> +	const unsigned int fdvfs_fdiv;
> +	const unsigned int domain_offset;

I don't think you need a domain_offset here, but just a boolean saying that this
"has_fdvfs" or "is_dvfs_hybrid" or something else...

Besides, what about having just a

#define FDVFS_FDIV_HZ (26 * 1000) ?

This is the only platform that uses FDVFS and needs a FDIV, and I don't think that
other FDVFS MCUs will have a different divider.

If so, we can always add that param later to the variant structure, I think?

That'd reduce the change to

struct mtk_cpufreq_pdata {
	int (*hw_init)(struct mtk_cpufreq_priv *priv);
	const u16 reg_offsets[REG_ARRAY_SIZE];
	const bool is_hybrid_dvfs;
};

(don't mind about the naming, I'm just giving you alternatives if you didn't think
about those, I'm not complaining)

>   };
>   
>   static const struct mtk_cpufreq_variant cpufreq_mtk_base_variant = {
> @@ -63,6 +71,37 @@ static const struct mtk_cpufreq_variant cpufreq_mtk_base_variant = {
>   	},
>   };
>   
> +static int mtk_cpufreq_hw_mt8196_init(struct mtk_cpufreq_priv *priv)
> +{
> +	priv->fdvfs_config = devm_of_iomap(priv->dev, priv->dev->of_node, 0, NULL);
> +	if (IS_ERR_OR_NULL(priv->fdvfs_config))
> +		return dev_err_probe(priv->dev, PTR_ERR(priv->fdvfs_config),
> +				     "failed to get fdvfs-config iomem\n");
> +
> +	if (readl_relaxed(priv->fdvfs_config) == MT8196_FDVFS_MAGIC) {

...but then, wait a minute, is the FDVFS_CONFIG used only to check if FDVFS_MAGIC
is present?

If that's all for which it is used for, we might as well just assume that MT8196
always has FDVFS, because, well, it's true - MT8196 and MT6991 always have that
because it's initialized by the firmware before booting the kernel.

If there will be any need at all to initialize the FDVFS in Linux, we can use that
MMIO in a driver that does only that, perhaps...

> +		priv->fdvfs = devm_of_iomap(priv->dev, priv->dev->of_node, 1, NULL);
> +		if (IS_ERR_OR_NULL(priv->fdvfs))
> +			return dev_err_probe(priv->dev, PTR_ERR(priv->fdvfs),
> +					     "failed to get fdvfs iomem\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct mtk_cpufreq_variant cpufreq_mtk_mt8196_variant = {
> +	.init = mtk_cpufreq_hw_mt8196_init,
> +	.reg_offsets = {
> +		[REG_FREQ_LUT_TABLE]	= 0x0,
> +		[REG_FREQ_ENABLE]	= 0x84,
> +		[REG_FREQ_PERF_STATE]	= 0x88,
> +		[REG_FREQ_HW_STATE]	= 0x8c,
> +		[REG_EM_POWER_TBL]	= 0x90,
> +		[REG_FREQ_LATENCY]	= 0x114,
> +	},
> +	.fdvfs_fdiv = 26000,
> +	.domain_offset = 2,
> +};
> +
>   static int __maybe_unused
>   mtk_cpufreq_get_cpu_power(struct device *cpu_dev, unsigned long *uW,
>   			  unsigned long *KHz)
> @@ -91,12 +130,31 @@ mtk_cpufreq_get_cpu_power(struct device *cpu_dev, unsigned long *uW,
>   	return 0;
>   }
>   
> +static void mtk_cpufreq_hw_fdvfs_switch(unsigned int target_freq,
> +				       struct cpufreq_policy *policy)
> +{
> +	struct mtk_cpufreq_domain *data = policy->driver_data;
> +	struct mtk_cpufreq_priv *priv = data->parent;
> +	unsigned int cpu;
> +
> +	target_freq = DIV_ROUND_UP(target_freq, priv->variant->fdvfs_fdiv);
> +	for_each_cpu(cpu, policy->real_cpus) {
> +		writel_relaxed(target_freq, priv->fdvfs + cpu * 4);
> +	}
> +}
> +
>   static int mtk_cpufreq_hw_target_index(struct cpufreq_policy *policy,
>   				       unsigned int index)
>   {
>   	struct mtk_cpufreq_domain *data = policy->driver_data;
> +	unsigned int target_freq;
>   
> -	writel_relaxed(index, data->reg_bases[REG_FREQ_PERF_STATE]);
> +	if (data->parent->fdvfs) {
> +		target_freq = policy->freq_table[index].frequency;
> +		mtk_cpufreq_hw_fdvfs_switch(target_freq, policy);
> +	} else {
> +		writel_relaxed(index, data->reg_bases[REG_FREQ_PERF_STATE]);
> +	}
>   
>   	return 0;
>   }
> @@ -127,7 +185,10 @@ static unsigned int mtk_cpufreq_hw_fast_switch(struct cpufreq_policy *policy,
>   
>   	index = cpufreq_table_find_index_dl(policy, target_freq, false);
>   
> -	writel_relaxed(index, data->reg_bases[REG_FREQ_PERF_STATE]);
> +	if (data->parent->fdvfs)
> +		mtk_cpufreq_hw_fdvfs_switch(target_freq, policy);
> +	else
> +		writel_relaxed(index, data->reg_bases[REG_FREQ_PERF_STATE]);
>   
>   	return policy->freq_table[index].frequency;
>   }
> @@ -188,7 +249,7 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
>   	if (ret < 0)
>   		return ret;
>   
> -	index = args.args[0];

	index = args.args[0];

	/*
	 * If this is cpufreq with hybrid dvfs, the first declared register range
	 * is FDVFS and each of the frequency domain MMIOs follow that.
	 */
	if (priv->variant->cpufreq_is_hybrid_dvfs)
		index++

Do you like that? Any concern with such a solution? :-)

Cheers,
Angelo

> +	index = args.args[0] + priv->variant->domain_offset;
>   	of_node_put(args.np);
>   
>   	data->parent = priv;
> @@ -339,6 +400,13 @@ static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	priv->variant = data;
> +	priv->dev = &pdev->dev;
> +
> +	if (priv->variant->init) {
> +		ret = priv->variant->init(priv);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	platform_set_drvdata(pdev, priv);
>   	cpufreq_mtk_hw_driver.driver_data = pdev;
> @@ -357,6 +425,7 @@ static void mtk_cpufreq_hw_driver_remove(struct platform_device *pdev)
>   
>   static const struct of_device_id mtk_cpufreq_hw_match[] = {
>   	{ .compatible = "mediatek,cpufreq-hw", .data = &cpufreq_mtk_base_variant },
> +	{ .compatible = "mediatek,mt8196-cpufreq-hw", .data = &cpufreq_mtk_mt8196_variant },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, mtk_cpufreq_hw_match);
> 



