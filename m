Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974EDC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggfPnUnXU0n3rJkPoLDqNiw5pfA+E10hNhIURH89gMk=; b=niROiUWA2lrKTrQrSvCEg8d8I6
	8m+kO2MebA0ECqT0RsJa9KDcXg4aYFSoqLDxytovgwRlvmQyWvHXixWUlJlfgzNeQy1EMS5KUbAqS
	W0Mf/frIdsFS6Kk8dtmsEi8FKwBnhwW/7q8Jn4JhBabQFWzf7S/Xdjp8aTSSg9st03sBytv7Wqsxs
	NYyENXjuUyYOYqplbYwA+jGq15wtmA0GotCOjC+mV/C155FLn+0CBNcucHobQ3mbH+DKqnexsXds9
	yJa3ZXleFXeGclfxngON+gWMnLTMEGpXvxj9CgOrfXlsiv1ks7r83dLzvdCae4nny71czgFZjWHnA
	pit3FJcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IO3-00000007X2C-188p;
	Wed, 23 Sep 2026 08:31:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IO0-00000007X0e-2gCB;
	Wed, 23 Sep 2026 08:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790152285;
	bh=f8MjPqhRjZFCo17vsKJXb4XJoztMeVIuVFT7xq41j/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D8yPuzyqijQDRhuR1w5l5pydXbXnu2NwfYYMuWMQYAiw2AVLiA04oDG0j34xLhljP
	 IUXY4/WlqIuoy6Gs3SrvIOIgX8fj5GrbpmqxdOb+YwfqHjshamyEpRloboo/5GRLmG
	 DA6UyYupEHPZcCWYqKB+PMIdTSWll1jsWkKtTj93036bMWjr92Lc1v9eBmwYlhCf9D
	 taMm1NDT/AY4eEXbKO8hPN00cQPCv0DHpH8N42BU04Ypjek+3Xl8lxmMw2RUAK3ZYI
	 vzs6ODb0BQMM1n3znaAaMAnECzA0V/acurL+MI/C5cg+FAJgnZuwzjq1YJ8liaAm2W
	 DZVx4dEtc5xGQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C896A17E03D5;
	Wed, 23 Sep 2026 10:31:24 +0200 (CEST)
Message-ID: <c4908f1a-878c-4958-aaac-9960aae11879@collabora.com>
Date: Wed, 23 Sep 2026 10:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] cpufreq: mediatek: add support for CPU speedbin
To: rva333@protonmail.com, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260923-6572-cpufreq-v1-0-41f7af6d6d1a@protonmail.com>
 <20260923-6572-cpufreq-v1-1-41f7af6d6d1a@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260923-6572-cpufreq-v1-1-41f7af6d6d1a@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_013128_844888_58869600 
X-CRM114-Status: GOOD (  29.06  )
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

On 9/23/26 09:23, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> MediaTek SoCs are often released under the same marketing name, but with
> different suffix for the speedbin. For example, mt6572m has 1 GHz limit,
> mt6572a - 1.2 GHz, mt6572w - 1.4 GHz.
> 
> Add code to support per-cluster 'opp-supported-hw' property. The DT is
> expected to pass a CPU speedbin using standard 'nvmem-cells' property
> under the CPU node.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>   drivers/cpufreq/mediatek-cpufreq.c | 50 ++++++++++++++++++++++++++++++++++++--
>   1 file changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 052ca7cd2f4f..f15135b2898b 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -10,6 +10,7 @@
>   #include <linux/cpumask.h>
>   #include <linux/minmax.h>
>   #include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
>   #include <linux/of.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
> @@ -57,6 +58,7 @@ struct mtk_cpu_dvfs_info {
>   	const struct mtk_cpufreq_platform_data *soc_data;
>   	int vtrack_max;
>   	bool ccifreq_bound;
> +	int opp_token;
>   };
>   
>   static struct platform_device *cpufreq_pdev;
> @@ -381,6 +383,38 @@ static struct device *of_get_cci(struct device *cpu_dev)
>   	return &pdev->dev;
>   }
>   
> +static int mtk_cpu_parse_speedbin(struct mtk_cpu_dvfs_info *info, int cpu)
> +{
> +	struct device *cpu_dev = get_cpu_device(cpu);
> +	struct dev_pm_opp_config config = {};
> +	u32 val, opp_hw_ver;
> +	int ret;
> +
> +	ret = nvmem_cell_read_variable_le_u32(cpu_dev, "speed_grade", &val);

Let's keep consistency with cell names: for example, on the GPU side, the node
in devicetree is called "gpu-speedbin@1234", and the panfrost node has

nvmem-cells = <&gpu_speedbin>;
nvmem-cell-names = "speed-bin";

Check MT8186 and MT8188 devicetrees ;-)

> +	if (ret) {
> +		if (ret == -ENOENT)

if (ret != -ENOENT && ret != -EOPNOTSUPP)

> +			/* speedbin is optional */
> +			return 0;
> +		return dev_err_probe(cpu_dev, ret, "cpu%d: failed to read speedbin\n", cpu);
> +	}
> +
> +	/* Convert the raw value to a bitmask */
> +	if (val >= 32)
> +		return dev_err_probe(cpu_dev, -EINVAL,
> +				     "cpu%d: invalid speedbin value %u\n", cpu, val);
> +	opp_hw_ver = BIT(val);

If you look at nvmem/mtk-efuse.c there is a mtk_efuse_gpu_speedbin_pp() function
that is doing (almost) *exactly* what you're doing here.

Check if the same constraints as GPU speed binning applies to the CPU: if they do,
just allow "cpu-speedbin" as node name in the fixup function, otherwise add a new
post processing function for the CPU and act accordingly.

> +
> +	config.supported_hw = &opp_hw_ver;
> +	config.supported_hw_count = 1;
> +
> +	info->opp_token = dev_pm_opp_set_config(cpu_dev, &config);

It's way easier if you use

devm_pm_opp_set_supported_hw(dev, &opp_hw_ver, 1);

Cheers,
Angelo

> +	if (info->opp_token < 0)
> +		return dev_err_probe(cpu_dev, info->opp_token,
> +				     "cpu%d: failed to set OPP config\n", cpu);
> +
> +	return 0;
> +}
> +
>   static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>   {
>   	struct device *cpu_dev;
> @@ -450,18 +484,22 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>   		}
>   	}
>   
> +	ret = mtk_cpu_parse_speedbin(info, cpu);
> +	if (ret)
> +		goto out_disable_sram_reg;
> +
>   	/* Get OPP-sharing information from "operating-points-v2" bindings */
>   	ret = dev_pm_opp_of_get_sharing_cpus(cpu_dev, &info->cpus);
>   	if (ret) {
>   		dev_err_probe(cpu_dev, ret,
>   			"cpu%d: failed to get OPP-sharing information\n", cpu);
> -		goto out_disable_sram_reg;
> +		goto out_free_speedbin;
>   	}
>   
>   	ret = dev_pm_opp_of_cpumask_add_table(&info->cpus);
>   	if (ret) {
>   		dev_err_probe(cpu_dev, ret, "cpu%d: no OPP table\n", cpu);
> -		goto out_disable_sram_reg;
> +		goto out_free_speedbin;
>   	}
>   
>   	ret = clk_prepare_enable(info->cpu_clk);
> @@ -533,6 +571,10 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>   out_free_opp_table:
>   	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
>   
> +out_free_speedbin:
> +	if (info->opp_token > 0)
> +		dev_pm_opp_clear_config(info->opp_token);
> +
>   out_disable_sram_reg:
>   	if (info->sram_reg)
>   		regulator_disable(info->sram_reg);
> @@ -573,6 +615,10 @@ static void mtk_cpu_dvfs_info_release(struct mtk_cpu_dvfs_info *info)
>   	clk_disable_unprepare(info->inter_clk);
>   	clk_put(info->inter_clk);
>   	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
> +
> +	if (info->opp_token > 0)
> +		dev_pm_opp_clear_config(info->opp_token);
> +
>   	dev_pm_opp_unregister_notifier(info->cpu_dev, &info->opp_nb);
>   	if (info->soc_data->ccifreq_supported)
>   		put_device(info->cci_dev);
> 

