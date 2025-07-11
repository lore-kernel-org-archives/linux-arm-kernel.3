Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE4CC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+4xaweSVH+jChbUQzY/YbpYq/4OXmsFAFnCVgkrYwM=; b=3f5zwK+rJ80bGpprOu5a6HVSb3
	KVNjFPYx15y9HEbFyHRPW+BTpNAboHygXsA8h8cYP09c2ZfPepxWD5wNMEGBG6Y+OV1Xt5YMOCvUZ
	v4PjvPvNIdOX/38zrOnC4mmPvn6v1kffQCx+aj2vYzhxDDIU0TSkBqqn99XTFkK3dv+SxUXfAWDi5
	T8iY8GGbyVnX/Ubzq9tXI6wzChlvSddrNq+3EQscnizKcCtnboeLUbq7t01I4xiQQhrEAnwyrj+kk
	fE7r5464H48lSMnEc2/aa4KQ0IEXatIRnJf4RKQqCnerNh1lusDfLQ6BH1Z6xXguUGlMK+9f6H5ph
	/UKByZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBwU-0000000EbNX-29FR;
	Fri, 11 Jul 2025 11:29:26 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaB97-0000000EVC2-3vc8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 10:38:27 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bdp7R62yrz6GC7K;
	Fri, 11 Jul 2025 18:37:23 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 7C31F1402EF;
	Fri, 11 Jul 2025 18:38:18 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 11 Jul
 2025 12:38:18 +0200
Date: Fri, 11 Jul 2025 11:38:16 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Huisong Li <lihuisong@huawei.com>, <linuxarm@huawei.com>
CC: <xuwei5@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
	<zhanjie9@hisilicon.com>
Subject: Re: [PATCH] soc: hisilicon: kunpeng_hccs: Fix incorrect log
 information
Message-ID: <20250711113816.00003403@huawei.com>
In-Reply-To: <20250711063706.3121253-1-lihuisong@huawei.com>
References: <20250711063706.3121253-1-lihuisong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_033826_122685_7ED3B407 
X-CRM114-Status: GOOD (  15.87  )
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

On Fri, 11 Jul 2025 14:37:06 +0800
Huisong Li <lihuisong@huawei.com> wrote:

> The hccs_get_all_spec_port_idle_sta() will tell user which port
> is busy when firmware doesn't allow to decrease HCCS lane number.
> However, the current log prints the index of die and port instead
> of the hardware ID user perceived.
> 
> Signed-off-by: Huisong Li <lihuisong@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Maybe adding an example of a wrong print and how it is fixed to this
patch description would make the problem even more obvious?
Not worth respin for that though!

> ---
>  drivers/soc/hisilicon/kunpeng_hccs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
> index 7fc353732d55..65ff45fdcac7 100644
> --- a/drivers/soc/hisilicon/kunpeng_hccs.c
> +++ b/drivers/soc/hisilicon/kunpeng_hccs.c
> @@ -1295,11 +1295,11 @@ static int hccs_get_all_spec_port_idle_sta(struct hccs_dev *hdev, u8 port_type,
>  				if (ret) {
>  					dev_err(hdev->dev,
>  						"hccs%u on chip%u/die%u get idle status failed, ret = %d.\n",
> -						k, i, j, ret);
> +						port->port_id, chip->chip_id, die->die_id, ret);
>  					return ret;
>  				} else if (idle == 0) {
>  					dev_info(hdev->dev, "hccs%u on chip%u/die%u is busy.\n",
> -						k, i, j);
> +						 port->port_id, chip->chip_id, die->die_id);
>  					return 0;
>  				}
>  			}


