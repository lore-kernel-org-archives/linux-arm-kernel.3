Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73BCF8A146
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 10:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUW1Nks1X2mTcovG/s8cOh6BnWk2+vNCjZ3XdZZTfY0=; b=Kuqzu9ymZ59lc7M3VaPXGLPeS0
	z7w0hIxRvy83xI7lkO6yz3hXUA7UFQc1tzntQAeafdVmD7dWRDqIOQkgCcCXHekN6YbNVyEKodx08
	0nHY8H3pWMtEE9PNFsDuqAIv3x3I3M9HpXiQXiQ/+L+DHQ7C7/19L6tQcqIJ5HMEbo8m1o5vWd1A/
	Sh0kyeMdO+1L5FwklK0GJjGWEdUZKmkPag4BVGqeZiswAEv05KyvQRhBz3dJkO4uvw08q9Ckol8Cy
	TLCTMOhhpT6i+tcgRaPF58xWRxtxuyNMtEQnI0VUEfPa9jwtzBdtTY+Sro3f2zF06Tdl2gJC1kxB3
	JcZfaBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJgR-00000002Hpv-2WCR;
	Thu, 16 Apr 2026 10:10:51 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJgN-00000002Ho8-3jfI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 10:10:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fUW1Nks1X2mTcovG/s8cOh6BnWk2+vNCjZ3XdZZTfY0=;
	b=WDQ0QxS6T7NkPy+9kx2flk3wLyKKbm4eyRmRmAVTv7vvDRafi87K9po7ZU/8gX7nmhFdvFG5+
	ED2/aKfPLAq0GVnEJnPDAljA0MkjGXuR14Vd7WRf5vc6H3/OtuI6PDTgqaKmiEfzGYKitvxVGu+
	bLVCVZxurlXak+Ax7ehhWN4=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fxDBQ6cfhzRhVL;
	Thu, 16 Apr 2026 18:04:14 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id E1AEB4056D;
	Thu, 16 Apr 2026 18:10:33 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Apr 2026 18:10:33 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 16 Apr 2026 18:10:33 +0800
Message-ID: <81cde3ab-8349-4672-a806-4cba480c853f@huawei.com>
Date: Thu, 16 Apr 2026 18:10:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update HiSilicon PMU driver maintainer to
 Yushan Wang
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Jie Zhan <zhanjie9@hisilicon.com>, Will Deacon
	<will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>
CC: <jic23@kernel.org>, Linuxarm <linuxarm@huawei.com>
References: <20260416095110.25612-1-Jonathan.Cameron@huawei.com>
Content-Language: en-US
From: Yushan Wang <wangyushan12@huawei.com>
In-Reply-To: <20260416095110.25612-1-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_031048_422667_C998CEB6 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

It's privileged to have your guidance, thanks a lot!

Acked-by: Yushan Wang <wangyushan12@huawei.com>

>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1cc0e12fe1f..8b95a43527fa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11563,7 +11563,7 @@ F:    Documentation/devicetree/bindings/net/hisilicon*.txt
>  F:   drivers/net/ethernet/hisilicon/
>
>  HISILICON PMU DRIVER
> -M:   Jonathan Cameron <jonathan.cameron@huawei.com>
> +M:   Yushan Wang <wangyushan12@huawei.com>
>  S:   Supported
>  W:   http://www.hisilicon.com
>  F:   Documentation/admin-guide/perf/hisi-pcie-pmu.rst



