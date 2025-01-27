Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0CCC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 12:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APpybDrxAEGl3cvQrqgQ9M3a+CZX8nr+kRTuaOm6z88=; b=vWWbwZeVAyD81cdrkCvZdDmxbG
	zxyrbkYpymI++Ik6jiKMda79pgtBauKoHCJ0RFbMmXznylbwnjYgZX87Ow/AGGnPTm/1CElk9tCXU
	8/i+g7pVxwrqRqaf0p7VNx33DonHYGcFqkcDXfxbNvwoo9X4XT3BWWypyhlE5Zm095A7U/FCmniSJ
	rXqyxSALR+Tt0/bwfGOeIsovceeLNC7ahY2X4AqaGFRfEjYdejOTlq7AiCIOjr46nKQ/ztjhwWI8z
	sdPlFvLcFGLZojCzFT2z6CQH/hy60QG3rXf90pqFYlMdQDZSgidlHT6Z7G52jjuxTDzZ/GQszInhV
	VLmybIuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcNzF-00000002GUY-3cCV;
	Mon, 27 Jan 2025 12:13:05 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcNxx-00000002GOI-1vTv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 12:11:47 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YhS1m40Bbz6K9C8;
	Mon, 27 Jan 2025 20:11:08 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B26401400C8;
	Mon, 27 Jan 2025 20:11:38 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 27 Jan
 2025 13:11:38 +0100
Date: Mon, 27 Jan 2025 12:11:36 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
CC: <robh@kernel.org>, <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<shameerali.kolothum.thodi@huawei.com>, <zhao1.liu@intel.com>,
	<yangyicong@hisilicon.com>, <rrendec@redhat.com>, <catalin.marinas@arm.com>
Subject: Re: [RFC PATCH v1 1/1] base/of/cacheinfo: support l1 entry in dt
Message-ID: <20250127121136.00007f14@huawei.com>
In-Reply-To: <20250124152008.313-2-alireza.sanaee@huawei.com>
References: <20250124152008.313-1-alireza.sanaee@huawei.com>
	<20250124152008.313-2-alireza.sanaee@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_041145_796232_3696C37C 
X-CRM114-Status: GOOD (  21.22  )
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

On Fri, 24 Jan 2025 15:20:08 +0000
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

> This commit simply assumes that CPU node entries may point to a cache
> node that basically act as a l1-cache and there are some CPU nodes
> without describing any caches but a next-level-cache property that
> points to l1-cache.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  drivers/base/cacheinfo.c | 54 +++++++++++++++++++++++++++-------------
>  1 file changed, 37 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index cf0d455209d7..d119228fc392 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -83,7 +83,31 @@ bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y)
>  
>  #ifdef CONFIG_OF
>  
> -static bool of_check_cache_nodes(struct device_node *np);
> +static bool of_check_cache_node(struct device_node *np) {
> +	if (of_property_present(np, "cache-size")   ||
> +	    of_property_present(np, "i-cache-size") ||
> +	    of_property_present(np, "d-cache-size") ||
> +	    of_property_present(np, "cache-unified"))
> +		return true;
> +	return false;
> +}
> +
> +static bool of_check_cache_nodes(struct device_node *np)
> +{
> +	if (of_property_present(np, "cache-size")   ||
> +	    of_property_present(np, "i-cache-size") ||
> +	    of_property_present(np, "d-cache-size") ||
> +	    of_property_present(np, "cache-unified"))
> +		return true;

	if (of_check_cache_node(np))
		return true;
> +
> +	struct device_node *next __free(device_node) = of_find_next_cache_node(np);
> +	if (next) {

Hmm. Was like this before, but general kernel style is no brackets for single statement
if block.

> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  
>  /* OF properties to query for a given cache type */
>  struct cache_type_info {
> @@ -218,11 +242,23 @@ static int cache_setup_of_node(unsigned int cpu)
>  	while (index < cache_leaves(cpu)) {
>  		this_leaf = per_cpu_cacheinfo_idx(cpu, index);
>  		if (this_leaf->level != 1) {
> +			/* Always go one level down for level > 1 */
>  			struct device_node *prev __free(device_node) = np;
>  			np = of_find_next_cache_node(np);
>  			if (!np)
>  				break;
> +		} else {
> +			/* For level 1, check compatibility */
> +			if (!of_device_is_compatible(np, "cache") &&
> +			    !of_check_cache_node(np)) {
> +				struct device_node *prev __free(device_node) = np;
> +				np = of_find_next_cache_node(np);
> +				if (!np)
> +					break;
> +				continue; /* Skip to next index without processing */
> +			}
>  		}
> +
>  		cache_of_set_props(this_leaf, np);
>  		this_leaf->fw_token = np;
>  		index++;
> @@ -234,22 +270,6 @@ static int cache_setup_of_node(unsigned int cpu)
>  	return 0;
>  }
>  
> -static bool of_check_cache_nodes(struct device_node *np)
> -{
> -	if (of_property_present(np, "cache-size")   ||
> -	    of_property_present(np, "i-cache-size") ||
> -	    of_property_present(np, "d-cache-size") ||
> -	    of_property_present(np, "cache-unified"))
> -		return true;
> -
> -	struct device_node *next __free(device_node) = of_find_next_cache_node(np);
> -	if (next) {
> -		return true;
> -	}
> -
> -	return false;
> -}
> -
>  static int of_count_cache_leaves(struct device_node *np)
>  {
>  	unsigned int leaves = 0;


