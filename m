Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D204CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 10:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+iJpz+OvSRspbIayEdJOX/LBaZQ1yi7Hgr1NPbKgzo=; b=3J2zpvv4s6l5y1ZZUqeJLuxytr
	ACvFbkq8RlON8Lp1RkG2KsNZ1medOFFsMRVH7N4HfPfJqhKHO8OelBrA91pS4QvYvi0jDGEccAr12
	zAGzkYSUkEjAKk9Ni0P3pJk6AORArN0QTyR/CTG27UK30xR378y3POLo9evjuN4ouYHqz/0GgxOFz
	yrmscB8wEOsHoKyHGLyFN2AL3ns839Qe8ZchUx2iI6xtUQOpmVhL3AvY5MhMcD0QBtsELO92snkO8
	K7HULm3yLPzG/OJjUw3TA8P7ADMkCYO2zYvO6yJh27fo10PKRVofFhGpNUWXt0et8jgjYCAObQNq/
	eKDWYmMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwITz-0000000DeNa-159v;
	Wed, 10 Sep 2025 10:55:23 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwITv-0000000DeKh-2rXi;
	Wed, 10 Sep 2025 10:55:21 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cMHZm2BSvz6LDG6;
	Wed, 10 Sep 2025 18:52:32 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 8EE85140373;
	Wed, 10 Sep 2025 18:55:10 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 10 Sep
 2025 12:55:10 +0200
Date: Wed, 10 Sep 2025 11:55:08 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Fei Shao <fshao@chromium.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: mediatek: Use
 for_each_available_child_of_node_scoped()
Message-ID: <20250910115508.0000785e@huawei.com>
In-Reply-To: <20250908044348.2402981-1-fshao@chromium.org>
References: <20250908044348.2402981-1-fshao@chromium.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_035520_032413_45ABDC1A 
X-CRM114-Status: GOOD (  16.70  )
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

On Mon,  8 Sep 2025 12:43:25 +0800
Fei Shao <fshao@chromium.org> wrote:

> Use scoped for_each_available_child_of_node_scoped() to remove manual
> of_node_put() calls from early returns.

There aren't any early returns here.

This runs into some of the stuff that cleanup.h docs suggest we shouldn't
do which is combining gotos and __free() magic. 
I think this case is actually fine despite that but in general worth
thinking about the code structure and whether that can be avoided.

One option would be to factor out the loop into another function then use
and error return from that to call the stuff under the init_free label.

Jonathan


> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>  drivers/remoteproc/mtk_scp.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 8206a1766481..b123698feb52 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1234,7 +1234,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev_of_node(dev);
>  	struct platform_device *cpdev;
> -	struct device_node *child;
>  	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
>  	const struct mtk_scp_of_data **cluster_of_data;
>  	struct mtk_scp *scp, *temp;
> @@ -1243,11 +1242,10 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  
>  	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
>  
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		if (!cluster_of_data[core_id]) {
>  			ret = -EINVAL;
>  			dev_err(dev, "Not support core %d\n", core_id);
> -			of_node_put(child);
>  			goto init_fail;
>  		}
>  
> @@ -1255,7 +1253,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  		if (!cpdev) {
>  			ret = -ENODEV;
>  			dev_err(dev, "Not found platform device for core %d\n", core_id);
> -			of_node_put(child);
>  			goto init_fail;
>  		}
>  
> @@ -1264,14 +1261,12 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  		if (IS_ERR(scp)) {
>  			ret = PTR_ERR(scp);
>  			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
> -			of_node_put(child);
>  			goto init_fail;
>  		}
>  
>  		ret = rproc_add(scp->rproc);
>  		if (ret) {
>  			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
> -			of_node_put(child);
>  			scp_free(scp);
>  			goto init_fail;
>  		}


