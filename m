Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C427DF8A160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 11:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEFi7lDFdkvFlL0ON8TeYzDON4w7dnJSIB15kjKD4eM=; b=4GnKRQeVp5E2VKxYjmuWyt8G+b
	qmgMiiAzK4llxfwqwDT7yogMbSezJVxnUlA5Gk7hx9RR4NhE70aQ4w+Axrv7sQPC++bWvMxG3SXai
	3xtOMg2CAw9ijLiyt2ElIeNMe5ESOsCH9eW7vt94b1lK48WozpPeZQLpYQBk9A742eZKumArqeoaZ
	Wdn4FJDIk6Kh29P+N8vd4pyhxxoKMnuZniF3PLuPm+t4Wwbzr6N3K2nwplAJ0WzYmqDcyZ7woeAPT
	TU7Yn1vBduk33FswBs+kXHcV3Uo0pD9HWA1yovMEzpRoKzVl65zp0uAQsqlH50ekyGPq+Wdm4gU1w
	yVT0bvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKlT-00000002NK1-4Abu;
	Thu, 16 Apr 2026 11:20:08 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKlQ-00000002NIi-1DRO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 11:20:06 +0000
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fxFk56N8YzcZyN;
	Thu, 16 Apr 2026 19:13:17 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id E7D3740561;
	Thu, 16 Apr 2026 19:19:49 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 16 Apr
 2026 19:19:49 +0800
Message-ID: <8be7bda5-56da-4c1d-9fde-6b81ea10ac19@hisilicon.com>
Date: Thu, 16 Apr 2026 19:19:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update HiSilicon PMU driver maintainer to
 Yushan Wang
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>
CC: <linuxarm@huawei.com>, <jic23@kernel.org>
References: <20260416095110.25612-1-Jonathan.Cameron@huawei.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <20260416095110.25612-1-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_042004_496343_2B096087 
X-CRM114-Status: GOOD (  10.04  )
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



On 4/16/2026 5:51 PM, Jonathan Cameron wrote:
> Replace myself with Yushan Wang who is very familiar with the HiSilicon PMU
> drivers.
Really appreciate all your guidance during the upstreaming work!

Acked-by: Jie Zhan <zhanjie9@hisilicon.com>
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1cc0e12fe1f..8b95a43527fa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11563,7 +11563,7 @@ F:	Documentation/devicetree/bindings/net/hisilicon*.txt
>  F:	drivers/net/ethernet/hisilicon/
>  
>  HISILICON PMU DRIVER
> -M:	Jonathan Cameron <jonathan.cameron@huawei.com>
> +M:	Yushan Wang <wangyushan12@huawei.com>
>  S:	Supported
>  W:	http://www.hisilicon.com
>  F:	Documentation/admin-guide/perf/hisi-pcie-pmu.rst

