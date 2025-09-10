Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF66CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 13:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGyvaOmJO5BvrqiSAVLBX52CbNYPzw7n66uBh6XqncY=; b=WqZJzt9ntl9J1/G4ADzhJlj28F
	EAS2pEYdWaEVrBdGf4PY35JRzCiR5bBZy4jzd/2HDLgJn5F7xA59F3gGYPeM6nW2Ezg8Crir9D0zO
	tTAfCZJnQoPeum6xxA/fgQMpRAMUvrUXdfaViTvUmwN+45nHZ4HYu4Q4ziEOD9u3z7ivhUOYFw0A4
	8mUk1BZns2NLtZbrgAZZpbXU6pqBthCLtMS2DhzjbiwnjogqsPkZ4Z+xUPy2E9tTG2nOvC0A1HYZ4
	4LuQdyk+M0ML557cWLLcgXkSOWahLFVMS0NlmTnGJbBw1kE2NM+g0e7QYM6uFUJFfXHkmiyBWeOJ0
	CCmtElwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLMO-0000000EXJ4-488U;
	Wed, 10 Sep 2025 13:59:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLML-0000000EXDh-3sjM;
	Wed, 10 Sep 2025 13:59:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1371C16F8;
	Wed, 10 Sep 2025 06:59:33 -0700 (PDT)
Received: from [10.1.25.55] (e122027.cambridge.arm.com [10.1.25.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E14273F694;
	Wed, 10 Sep 2025 06:59:35 -0700 (PDT)
Message-ID: <4670e984-10c2-4c8e-89b3-d3a0217735b3@arm.com>
Date: Wed, 10 Sep 2025 14:59:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/10] drm/panthor: devfreq: add pluggable devfreq
 providers
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-9-7b6c2d6be221@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250905-mt8196-gpufreq-v1-9-7b6c2d6be221@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_065942_088003_4F1970D3 
X-CRM114-Status: GOOD (  29.79  )
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

On 05/09/2025 11:23, Nicolas Frattaroli wrote:
> On some devices, devfreq is not controlled directly by DT OPPs and the
> common clock framework, but through an external devfreq driver. To
> permit this type of usage, add the concept of devfreq providers.
> 
> Devfreq providers for panthor register themselves with panthor as a
> provider. panthor then gets whatever driver is suckling on its
> performance-node property, finds the registered devfreq provider init
> function for it, and calls it.
> 
> Should the probe order work out such that panthor probes before the
> devfreq provider is finished probing and registering itself, then we
> just defer the probe after adding a device link.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Looks fine to me, but I think there are some updates needed due to the
DT review.

Thanks,
Steve

> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 74 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_devfreq.h | 16 +++++++
>  2 files changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index d495dd856299826c4bddc205087d8914d01d7fc4..1b0c21f6f069b059b8b0e412a79556c602c5f1e7 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -4,6 +4,7 @@
>  #include <linux/clk.h>
>  #include <linux/devfreq.h>
>  #include <linux/devfreq_cooling.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  
> @@ -12,6 +13,34 @@
>  #include "panthor_devfreq.h"
>  #include "panthor_device.h"
>  
> +static LIST_HEAD(panthor_devfreq_providers);
> +static DEFINE_MUTEX(panthor_devfreq_providers_lock);
> +
> +int panthor_devfreq_register_provider(struct panthor_devfreq_provider *prov)
> +{
> +	guard(mutex)(&panthor_devfreq_providers_lock);
> +
> +	list_add(&prov->node, &panthor_devfreq_providers);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(panthor_devfreq_register_provider);
> +
> +static int panthor_devfreq_init_provider(struct panthor_device *ptdev,
> +					 struct device *provider_dev)
> +{
> +	struct panthor_devfreq_provider *prov;
> +
> +	guard(mutex)(&panthor_devfreq_providers_lock);
> +
> +	list_for_each_entry(prov, &panthor_devfreq_providers, node) {
> +		if (prov->dev == provider_dev)
> +			return prov->init(ptdev, provider_dev);
> +	}
> +
> +	return -EPROBE_DEFER;
> +}
> +
>  static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
>  {
>  	ktime_t now, last;
> @@ -102,7 +131,7 @@ static struct devfreq_dev_profile panthor_devfreq_profile = {
>  	.get_cur_freq = panthor_devfreq_get_cur_freq,
>  };
>  
> -int panthor_devfreq_init(struct panthor_device *ptdev)
> +static int panthor_devfreq_init_of(struct panthor_device *ptdev)
>  {
>  	/* There's actually 2 regulators (mali and sram), but the OPP core only
>  	 * supports one.
> @@ -222,6 +251,49 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  	return 0;
>  }
>  
> +static int panthor_devfreq_init_platform(struct panthor_device *ptdev)
> +{
> +	struct device_node *pcnode;
> +	struct platform_device *pdev;
> +	struct device_link *link;
> +	int ret;
> +
> +	pcnode = of_parse_phandle(ptdev->base.dev->of_node,
> +				  "performance-controller", 0);
> +	if (!pcnode)
> +		return -EINVAL;
> +
> +	pdev = of_find_device_by_node(pcnode);
> +	of_node_put(pcnode);
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	link = device_link_add(ptdev->base.dev, &pdev->dev,
> +			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
> +	if (!link) {
> +		dev_err(ptdev->base.dev, "failed to add device link\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = panthor_devfreq_init_provider(ptdev, &pdev->dev);
> +	if (ret)
> +		return dev_err_probe(ptdev->base.dev, ret,
> +				     "failed to initialize devfreq provider\n");
> +
> +	DRM_DEV_INFO(ptdev->base.dev, "initialized devfreq provider %s\n",
> +		     dev_name(&pdev->dev));
> +
> +	return 0;
> +}
> +
> +int panthor_devfreq_init(struct panthor_device *ptdev)
> +{
> +	if (!of_property_present(ptdev->base.dev->of_node, "performance-controller"))
> +		return panthor_devfreq_init_of(ptdev);
> +
> +	return panthor_devfreq_init_platform(ptdev);
> +}
> +
>  void panthor_devfreq_resume(struct panthor_device *ptdev)
>  {
>  	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
> index a891cb5fdc34636444f141e10f5d45828fc35b51..94c9768d5d038c4ba8516929edb565a1f13443fb 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.h
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> @@ -8,6 +8,7 @@
>  
>  struct devfreq;
>  struct thermal_cooling_device;
> +struct platform_device;
>  
>  struct panthor_device;
>  
> @@ -43,6 +44,19 @@ struct panthor_devfreq {
>  	spinlock_t lock;
>  };
>  
> +struct panthor_devfreq_provider {
> +	/** @dev: device pointer to the provider device */
> +	struct device *dev;
> +	/**
> +	 * @init: the provider's init callback that allocates a
> +	 * &struct panthor_devfreq, adds it to panthor, and adds a devfreq
> +	 * device to panthor. Will be called during panthor's probe.
> +	 */
> +	int (*init)(struct panthor_device *ptdev, struct device *dev);
> +
> +	struct list_head node;
> +};
> +
>  
>  int panthor_devfreq_init(struct panthor_device *ptdev);
>  
> @@ -57,4 +71,6 @@ int panthor_devfreq_get_dev_status(struct device *dev,
>  
>  unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
>  
> +int panthor_devfreq_register_provider(struct panthor_devfreq_provider *prov);
> +
>  #endif /* __PANTHOR_DEVFREQ_H__ */
> 


