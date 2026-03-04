Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D193EFCE3B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 19:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3ID+Rt3thScCZWKCweYCrtAtGByTHZygFo61zkltu0=; b=Yxlgp5bzXQz1pqPsY/NOKSKIWI
	asdl4BirBCOcwjLoVC2lbaKuFoUo/3w6+klfdBUju4JyOn5npsf7XCFcOJj845epjDppoFMRzQiIE
	TLV6qaBV0zXovtFa4mW3NXfAdvXzjX+OzNtNtpPHgGBGxQKnd+7UyV05Q4kgPHo1G6CQOOq2lyFhK
	mW17nPuCwP9SOO7MS0HoD33clhTcTD21grUnaFjTlTMNpTO23ymW8LqQdm2zfQFvNkcsIBit5ZOfB
	58xDHB57HJfXj0MPPfDGMzYFByOa5E6EFUSFteIJfhXz6q0crFSwCwt7QOBpo+/0nbIDhoI9QgRWh
	bjKAy9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrUf-00000000NCC-1vuy;
	Wed, 04 Mar 2026 19:02:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrUd-00000000NBY-0imP
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 19:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=m3ID+Rt3thScCZWKCweYCrtAtGByTHZygFo61zkltu0=; b=h4AzNiem+70nEQrInCT9x1zSZj
	HH7jg/Ows0ffTtmAZJGQNa65WqyaYuKSxt6YLF8ShsTeq3/4aODl0uRAaqsV5YTAjjSZJDrrGsa6o
	1i4AR0zYYqvyXswNOc9yjjsg6nbU0apYGxh40tFMWX07nZAmoV3ZkqXwOwKb+YFY38WddiWw7K1Ll
	zd/WzbX/bMfEynFmNdmKwRE/l/MRFiH48voqYjMoeZOVzHZMpZ56XJRl4J2zKuD9yDZD2YsTSHMmb
	68tae0Ss/CTDAX5ipBHSVh8CDgqkxpy5bjC5skQGvkDt46fW76WF3HnuzlFEkp0xshwEBtoevCemA
	IyGzeRTg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrUa-00000005Q1u-03XW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 19:02:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CSpYj1421875
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 19:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m3ID+Rt3thScCZWKCweYCrtA
	tGByTHZygFo61zkltu0=; b=kdbduWmAuOxgRJDnWHrdmZx794TiSXGoPs0P835a
	UMhWh3w9ExHrKJeno627eEYKhycPJQuEWxv+WeQMflCAKS29mFtKPfc9B3UZFkHd
	OdIBMrpmBn/Lkm7FWLFyH56RcYiS7X7a/CB4XXwZCi7xpwgCL/QRqWs3bpm/J9wc
	aETs6Mcq/4ycqyxL0GOK915RX8Cq6fBRdtU4x526NEnNL6tW0KUm7z8kFHkVYAEi
	vwFbJtZn8H2TD6IzTJYKCCNYmyf5T7XJ+azBvJiJY6+Echrw1NCNt6D3K1W0r04x
	MGKGz+K+plTRLHayID98c8ZeQETBPmNQJ0xQmWoIPK/RRg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u2ma8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 19:02:39 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94dec0ac214so67426604241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 11:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772650959; x=1773255759; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m3ID+Rt3thScCZWKCweYCrtAtGByTHZygFo61zkltu0=;
        b=OhOBt1gAONW07KP1fpYKV7egSBho5vfI4X9gXM0b8cWAE4XT65/ZE8ns9qsjl65PaW
         SnTvRiBtk778ouogm6jUoaEt0TK1oSaOXCj5l60ioDSA4upPw6WO9QwDlIlY/PPuo33X
         MrLPi45eH6pNK6kLvqKn4KnB44qS7KZcyMo+5L+I7TkCkB4Rai6f0yU2DsO1cCI9rLaC
         MfvXrn/5Jq0+nnn8QTaU8R+QjY8iXMRn/11b7j9ViA4Oa26nTi5lc2ORpYUV1gKHN3jV
         X+aM8lSit/eHO8mNSZqTUszvbnJFItl4tV4TZ47GRmcE1V1UaZX/thpO2svaluACnUvB
         cabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772650959; x=1773255759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3ID+Rt3thScCZWKCweYCrtAtGByTHZygFo61zkltu0=;
        b=IRqJZseSbi+53XewpCat0t8p3pshvkXbfT7Rwn4GHRXUktrlOe8nSeFCsKSO5xVHtK
         6tG/0/4u6jT/BxtvYw+96Cp1A7oMdYARCdup9hZEcpU96JdZ61s0WC7cF0JnRhL/kn8P
         WTkcLP/6guLuhqtthLTI6gT+PGEiJV2sZz6bTeM0s7t8SLgAX1SagQTLL+QmxOpsQVss
         +1/pJqGgnvJmn4V3Fo9L6evxiHFMXCZhQilwOvT5UPqXRHSxAHUiR6oo61KstRSr0wWY
         8QXhdBs1dO0KLQ6Eu0GGn6s66BQZTlJeN1zYvPMn5GEDyDXHA8k0YD2GxB4onqQyPuXO
         7T1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhv7xUx7dP5hhjGNfWmIUO82EcH2idKCVUtWkxVYV84FtjxjrmAv810/EKVt6sC6cOc6BnT6A0/LL2iR495rzz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0m0rYSoB7mEfAMXpjJYIA6IyBteVMa0uNAzak0bRTy/xIs+dP
	xE6qLBJkalIebfqBe87WeKvil9nkkp7kJkrpmObw/Dd7JkT+3vs+3INLBdMRufnzvFUDGspZLo+
	lCUOwTmbYQjbQp3LV2DKwSziwU6Tsx47Ljj6ha79HpTNPIuBeXpjawuPZNkLw0LrouEA3xLOK+2
	6rjg==
X-Gm-Gg: ATEYQzx3ukrrNLnLsdKjT929dea7WBMYzCDRJMFh6tB5z+aeUwuZJ6/GSsDtgY2P2uy
	gekxl1mYoZg77aCTnZbwtSynAjfGG4PluIlDVmbODWTTPxsGr6bwYze7TpWoDGqZ8k+X1ndND+u
	As6NCnPRuJ08l6SNzuB34m6kIpde8mw587GaBIfKfAyDiGihWfNTyVUZc4dg/43chLp0cQd1Uml
	ONMbCCb2cLxeVW2JSDHek/6e7h0gY1Ia0ZNvA25R6sHTMieg0ZsPMiljTvW1Io6C7ruldYWwTxZ
	Zi75U6/R/nm+qxyrj1GU5bD9eGiwgqQ6QlMRlsjWACC5/RY42SG4zQQEmtgDxJNzAhnRHeGxGAR
	GvaSUB/YD1lDxkQ4NlQfMfn52n9uf
X-Received: by 2002:a05:6122:3d03:b0:567:638a:ce16 with SMTP id 71dfb90a1353d-56ae77c396bmr1558866e0c.14.1772650958836;
        Wed, 04 Mar 2026 11:02:38 -0800 (PST)
X-Received: by 2002:a05:6122:3d03:b0:567:638a:ce16 with SMTP id 71dfb90a1353d-56ae77c396bmr1558806e0c.14.1772650958386;
        Wed, 04 Mar 2026 11:02:38 -0800 (PST)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:ee0b:246c:2dae:77b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a8a9542sm39209755e9.1.2026.03.04.11.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:02:36 -0800 (PST)
Date: Wed, 4 Mar 2026 20:02:34 +0100
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
        walter.chang@mediatek.com, jstultz@google.com, amergnat@baylibre.com,
        aisheng.dong@nxp.com, jindong.yue@nxp.com, xuegang.liu@nxp.com
Subject: Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek: Convert
 timer-mediatek to a loadable module
Message-ID: <aaiByowtXrTxPsd7@mai.linaro.org>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
 <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
X-Proofpoint-ORIG-GUID: QLqaEClns8eCqIzeXiMpDybLZKT54aDU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE1NSBTYWx0ZWRfX3Z1TPnCFeANq
 JI7r+Hi66V2W+XkRW9GX6cXeUO8wwtXCUm5K9SAeryNOQcldfv7xufxXUAD3qiHPj48+0JQJbGk
 bABY9lDHH52zk+e03oc66hmDEQXETpKWVpb4sDeoFYFld9U7qaR0ukCA4y/d1b8hNWcimlwMG66
 x1AM9nqEVDw0g5KV92ZdyiF5FSEqE8JZEIg15+MeucO9TfKXdl3o9jRldYJvM5jaINggVMz+4nE
 4B0wYbH6dL+DCQmuBSsh6BVxnNf11F7bJY7hl4kKdgCz0ReasMSPI9mEdIq6NsilRlflNp4fq0e
 Wkc040YgnIf0mCD169SkEd7shinLHDM2/SvLYR/gKz1QqVYUQZYPCBkvbPN/WwqrzhNFydyvV71
 SoeE8ECnm5wX7LIia5hv+oyWXoBd3BH1BVe8thO+dnE476nbb7knpiFPhPCLaVjz/YEB3rnGMJs
 Pq1Bv72VtA3ABbrDYww==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a881cf cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=mpaa-ttXAAAA:8 a=QX4gbG5DAAAA:8 a=IpJZQVW2AAAA:8
 a=8AirrxEcAAAA:8 a=4XJdlQNtnODeGaihWlIA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: QLqaEClns8eCqIzeXiMpDybLZKT54aDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_190244_332503_01707B9A 
X-CRM114-Status: GOOD (  29.31  )
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

On Wed, Mar 04, 2026 at 05:12:06PM +0900, Zhipeng Wang wrote:
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> 
> Convert the timer-mediatek driver into a loadable module so that it
> can register an always-on timer as the tick_broadcast_device on
> MediaTek SoCs. This helps support GKI(Generic Kernel Image) modular
> configurations.
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
> Tested-by: Walter Chang <walter.chang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
>  drivers/clocksource/Kconfig          |  2 +-
>  drivers/clocksource/timer-mediatek.c | 33 ++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index fd9112706545..2112efb85029 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -488,7 +488,7 @@ config SYS_SUPPORTS_SH_CMT
>  	bool
>  
>  config MTK_TIMER
> -	bool "Mediatek timer driver" if COMPILE_TEST
> +	tristate "MediaTek timer driver"
>  	depends on HAS_IOMEM
>  	select TIMER_OF
>  	select CLKSRC_MMIO
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index 7bcb4a3f26fb..4ad4bac6f34b 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -13,6 +13,9 @@
>  #include <linux/clocksource.h>
>  #include <linux/interrupt.h>
>  #include <linux/irqreturn.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
>  #include <linux/sched_clock.h>
>  #include <linux/slab.h>
>  #include "timer-of.h"
> @@ -337,5 +340,35 @@ static int __init mtk_gpt_init(struct device_node *node)
>  
>  	return 0;
>  }
> +
> +#ifndef MODULE
>  TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
>  TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
> +#else
> +static int mtk_timer_probe(struct platform_device *pdev)
> +{
> +	int (*timer_init)(struct device_node *node);
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	timer_init = of_device_get_match_data(&pdev->dev);
> +	return timer_init(np);
> +}
> +
> +static const struct of_device_id mtk_timer_match_table[] = {
> +	{ .compatible = "mediatek,mt6577-timer", .data = mtk_gpt_init },
> +	{ .compatible = "mediatek,mt6765-timer", .data = mtk_syst_init },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver mtk_timer_driver = {
> +	.probe = mtk_timer_probe,
> +	.driver = {
> +		.name = "mediatek-timer",
> +		.of_match_table = mtk_timer_match_table,
> +	},
> +};
> +module_platform_driver(mtk_timer_driver);
> +
> +MODULE_DESCRIPTION("MediaTek Timer driver");
> +MODULE_LICENSE("GPL");
> +#endif

What do you think about the approach found here:

https://lore.kernel.org/all/20250625085715.889837-1-daniel.lezcano@linaro.org/

> -- 
> 2.34.1
> 

-- 

