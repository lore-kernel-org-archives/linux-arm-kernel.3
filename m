Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFB7C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 08:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6ktIF/hpZOLXL+wae3tS30SAl/Eb6EXFHFJdYEA47I=; b=aa6SGLLF4921iPoPgr3P7ArzQN
	ObWGujkMfrWqJ1wRDJmBby3PxZeWU+yCxRAWcT2Lm1UH4oLTpEPCbf5Y119YPdVnVOfWOS0vo55i8
	iabtSEbmzLJ7ijjTqAFxJHtfaLvUEABn0ifxFDmjcHfXqosKryTsVqPf1SFH3aHIRZAwj751jGUic
	irMuSepz5TvXiqIJ7yNFZAZLzQLdWjWz+B3mXtqoq8n01qlJoepGI/qwq0mLjj5O/Xbmk1wagIxJT
	Lw9I5dZw4XYY90Jrylez/gN7rbwmy4cjBb9PXZphUX4GH7W+bm0M7DeMwuUqfq8CiIYj02uxKIcDn
	UkrNPNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgGq-0000000C03n-1kN6;
	Fri, 18 Jul 2025 08:16:44 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucg6J-0000000ByDu-0MY5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 08:05:52 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bk2Pk3gpxztSvY;
	Fri, 18 Jul 2025 16:04:26 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 70BF314011F;
	Fri, 18 Jul 2025 16:05:31 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Jul 2025 16:05:31 +0800
Received: from [10.67.113.98] (10.67.113.98) by kwepemq100003.china.huawei.com
 (7.202.195.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 18 Jul
 2025 16:05:30 +0800
Message-ID: <687A004A.7030905@hisilicon.com>
Date: Fri, 18 Jul 2025 16:05:30 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Huisong Li <lihuisong@huawei.com>, <xuwei5@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<zhanjie9@hisilicon.com>
Subject: Re: [PATCH] soc: hisilicon: kunpeng_hccs: Fix incorrect log information
References: <20250711063706.3121253-1-lihuisong@huawei.com>
In-Reply-To: <20250711063706.3121253-1-lihuisong@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.98]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_010551_282450_85BF92BC 
X-CRM114-Status: GOOD (  13.44  )
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

Hi Huisong,

On 2025/7/11 14:37, Huisong Li wrote:
> The hccs_get_all_spec_port_idle_sta() will tell user which port
> is busy when firmware doesn't allow to decrease HCCS lane number.
> However, the current log prints the index of die and port instead
> of the hardware ID user perceived.
> 
> Signed-off-by: Huisong Li <lihuisong@huawei.com>
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
> 

Applied to the Hisilicon driver tree.
Thanks!

Best Regards,
Wei

