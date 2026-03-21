Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040FE1099B54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 06:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iU7fULhnma33dp/23p2NuWLiV6eIfv8H817dB3QYFxs=; b=wkYeVudfezke6XCe3uqpqtNZ9V
	0Wk+r4smCnQ/+y1afbSj6Tb24AmVBnBUDtPa7/IgD68ROxHTQfD0AdzNnys1qZmXcGKnlhQyRPLII
	3Q0BHfGPE4Mht631Oec5bKSeRzRUUPCxt5bk+FJrv2EizRzbP/c9cJZsJ/tXVmO98aRGXcyNNqVnF
	8BAXtppXsdkjE0Hm++jnBTJksCzx5cKDKuRk5SG7GKEBL5z7vB6AF69cOBoX1IuSilmh2VjI+l5tm
	+1hdXyYnDICXYkKO2XDpRcP5BZFR0kWdcOBC4VKqyeeNLJGqFu3FRzEHBgm5tT5PHmtLoV+0zgAqk
	P2q1mPBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3qBf-0000000EAPR-1IGp;
	Sat, 21 Mar 2026 06:51:55 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3qBZ-0000000EAOe-3jCg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 06:51:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iU7fULhnma33dp/23p2NuWLiV6eIfv8H817dB3QYFxs=;
	b=TXLIuAUeOibfTKOTiR3ewg4V+Pq06u0Qzwin5YISmHRm7uTsYuplo1kFXY2kcg2dgAEcVEnew
	zz0FqiUA7/1FVjvAE8aIBcKuoH2wOXYuVZCKOJmvzBGOynpSlbZJ2GKzzpbCDRMBjJ2Zl8tZ+QS
	WMf2mc+GlCKcm6Gy0pOLjSU=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fd91s5YVlz1T4G5;
	Sat, 21 Mar 2026 14:46:09 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B19A40569;
	Sat, 21 Mar 2026 14:51:35 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 21 Mar 2026 14:51:34 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 21 Mar 2026 14:51:34 +0800
Message-ID: <69BE3FE8.9080109@hisilicon.com>
Date: Sat, 21 Mar 2026 14:51:20 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Shawn Guo <shawnguo@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: hisilicon: poplar: Correct PCIe reset GPIO
 polarity
References: <20260227071958.1350024-1-shawnguo@kernel.org>
In-Reply-To: <20260227071958.1350024-1-shawnguo@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.213]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_235150_423735_8A0CA150 
X-CRM114-Status: GOOD (  14.09  )
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

Hi Shawn,

On 2026/2/27 15:19, Shawn Guo wrote:
> The PCIe reset GPIO on Poplar is actually active low.  The active high
> worked before because kernel driver didn't respect the setting from DT.
> This is changed since commit 1d26a55fbeb9 ("PCI: histb: Switch to using
> gpiod API"), and thus PCIe on Poplar got brken since then.
> 
> Fix the problem by correcting the polarity.
> 
> Fixes: 32fa01761bd9 ("arm64: dts: hi3798cv200: enable PCIe support for poplar board")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>
> ---
>  arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
> index 7d370dac4c85..579d55daa7d0 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
> @@ -179,7 +179,7 @@ &ohci {
>  };
>  
>  &pcie {
> -	reset-gpios = <&gpio4 4 GPIO_ACTIVE_HIGH>;
> +	reset-gpios = <&gpio4 4 GPIO_ACTIVE_LOW>;
>  	vpcie-supply = <&reg_pcie>;
>  	status = "okay";
>  };
> 

Applied to the HiSilicon arm64 dt tree.
Thanks!

Best Regards,
Wei

