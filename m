Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2336ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 10:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFNI7yHhrBSW1VHE88M0pB7rQTWGiaOpyu8ovXs7FEg=; b=CfMFMUqx6KJrmY5R3YrjQvwhgz
	zFtdrYEul3HafKMxaV8RCw8OR9ymGzFQ4QAa0SuLbUgDE+HIVimwx5IaKkJbJu/S2WjXplGhmyI9g
	Ub3B4vNKTsKos6MhUHocNRi7uJMYACho8dIXadoItwWGjZg2qhbg5ao3rIwG1t6ki9hZSZqxR5xfL
	wAdvJS6Odb+aI1VwQMZc5Jd4LsUTNJgmM9DOtilSPWXH0m0gbZDs3kKaLSlMyu799HTqJ9Ss/uk2y
	tqbRmBbpm25CDiOgASgF0ybhiD747sL2Fu4SVAvgqWTuvPUmOk4xIcgBmso9naJ+Bp4c5CKS8D8BO
	6yUR5fNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrs2-00000002EVG-28EI;
	Fri, 15 Aug 2025 10:41:14 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqES-00000001vvM-3JpH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 08:56:18 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4c3GB74QCdz6M4qb;
	Fri, 15 Aug 2025 16:54:07 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 21E5B1402A4;
	Fri, 15 Aug 2025 16:56:08 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 15 Aug
 2025 10:56:07 +0200
Date: Fri, 15 Aug 2025 09:56:06 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>,
	<hejunhao3@h-partners.com>
Subject: Re: [PATCH v6 3/3] MAINTAINERS: Remove myself from HiSilicon PMU
 maintainers
Message-ID: <20250815095606.0000606e@huawei.com>
In-Reply-To: <20250814091622.23269-4-yangyicong@huawei.com>
References: <20250814091622.23269-1-yangyicong@huawei.com>
	<20250814091622.23269-4-yangyicong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_015616_983519_9E518A68 
X-CRM114-Status: GOOD (  12.44  )
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

On Thu, 14 Aug 2025 17:16:22 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Remove myself as I'm leaving HiSilicon and not suitable for maintaining
> this. Thanks for the journey.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Thanks Yicong, it's been a pleasure working with you.
Best wishes for whatever you do next.

Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..22999fccfbd7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11059,7 +11059,6 @@ F:	Documentation/devicetree/bindings/net/hisilicon*.txt
>  F:	drivers/net/ethernet/hisilicon/
>  
>  HISILICON PMU DRIVER
> -M:	Yicong Yang <yangyicong@hisilicon.com>
>  M:	Jonathan Cameron <jonathan.cameron@huawei.com>
>  S:	Supported
>  W:	http://www.hisilicon.com


